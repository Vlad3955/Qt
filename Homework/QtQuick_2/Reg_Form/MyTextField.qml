import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: _root
    implicitWidth: 100
    implicitHeight: 30
    property alias borderColor: _rectBackground.border.color
    property alias placeholdText: _tfMyTextField.placeholderText
    property alias backGroundColor: _rectBackground.color
    property alias fontColor: _tfMyTextField.color
    property alias mtfText: _tfMyTextField.text

    Rectangle {
        id: _rectMyTextField
        anchors.fill: parent
        radius: 3

        TextField {
            id: _tfMyTextField
            anchors.fill: parent
            //anchors.leftMargin: 2
            verticalAlignment: Qt.AlignCenter
            placeholderText: qsTr("some text")

            background: Rectangle {
                id: _rectBackground
                border.width: 2
                radius: 3
            }
        }
    }

    // Variant from main.qml

    //            Rectangle {
    //                id: _rectYourName
    //                width: parent.width - 10
    //                anchors.horizontalCenter: parent.horizontalCenter
    //                height: 30
    //                radius: 3

    //                TextField {
    //                    id: _tfYourName
    //                    anchors.fill: parent
    //                    anchors.leftMargin: 2
    //                    verticalAlignment: Qt.AlignCenter

    //                    background: Rectangle {
    //                        border.width: 2
    //                        border.color: grey
    //                        radius: 3
    //                    }
    //                }
    //            }
}
