import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2

//import Qt.labs.platform 1.0


Item {
    id: shootingPage

    visible: false

    property int matchShootCount: -1
    property alias currentGameDisplay1: leftPanel.gameDisplay1
    property alias currentGameDisplay2: leftPanel.gameDisplay2
    property alias currentmatchDisplay: leftPanel.matchDisplay
    property alias totalScore : rightPanel.grandTotal
    property alias totalTime: rightPanel.totalTimeConsume

    property alias isBackgroudBlack: settingsPage.isBackGroundBlack
    property alias isPalletRed: settingsPage.isPalletRedColor

    property alias currentPageIndexOfSer: rightPanel.currentPageIndex

    property bool sligterMode: true

    property bool matchFinished :false

    property string messageText: "Match is completed, restart to stimulate"
    property string sighterSummaryText: "You are in Sighter. You can't generate Match Summary"
    property string sighterMatchText: "You are in Sighter. You can't generate Match Report"
    property string minimumShotsSummary: "Minimum 10 shots required to generate Summary"
    property string minimumShotsMatchReport: "Minimum 10 shots required to generate Match Report"


    MessageDialog
    {
        id: matchInfoDialog
        text: messageText
        visible: false
    }


    Rectangle {
        id:settingsMask
        anchors.fill:parent
        color: "transparent"
        visible: false
        z:100
        MouseArea
        {
            id:parentMouseArea
            anchors.fill: parent
            onClicked: {
                settingsMask.visible = false
            }
        }

        SettingsPage
        {
            id:settingsPage
            x:leftPanel.settingsX + leftPanel.settingsWidth
            y:leftPanel.settingsY

            onIsBackGroundBlackChanged: {
                settingsMask.visible = false
            }
            onIsPalletRedColorChanged: {
                settingsMask.visible = false
            }
        }
    }


    Dialog
    {
        id:matchFinishConfirmation
        width: 200//parent.width*0.2
        height: 75//parent.height*0.2
        Label{
            text: "Are you sure you want to finish the match ?"
            anchors.centerIn: parent
        }

        standardButtons: StandardButton.Ok | StandardButton.Cancel

        onAccepted: {
            changedToMatchFinish()
        }
    }

    MessageDialog
    {
        id: matchNotStarted
        title: "Warning"
        text: "Match Not Started"
        visible: false
    }



    MessageDialog
    {
        id: cannotGenerate
        text: sighterSummaryText
        title: "Warning"
        visible: false
    }

    ListModel
    {
        id:globalModelOfData
        onCountChanged: {
            centerPanel.disableMotorMovement = false
            centerPanel.currentPageIndexChanged()
        }
    }

    ListModel
    {
        id:globalSlighterModel
    }

    ListModel
    {
        id:globalMatchModel
    }

    function setCurrentGameType(index)
    {
        if (index >= gameEventModel.count)
            return

        matchShootCount = gameEventModel.get(index).count
        currentGameDisplay1 = gameEventModel.get(index).gameDisplay1
        currentGameDisplay2 = gameEventModel.get(index).gameDisplay2
        currentmatchDisplay = gameEventModel.get(index).matchDisplay
    }

    onVisibleChanged: {
        if (visible)
            centerPanel.circleCordinates()
    }

    onMatchShootCountChanged: {
        centerPanel.shotCount = matchShootCount
//        console.log(APPSETTINGS.getTimeCount(matchShootCount)," Match Shoot count is ",matchShootCount)
        centerPanel.totalGameTime = APPSETTINGS.getTimeCount(matchShootCount)
    }

    LeftPanel {
        id: leftPanel
        width: 0.15*parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.top: parent.top
        name: window.userName
        z: 10

        onHomeButtonClicked: {
            loginPage.visible = true
            resetDataModels()
        }
        onSettingsClicked:
        {
            settingsMask.visible = true
        }
    }

    RightPanel {
        id: rightPanel
        width: 0.31*parent.width
        height: parent.height
        anchors.right: parent.right
        anchors.top: parent.top
        z: 10
        onSwitchToSighter:
        {
            if(sighterEnable)
            {
                changedToSigherMode()
            }
            else
            {
                changedToMatchMode()
            }
        }

        onMatchFinished: {
            changedToMatchFinish()
        }
    }

    CenterPane {
        id: centerPanel
        width: parent.width - leftPanel.width - rightPanel.width
        height: parent.height
        anchors.left: leftPanel.right
        anchors.right: rightPanel.left
        anchors.top: parent.top

        onPointAddedToSeries: {
            rightPanel.addToSeries(xPosition,yPosition,currentCalculatedScore)
            console.log("x ", xPosition, " y ", yPosition, " score ", currentCalculatedScore, " matchShootCount ", matchShootCount)
        }
    }


    SummaryPage {
        id:showSummaryPage
        visible: false
        width:parent.width*3/4
        height:parent.height*3/4

        onVisibleChanged: {
            if (visible)
                centerPanel.pauseGameTimer()
            else
                centerPanel.unPauseGameTimer()
        }
        //z: 20
    }

    MatchReport
    {
        id:matchReportPage
        visible: false
        width:parent.width*3/4
        height:parent.height*3/4

        onVisibleChanged: {
            if (visible)
                centerPanel.pauseGameTimer()
            else
                centerPanel.unPauseGameTimer()
        }
    }

    function resetDataModels()
    {
        globalModelOfData.clear()
        globalSlighterModel.clear()
        globalMatchModel.clear()
        matchFinished = false
        rightPanel.resetRightPanelModels()
        centerPanel.refreshCentralPanelPage()
    }

    function changedToSigherMode()
    {
        centerPanel.disableMotorMovement = true
        centerPanel.showSlighter(true)
        leftPanel.enableSighterMode(true)
        globalModelOfData.clear()
        for(var index = 0; index <globalSlighterModel.count; ++index )
        {
            globalModelOfData.append(globalSlighterModel.get(index))
        }
        sligterMode = true
        rightPanel.updateTotal()
        centerPanel.currentPageIndexChanged()
        centerPanel.disableMotorMovement = false
    }

    function changedToMatchMode()
    {
        centerPanel.disableMotorMovement = true
        centerPanel.showSlighter(false)
        leftPanel.enableSighterMode(false)
        globalModelOfData.clear()
        for(var index = 0; index <globalMatchModel.count; ++index )
        {
            globalModelOfData.append(globalMatchModel.get(index))
        }
        sligterMode = false
        rightPanel.updateTotal()
        centerPanel.currentPageIndexChanged()
        centerPanel.disableMotorMovement = false
    }

    function changedToMatchFinish()
    {
        matchFinished = true
    }

    function minutesToseconds(totalSecs)
    {
        var minutes = Math.floor(totalSecs / 60);
        var seconds = totalSecs - minutes * 60;
        var finalTime = str_pad_left(minutes,'0',2)+':'+str_pad_left(seconds,'0',2);
        return finalTime
    }

    function str_pad_left(string,pad,length) {
        return (new Array(length+1).join(pad)+string).slice(-length);
    }

}
