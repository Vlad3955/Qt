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
    db.setDatabaseName("todolist.db");
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
    QString s = "CREATE TABLE todolist ( "
                "number INTEGER PRIMARY KEY NOT NULL, "
                "task VARCHAR(255) "
                ");";
    if (!query.exec(s))
    {
        qDebug() << "Unable to create a table!";
        return false;
    }
    return true;
}

bool TaskDataBase::insertRecord(QString task)
{
    QSqlQuery query;
    QString s = "INSERT INTO todolist (task) "
                "VALUES('%1');";
    QString q = s.arg(task);

    if (!query.exec(q))
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
    view = new QTableView(this);
    setCentralWidget(view);
    model = new QSqlQueryModel(this);
    model->setQuery("SELECT * FROM todolist;");
    view->setModel(model);
    this->show();

}

int TaskDataBase::recordCount()
{
    QSqlQuery query;
    if (!query.exec("SELECT * FROM todolist;"))
    {
        qDebug() << "Unable to count table!";
    }
    m_recordCount = 0;
    while (query.next())
    {
        ++m_recordCount;
    }
    return m_recordCount;
}
