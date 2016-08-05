import QtQuick 2.0

Rectangle {
    gradient: Gradient {
        id: grad
        GradientStop { position: 0; color: "steelblue" }
        GradientStop { position: 1; color: "black" }
    }

    Text {
        font.pointSize: 32
        color: "white"
        text: "This is QGuiApplication::screens()[" + screenIdx + "]"
    }
}
