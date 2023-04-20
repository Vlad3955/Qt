// VARIANT I
//=====================================================

//#include "chartsdata.h"
//#include <QDebug>


//ChartsData::ChartsData(QObject *parent)
//    : QObject{parent}
//{
//    h = 0.1;
//    xBegin = 0;
//    xEnd = 5 + h;
//    x.clear();
//    y.clear();
//}

//QVector<double> ChartsData::getPointX()
//{
//    return x;
//}

//QVector<double> ChartsData::getPointY()
//{
//    return y;
//}


//void ChartsData::setPointXY(ChartKind ck)
//{
//    x.clear();
//    y.clear();
//    qDebug() << ck;
//    switch (ck) {
//    case SINUSOID:
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
//        break;
//    case STRAIGHT:
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = x
//            x.push_back(X);
//            y.push_back(X);
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//        break;
//    case ABSX:
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = |x - 2.5|
//            x.push_back(X);
//            y.push_back(abs(X - 2.5));
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//        break;
//    case PARABOLA:
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = x^2
//            x.push_back(X);
//            y.push_back(X * X);
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//        break;
//    case LOGFUNC:
//        for (X = xBegin; X <= xEnd; X += h)
//        {
//            // y = log2(x)
//            x.push_back(X);
//            y.push_back(log2(X));
//            emit chartChangedX(x);
//            emit chartChangedY(y);
//        }
//        break;
//    default:
//        break;
//    }
//}


// VARIANT II
//=====================================================

#include "chartsdata.h"
#include <QDebug>


ChartsData::ChartsData(QObject *parent)
    : QObject{parent}
{
    h = 0.1;
    xBegin = 0;
    xEnd = 5 + h;
    xi = 0;
    yi = 0;
    xi2 = 0;
    xiyi = 0;
    x.clear();
    y.clear();
    Xi.clear();
    Yi.clear();


    Xi = {7, 31, 61, 99, 129, 178, 209};
    Yi = {13, 10, 9, 10, 12, 20, 26};

    for (int i = 0; i < Xi.length(); ++i)
    {
        xi += Xi[i];
        yi += Yi[i];
        xi2 += Xi[i] * Xi[i];
        xiyi += Xi[i] * Yi[i];
    }

    qDebug() << "xi = " << xi;
    qDebug() << "yi = " << yi;
    qDebug() << "xi2 = " << xi2;
    qDebug() << "xiyi = " << xiyi;
}

QVector<double> ChartsData::getPointX()
{
    return x;
}

QVector<double> ChartsData::getPointY()
{
    return y;
}

void ChartsData::setCk(ChartKind _ck)
{
    if(ck == _ck)
    {
        setPointXY(ck);
        return;
    }
    ck = _ck;
    emit chartKindChanges(ck);
    setPointXY(ck);
}

ChartsData::ChartKind ChartsData::getCk()
{
    return ck;
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
//            qDebug() << "in sin case";
//            qDebug() << x.length();
//            qDebug() << y.length();
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
}
