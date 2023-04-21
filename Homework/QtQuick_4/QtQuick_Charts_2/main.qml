import QtQuick 2.15
import QtQuick.Window 2.15
import QtCharts 2.15
import QtQml 2.13
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import by.me.ChartsData



Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    ChartsData {
        id: chartsData

        }

    Item {
        anchors.fill: parent

        ChartView {
            id: _line
            title: "Line"
            anchors.fill: parent
            antialiasing: true

            ValuesAxis {
                id: _axisX
                min: -3
                max: 220
            }

            ValuesAxis {
                id: _axisY
                min: -3
                max: 30
            }

            LineSeries {
                id: _lineSeries
                name: "Линейная зависимость"
                axisX: _axisX
                axisY: _axisY
            }

            ScatterSeries {
                id: scatter1
                name: "Исходные данные"
            }
        }


        Component.onCompleted: {

            for (var i = 0; i < chartsData.Xi.length; ++i)
            {
                _lineSeries.append(chartsData.Xi[i], chartsData.yM[i])
                scatter1.append(chartsData.Xi[i], chartsData.Yi[i])
            }
        }
    }
}



