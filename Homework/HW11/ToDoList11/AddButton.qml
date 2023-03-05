import QtQuick 2.15

BorderImage {
    id: _add
    signal clicked
    source: _addMouse.pressed ? "qrc:///img/add_plus_black.png" : "qrc:///img/add_plus_white.png"
    width: 100; height: 100
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    MouseArea{
        id: _addMouse
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
