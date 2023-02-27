import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: _efRoot
    implicitWidth: 100
    implicitHeight: 24
    signal newMessage(string msg)
    signal newDate()
    property alias textEntr: _addEntryField.text

    Rectangle{
        radius: 10
        //color: "green"
        anchors.fill: parent
        border.color: "gray"
        border.width: 2

        AddButton{
            id: _addB
            width: 16
            height: 16
            anchors.horizontalCenter: parent.left
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: parent.height/2
            anchors.horizontalCenterOffset: parent.width/20

            onClicked: {
                newMessage(_addEntryField.text)
                _addEntryField.clear()
            }
        }

        CalendarButton{
            id: _calB
            width: 16
            height: 16
            anchors.horizontalCenter: parent.right
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: parent.height/2
            anchors.horizontalCenterOffset: -parent.width/20

            onClicked: {
                newDate()
            }
        }


        TextField{
            id: _addEntryField
            color: "black"
            placeholderText: qsTr("Enter a task, deadline and priority (task dd.mm.yy 7)")
            height: parent.height
            anchors.left: _addB.right
            anchors.right: _calB.left
            anchors.top: parent.top
            anchors.bottomMargin: 2
            anchors.topMargin: parent.height/5
            anchors.bottom: parent.bottom

            background: Rectangle{

                border.color: "white"
                border.width: 1
            }
        }
    }
}
