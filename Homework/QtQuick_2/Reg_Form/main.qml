import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Registration form")
    color: "#e5ecef"

//===================================================
//===================================================
// 1 Column(White)

    Rectangle {
        id: _rectMain
        color: "white"
        anchors.centerIn: parent
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
                id: _mtfYourName
                width: parent.width - 11
                anchors.horizontalCenter: parent.horizontalCenter
                placeholdText: qsTr("enter your name")
            }


            // Gender and age:
            Text {
                id: _gendAgeText
                text: qsTr("Gender and age:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: _rectGendAge
                width: parent.width - 12
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                border.width: 2
                radius: 3

//                ComboBox {
//                    id: cbGender
//                    model: ["Male", "Female"]
//                    anchors.left: parent.left
//                    anchors.verticalCenter: parent.verticalCenter
//                    anchors.leftMargin: 4

//                    background: Rectangle {
//                        anchors.fill: parent
//                        anchors.margins: 2
//                        anchors.rightMargin: 10
//                        radius: 3
//                        border.width: 2
//                        border.color: "black"
//                    }
//                }


                ComboBox {
                    id: control
                    model: ["Male", "Female"]
                    anchors.verticalCenter: parent.verticalCenter

                    delegate: ItemDelegate {
                        width: control.width
                        contentItem: Text {
                            text: control.textRole
                                ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole])
                                : modelData
                            color: "black"
                            font: control.font
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        highlighted: control.highlightedIndex === index
                    }

                    indicator: Canvas {
                        id: canvas
                        x: control.width - width - control.rightPadding
                        y: control.topPadding + (control.availableHeight - height) / 2
                        width: 12
                        height: 8
                        contextType: "2d"

                        Connections {
                            target: control
                            function onPressedChanged() { canvas.requestPaint(); }
                        }

                        onPaint: {
                            context.reset();
                            context.moveTo(0, 0);
                            context.lineTo(width, 0);
                            context.lineTo(width / 2, height);
                            context.closePath();
                            context.fillStyle = control.pressed ? "gray" : "black";
                            context.fill();
                        }
                    }

                    contentItem: Text {
                        leftPadding: 2
                        rightPadding: control.indicator.width + control.spacing

                        text: control.displayText
                        font: control.font
                        color: control.pressed ? "gray" : "black"
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    background: Rectangle {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 4
                        implicitWidth: 100
                        implicitHeight: 22
                        border.color: control.pressed ? "gray" : "black"
                        border.width: 2//control.visualFocus ? 2 : 1
                        radius: 2
                    }

                    popup: Popup {
                        y: control.height - 1
                        width: control.width
                        implicitHeight: contentItem.implicitHeight
                        padding: 1

                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: control.popup.visible ? control.delegateModel : null
                            currentIndex: control.highlightedIndex

                            ScrollIndicator.vertical: ScrollIndicator { }
                        }

                        background: Rectangle {
                            id: _backPopup
                            border.color: "black"
                            radius: 2
                        }
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
                    placeholdText: "Age"
                }
            }

            // City

            Text {
                id: _cityText
                text: qsTr("City:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MyTextField {
                id: _mtfCity
                width: parent.width - 11
                anchors.horizontalCenter: parent.horizontalCenter
                placeholdText: "Enter city"
            }

            // Education

            Text {
                id: _educText
                text: qsTr("Education:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                id: _rectEduc
                width: parent.width - 12
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                border.width: 2
                radius: 3
                property string educ: "text"


                RadioButton {
                    id: _chbEducU
                    checked: true
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4
                    text: qsTr("University")
                }

                RadioButton {
                    id: _chbEducC
                    checked: false
                    anchors.left: _chbEducU.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    text: qsTr("College")
                }

                RadioButton {
                    id: _chbEducHS
                    checked: false
                    anchors.left: _chbEducC.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    text: qsTr("High school")
                }

                RadioButton {
                    id: _chbEducO
                    checked: false
                    anchors.left: _chbEducHS.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    text: qsTr("Other")
                }



            }

            Text {
                id: _otherText
                text: qsTr("If you selected other:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MyTextField {
                id: _mtfEducOther
                width: parent.width - 11
                anchors.horizontalCenter: parent.horizontalCenter
                placeholdText: "Enter your education information"
            }

            // Information

            Text {
                id: _infoText
                text: qsTr("Information:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextArea {
                id: _taInfo
                width: parent.width - 12
                height: 150
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Information about you, your hobby, etc.")

                background: Rectangle {
                         implicitWidth: 200
                         implicitHeight: 40
                         border.color: "black"
                         border.width: 2
                         radius: 3
                }
            }
        }


//===================================================
//===================================================
// 2 Column(Black)

        Rectangle {
            id: _rectCol2
            width: parent.width / 2
            height: parent.height
            anchors.left: _column1.right
            color: "black"

            Column {
                id: _column2
                anchors.fill: parent
                spacing: 5


                // Gender and age:

                Text {
                    id: _gendAgeTheirText
                    text: qsTr("He/She:")
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    id: _rectGendTheirAge
                    width: parent.width - 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 65
                    border.width: 2
                    border.color: "gray"
                    color: "black"
                    radius: 3

                    Switch {
                        id: _switchMale
                        text: qsTr("Male")

                        indicator: Rectangle {
                            implicitWidth: 48
                            implicitHeight: 20
                            x: _switchMale.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: "black"       //_switchMale.checked ? "black" : "black"
                            border.color: "gray" //_switchMale.checked ? "gray" : "gray"

                            Rectangle {
                                x: _switchMale.checked ? parent.width - width : 0
                                width: 20
                                height: 20
                                radius: 13
                                color: _switchMale.down ? "black" : "white"
                                border.color: _switchMale.checked ? (_switchMale.down ? "grey" : "gray") : "gray"
                            }
                        }

                        contentItem: Text {
                            text: _switchMale.text
                            font: _switchMale.font
                            opacity: enabled ? 1.0 : 0.3
                            color: _switchMale.down ? "gray" : "white"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: _switchMale.indicator.width + _switchMale.spacing
                        }
                    }

                    Switch {
                        id: _switchFemale
                        text: qsTr("Female")
                        anchors.top: _switchMale.bottom

                        indicator: Rectangle {
                            implicitWidth: 48
                            implicitHeight: 20
                            x: _switchFemale.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: "black"       //_switchFemale.checked ? "black" : "black"
                            border.color: "gray" //_switchFemale.checked ? "gray" : "gray"

                            Rectangle {
                                x: _switchFemale.checked ? parent.width - width : 0
                                width: 20
                                height: 20
                                radius: 13
                                color: _switchFemale.down ? "black" : "white"
                                border.color: _switchFemale.checked ? (_switchFemale.down ? "grey" : "gray") : "gray"
                            }
                        }

                        contentItem: Text {
                            text: _switchFemale.text
                            font: _switchFemale.font
                            opacity: enabled ? 1.0 : 0.3
                            color: _switchFemale.down ? "gray" : "white"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: _switchFemale.indicator.width + _switchFemale.spacing
                        }
                    }


                    RangeSlider {
                        id: _slider
                        from: 18
                        to: 100
                        first.value: 25
                        second.value: 50
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 15


                        background: Rectangle {
//                                x: control.right
//                                y: control.topPadding + control.availableHeight / 2 - height / 2
                                anchors.right: _slider.right
                                anchors.bottom: _slider.bottom
                                anchors.rightMargin: 5
                                implicitWidth: 150
                                implicitHeight: 6
                                width: _slider.availableWidth
                                height: implicitHeight

                                radius: 2
                                color: "white"
                                border.width: 1
                                border.color: "gray"

                                Rectangle {
                                    x: _slider.first.visualPosition * parent.width
                                    width: _slider.second.visualPosition * parent.width - x
                                    height: parent.height
                                    color: "black"
                                    border.width: 1
                                    border.color: "gray"
                                    radius: 2
                                }
                            }

                            first.handle: Rectangle {
                                x: _slider.leftPadding + _slider.first.visualPosition * (_slider.availableWidth - width)
                                y: _slider.topPadding + _slider.availableHeight / 2 - height / 4
                                implicitWidth: 15
                                implicitHeight: 15
                                radius: 2
                                color: _slider.first.pressed ? "#f0f0f0" : "#f6f6f6"
                                border.color: "#bdbebf"
                            }

                            second.handle: Rectangle {
                                x: _slider.leftPadding + _slider.second.visualPosition * (_slider.availableWidth - width)
                                y: _slider.topPadding + _slider.availableHeight / 2 - height / 4
                                implicitWidth: 15
                                implicitHeight: 15
                                radius: 2
                                color: _slider.second.pressed ? "#f0f0f0" : "#f6f6f6"
                                border.color: "#bdbebf"
                            }
                    }

                    Text {
                        id: _tTheirAgeFrom
                        text: qsTr("From:")
                        anchors.bottom: _slider.top
                        anchors.right: _mtfTheirAgeFrom.left
                        anchors.bottomMargin: _mtfTheirAgeFrom.height / 2
                        color: "white"
                        anchors.rightMargin: 3
                    }

                    MyTextField {
                        id: _mtfTheirAgeFrom
                        width: 40
                        height: 22
                        anchors.bottom: _slider.top
                        anchors.right: _tTheirAgeTo.left
                        anchors.margins: 5
                        borderColor: "gray"
                        mtfText: _slider.first.value.toFixed(0)
                    }


                    Text {
                        id: _tTheirAgeTo
                        text: qsTr("To:")
                        anchors.bottom: _slider.top
                        anchors.right: _mtfTheirAgeTo.left
                        anchors.bottomMargin: _mtfTheirAgeTo.height / 2
                        color: "white"
                        anchors.rightMargin: 3
                    }

                    MyTextField {
                        id: _mtfTheirAgeTo
                        width: 40
                        height: 22
                        anchors.bottom: _slider.top
                        anchors.right: parent.right
                        anchors.rightMargin: 13
                        anchors.margins: 5
                        borderColor: "gray"
                        mtfText: _slider.second.value.toFixed(0)
                    }
                }





                // City

                Text {
                    id: _cityTheirText
                    text: qsTr("City:")
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                MyTextField {
                    id: _mtfTheirCity
                    width: parent.width - 11
                    anchors.horizontalCenter: parent.horizontalCenter
                    backGroundColor: "black"
                    fontColor:  "white"
                    borderColor: "gray"
                    placeholdTextColor: "gray"
                    placeholdText: "Enter city"
                }

                // Education

                Text {
                    id: _educTheirText
                    text: qsTr("Education:")
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    id: _rectTheirEduc
                    width: parent.width - 12
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    color: "black"
                    border.color: "gray"
                    border.width: 2
                    radius: 3

                    CheckBox {
                        id: _chbTheirEducU
                        checked: true
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 4
                        text: qsTr("University")

                        contentItem: Text {
                            text: _chbTheirEducU.text
                            color: "white"
                            leftPadding: _chbTheirEducU.indicator.width + 4
                        }
                    }

                    CheckBox {
                        id: _chbTheirEducC
                        checked: false
                        anchors.left: _chbTheirEducU.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10
                        text: qsTr("College")

                        contentItem: Text {
                            text: _chbTheirEducC.text
                            color: "white"
                            leftPadding: _chbTheirEducC.indicator.width + 4
                        }
                    }

                    CheckBox {
                        id: _chbTheirEducHS
                        checked: false
                        anchors.left: _chbTheirEducC.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10
                        text: qsTr("High school")

                        contentItem: Text {
                            text: _chbTheirEducHS.text
                            color: "white"
                            leftPadding: _chbTheirEducHS.indicator.width + 4
                        }
                    }

                    CheckBox {
                        id: _chbTheirEducO
                        checked: false
                        anchors.left: _chbTheirEducHS.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 10
                        text: qsTr("Other")

                        contentItem: Text {
                            text: _chbTheirEducO.text
                            color: "white"
                            leftPadding: _chbTheirEducO.indicator.width + 4
                        }
                    }

                }

                Text {
                    id: _otherTheirText
                    text: qsTr("If you selected other:")
                    color: "white"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                MyTextField {
                    id: _mtfTheirEducOther
                    width: parent.width - 11
                    anchors.horizontalCenter: parent.horizontalCenter
                    backGroundColor: "black"
                    fontColor:  "white"
                    borderColor: "gray"
                    placeholdTextColor: "gray"
                    placeholdText: "Enter her/his education information"
                }

                Button {
                    id: _regButton
                    text: qsTr("Registration")
                    anchors.horizontalCenter: parent.horizontalCenter


                    contentItem: Text {
                        text: _regButton.text
                        font: _regButton.font
                        opacity: enabled ? 1.0 : 0.3
                        color: _regButton.down ? "black" : "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true

                        onEntered: {
                            _rectButton.color = "white"
                            _rectButton.border.color = "gray"
                        }

                        onExited: {
                            _rectButton.color = "black"
                            _rectButton.border.color = "gray"
                        }

                        onClicked: {
                            console.log("        You:       ")
                            console.log("Name:", _mtfYourName.mtfText)
                            console.log("Gender:", control.currentText)
                            console.log("Age:", _mtfAge.mtfText)
                            console.log("City:", _mtfCity.mtfText)
                            function education() {
                                if (_chbEducU.checked)
                                {
                                    console.log("Education:", _chbEducU.text)
                                }
                                if (_chbEducC.checked)
                                {
                                    console.log("Education:", _chbEducC.text)
                                }
                                if (_chbEducHS.checked)
                                {
                                    console.log("Education:", _chbEducHS.text)
                                }
                                if (_chbEducO.checked)
                                {
                                    console.log("Education:", _mtfEducOther.mtfText)
                                }
                            }
                            education()
                            console.log("Information about you:", _taInfo.text)
                            console.log("")


                            console.log("        He/She:       ")
                            function gender() {
                                if (_switchMale.checked)
                                {
                                    console.log("Gender:", _switchMale.text)
                                }
                                if (_switchFemale.checked)
                                {
                                    console.log("Gender:", _switchFemale.text)
                                }
                            }
                            gender()
                            console.log("Age, from:", _mtfTheirAgeFrom.mtfText, " to:", _mtfTheirAgeTo.mtfText)
                            console.log("City:", _mtfTheirCity.mtfText)
                            function theirEducation() {
                                if (_chbTheirEducU.checked)
                                {
                                    console.log("Education:", _chbTheirEducU.text)
                                }
                                if (_chbTheirEducC.checked)
                                {
                                    console.log("Education:", _chbTheirEducC.text)
                                }
                                if (_chbTheirEducHS.checked)
                                {
                                    console.log("Education:", _chbTheirEducHS.text)
                                }
                                if (_chbTheirEducO.checked)
                                {
                                    console.log("Education:", _mtfTheirEducOther.mtfText)
                                }
                            }
                            theirEducation()


                        }
                    }

                    background: Rectangle {
                        id: _rectButton
                        implicitWidth: 100
                        implicitHeight: 40
                        color: "black"
                        opacity: enabled ? 1 : 0.3
                        border.color: _regButton.down ? "black" : "gray"
                        border.width: 2
                        radius: 2
                    }
                }
            }
        }
    }
}
