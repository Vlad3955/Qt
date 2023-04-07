#ifndef CHARTSDATA_H
#define CHARTSDATA_H

#include <QObject>
#include <QVector>

class ChartsData : public QObject
{
    Q_OBJECT
public:
    explicit ChartsData(QObject *parent = nullptr);
    QVector<double> x, y;

signals:

};

#endif // CHARTSDATA_H
