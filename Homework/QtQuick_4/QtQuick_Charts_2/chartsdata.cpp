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
    xi = 0;
    yi = 0;
    xi2 = 0;
    xiyi = 0;
    Xi.clear();
    Yi.clear();
    xM.clear();
    yM.clear();


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

    xM.resize(2);
    yM.resize(2);

    xM[0] = xi2;
    xM[1] = xi;
    yM[0] = xi;
    yM[1] = Xi.length();

    d1 = xM[0] * yM[1];
    d2 = yM[0] * xM[1];
    d = d1 - d2;

    qDebug() << "d = " << d;

    xM[0] = xiyi;
    yM[0] = yi;

    d1 = xM[0] * yM[1];
    d2 = yM[0] * xM[1];
    da = d1 - d2;
    a = da / d;
    qDebug() << "da = " << da;
    qDebug() << "a = " << a;

    xM[0] = xi2;
    xM[1] = xiyi;
    yM[0] = xi;
    yM[1] = yi;

    d1 = xM[0] * yM[1];
    d2 = yM[0] * xM[1];
    db = d1 - d2;
    b = db / d;
    qDebug() << "db = " << db;
    qDebug() << "b = " << b;

    yM.clear();
    yM.resize(Xi.length());

    for (int i = 0; i < Xi.length(); ++i)
    {
        yM[i] = (a * Xi[i]) + b;
    }

    for (double it : yM)
    {
        qDebug() << "f(xi) = " << it;
    }
}

QVector<double> ChartsData::getPointX()
{
    return Xi;
}

QVector<double> ChartsData::getPointY()
{
    return Yi;
}

QVector<double> ChartsData::getPointYM()
{
    return yM;
}

