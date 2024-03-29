import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


//===============================================================================
// Variant I
//===============================================================================


Window {
    id: primaryFrame
    width: 640
    height: 480
    visible: true
    title: qsTr("Login form")
    color: "#e5ecef"
    property string login: "login"
    property string password: "password"

    // Javascript-функция для проверки данных
    function checkCredentials() {
        if (login === loginTextField.text
               && password === passwordTextField.text)
        {
            passwordTextField.text = ""
            secondaryFrame.state = "Search"
        }
        else
        {
            if (secondaryFrame.state !== "Search")
            failAnimation.start()//console.log("Неудачный вход")
        }
    }

    Rectangle {
        id: secondaryFrame
        anchors.centerIn: parent

        color: "white"
        radius: 5
        width: 300
        height: 250

        property string textColor: "#535353"
        state: "Registration"

        Column {
            anchors.fill: parent
            padding: 32
            spacing: 32

            Rectangle {
                id: rectLoginTextField
                anchors.horizontalCenter: parent.horizontalCenter

                TextField {
                    id: loginTextField
                    anchors.fill: parent
                    verticalAlignment: Qt.AlignCenter
                    Keys.onEnterPressed: checkCredentials()
                    Keys.onReturnPressed: checkCredentials()
                }
            }

            Rectangle{
                id: rectPasswordTextField
                anchors.horizontalCenter: parent.horizontalCenter

                TextField {
                    id: passwordTextField
                    anchors.fill: parent
                    verticalAlignment: Qt.AlignCenter
                    Keys.onEnterPressed: checkCredentials()
                    Keys.onReturnPressed: checkCredentials()
                }
            }


            Button {
                id: submitButton
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                onClicked: checkCredentials()
            }

            Button {
                id: logoutButton
                anchors.horizontalCenter: parent.horizontalCenter
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
                onClicked: {
                    secondaryFrame.state = "Registration"
                    loginTextField.text = ""
                }
            }
        }

        states: [
            State {
                name: "Search"
                PropertyChanges {
                    target: secondaryFrame
                    color: "black"
                    radius: 5
                    width: 300
                    height: 250
                }
                PropertyChanges {
                    target: rectLoginTextField
                    visible: false
                }
                PropertyChanges {
                    target: rectPasswordTextField
                    width: 200
                    height: 40
                }
                PropertyChanges {
                    target: passwordTextField
                    placeholderText: qsTr("Поиск")
                    echoMode: TextInput.Normal
                }
                PropertyChanges {
                    target: submitButton
                    width: 200
                    height: 40
                    text: qsTr("Поехали")
                }
                PropertyChanges {
                    target: logoutButton
                    width: 200
                    height: 40
                    text: qsTr("Выход")
                }
            },
            State {
                name: "Registration"
                PropertyChanges {
                    target: secondaryFrame
                    color: "white"
                    radius: 5
                    width: 300
                    height: 250
                }
                PropertyChanges {
                    target: rectLoginTextField
                    width: 200
                    height: 40
                }
                PropertyChanges {
                    target: loginTextField
                    placeholderText: qsTr("Логин")
                    color: secondaryFrame.textColor
                }
                PropertyChanges {
                    target: rectPasswordTextField
                    width: 200
                    height: 40
                }
                PropertyChanges {
                    target: passwordTextField
                    echoMode: TextInput.Password
                    placeholderText: qsTr("Пароль")
                    color: secondaryFrame.textColor
                }
                PropertyChanges {
                    target: submitButton
                    width: 200
                    height: 40
                    text: qsTr("Вход")
                }
            }
        ]


        transitions: [
//            Transition {
//                from: "Registration"
//                to: "*"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [secondaryFrame, rectLoginTextField, rectPasswordTextField, submitButton]
//                        property: "opacity"
//                        from: 1
//                        to: 0
//                        duration: 1000
//                    }
//                }
//            },
            Transition {
                from: "Registration"
                to: "Search"
                SequentialAnimation{
                    PropertyAnimation {
                        targets: [secondaryFrame, rectPasswordTextField, passwordTextField, submitButton, logoutButton]
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 1500
                    }
                }
            },
//            Transition {
//                from: "Search"
//                to: "*"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [secondaryFrame, rectPasswordTextField, passwordTextField, submitButton, logoutButton]
//                        property: "opacity"
//                        from: 1
//                        to: 0
//                        duration: 1000
//                    }
//                }
//            },
            Transition {
                from: "Search"
                to: "Registration"
                SequentialAnimation{
                    PropertyAnimation {
                        targets: [secondaryFrame, rectLoginTextField, rectPasswordTextField, submitButton]
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 1500
                    }
                }
            }
        ]



        // анимации внутри ParallelAnimation будут выполнены параллельно
        ParallelAnimation {
        id: failAnimation
            SequentialAnimation {
            // Группа анимаций внутри SequentialAnimation будет выполнена
            //последовательно
                PropertyAnimation {
                    // Текст внутри полей логина и пароля моментально изменит цвет на
                    //темно-красный
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: "dark red"
                    duration: 0
                }
                PropertyAnimation {
                    // После этого за 400 миллисекунд вернется к обычному цвету
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: secondaryFrame.textColor
                    duration: 400
                }
            }
            SequentialAnimation {
                // Подложка secondaryFrame сместится на -5 пикселей относительно
                //центра, затем передвинется на позицию +5, а потом вернётся в исходное положение.
                //Произойдет “потрясывание” формы.
                NumberAnimation { target: secondaryFrame; property:
                    "anchors.horizontalCenterOffset"; to: -5; duration: 50 }
                NumberAnimation { target: secondaryFrame; property:
                    "anchors.horizontalCenterOffset"; to: 5; duration: 100 }
                NumberAnimation { target: secondaryFrame; property:
                    "anchors.horizontalCenterOffset"; to: 0; duration: 50 }
            }
        }
    }
}






