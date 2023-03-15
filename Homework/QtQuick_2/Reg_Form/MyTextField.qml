import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: _root
    implicitWidth: 100
    implicitHeight: 30
    property alias borderColor: _rectBackground.border.color

    Rectangle {
        id: _rectMyTextField
        anchors.fill: parent

        TextField {
            id: _tfMyTextField
            anchors.fill: parent
            anchors.leftMargin: 2
            verticalAlignment: Qt.AlignCenter

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
