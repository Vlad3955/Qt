import QtQuick 2.15

BorderImage {
    id: _delete
    signal clicked
    source: _deleteMouse.pressed ? "qrc:///img/delete_black.png" : "qrc:///img/delete_white.png"
    width: 100; height: 100
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    MouseArea{
        id: _deleteMouse
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
