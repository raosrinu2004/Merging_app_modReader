import QtQuick 2.2
import QtCharts 2.2

Item {
    property int rootItemWidth:1398
    property int rootItemHeight:2481
    Image {
        id: layer_0
        source: "qrc:/images/rightPanel/layer_0.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: layer_1
        source: "qrc:/images/rightPanel/layer_1.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: stop_btn
        source: "qrc:/images/rightPanel/stop_btn.png"
        x: ((parent.width/rootItemWidth)*72)
        y: ((parent.height/rootItemHeight)*1341)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: stop_btn_over
        source: "qrc:/images/rightPanel/stop_btn_over.png"
        x: ((parent.width/rootItemWidth)*72)
        y: ((parent.height/rootItemHeight)*1341)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: play_btn
        source: "qrc:/images/rightPanel/play_btn.png"
        x: ((parent.width/rootItemWidth)*72)
        y: ((parent.height/rootItemHeight)*1076)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: play_btn_over
        source: "qrc:/images/rightPanel/play_btn_over.png"
        x: ((parent.width/rootItemWidth)*72)
        y: ((parent.height/rootItemHeight)*1076)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: match_series_blank
        source: "qrc:/images/rightPanel/match_series_blank.png"
        x: ((parent.width/rootItemWidth)*385)
        y: ((parent.height/rootItemHeight)*921)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: match_series
        source: "qrc:/images/rightPanel/match_series.png"
        x: ((parent.width/rootItemWidth)*385)
        y: ((parent.height/rootItemHeight)*823)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: th593_text_field
        source: "qrc:/images/rightPanel/th593_text_field.png"
        x: ((parent.width/rootItemWidth)*977)
        y: ((parent.height/rootItemHeight)*580)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: th509_text_field
        source: "qrc:/images/rightPanel/th509_text_field.png"
        x: ((parent.width/rootItemWidth)*1204)
        y: ((parent.height/rootItemHeight)*580)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: grand_total_text_field
        source: "qrc:/images/rightPanel/grand_total_text_field.png"
        x: ((parent.width/rootItemWidth)*977)
        y: ((parent.height/rootItemHeight)*480)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: sub_total_text_field
        source: "qrc:/images/rightPanel/sub_total_text_field.png"
        x: ((parent.width/rootItemWidth)*977)
        y: ((parent.height/rootItemHeight)*233)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: th36text_field
        source: "qrc:/images/rightPanel/th36text_field.png"
        x: ((parent.width/rootItemWidth)*1203)
        y: ((parent.height/rootItemHeight)*291)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: th37_8_text_field
        source: "qrc:/images/rightPanel/th37_8_text_field.png"
        x: ((parent.width/rootItemWidth)*977)
        y: ((parent.height/rootItemHeight)*291)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pip_window
        source: "qrc:/images/rightPanel/pip_window.png"
        x: ((parent.width/rootItemWidth)*110)
        y: ((parent.height/rootItemHeight)*66)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)

        PolarChartView {
            id:preview

            width: pip_window.width < pip_window.height ? pip_window.width : pip_window.height
            height: width

            antialiasing: true
            titleFont.family: "Helvetica"
            titleFont.pointSize: 13
            titleFont.bold: true
            titleColor: "Red"
            backgroundColor: "transparent"

            Rectangle
            {
                id:circleRegion
                visible: false
                width: preview.width/4
                height: preview.height/4
                radius:width/2
                color: "black"
            }

            onWidthChanged:
            {
                circleRegionCordinates()
            }

            onHeightChanged:
            {
                circleRegionCordinates()
            }
            Component.onCompleted:
            {
                legend.visible = false;
                //                        CUSTOMPRINT.print("")
                //                        preview.grabToImage()
            }

            ValueAxis {
                id: axisAngular
                min: 0
                max: 360
                labelsFont.bold: true
                labelsVisible: false
            }

            ValueAxis {
                id: axisRadial
                min: 0
                max: minPreviewMode ? 4 : 10
                tickCount: max+1
                labelsVisible: false
            }

            ScatterSeries {
                id: scaterSeries
                axisAngular: axisAngular
                axisRadial: axisRadial
                markerSize: 12
                brushFilename: "qrc:/images/pin.png"
            }
        }
    }

    //////////////

    property var subTotal: 0
    property var subTotalExculdeDec: 0
    property var grandTotal: 0
    property var grandTotalExculdeDec: 0
    property bool minPreviewMode: true
    property int timeInSec: 0
    property int lastUsedTime: 0

    ListModel {
        id:listModel
    }
    ListModel {
        id:seriesModelScore
    }
    ListModel
    {
        id:numberModel
    }

    Rectangle
    {
        id:scoresummary
        anchors.margins: 10
        height: parent.height
        width: parent.width*0.4
        border.color: "black"
        radius: 3
        visible: false
        Column
        {
            anchors.fill: parent
            Text{
                text : "Sub Total     " + subTotal +   "  " + subTotalExculdeDec
            }
            Text{
                text : "Grand Total   " + grandTotal + "  " + grandTotalExculdeDec
            }
        }
    }

    ListView{
        id:matchScore
        anchors.fill: match_series_blank
        //        width: parent.width
        //        height: parent.height - 40
        //anchors.margins: 5
        model: listModel
        delegate: matchSeriesDelegate

        onCountChanged: {
            if (count != 0)
            {
                var direction = listModel.get(count-1).direction;
                var score = listModel.get(count-1).score
                console.log(direction, "-------------------", score)
            }
        }
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            timeInSec++;
        }
    }

    Component {
        id: matchSeriesDelegate
        Item {
            width:matchScore.width
            height: matchScore.height/10

            Rectangle {
                id: indexRect
                height: parent.height
                width: parent.width*0.1
                border.color: "grey"
                color: "transparent"

                Text {
                    text: index+1
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                anchors.right: parent.right
                width: parent.width - indexRect.width
                height: parent.height

                border.color: "grey"
                color: "transparent"

                Image {
                    id: arrowImage
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 5

                    transformOrigin: Item.Center

                    height: 16 //parent.height - 4
                    width: 16
                    source: "qrc:/images/rightPanel/up_arrow.png"
                    anchors.verticalCenter: parent.Center

                    Component.onCompleted:
                    {
                        if(direction === 0.00 || direction === 360.00 || direction === 90.00 ||
                                direction === 180.00 || direction === 270.00)
                        {
                            rotation = direction
                        } else if(direction > 0 && direction < 90 ) {
                            rotation = 45
                        } else if(direction > 90 && direction < 180 ) {
                            rotation = 135
                        } else if(direction > 180 && direction < 270 ) {
                            rotation = 225
                        } else if(direction > 270 && direction < 360 ) {
                            rotation = 315
                        }
                    }
                }

                Rectangle {
                    id: scoreTextRect
                    width: parent.width * 0.5
                    height: parent.height

                    anchors.left: arrowImage.right

                    color: "transparent"
                    Text {
                        id: scoreText
                        anchors.centerIn: parent

                        text: score
                    }
                }

                Rectangle {
                    id: timeTextRect
                    width: parent.width * 0.3
                    height: parent.height

                    anchors.right: parent.right
                    color: "transparent"

                    Text {
                        id: timeText
                        anchors.centerIn: parent
                        text: "0"

                        Component.onCompleted: {
                            text = timeInSec - lastUsedTime
                            text = text + "s"
                            lastUsedTime = timeInSec
                        }
                    }
                }
            }
        }
    }

    Component {
        id: seriesDelegate
        Item {
            width:seriesListView.width
            height: seriesListView.height/12
            Row {
                spacing: 2
                Text { text: index+1 }
                Text { text: score }
            }
        }
    }

    Repeater
    {
        id:numberRepeater
        model:numberModel
        delegate: numberDelegate
    }

    Component {
        id:numberDelegate
        Item {
            id:mainItem
            width:15
            height: 15
            Rectangle
            {
                Component.onCompleted:
                {
                    var left = Qt.point(direction*1,score*1);
                    left = preview.mapToPosition(left,scaterSeries);
                    mainItem.x = pip_window.x + left.x - radius
                    mainItem.y = pip_window.y + left.y - radius
                    if(score > axisRadial.max)
                        visible = false
                    else
                        visible = true
                }
                anchors.fill: parent
                radius:parent.width/2
                color:"red"
                Text{
                    anchors.centerIn: parent
                    text: index+1
                }
            }
        }
    }

    //    function updateShoots(xPosition, yPosition)
    //    {
    //        var itemPoint = Qt.point(xPosition, yPosition);
    //        var temp = preview.mapToValue(itemPoint,scaterSeries);
    //        scaterSeries.append(temp.x, temp.y);
    //        //addToSeries(temp);
    //    }

    Component.onCompleted: {
        timer.start()
    }

    function addToSeries(angle,radius)
    {
        var relativeVal = 10 - radius
        if(listModel.count === 10)
        {
            var totalScore = 0;
            for(var i = 0; i < listModel.count; i++)
            {
                totalScore += listModel.get(i).score*1
            }
            seriesModelScore.append({"score":totalScore.toFixed(2)})
            listModel.clear()
            subTotal = subTotal*0
            subTotalExculdeDec = subTotalExculdeDec*0
        }
        subTotal = ( subTotal*1 + relativeVal.toFixed(1)*1)
        subTotalExculdeDec = ( subTotalExculdeDec*1 + relativeVal.toFixed(0)*1)

        grandTotal = ( grandTotal*1 + relativeVal.toFixed(1)*1)
        grandTotalExculdeDec = ( grandTotalExculdeDec*1 + relativeVal.toFixed(0)*1)

        listModel.append({"direction":angle.toFixed(2), "score":relativeVal.toFixed(2)})
        numberModel.append({"direction":angle.toFixed(2), "score":radius.toFixed(2)})
        matchScore.model =listModel
        if(minPreviewMode && radius > 4)
        {
            minPreviewMode = false
        }

        numberRepeater.model = null
        numberRepeater.model = numberModel
        //circleRegionCordinates()
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
    }
}
