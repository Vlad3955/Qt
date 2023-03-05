#ifndef TASKMODEL_H
#define TASKMODEL_H

#include <QAbstractListModel>
#include <QStringList>
#include <QFile>


// Variant II write to database from TaskModel

#include "taskdatabase.h"

class TaskModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int m_tasksCount READ tasksCount  NOTIFY tasksCountChanged)

public:
    enum Roles {
        TextRole = Qt::UserRole + 1
    };

    TaskModel(QObject *parent = 0);
    ~TaskModel();

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role);
    virtual Qt::ItemFlags flags(const QModelIndex &index) const;

    Q_INVOKABLE void add(QString task);
    //Q_INVOKABLE void removeData(int row);
    Q_INVOKABLE void printTable();
    void setTaskCount(int c);
    Q_INVOKABLE int tasksCount();

signals:
    void tasksCountChanged(int c);

private:
    TaskDataBase *taskDB;
    QStringList m_data;
    int m_tasksCount;
};

#endif // TASKMODEL_H
