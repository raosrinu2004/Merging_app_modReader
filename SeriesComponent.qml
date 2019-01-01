import QtQuick 2.3

Item {
    id: seriesComp

    property int seriesIndex: 0 //0 is invalid, series starts with 1

    Rectangle {
        color: "transparent"

        Column{
            anchors.fill: parent
            anchors.topMargin: 20
            anchors.leftMargin: 20

            Row {
                width: parent.width > 300 ? parent.width : 500
                height: 150
                spacing: 150
                Image {
                    id: shootingcanvas
                    source: centerPanel.gameMode ? (shootingPage.isBackgroudBlack ? "qrc:/images/centerPanel/pistol.png" : "qrc:/images/centerPanel/pistol_blue.png")
                                                 : (shootingPage.isBackgroudBlack ? "qrc:/images/centerPanel/rifle.png" : "qrc:/images/centerPanel/rifle_blue.png")
                    width: 150 //parent.width < parent.height ? parent.width*0.45 : parent.height*0.45
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
                                id: mainItemRect
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

                                    console.log(seriesIndex, "componene comp ----------------------------------121")
                                }

                                onVisibleChanged: {
                                    console.log(seriesIndex, "on visible changed ----------------------------------121 ", visible)
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
                                color: shootingPage.isPalletRed ? "green" : "white"
                                Text{
                                    anchors.centerIn: parent
                                    text: index+1
                                }
                                border.color: "red"
                                visible: index >= (seriesComp.seriesIndex - 1) *10 && index < seriesComp.seriesIndex*10 ? true : false

                                function refreshPelletItem()
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
                            }

                            onVisibleChanged: {
                                mainItemRect.refreshPelletItem()
                            }
                        }


                    }

                }

                MatchReportInfo {
                    isMatchSummary: false
                    seriesIndex: seriesComp.seriesIndex
                    width: parent.width - shootingcanvas.width
                    height: parent.height
                }
            }
        }
    }
}
