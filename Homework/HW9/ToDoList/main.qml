import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 350
    height: 480
    visible: true
    title: qsTr("To Do List")

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"

        ListView {
            id: listView
            anchors.fill: parent
            spacing: 5
            ScrollBar.vertical: ScrollBar {}

            model: listModel
            delegate: TaskField {
                height: 40

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5
                textTask: model.text
            }
        }

        EntryField {
            height: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5

            onNewMessage: function newMessage(msg){
                var newMsg = {};
                newMsg.text = msg;
                listModel.append(newMsg)
            }    


        ListModel {
            id: listModel
        }
    }
  }
}


