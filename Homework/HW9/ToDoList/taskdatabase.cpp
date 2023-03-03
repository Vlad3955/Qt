#include "taskdatabase.h"

TaskDataBase::TaskDataBase(QWidget *parent) :
    QMainWindow(parent)
{
    if (!createConnection())
    {
        return;
    }

//    if (!createTable())
//    {
//        return;
//    }
}

bool TaskDataBase::createConnection()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("D:/GB/CPP/Qt/Homework/HW9/build-ToDoList-Desktop_Qt_6_4_1_MSVC2019_64bit-Debug/todolist.db");
    if (!db.open())
    {
        qDebug() << "Cannot open database";
        return false;
    }
    return true;
}

bool TaskDataBase::createTable()
{
    QSqlQuery query;
//    QString s = "CREATE TABLE todolist ("
//                "number INTEGER PRIMARY KEY NOT NULL,";
//                "task VARCHAR(255) );";
//    if (!query.exec(s))
//    {
//        qDebug() << "Unable to create a table!";
//        return false;
//    }


    if (!query.exec("create table todolist(id int(11),"
                    "task varchar(255))"))
    {
        qDebug() << "Unable to create a table!";
        return false;
    }
    return true;
}

bool TaskDataBase::insertRecord(QString rec)
{
    QSqlQuery query;
//    QString s = "insert into todolist (rec) "
//                "VALUES('%1');";
//    QString s = "insert into todolist values(1, rec);";
//    QString q = s.arg(rec);
//    if (!query.exec(q))
//    {
//        qDebug() << "Unable to make insert operation!";
//        return false;
//    }
//    return true;


    if (!query.exec("insert into todolist values(1, 'hi');"))
    {
        qDebug() << "Unable to make insert operation!";
        return false;
    }
    return true;
}

void TaskDataBase::printTable()
{
    QSqlQuery query;
    if (!query.exec("SELECT * FROM todolist;"))
    {
        qDebug() << "Unable to read table!";
    }
    QSqlRecord r = query.record();
    while (query.next())
    {
        qDebug() << query.value(r.indexOf("number")).toInt() << "\t" <<
                    query.value(r.indexOf("task")).toString();
    }
}
