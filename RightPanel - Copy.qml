import QtQuick 2.2
Item {
    property int rootItemWidth:1674
    property int rootItemHeight:3092
    property int currentPageIndex : 0
    property int totalStars : 0
    property int seriesStars : 0
    property int totalTimeConsume: 0
    property int seriesTimeConsume: 0
    onCurrentPageIndexChanged:
    {
        var maxPageIndex = Math.floor((numberModel.count-1)/10)
        console.log("Current Page Index and Max page Index " , currentPageIndex,maxPageIndex)
        if(currentPageIndex < maxPageIndex)
        {
            enableRightNavigation(true)
        }
        else
        {
            enableRightNavigation(false)
        }

        if(currentPageIndex > 0)
        {
            enableLeftNavigation(true)
        }
        else
        {
            enableLeftNavigation(false)
        }

        //Update centerPanel
        centerPanel.currentPageIndexChanged()
    }

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
        id: total_score_block
        source: "qrc:/images/rightPanel/total_score_block.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: text_field
        source: "qrc:/images/rightPanel/text_field.png"
        x: ((parent.width/rootItemWidth)*1188)
        y: ((parent.height/rootItemHeight)*2480)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "lightblue"
        }
    }

    Text {
        id: totalTime
        width: ((parent.width/rootItemWidth)*text_field.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_field_593_2.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.horizontalCenter: text_field.horizontalCenter
        anchors.verticalCenter: text_field_593_2.verticalCenter
    }

    Image {
        id: text_field1
        source: "qrc:/images/rightPanel/text_field.png"
        x: ((parent.width/rootItemWidth)*823)
        y: ((parent.height/rootItemHeight)*2480)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)

        Rectangle {
            anchors.fill: parent
            color: "red"
        }
    }

    Text {
        id: grandTotalED
        width: ((parent.width/rootItemWidth)*text_field1.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_field_593_2.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.horizontalCenter: text_field1.horizontalCenter
        anchors.verticalCenter: text_field_593_2.verticalCenter
    }

    Image {
        id: text_field_593_2
        source: "qrc:/images/rightPanel/text_field_593_2.png"
        x: ((parent.width/rootItemWidth)*400)
        y: ((parent.height/rootItemHeight)*2480)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "yellow"
        }
    }

    Text {
        id: grandTotalText
        width: ((parent.width/rootItemWidth)*text_field_593_2.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_field_593_2.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.centerIn: text_field_593_2
    }

    Image {
        id: text_field_8
        source: "qrc:/images/rightPanel/text_field_8.png"
        x: ((parent.width/rootItemWidth)*228)
        y: ((parent.height/rootItemHeight)*2480)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "green"
        }
    }

    Text {
        id: grandStarText
        width: ((parent.width/rootItemWidth)*text_field_8.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_field_8.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.centerIn: text_field_8
    }

    Image {
        id: text_field_1_55
        source: "qrc:/images/rightPanel/text_field_1_55.png"
        x: ((parent.width/rootItemWidth)*1188)
        y: ((parent.height/rootItemHeight)*2186)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "blue"
        }
    }

    Text {
        id: seriesTime
        width: ((parent.width/rootItemWidth)*text_field_1_55.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_field_1_55.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.centerIn: text_field_1_55
    }

    Image {
        id: text_field2
        source: "qrc:/images/rightPanel/text_field.png"
        x: ((parent.width/rootItemWidth)*823)
        y: ((parent.height/rootItemHeight)*2186)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "orange"
        }
    }
    Text {
        id: seriesSubTotalED
        width: ((parent.width/rootItemWidth)*text_field2.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_field2.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.centerIn: text_field2
    }
    Image {
        id: field_88_7
        source: "qrc:/images/rightPanel/field_88_7.png"
        x: ((parent.width/rootItemWidth)*400)
        y: ((parent.height/rootItemHeight)*2186)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Text {
        id: seriesSubTotal
        width: ((parent.width/rootItemWidth)*field_88_7.sourceSize.width)
        height: ((parent.height/rootItemHeight)*field_88_7.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.centerIn: field_88_7
    }

    Image {
        id: text_filed_3
        source: "qrc:/images/rightPanel/text_filed_3.png"
        x: ((parent.width/rootItemWidth)*228)
        y: ((parent.height/rootItemHeight)*2186)
        opacity: 0
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        Rectangle {
            anchors.fill: parent
            color: "pink"
        }
    }

    Text {
        id: seriesStarText
        width: ((parent.width/rootItemWidth)*text_filed_3.sourceSize.width)
        height: ((parent.height/rootItemHeight)*text_filed_3.sourceSize.height)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: (0.45*height)

        text: ""
        color: "white"
        anchors.centerIn: text_filed_3
    }

    Image {
        id: stop
        source: "qrc:/images/rightPanel/stop.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*1550)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: stop_over
        source: "qrc:/images/rightPanel/stop_over.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*1550)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pause
        source: "qrc:/images/rightPanel/pause.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*1223)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: pause_over
        source: "qrc:/images/rightPanel/pause_over.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*1223)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: num
        source: "qrc:/images/rightPanel/num.png"
        x: ((parent.width/rootItemWidth)*400)
        y: ((parent.height/rootItemHeight)*347)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
    }
    Image {
        id: series_6
        source: "qrc:/images/rightPanel/series_6.png"
        x: ((parent.width/rootItemWidth)*400)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: true
    }
    Text {
        id: seriesText
        anchors.centerIn: series_6
//        source: "qrc:/images/rightPanel/series_6.png"
//        x: ((parent.width/rootItemWidth)*400)
//        y: ((parent.height/rootItemHeight)*131)
//        opacity: 1
//        width: ((parent.width/rootItemWidth)*sourceSize.width)
//        height: ((parent.height/rootItemHeight)*sourceSize.height)
        text : "Series " + (currentPageIndex+1)
        visible: false
    }
    Image {
        id: right
        source: "qrc:/images/rightPanel/right.png"
        x: ((parent.width/rootItemWidth)*1408)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: false
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                rightClicked()
            }
        }
    }
    Image {
        id: right_end
        source: "qrc:/images/rightPanel/right_end.png"
        x: ((parent.width/rootItemWidth)*1408)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: true
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {

            }
        }
    }
    Image {
        id: right_over
        source: "qrc:/images/rightPanel/right_over.png"
        x: ((parent.width/rootItemWidth)*1408)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: false
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {

            }
        }
    }
    Image {
        id: left_arrow
        source: "qrc:/images/rightPanel/left_arrow.png"
        x: ((parent.width/rootItemWidth)*297)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: false
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                leftClicked()
            }
        }
    }
    Image {
        id: left_arrow_end
        source: "qrc:/images/rightPanel/left_arrow_end.png"
        x: ((parent.width/rootItemWidth)*297)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: true
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {

            }
        }
    }
    Image {
        id: left_arrow_over
        source: "qrc:/images/rightPanel/left_arrow_over.png"
        x: ((parent.width/rootItemWidth)*297)
        y: ((parent.height/rootItemHeight)*131)
        opacity: 1
        width: ((parent.width/rootItemWidth)*sourceSize.width)
        height: ((parent.height/rootItemHeight)*sourceSize.height)
        visible: false
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {

            }
        }
    }

    /////////////////////////////////////
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
        anchors.fill: num
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
                id: currentItem
                anchors.fill: parent
                color: "#A6CE72"
                visible: (right_end.visible) && (index === (numberModel.count-1)%10)
            }

            Rectangle {
                id: indexRect
                height: parent.height
                width: parent.width*0.1
                border.color: "grey"
                color: "transparent"

                Text {
                    text: currentPageIndex*10 + index + 1
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
                    anchors.left: scoreTextRect.right
                    transformOrigin: Item.Center

                    height: 16 //parent.height - 4
                    width: 16
                    source: "qrc:/images/rightPanel/up_arrow.png"
                    anchors.verticalCenter: parent.verticalCenter

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
                    width: parent.width * 0.3
                    height: parent.height

                    anchors.left: parent.left
                    anchors.leftMargin: 10

                    color: "transparent"
                    Text {
                        id: scoreText
                        anchors.centerIn: parent

                        text: score
                    }
                }

                Image {
                    id: starImage
                    height: 16 //parent.height - 4
                    width: 16
                    anchors.left: arrowImage.right
                    anchors.leftMargin: 10

                    visible: score > 9
                    source: "qrc:/images/rightPanel/star.png"
                    anchors.verticalCenter: parent.verticalCenter
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
                        text: timeComsumed
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

    Component.onCompleted: {
        timer.start()
    }

    function addToSeries(angle,radius)
    {
        var relativeVal = 10 - radius
        grandTotal = ( grandTotal*1 + relativeVal.toFixed(1)*1)
        grandTotalExculdeDec = ( grandTotalExculdeDec*1 + Math.floor(relativeVal))
        totalTimeConsume = totalTimeConsume*1 + (timeInSec - lastUsedTime)

        var text = timeInSec - lastUsedTime
        lastUsedTime = timeInSec
        numberModel.append({"direction":angle.toFixed(2), "score":radius.toFixed(2),  "timeComsumed":text})
        globalModelOfData.append({"direction":angle.toFixed(2), "score":radius.toFixed(2),  "timeComsumed":text})
        matchScore.model =listModel
        if(minPreviewMode && radius > 4)
        {
            minPreviewMode = false
        }
        if(relativeVal > 9)
            ++totalStars
        var startIndex = Math.floor((numberModel.count-1)/10)
        var endIndex = numberModel.count;
        updateListModel(startIndex*10,endIndex)
    }


    function updateListModel(startIndex,endIndex)
    {
        listModel.clear()
        subTotal = subTotal*0
        subTotalExculdeDec = subTotalExculdeDec*0
        seriesStars = 0
        seriesTimeConsume = 0
        for(var i = startIndex; i < endIndex; i++)
        {
            var relativeVal = 10 - numberModel.get(i).score*1
            var direction = numberModel.get(i).direction*1
            var timeConsumed = numberModel.get(i).timeComsumed

            listModel.append({"direction":direction.toFixed(2), "score":relativeVal.toFixed(2), "timeComsumed":timeConsumed})
            subTotal = ( subTotal*1 + relativeVal.toFixed(1)*1)
//            subTotalExculdeDec = ( subTotalExculdeDec*1 + relativeVal.toFixed(0)*1)
            subTotalExculdeDec = ( subTotalExculdeDec*1 + Math.floor(relativeVal))
            seriesTimeConsume = (seriesTimeConsume + timeConsumed)
            if(relativeVal > 9)
                ++seriesStars
        }
        currentPageIndex = Math.floor( (endIndex-1)/10)

        //Log messages
        grandStarText.text = totalStars
        seriesStarText.text =  seriesStars
        seriesSubTotal.text = subTotal.toFixed(1)*1
        seriesSubTotalED.text = subTotalExculdeDec.toFixed(0)*1
        grandTotalText.text = grandTotal.toFixed(1)*1
        grandTotalED.text = grandTotalExculdeDec.toFixed(0)*1
        seriesTime.text = seriesTimeConsume
        totalTime.text = totalTimeConsume
    }

    function leftClicked()
    {
        --currentPageIndex
        var maxPageIndex = Math.floor(numberModel.count/10)
        var startIndex = currentPageIndex*10
        var endIndex = startIndex+10;//maxPageIndex*10
        if(endIndex >= numberModel.count)
        {
            endIndex = numberModel.count
        }
        updateListModel(startIndex,endIndex)
    }

    function rightClicked()
    {
        ++currentPageIndex
        var maxPageIndex = Math.floor(numberModel.count/10)
        var startIndex = currentPageIndex*10
        var endIndex = startIndex+10;//(maxPageIndex)*10
        if(endIndex >= numberModel.count)
            endIndex = numberModel.count
        updateListModel(startIndex,endIndex)
    }

    function updateTotal()
    {

    }

    function updatePageIndex()
    {

    }

    function enableLeftNavigation(showFlag)
    {
        left_arrow.visible = showFlag
        left_arrow_end.visible = !showFlag
    }

    function enableRightNavigation(showFlag)
    {
        right.visible = showFlag
        right_end.visible = !showFlag
    }

    function resetRightPanelModels()
    {
        listModel.clear()
        numberModel.clear()
        seriesModelScore.clear()
        currentPageIndex = 0
        totalStars = 0
        seriesStars = 0
        totalTimeConsume = 0
        seriesTimeConsume = 0
        subTotal = 0
        subTotalExculdeDec = 0
        grandTotal =0
        grandTotalExculdeDec = 0
        minPreviewMode = true
        timeInSec = 0
        lastUsedTime = 0

        grandStarText.text = ""
        seriesStarText.text =  ""
        seriesSubTotal.text = ""
        seriesSubTotalED.text = ""
        grandTotalText.text = ""
        grandTotalED.text = ""
        seriesTime.text = ""
        totalTime.text = ""
    }
}
