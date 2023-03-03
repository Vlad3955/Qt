import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import TaskModel 1.0


Window {
    width: 350
    height: 480
    visible: true
    title: qsTr("To Do List")

//    ListModel {
//        id: _listModel
//    }

    TaskModel {
        id: _taskModel

        onTasksCountChanged: {
            _taskInfo.count = m_tasksCount
        }


    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"

        ListView {
            id: _listView
            anchors.fill: parent
            anchors.topMargin: 5
            spacing: 5
            ScrollBar.vertical: ScrollBar {}

            //model: listModel

            model: _taskModel
            delegate: TaskField {
                id: _taskField
                height: 40

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5
                textTask: model.text

                onDelTask: function delTask() {
                    _taskModel.removeData(model.index);
                }
            }
        }

        EntryField {
            id: _entryField
            height: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5



            onNewMessage: function newMessage(msg){
//                var newMsg = {};
//                newMsg.text = msg;
//                _listModel.append(newMsg)

                if(msg !== "")
                {
                    _taskModel.add(msg)
                }
            }

        TasksInfo {
            id: _taskInfo
            anchors.right: parent.right
            anchors.bottom: _entryField.top
            anchors.margins: 2

            count: _taskModel.m_tasksCount
            textInfo: "Total number of tasks: " + count
        }
    }
  }
}


