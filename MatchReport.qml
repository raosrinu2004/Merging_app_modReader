import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
    id:screenPresence
    title: "Match Report"

    property int repeaterModelCount: globalModelOfData.count <= 10 ? 0 : (globalModelOfData.count - 10)/30 + 1

    Connections{
        target: CUSTOMPRINT
        onSaveComplete :{
            console.log("Saved done")
            close()
        }
    }

    onAccepted: {
        console.log("888888888888888888888888888888888888888888888888 accespted")
    }

    onRejected: {
        console.log("9999999999999999999999999999999999999999999999999 rejected")
    }

    onVisibleChanged: {
        console.log("Sriiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiissssssssss", visible)
        contentRect.visible = visible
    }

    contentItem:Rectangle {
        id:contentRect
        anchors.fill: parent
        color: "transparent"

        onVisibleChanged: {
            console.log("aaaaaaaaaaaaaaaaaaaaaaaaaSriiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii", visible)
        }
        ScrollView {
            id: scrollView
            width: parent.width
            height: parent.height - buttonRect.height
            Column {
                spacing: 20
                width: scrollView.width

                PdfPage {
                    id: print_region
                    pageIndex: 1
                    width: parent.width
                    height: 700
                    sourceComp: tempComp
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Rectangle {
                    height: 20
                    width: scrollView.width
                    color: "transparent"
                }

                Repeater {
                    id: reportRepeater
                    visible: globalModelOfData.count > 10
                    model: repeaterModelCount
                    delegate: PdfSeriesPage {
                        pageIndex: index+2
                        //width: parent.width
                        anchors.horizontalCenter: parent.horizontalCenter
                        onVisibleChanged: {
                            console.log("test 1111--------------------------------")
                        }
                    }
                }
            }
        }

        Rectangle {
            id: buttonRect
            width:parent.width
            height:parent.height*0.1
            anchors.bottom: contentRect.bottom
            Row{
                anchors.centerIn: parent
                Button {
                    text:"Save"
                    onClicked:
                    {
                        printImage()
                    }
                }
                Button {
                    text:"Cancel"
                    onClicked:
                    {
                        close()
                    }
                }
            }
        }
    }

    Component {
        id: tempComp
        Rectangle {
            color: "transparent"

            Column{
                anchors.fill: parent
                anchors.topMargin: 20
                anchors.leftMargin: 20

                Rectangle {
                    id: matchSummartTextRect
                    width: parent.width
                    height: 40
                    color: "transparent"

                    Text {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 75
                        text: "Match Summary"
                        font.pixelSize: 20
                    }
                }

                Row {
                    width: parent.width > 300 ? parent.width : 500
                    height: 300
                    spacing: 30
                    Image {
                        id: shootingcanvas
                        source: centerPanel.gameMode ? (shootingPage.isBackgroudBlack ? "qrc:/images/centerPanel/pistol.png" : "qrc:/images/centerPanel/pistol_blue.png")
                                                     : (shootingPage.isBackgroudBlack ? "qrc:/images/centerPanel/rifle.png" : "qrc:/images/centerPanel/rifle_blue.png")
                        width: 300 //parent.width < parent.height ? parent.width*0.45 : parent.height*0.45
                        height: width
                        opacity: 1

                        Rectangle {
                            id: shootingMianRect
                            color: "transparent"
                            anchors.fill: parent
                        }

                        Repeater
                        {
                            id:numberRepeater
                            model:globalModelOfData
                            delegate: numberDelegate
                        }

                        Component {
                            id:numberDelegate
                            Item {
                                id:mainItem
                                // 34.55 and 10.11 was given by abins (tachus)
                                width: centerPanel.gameMode ? shootingcanvas.height/34.55 : shootingcanvas.height/10
                                height: width
                                Rectangle
                                {
                                    Component.onCompleted:
                                    {
                                        var xCor = MODREADER.getXCord(index+1)
                                        var yCor = MODREADER.getYCord(index+1)

                                        var pistalWidthHeight = 155.5
                                        var rifleWidthHeight = 45.5
                                        var shootingWidth = centerPanel.gameMode ? pistalWidthHeight : rifleWidthHeight
                                        var shootingHeight = centerPanel.gameMode ? pistalWidthHeight : rifleWidthHeight

                                        var offsetX = shootingMianRect.width/shootingWidth
                                        var offsetY = shootingMianRect.height/shootingHeight

                                        var centerX = shootingMianRect.width/2 //* offset
                                        var centerY = shootingMianRect.height/2 //* offset

                                        var bulletSize = 0//4.5/2

                                        mainItem.x = shootingMianRect.x + centerX+((xCor+bulletSize)*offsetX) - radius
                                        mainItem.y = shootingMianRect.y + centerY-((yCor+bulletSize)*offsetY) - radius
                                    }
                                    anchors.fill: parent
                                    radius:parent.width/2
                                    color: shootingPage.isPalletRed ? "red" : "white"
                                    Text{
                                        anchors.centerIn: parent
                                        text: index+1
                                    }
                                    border.color: "red"
                                }
                            }
                        }

                    }

                    MatchReportInfo {
                        width: parent.width - shootingcanvas.width
                        height: parent.height
                    }
                }

                Rectangle {
                    id: matchReportTextRect
                    width: parent.width
                    height: 40
                    color: "transparent"

                    Text {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "REPORTS"
                        font.pixelSize: 20
                    }
                }

                SeriesComponent {
                    seriesIndex: 1
                    width: parent.width
                    height: 200
                }
            }
        }
    }

    function circleRegionCordinates()
    {
        var left = Qt.point(270,4);
        left = preview.mapToPosition(left,scaterSeries);
        var right = Qt.point(90,4);
        right = preview.mapToPosition(right,scaterSeries);
        var top = Qt.point(360,4);
        top = preview.mapToPosition(top,scaterSeries);
        var bottom = Qt.point(180,4);
        bottom = preview.mapToPosition(bottom,scaterSeries);

        circleRegion.x = left.x
        circleRegion.y = top.y
        circleRegion.width = right.x - left.x
        circleRegion.height = circleRegion.width
        circleRegion.radius = circleRegion.width/2

        updateModel()
    }

    function updateModel()
    {
        numberRepeater.model = null
        numberRepeater.model =globalModelOfData
    }

    function printImage()
    {
        CUSTOMPRINT.clearImagesList()
        var stat = print_region.grabToImage(function(result) {
            CUSTOMPRINT.addImage(result.image);
            //CUSTOMPRINT.print(result.image); //result.image holds the QVariant
            //CUSTOMPRINT.printPNG(result.image); //result.image holds the QVariant
        }/*, Qt.size(595, 842)*/); //2229, 3258
        for (var i=0; i < reportRepeater.count; ++i)
        {
            reportRepeater.itemAt(i).grabToImage(function(result) {
                CUSTOMPRINT.addImage(result.image);
            }, Qt.size(8917/4, 13033/4));
        }
        CUSTOMPRINT.createPdf();
    }
}
