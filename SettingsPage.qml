import QtQuick 2.2
import QtQuick.Window 2.2

Item {
    id: name

    property int rootItemWidth:158
    property int rootItemHeight:61

    width:158
    height: 61

    property bool isPalletRedColor: true
    property bool isBackGroundBlack: true

    Image {
        id: settings_popup
        source: "qrc:/images/settings/settings_popup.png"
        x: ((parent.width/rootItemWidth)*1)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pellet_color_green_highlight
        source: "qrc:/images/settings/pellet_color_red_highlight.png"
        x: ((parent.width/rootItemWidth)*98)
        y: ((parent.height/rootItemHeight)*32)
        opacity: isPalletRedColor
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)

        MouseArea {
            anchors.fill: parent
            onClicked: {
                isPalletRedColor = true
            }
        }
    }
    Image {
        id: background_color_white_no_highlight
        source: "qrc:/images/settings/background_color_blue_no_highlight.png"
        x: ((parent.width/rootItemWidth)*123)
        y: ((parent.height/rootItemHeight)*6)
        opacity: isBackGroundBlack
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pellet_color_white_no_highlight
        source: "qrc:/images/settings/pellet_color_white_no_highlight.png"
        x: ((parent.width/rootItemWidth)*123)
        y: ((parent.height/rootItemHeight)*32)
        opacity: isPalletRedColor
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: background_color_black_no_highlight
        source: "qrc:/images/settings/background_color_black_no_highlight.png"
        x: ((parent.width/rootItemWidth)*98)
        y: ((parent.height/rootItemHeight)*6)
        opacity: !isBackGroundBlack
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pellet_color_white_highlight
        source: "qrc:/images/settings/pellet_color_white_highlight.png"
        x: ((parent.width/rootItemWidth)*124)
        y: ((parent.height/rootItemHeight)*33)
        opacity: !isPalletRedColor
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)

        MouseArea {
            anchors.fill: parent
            onClicked: {
                isPalletRedColor = false
                console.log("*************test")
            }
        }
    }
    Image {
        id: pellet_color_green_highlight_1
        source: "qrc:/images/settings/pellet_color_red_no_highlight.png"
        x: ((parent.width/rootItemWidth)*99)
        y: ((parent.height/rootItemHeight)*33)
        opacity: !isPalletRedColor
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: background_color_white_highlight
        source: "qrc:/images/settings/background_color_blue_highlight.png"
        x: ((parent.width/rootItemWidth)*124)
        y: ((parent.height/rootItemHeight)*6)
        opacity: !isBackGroundBlack
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        MouseArea {
            anchors.fill: parent
            onClicked: {
                isBackGroundBlack = false
            }
        }
    }
    Image {
        id: background_color_black_highlight
        source: "qrc:/images/settings/background_color_black_highlight.png"
        x: ((parent.width/rootItemWidth)*99)
        y: ((parent.height/rootItemHeight)*6)
        opacity: isBackGroundBlack
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        MouseArea {
            anchors.fill: parent
            onClicked: {
                isBackGroundBlack = true
            }
        }
    }
}
