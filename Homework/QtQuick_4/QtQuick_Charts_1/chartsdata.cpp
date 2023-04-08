#include "chartsdata.h"
#include <QDebug>


ChartsData::ChartsData(QObject *parent)
    : QObject{parent}
{
    h = 0.1;
    xBegin = 0;
    xEnd = 5 + h;
    x.clear();
    y.clear();

    for (X = xBegin; X <= xEnd; X += h)
    {
        // Sin(x)
//        x.push_back(X);
//        y.push_back(sin(X));

        // y = x
//        x.push_back(X);
//        y.push_back(X);

        // y = |x - 2.5|
//        x.push_back(X);
//        y.push_back(abs(X - 2.5));

        // y = x^2
//        x.push_back(X);
//        y.push_back(X * X);

        // y = log2(x)
        x.push_back(X);
        y.push_back(log2(X));
    }
    qDebug() << x.length();
    qDebug() << y.length();
}

QVector<double> ChartsData::getPointX()
{
    return x;
}

QVector<double> ChartsData::getPointY()
{
    return y;
}
