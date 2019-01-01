import QtQuick 2.2
Item {
    property int rootItemWidth:200
    property int rootItemHeight:725

    property alias name: nameText.text
    property alias gameDisplay1: gameDisplayText1.text
    property alias gameDisplay2: gameDisplayText2.text
    property alias matchDisplay: matchText.text
    property alias settingsX:settings_unclicked.x
    property alias settingsY:settings_unclicked.y
    property alias settingsWidth:settings_unclicked.width

    signal homeButtonClicked()
    signal settingsClicked()

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            console.log("I am here as well .............")
        }
    }

    Image {
        id: rectangle_1
        source: "qrc:/images/leftPanel/rectangle_1.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: rounded_rectangle_4_copy
        visible: true
        source: "qrc:/images/leftPanel/rounded_rectangle_4_copy.png"
        x: ((parent.width/rootItemWidth)*8)
        y: ((parent.height/rootItemHeight)*10)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: white_tile
        visible: true
        source: "qrc:/images/leftPanel/white_tile.png"
        x: ((parent.width/rootItemWidth)*34)
        y: ((parent.height/rootItemHeight)*268)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: device_not_connected
        visible: true
        source: "qrc:/images/leftPanel/device_not_connected.png"
        x: ((parent.width/rootItemWidth)*14)
        y: ((parent.height/rootItemHeight)*653)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: device_connected
        visible: true
        source: "qrc:/images/leftPanel/device_connected.png"
        x: ((parent.width/rootItemWidth)*14)
        y: ((parent.height/rootItemHeight)*653)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: home_hover
        visible: false
        source: "qrc:/images/leftPanel/home_hover.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*549)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: home_clicked
        visible: false
        source: "qrc:/images/leftPanel/home_clicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*549)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: home_unclicked
        visible: true
        source: "qrc:/images/leftPanel/home_unclicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*549)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        MouseArea {
            anchors.fill: parent
            hoverEnabled: false
            onEntered: {
                home_hover.visible = true
                home_clicked.visible = false
                visible = false
            }

            onExited: {
                home_clicked.visible = false
                home_hover.visible = false
                visible = true
            }

            onPressed: {
                home_clicked.visible = true
                home_hover.visible = false
                visible = false
            }

//            onClicked: homeButtonClicked()
        }
    }
    Image {
        id: settings_clicked
        visible: true
        source: "qrc:/images/leftPanel/settings_clicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*481)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: settings_hover
        visible: true
        source: "qrc:/images/leftPanel/settings_hover.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*481)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: settings_unclicked
        visible: true
        source: "qrc:/images/leftPanel/settings_unclicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*481)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                console.log("Settings Clicked")
                settingsClicked()
            }
        }
    }
    Image {
        id: match_report_clicked
        visible: false
        source: "qrc:/images/leftPanel/match_report_clicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*415)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: match_report_hover
        visible: false
        source: "qrc:/images/leftPanel/match_report_hover.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*415)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: match_report_unclicked
        visible: true
        source: "qrc:/images/leftPanel/match_report_unclicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*415)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: false
            onEntered: {
                match_report_hover.visible = true
                match_report_clicked.visible = false
                visible = false
            }

            onExited: {
                match_report_clicked.visible = false
                match_report_hover.visible = false
                visible = true
            }

            onPressed: {
                match_report_clicked.visible = true
                match_report_hover.visible = false
                visible = false
            }
            onClicked:
            {
                if(sligterMode)
                {
                    cannotGenerate.text = sighterMatchText
                    cannotGenerate.visible = true
                }
                else
                {
                    if(1/*globalModelOfData.count >= 10*/)
                    {
                        showMatchReport()
                        // only show summary for now
                        //showSummary()
                    }
                    else
                    {
                        cannotGenerate.text = minimumShotsMatchReport
                        cannotGenerate.visible = true
                    }
                }
            }
        }
    }
    Image {
        id: summery_clicked
        visible: true
        source: "qrc:/images/leftPanel/summery_clicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*348)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: summery_mouse_hover
        visible: false
        source: "qrc:/images/leftPanel/summery_mouse_hover.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*348)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: summery_unclicked
        visible: true
        source: "qrc:/images/leftPanel/summery_unclicked.png"
        x: ((parent.width/rootItemWidth)*38)
        y: ((parent.height/rootItemHeight)*348)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        MouseArea{
            anchors.fill: parent
            hoverEnabled: false
            onEntered: {
                summery_mouse_hover.visible = true
                summery_clicked.visible = false
                visible = false
            }

            onExited: {
                summery_clicked.visible = false
                summery_mouse_hover.visible = false
                visible = true
            }

            onPressed: {
                summery_clicked.visible = true
                summery_mouse_hover.visible = false
                visible = false
            }
            onClicked:
            {
                if(sligterMode)
                {
                    cannotGenerate.text = sighterSummaryText
                    cannotGenerate.visible = true
                }
                else
                {
//                    if(globalModelOfData.count >= 10)
//                    {
                        showSummary()
//                    }
//                    else
//                    {
//                        cannotGenerate.text = minimumShotsSummary
//                        cannotGenerate.visible = true
//                    }
                }
            }
        }
    }
    Image {
        id: sighter_selected
        visible: true
        source: "qrc:/images/leftPanel/sighter_selected.png"
        x: ((parent.width/rootItemWidth)*14)
        y: ((parent.height/rootItemHeight)*120)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: match_selected
        visible: !sighter_selected.visible
        source: "qrc:/images/leftPanel/match_selected.png"
        x: ((parent.width/rootItemWidth)*14)
        y: ((parent.height/rootItemHeight)*120)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: user_picture_circle_with_black_border
        visible: true
        source: "qrc:/images/leftPanel/user_picture_circle_with_black_border.png"
        x: ((parent.width/rootItemWidth)*54)
        y: ((parent.height/rootItemHeight)*240)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: name
        visible: true
        source: "qrc:/images/leftPanel/name.png"
        x: ((parent.width/rootItemWidth)*42)
        y: ((parent.height/rootItemHeight)*308)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Text {
        id: nameText
        anchors.left: name.left
        anchors.top: name.top
        width: ((parent.width/rootItemWidth)*name.sourceSize.width)
        height: ((parent.height/rootItemHeight)*name.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (height)

        text: "Dummy"
        color: "grey"
    }

    Image {
        id: match_60_40_box
        visible: true
        source: "qrc:/images/leftPanel/match_60_40_box.png"
        x: ((parent.width/rootItemWidth)*24)
        y: ((parent.height/rootItemHeight)*181)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Text {
        id: matchText
        width: ((parent.width/rootItemWidth)*match_60_40_box.sourceSize.width)
        height: ((parent.height/rootItemHeight)*match_60_40_box.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (height)

        text: "Dummy"
        color: "white"
        anchors.centerIn: match_60_40_box
    }

    Image {
        id: pistol_box
        visible: true
        source: "qrc:/images/leftPanel/pistol_box.png"
        x: ((parent.width/rootItemWidth)*24)
        y: ((parent.height/rootItemHeight)*65)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pistol_box_copy
        visible: true
        source: "qrc:/images/leftPanel/pistol_box_copy.png"
        x: ((parent.width/rootItemWidth)*24)
        y: ((parent.height/rootItemHeight)*25)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }

//    Rectangle {
//        anchors.fill: pistol_over
//        color: "#2298D4"
//    }

    Text {
        id: gameDisplayText1
        anchors.top: pistol_box_copy.top
        anchors.left: pistol_box_copy.left
        width: ((parent.height/rootItemHeight)*pistol_box_copy.sourceSize.width)
        height: ((parent.height/rootItemHeight)*pistol_box_copy.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (height)

        text: "Dummy"
    }
    Text {
        id: gameDisplayText2
        anchors.top: pistol_box.top
        anchors.left: pistol_box.left
        width: ((parent.height/rootItemHeight)*pistol_box.sourceSize.width)
        height: ((parent.height/rootItemHeight)*pistol_box.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (height)
        text: "Dummy"
        color: "white"
    }

    function showSummary()
    {
        showSummaryPage.visible = true
    }

    function showMatchReport()
    {
        matchReportPage.visible = true
    }


    function showReport()
    {

    }

    function showSettings()
    {

    }

    function enableSighterMode(enableFlag)
    {
        sighter_selected.visible = enableFlag
    }
}
