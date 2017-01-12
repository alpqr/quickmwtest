import QtQuick 2.9
import QtQuick.Window 2.3

Window {
    id: w1
    visible: true
    Rectangle {
        anchors.fill: parent
        color: "red"
        Column {
            Text {
                font.pointSize: 32
                color: "white"
                text: "This scene is on Qt.application.screens[0]" +
                    "\nname: " + Qt.application.screens[0].name +
                    "\nwidth: " + Qt.application.screens[0].width +
                    "\nheight: " + Qt.application.screens[0].height
            }
        }
    }

    Window {
        id: w2
        targetScreen: Qt.application.screens[1]
        visible: true
        Rectangle {
            anchors.fill: parent
            color: "blue"
            Column {
                Text {
                    font.pointSize: 32
                    color: "white"
                    text: "This scene is on Qt.application.screens[1]" +
                        "\nname: " + Qt.application.screens[1].name +
                        "\nwidth: " + Qt.application.screens[1].width +
                        "\nheight: " + Qt.application.screens[1].height
                }
            }
        }
    }
}
