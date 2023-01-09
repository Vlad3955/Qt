#ifndef FILE_SYSTEM_VIEWER_H
#define FILE_SYSTEM_VIEWER_H

#include <QWidget>
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
    QPushButton *mainPath;
    QComboBox *disckSelBox;

private slots:
   void chgDisk(int index);
   void goMainPath();

private:
   QStandardItemModel *model;
   QString curretnPath;

};

#endif // FILE_SYSTEM_VIEWER_H
