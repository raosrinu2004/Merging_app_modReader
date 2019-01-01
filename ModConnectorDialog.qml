import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2

Dialog {
    id: modBusConnectorDia
    title: "Port Connector"

    contentItem: Rectangle {
        id:contentRect
        anchors.fill: parent
        color: "grey"

        Column {
            anchors.centerIn: parent
            height: childrenRect.height
            width: childrenRect.width

            spacing: 10
            Text {
                text: "Please Provide a Port Number"
                color: "black"
                font.pixelSize: 15
            }

            TextField {
                id: portTextInput
                width: 100
                height: 20
                placeholderText: "port number"
            }

            Button {
                text: "Connect"
                onClicked: {
                    console.log("**************************************", portTextInput.text)
                    MODREADER.connectedModbus(portTextInput.text)
                    mod_connected = MODREADER.isModBusConnected()
                    if (MODREADER.isModBusConnected())
                        modBusConnectorDia.close()
                }
            }
        }
    }
}
