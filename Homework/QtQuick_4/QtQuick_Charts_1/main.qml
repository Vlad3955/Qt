import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import QtQml 2.13


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


//    Item {
//        anchors.fill: parent
//        property real othersSlice: 0

//        ChartView {
//            id: chart
//            title: "Top-5 car brand shares in Finland"
//            anchors.fill: parent
//            legend.alignment: Qt.AlignBottom
//            antialiasing: true
//            signal activated

//            PieSeries {
//                id: pieSeries
//                PieSlice { label: "Volkswagen"; value: 13.5 }
//                PieSlice { label: "Toyota"; value: 10.9 }
//                PieSlice { label: "Ford"; value: 8.6 }
//                PieSlice { label: "Skoda"; value: 8.2 }
//                PieSlice { label: "Volvo"; value: 6.8 }
//            } // Доли графика будут рассчитаны автоматически
//        }

//        Component.onCompleted: {
//            // Динамическое добавление данных и выбор слайса, который будет выделен
//            //на графике
//            othersSlice = pieSeries.append("Others", 52.0);
//            //pieSeries.find("Volkswagen").exploded = true;
//            pieSeries.find("Volkswagen").exploded = true

//        }
//    }


    Item {
        anchors.fill: parent

        ChartView {
            id: _line
            title: "Line"
            anchors.fill: parent
            antialiasing: true

            LineSeries {
                id: _lineSeries
                name: "LineSeries"
//                XYPoint { x: 0; y: 0 }
//                XYPoint { x: 1.1; y: 2.1 }
//                XYPoint { x: 1.9; y: 3.3 }
//                XYPoint { x: 2.1; y: 2.1 }
//                XYPoint { x: 2.9; y: 4.9 }
//                XYPoint { x: 3.4; y: 3.0 }
//                XYPoint { x: 4.1; y: 3.3 }


            }
        }

        Component.onCompleted: {
            for (var i = 0; i < 7; ++i)
            {
                _lineSeries.append(i, i * i)


            }

        }
    }


//    Item {
//    anchors.fill: parent

//        ChartView {
//            title: "Spline"
//            anchors.fill: parent
//            antialiasing: true

//            SplineSeries {
//                name: "SplineSeries"
//                XYPoint { x: 0; y: 0.0 }
//                XYPoint { x: 1.1; y: 3.2 }
//                XYPoint { x: 1.9; y: 2.4 }
//                XYPoint { x: 2.1; y: 2.1 }
//                XYPoint { x: 2.9; y: 2.6 }
//                XYPoint { x: 3.4; y: 2.3 }
//                XYPoint { x: 4.1; y: 3.1 }
//            }
//        }
//    }


//    Item {
//    anchors.fill: parent

//        ChartView {
//            title: "Диаграмма рассеяния"
//            anchors.fill: parent
//            antialiasing: true

//            ScatterSeries {
//                id: scatter1
//                name: "Набор данных 1"
//                XYPoint { x: 1.5; y: 1.5 }
//                XYPoint { x: 1.5; y: 1.6 }
//                XYPoint { x: 1.57; y: 1.55 }
//                XYPoint { x: 1.8; y: 1.8 }
//                XYPoint { x: 1.9; y: 1.6 }
//                XYPoint { x: 2.1; y: 1.3 }
//                XYPoint { x: 2.5; y: 2.1 }
//            }

//            ScatterSeries {
//                name: "Набор данных 2"
//                XYPoint { x: 2.0; y: 2.0 }
//                XYPoint { x: 2.0; y: 2.1 }
//                XYPoint { x: 2.07; y: 2.05 }
//                XYPoint { x: 2.2; y: 2.9 }
//                XYPoint { x: 2.4; y: 2.7 }
//                XYPoint { x: 2.67; y: 2.65 }
//            }
//        }
//    }


//    Item {
//    anchors.fill: parent

//        ChartView {
//            title: "Bar series"
//            anchors.fill: parent
//            legend.alignment: Qt.AlignBottom
//            antialiasing: true

//            BarSeries {
//                id: mySeries
//                axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010",
//                "2011", "2012" ] } // Ось OX
//                BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] } // Данные для синих столбиков
//                BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] } // Данные для зелёных столбиков
//                BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] } // Данные для оранжевых столбиков
//            }
//        }
//    }


//    Item {
//        anchors.fill: parent

//        ChartView {
//            title: "Horizontal Bar series"
//            anchors.fill: parent
//            legend.alignment: Qt.AlignBottom
//            antialiasing: true

//            HorizontalBarSeries {
//                axisY: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010",
//                "2011", "2012" ] }
//                BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
//                BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
//                BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
//            }
//        }
//    }


//    Item {
//        anchors.fill: parent

//        ChartView {
//            id: chart
//            title: "Production costs"
//            anchors.fill: parent
//            legend.visible: false
//            antialiasing: true

//            PieSeries {
//                id: pieOuter
//                size: 0.96
//                holeSize: 0.7
//                PieSlice { label: "Alpha"; value: 19511; color: "#99CA53" }
//                PieSlice { label: "Epsilon"; value: 11105; color: "#209FDF" }
//                PieSlice { label: "Psi"; value: 9352; color: "#F6A625" }
//            }

//            PieSeries {
//                size: 0.7
//                id: pieInner
//                holeSize: 0.25
//                PieSlice { label: "Materials"; value: 10334; color: "#B9DB8A" }
//                PieSlice { label: "Employee"; value: 3066; color: "#DCEDC4" }
//                PieSlice { label: "Logistics"; value: 6111; color: "#F3F9EB" }
//                PieSlice { label: "Materials"; value: 7371; color: "#63BCE9" }
//                PieSlice { label: "Employee"; value: 2443; color: "#A6D9F2" }
//                PieSlice { label: "Logistics"; value: 1291; color: "#E9F5FC" }
//                PieSlice { label: "Materials"; value: 4022; color: "#F9C36C" }
//                PieSlice { label: "Employee"; value: 3998; color: "#FCE1B6" }
//                PieSlice { label: "Logistics"; value: 1332; color: "#FEF5E7" }
//            }
//        }

//        Component.onCompleted: {
//            // Для удобства параметры заданы динамически в цикле, чтобы не прописывать их вручную в каждом слайсе
//            for (var i = 0; i < pieOuter.count; i++) {
//                pieOuter.at(i).labelPosition = PieSlice.LabelOutside;

//                pieOuter.at(i).labelVisible = true;
//                pieOuter.at(i).borderWidth = 3;
//            }
//            for (var i = 0; i < pieInner.count; i++) {
//                pieInner.at(i).labelPosition = PieSlice.LabelInsideNormal;
//                pieInner.at(i).labelVisible = true;
//                pieInner.at(i).borderWidth = 2;
//            }
//        }
//    }


}



