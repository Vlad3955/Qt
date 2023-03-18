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
                id: _rectYourName
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

                ComboBox {
                    id: cbGender
                    model: ["Male", "Female"]
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4

                    background: Rectangle {
                        anchors.fill: parent
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
            }


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

                CheckBox {
                    id: _chbEducU
                    checked: true
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4
                    text: qsTr("University")
                }

                CheckBox {
                    id: _chbEducC
                    checked: false
                    anchors.left: _chbEducU.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    text: qsTr("College")
                }

                CheckBox {
                    id: _chbEducHS
                    checked: false
                    anchors.left: _chbEducC.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 10
                    text: qsTr("High school")
                }

                CheckBox {
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
            }

            // Information

            Text {
                id: _infoText
                text: qsTr("Information:")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextArea {
                id: taInfo
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
                                color: _switchMale.checked ? "black" : "black"
                                border.color: _switchMale.checked ? "gray" : "gray"

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
                                color: _switchFemale.checked ? "black" : "black"
                                border.color: _switchFemale.checked ? "gray" : "gray"

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

//                        Text {
//                            id: _tTheirAge
//                            text: qsTr("Age:")
//                            anchors.verticalCenter: parent.verticalCenter
//                            anchors.right: _mtfTheirAge.left
//                            color: "white"
//                            anchors.rightMargin: 3
//                        }

//                        MyTextField {
//                            id: _mtfTheirAge
//                            width: 40
//                            height: 22
//                            anchors.verticalCenter: parent.verticalCenter
//                            anchors.right: parent.right
//                            anchors.margins: 5
//                            borderColor: "gray"
//                        }

                        RangeSlider {
                            id: _slider
                            from: 1
                            to: 100
                            first.value: 25
                            second.value: 75
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 15
                            first.onMoved: _mtfTheirAgeFrom.textFrom
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

//                        MyTextField {
//                            id: _mtfTheirAgeFrom
//                            width: 40
//                            height: 22
//                            anchors.bottom: _slider.top
//                            anchors.right: _tTheirAgeTo.left
//                            anchors.margins: 5
//                            borderColor: "gray"
//                        }

                        Rectangle {
                            id: _mtfTheirAgeFrom
                            width: 40
                            height: 22
                            anchors.bottom: _slider.top
                            anchors.right: _tTheirAgeTo.left
                            border.color: "black"
                            border.width: 2
                            anchors.margins: 5
                            property alias textFrom: _textFrom.text

                            Text {
                                id: _textFrom

                                anchors.fill: parent
                            }

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
                        }
                    }





                    // City

                    Text {
                        id: _cityTheirText
                        text: qsTr("City:")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MyTextField {
                        id: _mtfTheirCity
                        width: parent.width - 11
                        anchors.horizontalCenter: parent.horizontalCenter
                        borderColor: "gray"
                    }


                    Text {
                        id: _educTheirText
                        text: qsTr("Education:")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: _rectTheirEduc
                        width: parent.width - 12
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 30
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
                        }

                        CheckBox {
                            id: _chbTheirEducC
                            checked: false
                            anchors.left: _chbTheirEducU.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            text: qsTr("College")
                        }

                        CheckBox {
                            id: _chbTheirEducHS
                            checked: false
                            anchors.left: _chbTheirEducC.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            text: qsTr("High school")
                        }

                        CheckBox {
                            id: _chbTheirEducO
                            checked: false
                            anchors.left: _chbTheirEducHS.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            text: qsTr("Other")
                        }

                    }

                    Text {
                        id: _otherTheirText
                        text: qsTr("If you selected other:")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    MyTextField {
                        id: _mtfTheirEducOther
                        width: parent.width - 11
                        anchors.horizontalCenter: parent.horizontalCenter
                        borderColor: "gray"
                    }

                    // Information

                    Text {
                        id: _infoTheirText
                        text: qsTr("Information:")
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    TextArea {
                        id: taTheirInfo
                        width: parent.width - 12
                        height: 150
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderText: qsTr("Information about you, your hobby, etc.")

                        background: Rectangle {
                                 implicitWidth: 200
                                 implicitHeight: 40
                                 border.color: "gray"
                                 border.width: 2
                                 radius: 3
                        }
                    }
                }
                }



        }

   // }
}
