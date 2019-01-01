import QtQuick 2.0

Item {
    id: loginPage

    property int rootItemWidth:992
    property int rootItemHeight:597

    Rectangle {
        anchors.fill: parent
        color: "lightgrey"
    }

    Rectangle {
        width: 0.7*parent.width
        height: 0.7*parent.height

        anchors.centerIn: parent

        //////////////////////////////////////////////
        Image {
            id: blue_bg
            source: "qrc:/images/loginPage/blue_bg.png"
            x: ((parent.width/rootItemWidth)*39)
            y: ((parent.height/rootItemHeight)*134)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: user_pic
            source: "qrc:/images/loginPage/user_pic.png"
            x: ((parent.width/rootItemWidth)*79)
            y: ((parent.height/rootItemHeight)*97)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: demo
            source: "qrc:/images/loginPage/demo.png"
            x: ((parent.width/rootItemWidth)*239)
            y: ((parent.height/rootItemHeight)*335)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: demo_over
            source: "qrc:/images/loginPage/demo_over.png"
            x: ((parent.width/rootItemWidth)*239)
            y: ((parent.height/rootItemHeight)*335)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: name
            source: "qrc:/images/loginPage/name.png"
            x: ((parent.width/rootItemWidth)*179)
            y: ((parent.height/rootItemHeight)*175)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: view_saved
            source: "qrc:/images/loginPage/view_saved.png"
            x: ((parent.width/rootItemWidth)*699)
            y: ((parent.height/rootItemHeight)*375)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: view_saved_over
            source: "qrc:/images/loginPage/view_saved_over.png"
            x: ((parent.width/rootItemWidth)*699)
            y: ((parent.height/rootItemHeight)*375)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: start
            source: "qrc:/images/loginPage/start.png"
            x: ((parent.width/rootItemWidth)*61)
            y: ((parent.height/rootItemHeight)*256)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: start_over
            source: "qrc:/images/loginPage/start_over.png"
            x: ((parent.width/rootItemWidth)*61)
            y: ((parent.height/rootItemHeight)*256)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: event
            source: "qrc:/images/loginPage/event.png"
            x: ((parent.width/rootItemWidth)*61)
            y: ((parent.height/rootItemHeight)*289)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: event_over
            source: "qrc:/images/loginPage/event_over.png"
            x: ((parent.width/rootItemWidth)*61)
            y: ((parent.height/rootItemHeight)*289)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: match
            source: "qrc:/images/loginPage/match.png"
            x: ((parent.width/rootItemWidth)*238)
            y: ((parent.height/rootItemHeight)*254)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: match_filedd
            source: "qrc:/images/loginPage/match_filedd.png"
            x: ((parent.width/rootItemWidth)*282)
            y: ((parent.height/rootItemHeight)*254)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: reset
            source: "qrc:/images/loginPage/reset.png"
            x: ((parent.width/rootItemWidth)*460)
            y: ((parent.height/rootItemHeight)*326)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: reset_over
            source: "qrc:/images/loginPage/reset_over.png"
            x: ((parent.width/rootItemWidth)*460)
            y: ((parent.height/rootItemHeight)*326)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: wi_fi
            source: "qrc:/images/loginPage/wi_fi.png"
            x: ((parent.width/rootItemWidth)*102)
            y: ((parent.height/rootItemHeight)*542)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: wi_fi_over
            source: "qrc:/images/loginPage/wi_fi_over.png"
            x: ((parent.width/rootItemWidth)*102)
            y: ((parent.height/rootItemHeight)*542)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: lan
            source: "qrc:/images/loginPage/lan.png"
            x: ((parent.width/rootItemWidth)*288)
            y: ((parent.height/rootItemHeight)*541)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: lan_over
            source: "qrc:/images/loginPage/lan_over.png"
            x: ((parent.width/rootItemWidth)*288)
            y: ((parent.height/rootItemHeight)*541)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: rifle_field
            source: "qrc:/images/loginPage/rifle_field.png"
            x: ((parent.width/rootItemWidth)*62)
            y: ((parent.height/rootItemHeight)*309)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: user_manual
            source: "qrc:/images/loginPage/user_manual.png"
            x: ((parent.width/rootItemWidth)*717)
            y: ((parent.height/rootItemHeight)*453)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }
        Image {
            id: user_manual_over
            source: "qrc:/images/loginPage/user_manual_over.png"
            x: ((parent.width/rootItemWidth)*717)
            y: ((parent.height/rootItemHeight)*453)
            opacity: 1
            width: ((parent.width/rootItemWidth)*sourceSize.width)
            height: ((parent.height/rootItemHeight)*sourceSize.height)
        }

        ///////////////////////////////
        MouseArea {
            anchors.fill: parent
            onClicked: {
                loginPage.visible = false
            }
        }
    }

}
