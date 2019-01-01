import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtCharts 2.2

Dialog {
    id:screenPresence
    title: "Match Summary"

    contentItem:Rectangle {
        id:contentRect
        anchors.fill: parent
        color: "grey"
        Rectangle
        {
            id:print_region
            width:parent.width
            height: parent.height*0.9
            color: "white"
            border.width: 20
            border.color: "transparent"
            //        }
            Column{
                anchors.fill: parent
                Row {
                    //                anchors.fill: parent
                    width:parent.width
                    height: parent.height*0.9

                    Image {
                        id: shootingcanvas
                        source: centerPanel.gameMode ? (shootingPage.isBackgroudBlack ? "qrc:/images/centerPanel/pistol.png" : "qrc:/images/centerPanel/pistol_blue.png")
                                                     : (shootingPage.isBackgroudBlack ? "qrc:/images/centerPanel/rifle.png" : "qrc:/images/centerPanel/rifle_blue.png")
                        //                        anchors.fill: parent
                        width: parent.width < parent.height ? parent.width : parent.height
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

                    Rectangle {
                        width:parent.width*0.5
                        height:parent.height
                        Column{
                            anchors.fill: parent
                            anchors.leftMargin: 30
                            anchors.topMargin: 30
                            spacing: 20
                            Grid{
                                columns : 2
                                rows:9
                                columnSpacing:  40
                                rowSpacing: 20
                                id:shooterName
                                Text {
                                    text:"Date and Time"
                                    font.bold: true
                                }
                                Text {
                                    id:event_Date
                                    text:": " + new Date().toLocaleString()
                                    font.bold: true
                                }
                                Text {
                                    id:shooterLabel
                                    text:"Shooter Name"
                                    font.bold: true
                                }
                                Text {
                                    id:name
                                    text:": " + userName
                                    font.bold: true
                                }
                                Text {
                                    id:eventLabel
                                    text:"Event"
                                    font.bold: true
                                }
                                Text {
                                    id:event_Name
                                    text:": " + eventName
                                    font.bold: true
                                }
                                Text {
                                    text:"Total Shots"
                                    font.bold: true
                                }
                                Text {
                                    id:number_Shots
                                    text:": " + globalModelOfData.count
                                    font.bold: true
                                }
                                Text {
                                    text:"Total Score"
                                    font.bold: true
                                }
                                Text {
                                    id:event_score
                                    text:": " + totalScore.toFixed(2)
                                    font.bold: true
                                }
                                Text {
                                    text:"Average score"
                                    font.bold: true
                                }
                                Text {
                                    id:event_average
                                    text:": " + (totalScore/globalModelOfData.count).toFixed(2)
                                    font.bold: true
                                }
                                Text {
                                    text:"Average Time/Shot (In minutes)"
                                    font.bold: true
                                }
                                Text {
                                    id:average_time_shot
                                    //                            text:": " + averageTime
                                    text:": " + (totalTime/globalModelOfData.count).toFixed(2)
                                    font.bold: true
                                }
                                Text {
                                    id:series_wise_totalLabel
                                    text:"Series wise total"
                                    font.bold: true
                                }
                                Text {
                                    id:series_wise_total
                                    width: 150
                                    text:": " + getSeriesTotalText()
                                    font.bold: true
                                    wrapMode: Text.WordWrap
                                }
                                Text {
                                    id:mpi
                                    text:"MPI"
                                    font.bold: true
                                }
                                Text {
                                    id:mpi_value
                                    width: 150
                                    text:getMPI()
                                    font.bold: true
                                    wrapMode: Text.WordWrap
                                }
                            }
                        }
                    }
                }

            }
        }
        Rectangle {
            width:parent.width
            height:parent.height*0.1
            anchors.bottom: contentRect.bottom
            Button {
                text:"Close"
                anchors.centerIn: parent
                onClicked:
                {
                    close()
                }
            }
        }
    }

    function updateModel()
    {
        numberRepeater.model = null
        numberRepeater.model =globalModelOfData
    }

    function printImage()
    {
        var stat = print_region.grabToImage(function(result) {
            CUSTOMPRINT.print(result.image); //result.image holds the QVariant
        });
    }

    function getSeriesTotalText()
    {
        var formatText = ""
        if(globalModelOfData.count === 0)
            return formatText
        var seriesScore = 0;
        for(var i=0; i<globalModelOfData.count; i++)
        {
            var scoreatIndex =globalModelOfData.get(i).calculatedscore*1
            seriesScore = seriesScore*1  +  (scoreatIndex.toFixed(1))*1
            console.log("Total score and score at current Index is",seriesScore,scoreatIndex)
            if( ( (i+1) % 10 == 0) && (i>0) )
            {
                var seriesId = Math.floor((i+1)/10)
                var seriesText = "Series " + seriesId*1
                seriesText += "(" + (seriesScore*1).toFixed(1) +") , "
                formatText = formatText + seriesText
                seriesScore = 0
            }
            if( (i === (globalModelOfData.count-1)) && ( (i+1)%10 != 0) )
            {
                var seriesIdNum = Math.floor((i+1)/10)
                var seriesScoreText = "Series " + seriesIdNum*1
                seriesScoreText += "(" + (seriesScore*1).toFixed(1) +")"
                formatText = formatText + seriesScoreText
                seriesScore = 0
            }
        }
        return formatText
    }

    function getMPI()
    {
        return (":  X: " + getXMPI()+"; Y: "+getYMPI())
    }

    function getXMPI()
    {
        console.log("-----------------*******************__________________")
        return MODREADER.getXMPI()
    }
    function getYMPI()
    {
        console.log("-----------------*******************__________________1")
        return MODREADER.getYMPI()
    }

}
