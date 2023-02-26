import QtQuick 2.15

Item {
    id: tiRoot
    implicitWidth: 100
    implicitHeight: 80

    Rectangle {
        radius: 10
        anchors.fill: parent
        border.color: "gray"
        border.width: 2
    }

    Text {
        id: _tiText
        color: "black"
        anchors.centerIn: parent
    }
}
