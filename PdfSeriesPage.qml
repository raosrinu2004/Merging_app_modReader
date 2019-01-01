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


        Rectangle {
            color: "transparent"
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Column{
                anchors.fill: parent
                anchors.topMargin: 20
                anchors.leftMargin: 20

                SeriesComponent {
                    seriesIndex: (rootItem.pageIndex-2) * 3 + 2 // as series 1 is already in first page
                    width: parent.width
                    height: 200
                    visible: (seriesIndex-1)*10 <= globalModelOfData.count

                    Component.onCompleted: {
                        visible = false
                        visible = (seriesIndex-1)*10 <= globalModelOfData.count
                        console.log(visible," PDF series page for series ", seriesIndex, " count ", globalModelOfData.count)
                    }
                }
                SeriesComponent {
                    seriesIndex: (rootItem.pageIndex-2) * 3 + 3 // as series 1 is already in first page
                    width: parent.width
                    height: 200
                    visible: (seriesIndex-1)*10 <= globalModelOfData.count
                    Component.onCompleted: {
                        visible = false
                        visible = (seriesIndex-1)*10 <= globalModelOfData.count
                        console.log(visible," PDF series page for series ", seriesIndex)
                    }
                }
                SeriesComponent {
                    seriesIndex: (rootItem.pageIndex-2) * 3 + 4 // as series 1 is already in first page
                    width: parent.width
                    height: 200
                    visible: (seriesIndex-1)*10 <= globalModelOfData.count
                    Component.onCompleted: {
                        visible = false
                        visible = (seriesIndex-1)*10 <= globalModelOfData.count
                        console.log(visible," PDF series page for series ", seriesIndex)
                    }
                }
            }
        }

        radius: 8
    }
}
