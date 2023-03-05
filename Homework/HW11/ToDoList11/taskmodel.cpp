#include "taskmodel.h"

// Variant II write to database from TaskModel

TaskModel::TaskModel(QObject *parent):
    QAbstractListModel(parent)
{
    taskDB = new TaskDataBase;


    m_tasksCount = taskDB->recordCount();
}

TaskModel::~TaskModel()
{
    for(int i = 0; i < m_data.size(); ++i)
    {
        QString task(m_data[i]);
        taskDB->insertRecord(task);
    }
}

int TaskModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) {
        return 0;
    }

    return m_data.size();
}

QVariant TaskModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid()) {
        return QVariant();
    }

    switch (role) {
    case TextRole:
        return m_data.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> TaskModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[TextRole] = "text";

    return roles;
}

void TaskModel::add(QString task)
{
    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
    if(task != "")
    m_data.append(task);
    endInsertRows();

    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
    emit dataChanged(index, index);
    setTaskCount(m_data.count());
}

void TaskModel::printTable()
{
    taskDB->printTable();
}

//void TaskModel::removeData(int row)
//{
//    if(row < 0 || row >= m_data.count())
//    {
//        return;
//    }

//    beginRemoveRows(QModelIndex(), row, row);
//    m_data.removeAt(row);
//    endRemoveRows();


//    setTaskCount(m_data.count());
//}

void TaskModel::setTaskCount(int c)
{
    if(c > 1)
    {
        c = 1;
    }
    m_tasksCount += c;
    emit tasksCountChanged(m_tasksCount);
}

bool TaskModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!index.isValid()) {
        return false;
    }

    switch (role) {
    case TextRole:
        m_data[index.row()] = value.toString();
        break;
    default:
        return false;
    }

    emit dataChanged(index, index, QVector<int>() << role);

    return true;
}

Qt::ItemFlags TaskModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::ItemIsEnabled;

    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
}

int TaskModel::tasksCount()
{
    return m_tasksCount;
}
