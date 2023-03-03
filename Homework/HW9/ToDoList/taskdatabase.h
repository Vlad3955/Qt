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
    bool insertRecord(QString rec = "");
    void printTable();

    QSqlDatabase db;

    QSqlQueryModel *model;
    QTableView *view;
};

#endif // TASKDATABASE_H