//===============================================================================
// Variant II
//===============================================================================


//Window {
//    id: primaryFrame
//    width: 640
//    height: 480
//    visible: true
//    title: qsTr("Login form")
//    color: "#e5ecef"
//    property string login: "login"
//    property string password: "password"

//    // Javascript-функция для проверки данных
//    function checkCredentials() {
//        if (login === loginTextField.text
//               && password === passwordTextField.text)
//        {
//            passwordTextField.text = ""
//            secondaryFrame.state = "Search"
//        }
//        else
//        {
//            if (secondaryFrame.state !== "Search")
//            failAnimation.start()//console.log("Неудачный вход")
//        }
//    }

//    Rectangle {
//        id: secondaryFrame
//        anchors.centerIn: parent
//        radius: 5
//        width: 300
//        height: 250
//        property string textColor: "#535353"
//        state: "Registration"

//        Column {
//            anchors.fill: parent
//            padding: 32
//            spacing: 32

//            Rectangle {
//                id: rectLoginTextField
//                width: 200
//                height: 40
//                anchors.horizontalCenter: parent.horizontalCenter

//                TextField {
//                    id: loginTextField
//                    anchors.fill: parent
//                    verticalAlignment: Qt.AlignCenter
//                    color: secondaryFrame.textColor
//                    Keys.onEnterPressed: checkCredentials()
//                    Keys.onReturnPressed: checkCredentials()
//                }
//            }

//            Rectangle{
//                id: rectPasswordTextField
//                width: 200
//                height: 40
//                anchors.horizontalCenter: parent.horizontalCenter

//                TextField {
//                    id: passwordTextField
//                    anchors.fill: parent
//                    verticalAlignment: Qt.AlignCenter
//                    color: secondaryFrame.textColor
//                    Keys.onEnterPressed: checkCredentials()
//                    Keys.onReturnPressed: checkCredentials()
//                }
//            }


//            Button {
//                id: submitButton
//                width: 200
//                height: 40
//                anchors.horizontalCenter: parent.horizontalCenter
//                background: Rectangle {
//                    color: parent.down ? "#bbbbbb" :
//                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                }
//                onClicked: checkCredentials()
//            }

