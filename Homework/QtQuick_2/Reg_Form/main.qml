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

            // You:
            Text {
                id: _youText
                text: qsTr("You:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MyTextField {
                id: _rectYourName
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
            }


            // Gender and age:
            Text {
                id: _gendAgeText
                text: qsTr("Gender and age:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: _rectGendAge
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                border.width: 2
                radius: 3

//                RadioButton {
//                    id: _rbMale
//                    checked: true
//                    anchors.left: parent.left
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.leftMargin: 4
//                    text: qsTr("Male")
//                }

//                RadioButton {
//                    id: _rbFemale
//                    checked: false
//                    anchors.left: _rbMale.right
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.leftMargin: 4
//                    text: qsTr("Female")
//                }

                ComboBox {
                    id: cbGender
                    model: ["Male", "Female"]
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4

                    background: Rectangle {
                        anchors.fill: parent
                        //color: "black"
                        anchors.margins: 2
                        anchors.rightMargin: 10
                        radius: 3
                        border.width: 2
                        border.color: "black"
                    }
                }

                Text {
                    id: _tAge
                    text: qsTr("Age:")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: _mtfAge.left
                    anchors.rightMargin: 3
                }

                MyTextField {
                    id: _mtfAge
                    width: 40
                    height: 22
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.margins: 5
                }
            }

            Text {
                id: _cityText
                text: qsTr("City:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MyTextField {
                id: _mtfCity
                width: parent.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Column {
            id: _column2
            width: parent.width / 2
            height: parent.height
            anchors.left: _column1.right


        }

    }
}
