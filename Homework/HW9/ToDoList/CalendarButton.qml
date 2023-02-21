import QtQuick 2.15

BorderImage {
    id: _calendar
    signal clicked
    source: _calendarMouse.pressed ? "qrc:///img/calendar_black.png" : "qrc:///img/calendar_white.png"
    width: 100; height: 100
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    MouseArea{
        id: _calendarMouse
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