//            Button {
//                id: logoutButton
//                width: 200
//                height: 40
//                text: qsTr("Выход")
//                anchors.horizontalCenter: parent.horizontalCenter
//                background: Rectangle {
//                    color: parent.down ? "#bbbbbb" :
//                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                }
//                onClicked: {
//                    secondaryFrame.state = "Registration"
//                    loginTextField.text = ""
//                }
//            }
//        }

//        states: [
//            State {
//                name: "Search"
//                PropertyChanges {
//                    target: secondaryFrame
//                    color: "black"
//                }
//                PropertyChanges {
//                    target: rectLoginTextField
//                    visible: false
//                }
//                PropertyChanges {
//                    target: passwordTextField
//                    placeholderText: qsTr("Поиск")
//                    echoMode: TextInput.Normal
//                }
//                PropertyChanges {
//                    target: submitButton
//                    text: qsTr("Поехали")
//                }
//                PropertyChanges {
//                    target: logoutButton
//                    visible: true
//                }
//            },
//            State {
//                name: "Registration"
//                PropertyChanges {
//                    target: secondaryFrame
//                    color: "white"
//                }
//                PropertyChanges {
//                    target: rectLoginTextField
//                    visible: true
//                }
//                PropertyChanges {
//                    target: loginTextField
//                    placeholderText: qsTr("Логин")
//                }
//                PropertyChanges {
//                    target: rectPasswordTextField
//                }
//                PropertyChanges {
//                    target: passwordTextField
//                    echoMode: TextInput.Password
//                    placeholderText: qsTr("Пароль")
//                }
//                PropertyChanges {
//                    target: submitButton
//                    text: qsTr("Вход")
//                }
//                PropertyChanges {
//                    target: logoutButton
//                    visible: false
//                }
//            }
//        ]


//        transitions: [
//            Transition {
//                from: "Registration"
//                to: "*"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [secondaryFrame]
//                        property: "opacity"
//                        from: 1
//                        to: 0
//                        duration: 5000
//                    }
//                }
//            },
//            Transition {
//                from: "Registration"
//                to: "Search"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [secondaryFrame]
//                        property: "opacity"
//                        from: 0
//                        to: 1
//                        duration: 1500
//                    }
//                }
//            },
//            Transition {
//                from: "Search"
//                to: "*"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [secondaryFrame]
//                        property: "opacity"
//                        from: 1
//                        to: 0
//                        duration: 1000
//                    }
//                }
//            },
//            Transition {
//                from: "Search"
//                to: "Registration"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [secondaryFrame, rectLoginTextField, loginTextField, rectPasswordTextField, passwordTextField, submitButton]
//                        property: "opacity"
//                        from: 0
//                        to: 1
//                        duration: 1500
//                    }
//                }
//            }
//        ]



//        // анимации внутри ParallelAnimation будут выполнены параллельно
//        ParallelAnimation {
//        id: failAnimation
//            SequentialAnimation {
//            // Группа анимаций внутри SequentialAnimation будет выполнена
//            //последовательно
//                PropertyAnimation {
//                    // Текст внутри полей логина и пароля моментально изменит цвет на
//                    //темно-красный
//                    targets: [loginTextField, passwordTextField]
//                    property: "color"
//                    to: "dark red"
//                    duration: 0
//                }
//                PropertyAnimation {
//                    // После этого за 400 миллисекунд вернется к обычному цвету
//                    targets: [loginTextField, passwordTextField]
//                    property: "color"
//                    to: secondaryFrame.textColor
//                    duration: 400
//                }
//            }
//            SequentialAnimation {
//                // Подложка secondaryFrame сместится на -5 пикселей относительно
//                //центра, затем передвинется на позицию +5, а потом вернётся в исходное положение.
//                //Произойдет “потрясывание” формы.
//                NumberAnimation { target: secondaryFrame; property:
//                    "anchors.horizontalCenterOffset"; to: -5; duration: 50 }
//                NumberAnimation { target: secondaryFrame; property:
//                    "anchors.horizontalCenterOffset"; to: 5; duration: 100 }
//                NumberAnimation { target: secondaryFrame; property:
//                    "anchors.horizontalCenterOffset"; to: 0; duration: 50 }
//            }
//        }
//    }
//}







