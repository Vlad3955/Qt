#include "taskmodel.h"

// Variant I write to file

TaskModel::TaskModel(QObject *parent):
    QAbstractListModel(parent)
{
    QFile file(":/doc/taskbase.txt");
    if (file.open(QIODevice::ReadOnly))
    {
        //int lineindex = 0;
        QTextStream in(&file);

        while (!in.atEnd()) {

            //QString fileLine = in.readLine();
            m_data << in.readLine();

//            QStringList lineToken = fileLine.split("/n", Qt::KeepEmptyParts);
//            for (int j = 0; j < lineToken.size(); j++)
//            {
//                QString value = lineToken.at(j);
//                m_data << value;
//            }
//            lineindex++;
        }
        file.close();
    }

    m_tasksCount = m_data.size();
}

TaskModel::~TaskModel()
{
    QFile file("D:/GB/CPP/Qt/Homework/HW9/ToDoList/taskbase.txt");
    if (file.exists())
    {
        if (file.open(QIODevice::WriteOnly))
        {
            for(int i = 0; i < m_data.size(); ++i)
            {
                QString task(m_data[i]);
                QByteArray ba = task.toUtf8() + "\r\n";
                file.write(ba, ba.length());
            }
        }
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

void TaskModel::removeData(int row)
{
    if(row < 0 || row >= m_data.count())
    {
        return;
    }

    beginRemoveRows(QModelIndex(), row, row);
    m_data.removeAt(row);
    endRemoveRows();

    QFile file("D:/C++/CPP/Qt/Homework/HW9/ToDoList/taskbase.txt");
    if (file.exists())
    {
        if (file.open(QIODevice::WriteOnly))
        {
            for(int i = 0; i < m_data.size(); ++i)
            {
                QString task(m_data[i]);
                QByteArray ba = task.toUtf8() + "\r\n";
                file.write(ba, ba.length());
            }
        }
    }
    setTaskCount(m_data.count());
}

void TaskModel::setTaskCount(int c)
{
    m_tasksCount = c;
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



// Variant II write to database from TaskModel

//TaskModel::TaskModel(QObject *parent):
//    QAbstractListModel(parent)
//{

//    taskDB = new TaskDataBase;

//    taskDB->printTable();


////    QFile file(":/doc/taskbase.txt");
////    if (file.open(QIODevice::ReadOnly))
////    {
////        //int lineindex = 0;
////        QTextStream in(&file);

////        while (!in.atEnd()) {

////            //QString fileLine = in.readLine();
////            m_data << in.readLine();

//////            QStringList lineToken = fileLine.split("/n", Qt::KeepEmptyParts);
//////            for (int j = 0; j < lineToken.size(); j++)
//////            {
//////                QString value = lineToken.at(j);
//////                m_data << value;
//////            }
//////            lineindex++;
////        }
////        file.close();
////    }

//    m_tasksCount = m_data.size();
//}

//TaskModel::~TaskModel()
//{
////    QFile file("D:/GB/CPP/Qt/Homework/HW9/ToDoList/taskbase.txt");
////    if (file.exists())
////    {
////        if (file.open(QIODevice::WriteOnly))
////        {
////            for(int i = 0; i < m_data.size(); ++i)
////            {
////                QString task(m_data[i]);
////                QByteArray ba = task.toUtf8() + "\r\n";
////                file.write(ba, ba.length());
////            }
////        }
////    }

//    for(int i = 0; i < m_data.size(); ++i)
//    {
//        taskDB->insertRecord(m_data[i]);
//    }

//}

//int TaskModel::rowCount(const QModelIndex &parent) const
//{
//    if (parent.isValid()) {
//        return 0;
//    }

//    return m_data.size();
//}

//QVariant TaskModel::data(const QModelIndex &index, int role) const
//{
//    if (!index.isValid()) {
//        return QVariant();
//    }

//    switch (role) {
//    case TextRole:
//        return m_data.at(index.row());
//    default:
//        return QVariant();
//    }
//}

//QHash<int, QByteArray> TaskModel::roleNames() const
//{
//    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
//    roles[TextRole] = "text";

//    return roles;
//}

//void TaskModel::add(QString task)
//{
//    beginInsertRows(QModelIndex(), m_data.size(), m_data.size());
//    if(task != "")
//    m_data.append(task);
//    endInsertRows();

//    QModelIndex index = createIndex(0, 0, static_cast<void *>(0));
//    emit dataChanged(index, index);
//     setTaskCount(m_data.count());
//}

//void TaskModel::removeData(int row)
//{
//    if(row < 0 || row >= m_data.count())
//    {
//        return;
//    }

//    beginRemoveRows(QModelIndex(), row, row);
//    m_data.removeAt(row);
//    endRemoveRows();

//    QFile file("D:/C++/CPP/Qt/Homework/HW9/ToDoList/taskbase.txt");
//    if (file.exists())
//    {
//        if (file.open(QIODevice::WriteOnly))
//        {
//            for(int i = 0; i < m_data.size(); ++i)
//            {
//                QString task(m_data[i]);
//                QByteArray ba = task.toUtf8() + "\r\n";
//                file.write(ba, ba.length());
//            }
//        }
//    }
//    setTaskCount(m_data.count());
//}

//void TaskModel::setTaskCount(int c)
//{
//    m_tasksCount = c;
//    emit tasksCountChanged(m_tasksCount);
//}

//bool TaskModel::setData(const QModelIndex &index, const QVariant &value, int role)
//{
//    if (!index.isValid()) {
//        return false;
//    }

//    switch (role) {
//    case TextRole:
//        m_data[index.row()] = value.toString();
//        break;
//    default:
//        return false;
//    }

//    emit dataChanged(index, index, QVector<int>() << role);

//    return true;
//}

//Qt::ItemFlags TaskModel::flags(const QModelIndex &index) const
//{
//    if (!index.isValid())
//        return Qt::ItemIsEnabled;

//    return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
//}

//int TaskModel::tasksCount()
//{
//    return m_tasksCount;
//}
