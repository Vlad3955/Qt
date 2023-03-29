import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


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
//        property string textColor: "#535353"
//        state: "Registration"

//        Column {
//            anchors.fill: parent
//            padding: 32
//            spacing: 32

//            Rectangle {
//                id: rectLoginTextField

//                TextField {
//                    id: loginTextField
//                    Keys.onEnterPressed: checkCredentials()
//                    Keys.onReturnPressed: checkCredentials()
//                }
//            }

//            Rectangle{
//                id: rectPasswordTextField

//                TextField {
//                    id: passwordTextField
//                    Keys.onEnterPressed: checkCredentials()
//                    Keys.onReturnPressed: checkCredentials()
//                }
//            }


//            Button {
//                id: submitButton

//                background: Rectangle {
//                    color: parent.down ? "#bbbbbb" :
//                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                }
//            }

//            Button {
//                id: logoutButton
//                onClicked: checkCredentials()
//                background: Rectangle {
//                    color: parent.down ? "#bbbbbb" :
//                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
//                }
//            }
//        }

//        states: [
//            State {
//                name: "Search"
//                PropertyChanges {
//                    target: secondaryFrame
//                    color: "black"
//                    anchors.centerIn: parent // Размещение компонента внутри родительского
//                    radius: 5                // Закругление углов с выбранным радиусом
//                    width: 300
//                    height: 250
//                }
//                PropertyChanges {
//                    target: rectLoginTextField
//                    visible: false
//                }
//                PropertyChanges {
//                    target: loginTextField
//                    visible: false
//                }
//                PropertyChanges {
//                    target: rectPasswordTextField
//                    width: 200
//                    height: 40
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//                PropertyChanges {
//                    target: passwordTextField
//                    placeholderText: qsTr("Поиск")
//                    echoMode: TextInput.Normal
//                }
//                PropertyChanges {
//                    target: submitButton
//                    width: 200
//                    height: 40
//                    text: qsTr("Поехали")
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    onClicked: checkCredentials()
//                }
//                PropertyChanges {
//                    target: logoutButton
//                    width: 200
//                    height: 40
//                    text: qsTr("Выход")
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//            },
//            State {
//                name: "Registration"
//                PropertyChanges {
//                    target: secondaryFrame
//                    color: "white"
//                    anchors.centerIn: parent // Размещение компонента внутри родительского
//                    radius: 5                // Закругление углов с выбранным радиусом
//                    width: 300
//                    height: 250
//                }
//                PropertyChanges {
//                    target: rectLoginTextField
//                    width: 200
//                    height: 40
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//                PropertyChanges {
//                    target: loginTextField
//                    anchors.fill: parent
//                    verticalAlignment: Qt.AlignCenter
//                    placeholderText: qsTr("Логин")
//                    color: secondaryFrame.textColor
//                }
//                PropertyChanges {
//                    target: rectPasswordTextField
//                    width: 200
//                    height: 40
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//                PropertyChanges {
//                    target: passwordTextField
//                    anchors.fill: parent
//                    echoMode: TextInput.Password
//                    verticalAlignment: Qt.AlignCenter
//                    placeholderText: qsTr("Пароль")
//                    color: secondaryFrame.textColor
//                }
//                PropertyChanges {
//                    target: submitButton
//                    width: 200
//                    height: 40
//                    text: qsTr("Вход")
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    onClicked: checkCredentials()
//                }
//            }
//        ]

//        transitions: [
//            Transition {
//                from: "Registration"
//                to: "*"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [rectLoginTextField, loginTextField, rectPasswordTextField, passwordTextField, submitButton]
//                        property: "opacity"
//                        from: 1
//                        to: 0
//                        duration: 600
//                    }
//                }
//            },
//            Transition {
//                from: "Registration"
//                to: "Search"
//                SequentialAnimation{
//                    PropertyAnimation {
//                        targets: [rectPasswordTextField, passwordTextField, submitButton, logoutButton]
//                        property: "opacity"
//                        from: 0
//                        to: 1
//                        duration: 1000
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
        property string textColor: "#535353"
        state: "Registration"

        Column {
            anchors.fill: parent
            padding: 32
            spacing: 32

            Rectangle {
                id: rectLoginTextField

                TextField {
                    id: loginTextField
                    Keys.onEnterPressed: checkCredentials()
                    Keys.onReturnPressed: checkCredentials()
                }
            }

            Rectangle{
                id: rectPasswordTextField

                TextField {
                    id: passwordTextField
                    Keys.onEnterPressed: checkCredentials()
                    Keys.onReturnPressed: checkCredentials()
                }
            }


            Button {
                id: submitButton

                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
            }

            Button {
                id: logoutButton
                onClicked: checkCredentials()
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                    (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
            }
        }

        states: [
            State {
                name: "Search"
                PropertyChanges {
                    target: secondaryFrame
                    color: "black"
                    anchors.centerIn: parent // Размещение компонента внутри родительского
                    radius: 5                // Закругление углов с выбранным радиусом
                    width: 300
                    height: 250
                }
                PropertyChanges {
                    target: rectLoginTextField
                    visible: false
                }
                PropertyChanges {
                    target: loginTextField
                    visible: false
                }
                PropertyChanges {
                    target: rectPasswordTextField
                    width: 200
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
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
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: checkCredentials()
                }
                PropertyChanges {
                    target: logoutButton
                    width: 200
                    height: 40
                    text: qsTr("Выход")
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        secondaryFrame.state = "Registration"
                    }
                }
            },
            State {
                name: "Registration"
                PropertyChanges {
                    target: secondaryFrame
                    color: "white"
                    anchors.centerIn: parent // Размещение компонента внутри родительского
                    radius: 5                // Закругление углов с выбранным радиусом
                    width: 300
                    height: 250
                }
                PropertyChanges {
                    target: rectLoginTextField
                    width: 200
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                PropertyChanges {
                    target: loginTextField
                    anchors.fill: parent
                    verticalAlignment: Qt.AlignCenter
                    placeholderText: qsTr("Логин")
                    color: secondaryFrame.textColor
                }
                PropertyChanges {
                    target: rectPasswordTextField
                    width: 200
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                PropertyChanges {
                    target: passwordTextField
                    anchors.fill: parent
                    echoMode: TextInput.Password
                    verticalAlignment: Qt.AlignCenter
                    placeholderText: qsTr("Пароль")
                    color: secondaryFrame.textColor
                }
                PropertyChanges {
                    target: submitButton
                    width: 200
                    height: 40
                    text: qsTr("Вход")
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: checkCredentials()
                }
            }
        ]

        transitions: [
            Transition {
                from: "Registration"
                to: "*"
                SequentialAnimation{
                    PropertyAnimation {
                        targets: [rectLoginTextField, loginTextField, rectPasswordTextField, passwordTextField, submitButton]
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 600
                    }
                }
            },
            Transition {
                from: "Registration"
                to: "Search"
                SequentialAnimation{
                    PropertyAnimation {
                        targets: [rectPasswordTextField, passwordTextField, submitButton, logoutButton]
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 1000
                    }
                }
            },
            Transition {
                from: "Search"
                to: "Registration"
                SequentialAnimation{
                    PropertyAnimation {
                        targets: [rectLoginTextField, loginTextField, rectPasswordTextField, passwordTextField, submitButton]
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 600
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



