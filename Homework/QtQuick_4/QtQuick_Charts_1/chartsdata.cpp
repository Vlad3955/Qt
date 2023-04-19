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
}

QVector<double> ChartsData::getPointX()
{
    return x;
}

QVector<double> ChartsData::getPointY()
{
    return y;
}


void ChartsData::setPointXY(ChartKind ck)
{
    x.clear();
    y.clear();
    qDebug() << ck;
    switch (ck) {
    case SINUSOID:
        for (X = xBegin; X <= xEnd; X += h)
        {
            // Sin(x)
            x.push_back(X);
            y.push_back(sin(X));
            qDebug() << "in sin case";
            qDebug() << x.length();
            qDebug() << y.length();
            emit chartChangedX(x);
            emit chartChangedY(y);
        }
        break;
    case STRAIGHT:
        for (X = xBegin; X <= xEnd; X += h)
        {
            // y = x
            x.push_back(X);
            y.push_back(X);
            emit chartChangedX(x);
            emit chartChangedY(y);
        }
        break;
    case ABSX:
        for (X = xBegin; X <= xEnd; X += h)
        {
            // y = |x - 2.5|
            x.push_back(X);
            y.push_back(abs(X - 2.5));
            emit chartChangedX(x);
            emit chartChangedY(y);
        }
        break;
    case PARABOLA:
        for (X = xBegin; X <= xEnd; X += h)
        {
            // y = x^2
            x.push_back(X);
            y.push_back(X * X);
            emit chartChangedX(x);
            emit chartChangedY(y);
        }
        break;
    case LOGFUNC:
        for (X = xBegin; X <= xEnd; X += h)
        {
            // y = log2(x)
            x.push_back(X);
            y.push_back(log2(X));
            emit chartChangedX(x);
            emit chartChangedY(y);
        }
        break;
    default:
        break;
    }


//    if(ck == SINUSOID)
//    {
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // Sin(x)
//            x.push_back(X);
//            y.push_back(sin(X));
//            qDebug() << "in sin case";
//            qDebug() << x.length();
//            qDebug() << y.length();
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//    }
//    else if (ck == STRAIGHT)
//    {
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = x
//            x.push_back(X);
//            y.push_back(X);
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//    }
//    else if (ck == ABSX)
//    {
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = |x - 2.5|
//            x.push_back(X);
//            y.push_back(abs(X - 2.5));
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//    }
//    else if (ck == PARABOLA)
//    {
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = x^2
//            x.push_back(X);
//            y.push_back(X * X);
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//    }
//    else if (ck == LOGFUNC)
//    {
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = log2(x)
//            x.push_back(X);
//            y.push_back(log2(X));
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//    }
}
