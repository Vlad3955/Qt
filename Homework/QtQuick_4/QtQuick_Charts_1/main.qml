import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import QtQml 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

//    Item {
//        anchors.fill: parent
//        property variant othersSlice: 0

//        ChartView {
//            id: chart
//            title: "Top-5 car brand shares in Finland"
//            anchors.fill: parent
//            legend.alignment: Qt.AlignBottom
//            antialiasing: true

//            PieSeries {
//                id: pieSeries
//                PieSlice { label: "Volkswagen"; value: 13.5 }
//                PieSlice { label: "Toyota"; value: 10.9 }
//                PieSlice { label: "Ford"; value: 8.6 }
//                PieSlice { label: "Skoda"; value: 8.2 }
//                PieSlice { label: "Volvo"; value: 6.8 }
//            } // Доли графика будут рассчитаны автоматически

//            Component.onCompleted: {
//                // Динамическое добавление данных и выбор слайса, который будет выделен
//                //на графике
//                othersSlice = pieSeries.append("Others", 52.0);
//                pieSeries.find("Volkswagen").exploded = true;
//            }
//        }
//    }

    Rectangle {
        width: 300
        height: 300
        Item {
            anchors.fill: parent

            ChartView {
                title: "Line"
                anchors.fill: parent
                antialiasing: true
                LineSeries {
                    name: "LineSeries"
                    XYPoint { x: 0; y: 0 }
                    XYPoint { x: 1.1; y: 2.1 }
                    XYPoint { x: 1.9; y: 3.3 }
                    XYPoint { x: 2.1; y: 2.1 }
                    XYPoint { x: 2.9; y: 4.9 }
                    XYPoint { x: 3.4; y: 3.0 }
                    XYPoint { x: 4.1; y: 3.3 }

                }
            }
        }
    }


}



