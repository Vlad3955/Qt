#ifndef FILE_SYSTEM_VIEWER_H
#define FILE_SYSTEM_VIEWER_H

#include <QWidget>
#include <QLineEdit>
#include <QGridLayout>
#include <QTreeView>
#include <QComboBox>
#include <QPushButton>
#include <QStandardItemModel>
#include <QApplication>
#include <QLabel>
#include <QTextEdit>


#include "controller.h"



Q_PROPERTY(QStandardItemModel *model READ getCurrentModel WRITE setNewModel)

class File_System_Viewer : public QWidget
{
    Q_OBJECT
public:
    explicit File_System_Viewer(QWidget *parent = nullptr);
    void clearTree();
    QStandardItemModel *getCurrentModel()const
    {
        return model;
    }
    void setNewModel(QStandardItemModel *newmodel);
    void rebuildModel(QString str);

private:
    QGridLayout *gridLay;
    QTreeView *tree;
    QLineEdit *t_edit;
    QPushButton *mainPath;
    QComboBox *disckSelBox;

    QLineEdit *searchEdit;
    QPushButton *startFindButton;
    QPushButton *stopFindButton;
    Controller *controllerl;
    QLabel *statusLabel;
    QLabel *searchStatus;
    QTextEdit *infoText;



private slots:
   void chgDisk(int index);
   void goMainPath();
   void chgFolders(QModelIndex index);

   void findFileSlot();
   void changStatusLabel(QString);
   void printFindFile(QString);

   void stopSearch();
   void infoTextClear();


private:
   QStandardItemModel *model;
   QString curretnPath;

};

#endif // FILE_SYSTEM_VIEWER_H
