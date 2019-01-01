import QtQuick 2.2
Item {
    property int rootItemWidth:1366
    property int rootItemHeight:45
    signal close()
    signal minimize()

    Rectangle {
        id: fullRect
        color: "#202020"
        anchors.fill: parent
    }

    Image {
        id: bg
        source: "qrc:/images/header/bg.png"
        x: ((parent.width/rootItemWidth)*0)
        y: ((parent.height/rootItemHeight)*0)
        opacity: 1
        anchors.fill:parent
        //fillMode: Image.PreserveAspectFit
    }
    Image {
        id: minimizeButton
        source: "qrc:/images/header/minimize.png"
        x: ((parent.width/rootItemWidth)*1258)
        y: ((parent.height/rootItemHeight)*5)
        opacity: 1
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: minimize()
        }
    }
    Image {
        id: closeButton
        source: "qrc:/images/header/close.png"
        x: ((parent.width/rootItemWidth)*1304)
        y: ((parent.height/rootItemHeight)*5)
        opacity: 1
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: close()
        }
    }
    Text {
        id: heading
        anchors.left: parent.left
        anchors.leftMargin: 10
        height: implicitHeight
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
        text: isDefaultIcon ? "SHOOT ON TACHUS" : "SHOOT ON SETA"
        font { family: "Luxi Mono"; pixelSize: 24; capitalization: Font.AllUppercase }
    }

//    Rectangle {
//        property string myText: "The quick brown fox jumps over the lazy dog."

//           width: 320; height: 480
//           color: "steelblue"

//           FontLoader { id: fixedFont; name: "Courier" }
//           FontLoader { id: localFont; source: "content/fonts/tarzeau_ocr_a.ttf" }
//           FontLoader { id: webFont; source: "http://www.princexml.com/fonts/steffmann/Starburst.ttf" }

//           Column {
//               anchors { fill: parent; leftMargin: 10; rightMargin: 10; topMargin: 10 }
//               spacing: 15

//               Text {
//                   text: "test"
//                   color: "lightsteelblue"
//                   width: parent.width
//                   wrapMode: Text.WordWrap
//                   font.family: "Times"
//                   font.pixelSize: 20
//               }
//               Text {
//                   text: "test1"
//                   color: "lightsteelblue"
//                   width: parent.width
//                   wrapMode: Text.WordWrap
//                   horizontalAlignment: Text.AlignHCenter
//                   font { family: "Times"; pixelSize: 20; capitalization: Font.AllUppercase }
//               }
//               Text {
//                   text: "test2"
//                   color: "lightsteelblue"
//                   width: parent.width
//                   horizontalAlignment: Text.AlignRight
//                   wrapMode: Text.WordWrap
//                   font { family: fixedFont.name; pixelSize: 20; weight: Font.Bold; capitalization: Font.AllLowercase }
//               }
//               Text {
//                   text: "test3"
//                   color: "lightsteelblue"
//                   width: parent.width
//                   wrapMode: Text.WordWrap
//                   font { family: fixedFont.name; pixelSize: 20; italic: true; capitalization: Font.SmallCaps }
//               }
//               Text {
//                   text: "test4"
//                   color: "lightsteelblue"
//                   width: parent.width
//                   wrapMode: Text.WordWrap
//                   font { family: localFont.name; pixelSize: 20; capitalization: Font.Capitalize }
//               }
//               Text {
//                   text: {
//                       if (webFont.status == FontLoader.Ready) "test5"
//                       else if (webFont.status == FontLoader.Loading) "Loading..."
//                       else if (webFont.status == FontLoader.Error) "Error loading font"
//                   }
//                   color: "lightsteelblue"
//                   width: parent.width
//                   wrapMode: Text.WordWrap
//                   font.family: webFont.name; font.pixelSize: 20
//               }
//           }
//    }
}
