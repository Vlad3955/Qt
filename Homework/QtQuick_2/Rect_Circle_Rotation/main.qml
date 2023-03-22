import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: _rect
        width: 200
        height: 200
        color: "red"
        border.width: 2
        border.color: "black"
        anchors.centerIn: parent
        transform: Rotation {
            id: _trForm
            origin.x: 30;
            origin.y: 30;
            axis {
                x: 0;
                y: 1;
                z: 0
            }
            angle: 0

            Behavior on angle {
                         SpringAnimation {
                             id: _spAnim
                             spring: 2;
                             damping: 0.2;
                             modulus: 0 }
                     }
        }


        MouseArea {
            id: _mouseArea
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            onClicked: {
                if (mouse.button === Qt.RightButton)
                {
//                    _trForm.angle = 18
//                    _trForm.angle = 36
//                    _trForm.angle = 54
//                    _trForm.angle = 72
//                    _trForm.angle = 80
//                    _trForm.angle = 98
//                    _trForm.angle = 116
//                    _trForm.angle = 132
//                    _trForm.angle = 150
//                    _trForm.angle = 168
//                    _trForm.angle = 186
//                    _trForm.angle = 204
//                    _trForm.angle = 222
//                    _trForm.angle = 240
//                    _trForm.angle = 258
//                    _trForm.angle = 276
//                    _trForm.angle = 294
//                    _trForm.angle = 312
//                    _trForm.angle = 330
//                    _trForm.angle = 348
//                    _trForm.angle = 360

//                    _trForm.angle = 0


                    _trForm.angle = 360
                }
                if (mouse.button === Qt.LeftButton)
                {
                    _rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                }

            }

            function anglDef() {
                _trForm.angle = 0
            }


            onDoubleClicked: {
                _rect.radius = _rect.width / 2
            }
        }
    }
}
