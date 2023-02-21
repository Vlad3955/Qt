import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: tfRoot
    implicitWidth: 100
    implicitHeight: 24
    property alias textTask: _addTaskField.text


    Rectangle{
        radius: 10
        //color: "green"
        anchors.fill: parent
        border.color: "gray"
        border.width: 2

        CalendarButton{
            id: _calB
            width: 16
            height: 16
            anchors.right: _delB.left
            anchors.rightMargin: 3
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: parent.height/2
        }

        DeleteButton{
            id: _delB
            width: 16
            height: 16
            anchors.horizontalCenter: parent.right
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: parent.height/2
            anchors.horizontalCenterOffset: -parent.width/20
        }

        TextField {
            id: _addTaskField
            color: "black"
            height: parent.height
            anchors.left: parent.left
            anchors.right: _calB.left
            anchors.top: parent.top
            anchors.bottomMargin: 2
            anchors.leftMargin: 3
            anchors.topMargin: parent.height/5
            anchors.bottom: parent.bottom
            background: Rectangle {
                id: _tfRect
                radius: 12
                border.color: "white"
                border.width: 1
            }

        }

//        Text {
//            id: _addTaskField
//            color: "black"
//            height: parent.height
//            anchors.left: parent.left
//            anchors.right: _calB.left
//            anchors.top: parent.top
//            anchors.bottomMargin: 2
//            anchors.topMargin: parent.height/4
//            anchors.leftMargin: 3
//            anchors.bottom: parent.bottom
//        }

    }
}







