#ifndef CHARTSDATA_H
#define CHARTSDATA_H

#include <QObject>
#include <QVector>
#include <QtMath>

class ChartsData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<double> x READ getPointX NOTIFY chartChangedX)
    Q_PROPERTY(QVector<double> y READ getPointY NOTIFY chartChangedY)
public:
    explicit ChartsData(QObject *parent = nullptr);
    enum ChartKind {
        SINUSOID,
        STRAIGHT,
        ABSX,
        PARABOLA,
        LOGFUNC
    };
    Q_ENUM(ChartKind)

    QVector<double> getPointX();
    QVector<double> getPointY();
    Q_INVOKABLE void setPointXY(ChartKind _ck);



signals:
    void chartChangedX(QVector<double> _x);
    void chartChangedY(QVector<double> _y);

private:
    double xBegin, xEnd, h, X;
    QVector<double> x, y;
};

#endif // CHARTSDATA_H
