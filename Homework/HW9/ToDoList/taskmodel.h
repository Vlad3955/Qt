#ifndef TASKMODEL_H
#define TASKMODEL_H

#include <QAbstractListModel>
#include <QStringList>
#include <QFile>


class TaskModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int m_tasksCount READ getTasksCount)

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

    Q_INVOKABLE void setTasksCount(int count);
    Q_INVOKABLE int getTasksCount();

    Q_INVOKABLE void add(QString task);
    Q_INVOKABLE void removeData(int row);

private:
    QStringList m_data;
    int m_tasksCount;
};

#endif // TASKMODEL_H
