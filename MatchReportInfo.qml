import QtQuick 2.0

Item {
    id: matchInfo

    property bool isMatchSummary: true
    property int seriesIndex: 0 // 0 is invalid series start with 1

    Rectangle {
        anchors.fill: parent
        color: "transparent"
    }

    Rectangle {
        width: 0.9*parent.width
        height: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"

        Column{
            spacing: 5
            Grid{
                anchors.fill: parent
                columns : 2
                rows:8
                columnSpacing:  20
                rowSpacing: 10
                id:shooterName
                //                Text {
                //                    text:"Date and Time"
                //                    font.bold: true
                //                }
                //                Text {
                //                    id:event_Date
                //                    text:": " + new Date().toLocaleString()
                //                    font.bold: true
                //                }

                Row {
                    spacing: 20
                    Text {
                        id:shooterLabel
                        text: isMatchSummary ? "Shooter Name" : "SERIES"
                        font.bold: true
                    }
                    Text {
                        id:name
                        text: isMatchSummary ? ": " + userName : ": "+seriesIndex
                        font.bold: true
                    }
                }

                Rectangle {
                    width: 20
                    height: 5
                    color: "transparent"
                }

                Row {
                    spacing: 20
                    Text {
                        id:eventLabel
                        text:"Event           "//14 char
                        font.bold: true
                        visible: isMatchSummary
                    }
                    Text {
                        id:event_Name
                        text:": " + eventName
                        font.bold: true
                        visible: isMatchSummary
                    }
                }

                Rectangle {
                    width: 20
                    height: 5
                    color: "transparent"
                }

                Row {
                    spacing: 20

                    Text {
                        text: "Total Shots   "//14 char
                        font.bold: true
                        visible: isMatchSummary
                    }
                    Text {
                        id:number_Shots
                        text:": " + globalModelOfData.count
                        font.bold: true
                        visible: isMatchSummary
                    }
                }

                Rectangle {
                    width: 20
                    height: 5
                    color: "transparent"
                }

                Row {
                    spacing: 20
                    Text {
                        text: isMatchSummary ? "Total Score   " : "Total"
                        font.bold: true
                    }
                    Text {
                        id:event_score
                        text: isMatchSummary ? ": " + totalScore.toFixed(2) : ": " + getSeriesTotal(seriesIndex)
                        font.bold: true
                    }
                }
                Row {
                    spacing: 20
                    Text {
                        text: "Average score"
                        font.bold: true
                    }
                    Text {
                        id:event_average
                        text: isMatchSummary ? ": " + (totalScore/globalModelOfData.count).toFixed(2) : ": "+ getAverageScore(seriesIndex)
                        font.bold: true
                    }
                }

                Row {
                    spacing: 20
                    Text {
                        text:"Total Time    " //14 char
                        font.bold: true
                    }
                    Text {
                        id:total_time_shot
                        text: isMatchSummary ?": " + (totalTime).toFixed(2) : ": " + getTotalTimeOfSeries(seriesIndex)
                        font.bold: true
                    }
                }
                Row {
                    spacing: 20
                    Text {
                        text:"Average Time/shot"
                        font.bold: true
                    }
                    Text {
                        id:average_time_shot
                        //                            text:": " + averageTime
                        text: isMatchSummary ? ": " + (totalTime/globalModelOfData.count).toFixed(2) : ": " + getAverageTime(seriesIndex)
                        font.bold: true
                    }
                }


//                Row {
//                    spacing: 20
//                    Text {
//                        id:series_wise_totalLabel
//                        text:"Series wise total"
//                        font.bold: true
//                    }
//                    Text {
//                        id:series_wise_total
//                        text:": " + getSeriesTotalText()
//                        font.bold: true
//                        wrapMode: Text.WordWrap
//                    }
//                }
            }
        }
    }

    function getSeriesTotalText()
    {
        var formatText = ""
        if(globalModelOfData.count === 0)
            return formatText
        var seriesScore = 0;
        for(var i=0; i<globalModelOfData.count; i++)
        {
            var scoreatIndex = globalModelOfData.get(i).calculatedscore*1
            seriesScore = seriesScore*1  +  (scoreatIndex.toFixed(1))*1
            //            console.log("Total score and score at current Index is",seriesScore,scoreatIndex)
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
                seriesScoreText += "(" + (seriesScore*1).toFixed(1) +"), "
                formatText = formatText + seriesScoreText
                seriesScore = 0
            }
        }
        return formatText
    }

    function getSeriesTotal(seriesIndex)
    {
        if(globalModelOfData.count === 0)
            return 0
        var seriesScore = 0
        for(var i=(seriesIndex-1)*10; i<globalModelOfData.count; i++)
        {
            if (i >=seriesIndex*10)
                break;

            var scoreatIndex = globalModelOfData.get(i).calculatedscore*1
            seriesScore = seriesScore*1  +  (scoreatIndex.toFixed(1))*1
            //            console.log("Total score and score at current Index is",seriesScore,scoreatIndex)

        }
        return seriesScore.toFixed(2)
    }

    function getAverageScore(seriesIndex)
    {
        var shootCount  = globalModelOfData.count
        var shootsInCurrentSeries = shootCount - (seriesIndex-1)*10

        if (shootsInCurrentSeries >= 10)
            return ((getSeriesTotal(seriesIndex))/10).toFixed(2)

        else if (shootsInCurrentSeries > 0 )
            return ((getSeriesTotal(seriesIndex))/shootsInCurrentSeries).toFixed(2)

        return ((getSeriesTotal(seriesIndex))).toFixed(2)
    }

    function getTotalTimeOfSeries(seriesIndex)
    {
        if(globalMatchModel.count === 0)
            return 0
        var seriesTime = 0
        for(var i=(seriesIndex-1)*10; i<globalMatchModel.count; i++)
        {
            if (i >=seriesIndex*10)
                break;

            var timeAtIndex = globalMatchModel.get(i).timeComsumed*1
            seriesTime = seriesTime*1  +  (timeAtIndex.toFixed(1))*1
        }

        return seriesTime.toFixed(2)
    }

    function getAverageTime(seriesIndex)
    {
        var shootCount  = globalMatchModel.count
        var shootsInCurrentSeries = shootCount - (seriesIndex-1)*10

        if (shootsInCurrentSeries >= 10)
            return ((getTotalTimeOfSeries(seriesIndex))/10).toFixed(2)

        else if (shootsInCurrentSeries > 0 )
            return ((getTotalTimeOfSeries(seriesIndex))/shootsInCurrentSeries).toFixed(2)

        return ((getTotalTimeOfSeries(seriesIndex))).toFixed(2)
    }
}
