import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Registration form")
    color: "#e5ecef"

    Rectangle {
        id: _rect1
        color: "white"
        anchors.centerIn: parent
        radius: 5
        width: 620
        height: 460

        Column {
            id: _column1
            width: parent.width / 2
            height: parent.height
            spacing: 5

            Text {
                id: _youText
                text: qsTr("You:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: _rectYourName
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                radius: 5
                color: "black"

                TextField {
                    id: _tfYourName
                    anchors.fill: parent


                    background: Rectangle {
                        border.width: 2
                        border.color: grey
                        radius: 3
                    }

//                    Rectangle {
//                        anchors.fill: parent
//                        border.width: 2
//                        border.color: grey
//                        radius: 5
//                    }
                }
            }

            Text {
                id: _gendAgeText
                text: qsTr("Gender and age:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: _rectGendName
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                radius: 5
                color: "black"
            }
        }

        Column {
            id: _column2
            width: parent.width / 2
            height: parent.height
            anchors.left: _column1.right

            Rectangle {
                anchors.fill: parent
                color: "Black"
            }
        }

    }
}
