#ifndef TASKMODEL_H
#define TASKMODEL_H

#include <QAbstractListModel>
#include <QStringList>


class TaskModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles {
        //ColorRole = Qt::UserRole + 1,
        TextRole = Qt::UserRole + 1
    };

    TaskModel(QObject *parent = 0);

    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QHash<int, QByteArray> roleNames() const;

    Q_INVOKABLE void add();

private:
    QStringList m_data;
};

#endif // TASKMODEL_H
