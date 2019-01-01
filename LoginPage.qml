import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Item {
    id: rootItem
    property int rootItemWidth:1366
    property int rootItemHeight:724

    property bool demoMode: true
    property alias username: name_text_field.text
    property int gameMode: 0 // 0 -> pistol, 1 -> rifel
    property int gameEvent: 0
    property int papermode: 0
    property bool mod_connected: false
    property bool popupMode: false

    signal loadSavedGame()

    onGameModeChanged: {
        APPSETTINGS.setGameMode(gameMode)
    }

    onGameEventChanged: {
        APPSETTINGS.setGameEvent(gameEvent)
    }

    onUsernameChanged: {
        APPSETTINGS.setUsername(userName)
    }

    Component.onCompleted: {
        MODREADER.connectedModbus()
        mod_connected = MODREADER.isModBusConnected() //empty for auto detect
        if (!MODREADER.isValidLicence())
            invalidLicence.visible = true
        else if (!mod_connected && popupMode) {
            modBusConnector.visible = true
        }
    }

    ModConnectorDialog {
        id: modBusConnector
        width: 300
        height: 100
//        x: parent.width/2 - width/2
//        y: parent.height/2 - height/2
        visible: false
    }

    MessageDialog
    {
        id: invalidUserName
        title: "Warning"
        text: popupMode ? "Please enter user name to login" : "Please enter a valid user name and port name."
        visible: false
    }

    MessageDialog
    {
        id: invalidLicence
        title: "Error"
        text: "Licence has expired, Please contact raosrinu2004@gmail.com or rahul.mishra@tachustechnology.com"
        visible: false

        onAccepted: {
            Qt.quit()
        }
    }

    Popup {
        id: popup
        width: 300
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        x: parent.width/2 - width/2
        y: parent.height/2 - height/2

    }

    Rectangle {
        id: fullRect
        color: "#202020"
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            gameEventList.visible = false
            //papermodeList.visible = false
        }
    }

    Rectangle {
        id: bgRect
        width: bg.paintedWidth
        height: bg.paintedHeight
        color: "transparent"
        anchors.centerIn: parent
    }

    function validate()
    {
        if(username === "")
        {
            invalidUserName.visible = true
            return false
        }

        if (port_name_text_field.text === "" && !popupMode)
        {
            invalidUserName.visible = true
            return false
        }

        return true
    }

    function reset()
    {
        username = ""
        gameMode = 0
        gameEvent = 0
        papermode = 0
    }

    function getGameEventText(index)
    {
        if (index === 0)
            return "10 Shots Match"
        else if (index === 1)
            return "20 Shots Match"
        else if (index === 2)
            return "30 Shots Match"
        else if (index === 3)
            return "40 Shots Match"
        else if (index === 4)
            return "60 Shots Match"

        return "Free Practice"
    }

    function getPaperModeText(index)
    {
        //        if (index === 0)
        //            return "Standard"
        //        if (index === 1)
        //            return "Dual Shots"
        //        if (index === 2)
        //            return "Pro Mode"
        //        else
        //            return "Multiple Shots"

        if (index === 0)
            return "Standard"
        else
            return "Pro Mode"
    }

    Image {
        id: bgRectImg
        source: "qrc:/images/loginPage/bgRectImg.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        anchors.fill: parent
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: bg
        source: isDefaultIcon ? "qrc:/images/loginPage/bg_tachus.png" : "qrc:/images/loginPage/bg.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        anchors.fill: parent
        //        fillMode: Image.PreserveAspectFit
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }

    Image {
        id: image_icon
        source: "qrc:/images/loginPage/image_icon.png"
        x: ((parent.width/rootItemWidth)*354)
        y: ((parent.height/rootItemHeight)* 14)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: upload_image_icon
        visible: true
        source: "qrc:/images/loginPage/upload_image_icon.png"
        x: ((parent.width/rootItemWidth)*386)
        y: ((parent.height/rootItemHeight)*91)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)

        MouseArea {
            property bool onItem: false
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                onItem = true
            }

            onExited: {
                onItem = false
            }

            ToolTip.visible: onItem
            ToolTip.text: qsTr("Upload image")
        }

    }

    Image {
        id: name
        source: "qrc:/images/loginPage/name.png"
        x: ((parent.width/rootItemWidth)*261)
        y: ((parent.height/rootItemHeight)*115)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }

    TextInput {
        id: name_text_field
        anchors.fill: name
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 5
        font.pixelSize: 0.5* height
        horizontalAlignment: TextInput.AlignHCenter
    }

    Image {
        id: demo
        source: "qrc:/images/loginPage/demo.png"
        x: ((parent.width/rootItemWidth)*211)
        y: ((parent.height/rootItemHeight)*480)
        opacity: demo_over.opacity === 1 ? 0 : 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
        visible: false
        //fillMode: Image.PreserveAspectFit
    }
    Image {
        id: demo_over
        source: "qrc:/images/loginPage/demo_over.png"
        x: ((parent.width/rootItemWidth)*211)
        y: ((parent.height/rootItemHeight)*480)

        opacity: demoMode ? 1 : 0
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
        visible: false
        //fillMode: Image.PreserveAspectFit
        MouseArea {
            id: demo_mouse
            anchors.fill: demo_over
            onClicked: {
                demoMode = !demoMode
            }
        }
    }

    Text {
        id: portNameLable
        text: "Port Name"
        x: demo_over.x
        y: demo_over.y - 50
        font.pixelSize: 10
        visible: !popupMode
    }

    Image {
        id: portnamebg
        source: "qrc:/images/loginPage/name.png"
        anchors.left: portNameLable.right
        anchors.leftMargin: 10
        anchors.top: portNameLable.top
        anchors.topMargin: -5
        opacity: 1
        width: 70
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: !popupMode
    }

    TextInput {
        id: port_name_text_field
        anchors.fill: portnamebg
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 5
        font.pixelSize: 0.5* height
        horizontalAlignment: TextInput.AlignHCenter
    }
    Image {
        id: pistol
        source: "qrc:/images/loginPage/pistol.png"
        x: ((parent.width/rootItemWidth)*229)
        y: ((bgRectImg.height/rootItemHeight)*212)
        opacity: pistol_over.opacity === 1 ? 0 : 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pistol_over
        source: "qrc:/images/loginPage/pistol_over.png"
        x: ((parent.width/rootItemWidth)*229)
        y: ((bgRectImg.height/rootItemHeight)*212)
        opacity: gameMode === 0 ? 1 : 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }

    MouseArea {
        id: pistolMouse
        anchors.fill: pistol_over
        onClicked : {
            papermode = 0
            gameMode = 0
        }
    }

    Image {
        id: rifle
        source: "qrc:/images/loginPage/rifle.png"
        x: ((parent.width/rootItemWidth)*403)
        y: ((parent.height/rootItemHeight)*212)
        opacity: rifle_over.opacity === 1 ? 0 : 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: rifle_over
        source: "qrc:/images/loginPage/rifle_over.png"
        x: ((parent.width/rootItemWidth)*403)
        y: ((parent.height/rootItemHeight)*(192+ 20))
        opacity: gameMode === 1 ? 1 : 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    MouseArea {
        id: rifleMouse
        anchors.fill: rifle_over
        onClicked: {
            papermode = 0
            gameMode = 1
        }
    }

    Image {
        id: shots_40_match
        source: "qrc:/images/loginPage/shots_40_match.png"
        x: ((parent.width/rootItemWidth)*299)
        y: ((parent.height/rootItemHeight)*269)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: shots_40_match_text_field
        source: "qrc:/images/loginPage/shots_40_match_text_field.png"
        x: ((parent.width/rootItemWidth)*299)
        y: ((parent.height/rootItemHeight)*269)
        opacity: 0
        //        width: 0.75 * shots_40_match.width
        //        height: shots_40_match.height
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }

    Text {
        id: gameEventText
        width: implicitWidth
        height: implicitHeight
        anchors.verticalCenter: shots_40_match.verticalCenter
        anchors.horizontalCenter: shots_40_match.horizontalCenter
        anchors.horizontalCenterOffset: -0.15*shots_40_match.width

        text : getGameEventText(gameEvent)
        color: "white"
    }

    MouseArea {
        id: gameEventMouse
        anchors.fill: shots_40_match
        onClicked: {
            //papermodeList.visible = false
            gameEventList.visible = true
        }
    }

    ListView {
        id: gameEventList
        anchors.top: shots_40_match.bottom
        anchors.topMargin: 5
        anchors.left: shots_40_match.left
        width: shots_40_match.width
        height: 6*shots_40_match.height
        visible: false
        z: 10

        model: 6

        delegate: Rectangle {
            width: parent.width
            height: shots_40_match.height
            border.width: 1
            border.color: "black"
            color: gameEvent === index ? "red" : "#2698d5"

            onVisibleChanged: {
                color = (gameEvent === index) ? "red" : "#2698d5"
            }

            Text {
                width: implicitWidth
                height: implicitHeight
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: getGameEventText(index)
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    parent.color = "green"
                }

                onExited: {
                    parent.color = (gameEvent === index) ? "red" : "#2698d5"
                }

                onClicked: {
                    gameEvent = index
                    gameEventList.visible = false
                }
            }
        }
    }

    //    Image {
    //        id: standard
    //        source: "qrc:/images/loginPage/standard.png"
    //        x: ((parent.width/rootItemWidth)*300)
    //        y: ((parent.height/rootItemHeight)*375)
    //        opacity: gameMode === 0 ? 1 : 0
    //        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
    //        height: ((bg.height/rootItemHeight)*sourceSize.height)
    //    }
    //    Image {
    //        id: standard1
    //        source: "qrc:/images/loginPage/standard1.png"
    //        x: ((parent.width/rootItemWidth)*300)
    //        y: ((parent.height/rootItemHeight)*375)
    //        opacity: 0//standard.opacity === 1 ? 0 : 1
    //        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
    //        height: ((bg.height/rootItemHeight)*sourceSize.height)
    //    }
    //    Image {
    //        id: standard_text_field
    //        source: "qrc:/images/loginPage/standard_text_field.png"
    //        x: ((parent.width/rootItemWidth)*300)
    //        y: ((parent.height/rootItemHeight)*375)
    //        opacity: standard.opacity === 1 ? 0 : 1
    //        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
    //        height: ((bg.height/rootItemHeight)*sourceSize.height)
    //    }

    //    Text {
    //        id: paperModeText
    //        width: implicitWidth
    //        height: implicitHeight
    //        anchors.verticalCenter: standard_text_field.verticalCenter
    //        anchors.horizontalCenter: standard_text_field.horizontalCenter

    //        text : getPaperModeText(papermode)
    //        color: "white"
    //    }

    //    MouseArea {
    //        anchors.fill: standard
    //        onClicked: {
    //            if (gameMode === 0)
    //            {
    //                papermodeList.visible = true
    //                gameEventList.visible = false
    //            }
    //        }
    //    }

    //    ListView {
    //        id: papermodeList
    //        anchors.top: standard_text_field.bottom
    //        anchors.topMargin: 2
    //        anchors.left: standard_text_field.left
    //        width: standard_text_field.width
    //        visible: false
    //        z: 10

    //        model: 2

    //        height: papermodeList.count * standard_text_field.height

    //        delegate: Rectangle {
    //            width: parent.width
    //            height: standard_text_field.height
    //            border.width: 1
    //            border.color: "black"
    //            color: papermode === index ? "red" : "#2698d5"

    //            onVisibleChanged: {
    //                color = (papermode === index) ? "red" : "#2698d5"
    //            }

    //            Text {
    //                width: implicitWidth
    //                height: implicitHeight
    //                anchors.verticalCenter: parent.verticalCenter
    //                anchors.horizontalCenter: parent.horizontalCenter
    //                text: getPaperModeText(index)
    //                color: "white"
    //            }
    //            MouseArea {
    //                anchors.fill: parent
    //                hoverEnabled: true

    //                onEntered: {
    //                    parent.color = "green"
    //                }

    //                onExited: {
    //                    parent.color = (papermode === index) ? "red" : "#2698d5"
    //                }

    //                onClicked: {
    //                    papermode = index
    //                    papermodeList.visible = false
    //                }
    //            }
    //        }
    //    }

    Image {
        id: start
        source: "qrc:/images/loginPage/start.png"
        x: ((parent.width/rootItemWidth)*317)
        y: ((parent.height/rootItemHeight)*466)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }

    MouseArea {
        anchors.fill: start
        onClicked: {
            if (!appMode) // in demo mode
            {
                rootItem.visible = false
            } else {
                if (!popupMode && port_name_text_field.text != "")
                {
                    MODREADER.connectedModbus(port_name_text_field.text)
                    mod_connected = MODREADER.isModBusConnected()
                }

                if (!mod_connected) // we need validation only if port are connected
                {
                    if (popupMode)
                        modBusConnector.visible = true
                    // else TextInput is provided to given the port name
                }else if (validate())
                    rootItem.visible = false
            }
        }
        onPressed: {
            start.visible = false
            start_over.visible = true
        }
        onPressAndHold: {
            start.visible = false
            start_over.visible = true
        }
        onReleased: {
            start.visible = true
            start_over.visible = false
            if (mod_connected)
            {
                MODREADER.on_pushButton_clicked();
                MODREADER.on_pushButton_2_clicked();
                MODREADER.resetShootinCount()
            }
        }
    }

    function startButtonClickedOnLoadGame()
    {
        //this function is only called during loadSavedGame()
        // so called loadSavedGame() before calling rootItem.visible = false
        if (!appMode) // in demo mode
        {
            rootItem.visible = false
        } else {
            if (!popupMode && port_name_text_field.text != "")
            {
                MODREADER.connectedModbus(port_name_text_field.text)
                mod_connected = MODREADER.isModBusConnected()
            }

            if (!mod_connected) // we need validation only if port are connected
            {
                if (popupMode)
                    modBusConnector.visible = true
                // else TextInput is provided to given the port name
            }else if (validate()) {
                rootItem.visible = false
            }
        }
    }

    Image {
        id: start_over
        source: "qrc:/images/loginPage/start_over.png"
        x: ((parent.width/rootItemWidth)*317)
        y: ((parent.height/rootItemHeight)*466)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: device_conhnected
        source: "qrc:/images/loginPage/device_conhnected.png"
        x: ((parent.width/rootItemWidth)*35)
        y: ((parent.height/rootItemHeight)*648)
        opacity: mod_connected ? 1 : 0
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: device_conhnected_blue
        source: "qrc:/images/loginPage/device_conhnected_blue.png"
        x: ((parent.width/rootItemWidth)*35)
        y: ((parent.height/rootItemHeight)*648)
        opacity: mod_connected ? 0 : 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!mod_connected)
                {
                    if (popupMode)
                    {
                        MODREADER.connectedModbus()
                        mod_connected = MODREADER.isModBusConnected()
                        if (!mod_connected)
                            modBusConnector.visible = true
                    }
                } else {
                    MODREADER.disconnectModbus()
                    mod_connected = MODREADER.isModBusConnected()
                }
            }
        }
    }

    Image {
        id: license_details
        source: "qrc:/images/loginPage/license_details.png"
        x: ((parent.width/rootItemWidth)*259)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    MouseArea {
        anchors.fill: license_details
        onClicked: {
        }
        onPressed: {
            license_details.visible = false
            license_details_over.visible = true
        }
        onPressAndHold: {
            license_details.visible = false
            license_details_over.visible = true
        }
        onReleased: {
            license_details.visible = true
            license_details_over.visible = false
        }
    }

    Image {
        id: license_details_over
        source: "qrc:/images/loginPage/license_details_over.png"
        x: ((parent.width/rootItemWidth)*259)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        visible: false
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: open_saved_files
        source: "qrc:/images/loginPage/open_saved_files.png"
        x: ((parent.width/rootItemWidth)*411)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    MouseArea {
        anchors.fill: open_saved_files
        onClicked: {
            APPSETTINGS.uploadGame()
            userName = APPSETTINGS.getUserName()
            gameMode = APPSETTINGS.getGameMode()
            gameEvent = APPSETTINGS.getGameEvent()

            if (userName != "")
            {
                startButtonClickedOnLoadGame()
                isSaveGame = true
            }
        }
        onPressed: {
            open_saved_files.visible = false
            open_saved_files_over.visible = true
        }
        onPressAndHold: {
            open_saved_files.visible = false
            open_saved_files_over.visible = true
        }
        onReleased: {
            open_saved_files.visible = true
            open_saved_files_over.visible = false
        }
    }
    Image {
        id: open_saved_files_over
        source: "qrc:/images/loginPage/open_saved_files_over.png"
        x: ((parent.width/rootItemWidth)*411)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        visible: false
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: user_guide
        source: "qrc:/images/loginPage/user_guide.png"
        x: ((parent.width/rootItemWidth)*1004)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    MouseArea {
        anchors.fill: user_guide
        onClicked: {
        }
        onPressed: {
            user_guide.visible = false
            user_guide_over.visible = true
        }
        onPressAndHold: {
            user_guide.visible = false
            user_guide_over.visible = true
        }
        onReleased: {
            user_guide.visible = true
            user_guide_over.visible = false
        }
    }
    Image {
        id: user_guide_over
        source: "qrc:/images/loginPage/user_guide_over.png"
        x: ((parent.width/rootItemWidth)*1004)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        visible: false
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: reset
        source: "qrc:/images/loginPage/reset.png"
        x: ((parent.width/rootItemWidth)*510)
        y: ((parent.height/rootItemHeight)*480)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)

        MouseArea {
            anchors.fill: parent
            onClicked: rootItem.reset()
            onPressed: {
                reset.visible = false
                reset_over.visible = true
            }
            onPressAndHold: {
                reset.visible = false
                reset_over.visible = true
            }
            onReleased: {
                reset.visible = true
                reset_over.visible = false
            }
        }
    }

    Image {
        id: reset_over
        source: "qrc:/images/loginPage/reset_over.png"
        x: ((parent.width/rootItemWidth)*510)
        y: ((parent.height/rootItemHeight)*480)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }

    Image {
        id: contact_us
        source: "qrc:/images/loginPage/contact_us.png"
        x: ((parent.width/rootItemWidth)*1185)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
        MouseArea {
            anchors.fill: parent
            //onClicked: rootItem.reset()
            onPressed: {
                contact_us.visible = false
                contact_us_over.visible = true
            }
            onPressAndHold: {
                contact_us.visible = false
                contact_us_over.visible = true
            }
            onReleased: {
                contact_us.visible = true
                contact_us_over.visible = false
            }
        }
    }
    Image {
        id: contact_us_over
        source: "qrc:/images/loginPage/contact_us_over.png"
        x: ((parent.width/rootItemWidth)*1185)
        y: ((parent.height/rootItemHeight)*646)
        opacity: 1
        visible: false
        width: ((bgRect.width/rootItemWidth)*sourceSize.width)
        height: ((bg.height/rootItemHeight)*sourceSize.height)
    }
}
