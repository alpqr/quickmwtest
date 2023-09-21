import QtQuick 2.0

Rectangle {
    gradient: Gradient {
        id: grad
        GradientStop { position: 0; color: "steelblue" }
        GradientStop { position: 1; color: "black" }
    }

    Column {
        Text {
            font.pointSize: 32
            color: "white"
            text: "This is QGuiApplication::screens()[" + screenIdx + "]" +
                "\ngeometry: " + screenGeom +
                "\n  available geometry: " + screenAvailGeom +
                "\nvirtual geometry: " + screenVirtGeom +
                "\n  available virtual geometry: " + screenAvailVirtGeom
        }
        Text {
            font.pointSize: 32
            color: "white"
            text: "\nrefresh rate: " + screenRefresh +
                "\nphysical size: " + screenPhysSizeMm + " mm"
        }
        Text {
            font.pointSize: 12
            color: "red"
            text: "  should override with physicalWidth and height via QT_QPA_EGLFS_KMS_CONFIG"
            visible: screenPhysSizeMm.width == 0 && screenPhysSizeMm.height == 0
        }
    }

    Rectangle {
        visible: false // ###
        color: "lightGray"
        width: parent.width / 3
        height: parent.height / 3
        anchors.centerIn: parent

        MouseArea {
            anchors.fill: parent
            onClicked: clickInfo.text = "Clicked at " + mouse.x + ", " + mouse.y
        }

        Text {
            id: clickInfo
            anchors.centerIn: parent
            color: "red"
        }
    }

    Rectangle {
        color: "red"
        width: 160
        height: 80
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Text {
            anchors.centerIn: parent
            text: "Exit"
            color: "yellow"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }
}
