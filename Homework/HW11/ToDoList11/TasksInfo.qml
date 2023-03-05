import QtQuick 2.15

Item {
    id: tiRoot
    implicitWidth: 150
    implicitHeight: 30
    property int count
    property alias textInfo: _tiText.text

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
