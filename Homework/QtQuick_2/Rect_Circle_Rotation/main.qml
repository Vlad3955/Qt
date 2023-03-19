import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: _rect
        width: 200
        height: 200
        color: "red"
        border.width: 2
        border.color: "black"
        anchors.centerIn: parent

        MouseArea {
            id: _mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                _rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
            }
        }
    }
}
