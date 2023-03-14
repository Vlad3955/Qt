import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 215
    height: 100
    visible: true
    title: qsTr("Hello World")

    TextField {
        id: _tFieldA
        width: 65
        height: 20
        anchors.left: parent.left
        anchors.margins: 5
        placeholderText: qsTr("side A")
    }

    TextField {
        id: _tFieldB
        width: 65
        height: 20
        anchors.left: _tFieldA.right
        anchors.margins: 5
        placeholderText: qsTr("side B")
    }

    TextField {
        id: _tFieldC
        width: 65
        height: 20
        anchors.left: _tFieldB.right
        anchors.margins: 5
        placeholderText: qsTr("side C")
    }

    Button {
        id: _submitButton
        width: 65
        height: 20
        anchors.left: parent.left
        anchors.top: _tFieldA.bottom
        anchors.margins: 5
        signal clicked

        MouseArea{
            id: _addMouse
            anchors.fill: parent
            onClicked: parent.clicked()
        }

        onClicked: {
            _result.text = "Result: " + _rectResult.s.toFixed(4).toString()
        }

        text: qsTr("Calculate")
    }

    Rectangle {
        id: _rectResult
        width: 135
        height: 20
        anchors.left: _submitButton.right
        anchors.top: _tFieldB.bottom
        anchors.margins: 5
        border.color: "grey"
        property real a: _tFieldA.text
        property real b: _tFieldB.text
        property real c: _tFieldC.text
        property real p: (a + b + c) / 2
        property real s: Math.sqrt(p * (p - a) * (p - b) * (p - c))

        Text {
            id: _result
            anchors.centerIn: parent
        }
    }


    // Points

    TextField {
        id: _tFieldAx
        width: 30
        height: 20
        anchors.left: parent.left
        anchors.top: _submitButton.bottom
        anchors.margins: 5
        placeholderText: qsTr("A x")
    }

    TextField {
        id: _tFieldAy
        width: 30
        height: 20
        anchors.left: _tFieldAx.right
        anchors.top: _submitButton.bottom
        anchors.margins: 5
        placeholderText: qsTr("A y")
    }

    TextField {
        id: _tFieldBx
        width: 30
        height: 20
        anchors.left: _tFieldAy.right
        anchors.top: _rectResult.bottom
        anchors.margins: 5
        placeholderText: qsTr("B x")
    }

    TextField {
        id: _tFieldBy
        width: 30
        height: 20
        anchors.left: _tFieldBx.right
        anchors.top: _rectResult.bottom
        anchors.margins: 5
        placeholderText: qsTr("B y")
    }

    TextField {
        id: _tFieldCx
        width: 30
        height: 20
        anchors.left: _tFieldBy.right
        anchors.top: _rectResult.bottom
        anchors.margins: 5
        placeholderText: qsTr("C x")
    }

    TextField {
        id: _tFieldCy
        width: 30
        height: 20
        anchors.left: _tFieldCx.right
        anchors.top: _rectResult.bottom
        anchors.margins: 5
        placeholderText: qsTr("C y")
    }

    Button {
        id: _submitButtonPoints
        width: 65
        height: 20
        anchors.left: parent.left
        anchors.top: _tFieldAx.bottom
        anchors.margins: 5
        signal clicked

        MouseArea{
            id: _addMousePoints
            anchors.fill: parent
            onClicked: parent.clicked()
        }

        onClicked: {
            _resultPoints.text = "Result: " + _rectResultPoints.sp.toFixed(4).toString()
        }

        text: qsTr("Calculate")
    }

    Rectangle {
        id: _rectResultPoints
        width: 135
        height: 20
        anchors.left: _submitButtonPoints.right
        anchors.top: _tFieldBx.bottom
        anchors.margins: 5
        border.color: "grey"
        property real ax: _tFieldAx.text
        property real ay: _tFieldAy.text
        property real bx: _tFieldBx.text
        property real by: _tFieldBy.text
        property real cx: _tFieldCx.text
        property real cy: _tFieldCy.text
        property real sp: (1/2)* (Math.abs(((bx - ax) * (cy - ay)) - ((cx - ax) * (by - ay))))

        Text {
            id: _resultPoints
            anchors.centerIn: parent
        }
    }
}
