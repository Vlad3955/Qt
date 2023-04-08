#ifndef CHARTSDATA_H
#define CHARTSDATA_H

#include <QObject>
#include <QVector>
#include <QtMath>

class ChartsData : public QObject
{
    Q_OBJECT
public:
    explicit ChartsData(QObject *parent = nullptr);
    Q_INVOKABLE QVector<double> getPointX();
    Q_INVOKABLE QVector<double> getPointY();


signals:


private:
    double xBegin, xEnd, h, X;
    QVector<double> x, y;
};

#endif // CHARTSDATA_H
