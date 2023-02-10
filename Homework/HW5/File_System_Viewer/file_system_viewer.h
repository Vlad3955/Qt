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

private slots:
   void chgDisk(int index);
   void goMainPath();
   void chgFolders(QModelIndex index);

private:
   QStandardItemModel *model;
   QString curretnPath;
   QString compPath;

};

#endif // FILE_SYSTEM_VIEWER_H
