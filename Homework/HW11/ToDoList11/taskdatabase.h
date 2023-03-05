#ifndef TASKDATABASE_H
#define TASKDATABASE_H

#include <QMainWindow>
#include <QSqlDatabase>
#include <QTableView>
#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QSqlRecord>



class TaskDataBase : public QMainWindow
{
    Q_OBJECT
public:
    TaskDataBase(QWidget *parent = nullptr);

//private:
    bool createConnection();
    bool createTable();
    bool insertRecord(QString task = "");
    void printTable();
    int recordCount();

    QSqlDatabase db;

    QSqlQueryModel *model;
    QTableView *view;
    int m_recordCount;
};

#endif // TASKDATABASE_H
