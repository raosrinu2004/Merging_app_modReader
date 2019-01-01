import QtQuick 2.0

Item {
    id: rootItem
    width: 595 // A4 size for 72 dpi
    height: 842 // A4 sixe for 72 dpi

    property int pageIndex: 0
    property string title: "Page " + pageIndex
    property var sourceComp: null

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text {
            id: headerTitle
            width: implicitWidth
            height: implicitHeight
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: title
            color: "black"
        }


        Loader {
            sourceComponent: sourceComp
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }

        radius: 8
    }
}
