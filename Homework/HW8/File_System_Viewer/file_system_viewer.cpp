#include "file_system_viewer.h"
#include <QDir>
#include <QStatusBar>


File_System_Viewer::File_System_Viewer(QWidget *parent)
    : QWidget{parent},
      model(nullptr)
{
    gridLay = new QGridLayout(this);
    this->setLayout(gridLay);
    tree = new QTreeView(this);
    gridLay->addWidget(tree, 1, 0, 10, 10);
    t_edit = new QLineEdit(this);
    gridLay->addWidget(t_edit, 0, 2, 1, 8);

    startFindButton = new QPushButton(this);
    startFindButton->setText(tr("Find"));
    gridLay->addWidget(startFindButton, 0, 10, 1, 2);
    searchEdit = new QLineEdit(this);
    gridLay->addWidget(searchEdit, 0, 12, 1, 8);
    connect(startFindButton, SIGNAL(clicked()), this, SLOT(findFileSlot()));
    infoText = new QTextEdit(this);
    gridLay->addWidget(infoText, 1, 10, 8, 10);
    controllerl = new Controller(this);
    statusLabel = new QLabel(this);
    searchStatus = new QLabel(this);
    searchStatus->setText(tr("Search status:"));
    gridLay->addWidget(searchStatus, 9, 10, 1, 1);
    gridLay->addWidget(statusLabel, 10, 10, 1, 10);

    stopFindButton = new QPushButton(this);
    stopFindButton->setText(tr("Stop search"));
    gridLay->addWidget(stopFindButton, 9, 18, 1, 2);
    connect(stopFindButton, SIGNAL(clicked()), this, SLOT(stopSearch()));
    connect(controllerl, SIGNAL(changFindPath(QString)), this,
    SLOT(changStatusLabel(QString)));
    connect(controllerl, SIGNAL(genPathOfFile(QString)), this,
    SLOT(printFindFile(QString)));
    //connect(controllerl, SIGNAL((newFind())), this, SLOT(infoTextClear()));
    connect(startFindButton, SIGNAL(clicked()), this, SLOT(infoTextClear()));


    setMinimumSize(900, 600);
    if(QSysInfo::productType() == "windows")
    {
        disckSelBox = new QComboBox(this);
        QFileInfoList list = QDir::drives();
        QFileInfoList::const_iterator listdisk = list.begin();
        int amount = list.count();
        for (int i = 0; i < amount; i++)
        {
            disckSelBox->addItem(listdisk->path());
            listdisk++;
        }
        if (amount > 0)
        {
            rebuildModel(list.at(0).path());
        }
        gridLay->addWidget(disckSelBox, 0, 0, 1, 2); // координаты
        connect(disckSelBox, SIGNAL(activated(int)), this, SLOT(chgDisk(int)));
        connect(tree, SIGNAL(doubleClicked(QModelIndex)), this, SLOT(chgFolders(QModelIndex)));
    }
    else
    {
        mainPath = new QPushButton(this);
        mainPath->setText("/");
        gridLay->addWidget(mainPath, 0, 0, 1, 2);
        connect(mainPath, SIGNAL(clicked()), this, SLOT(goMainPath()));
        rebuildModel("/");
    }
}


void File_System_Viewer::chgDisk(int index)
{
    QFileInfoList list = QDir::drives();
    rebuildModel(list.at(index).path());
}
void File_System_Viewer::goMainPath()
{
    rebuildModel("/");
}

void File_System_Viewer::chgFolders(QModelIndex index)
{
    qDebug() << "Index = " << model->data(index, Qt::DisplayRole).toString() + "/";
    qDebug() << "CurrentPath = " << curretnPath;
    if (curretnPath == model->data(index, Qt::DisplayRole).toString())
    {
        return;
    }
    else
    {
        curretnPath += model->data(index, Qt::DisplayRole).toString() + "/";
    }

    QStandardItemModel *model = new QStandardItemModel(this);
    QList<QStandardItem*> items;
    items.append(new QStandardItem(QIcon(QApplication::style()->standardIcon(QStyle::SP_DirIcon)), curretnPath));
    model->appendRow(items);
    QDir dir(curretnPath);
    dir.setFilter(QDir::Hidden | QDir::NoSymLinks | QDir::Dirs | QDir::NoDotAndDotDot);
    QStringList list = dir.entryList();
    int amount = list.count();
    QList<QStandardItem*>folders;
    t_edit->setText(curretnPath);

    for (int i = 0; i < amount; i++)
    {
        QStandardItem* f = new QStandardItem(QIcon(QApplication::style()->standardIcon(QStyle::SP_DirIcon)), list.at(i));
        folders.append(f);
    }

    items.at(0)->appendRows(folders);
    dir.setFilter(QDir::Hidden | QDir::NoSymLinks | QDir::Files);
    list = dir.entryList();
    amount = list.count();
    QList<QStandardItem*>files;

    for (int i = 0; i < amount; i++)
    {
        QStandardItem* f = new QStandardItem(QIcon(QApplication::style()->standardIcon(QStyle::SP_FileIcon)), list.at(i));
        files.append(f);
    }

    items.at(0)->appendRows(files);
    setNewModel(model);
}

void File_System_Viewer::findFileSlot()
{
    QString linesearch = searchEdit->text();
    if (linesearch.length() == 0) return;
    controllerl->startFind(disckSelBox->currentText(), linesearch);
}

void File_System_Viewer::changStatusLabel(QString line)
{
    statusLabel->setText(line);
}

void File_System_Viewer::printFindFile(QString str)
{
    infoText->append(str);
}

void File_System_Viewer::stopSearch()
{
    controllerl->stopSearch();
}

void File_System_Viewer::infoTextClear()
{
    infoText->clear();
}

void File_System_Viewer::setNewModel(QStandardItemModel *newmodel)
{
    tree->setModel(newmodel);
    model = newmodel;
}


void File_System_Viewer::rebuildModel(QString str)
{
    curretnPath = str;
    QStandardItemModel *model = new QStandardItemModel(this);
    QList<QStandardItem*> items;
    items.append(new QStandardItem(QIcon(QApplication::style()->standardIcon(QStyle::SP_DriveHDIcon)), str));
    model->appendRow(items);
    QDir dir(str);
    dir.setFilter(QDir::Hidden | QDir::NoSymLinks | QDir::Dirs);
    QStringList list = dir.entryList();
    int amount = list.count();
    QList<QStandardItem*>folders;

    for (int i = 0; i < amount; i++)
    {
        QStandardItem* f = new QStandardItem(QIcon(QApplication::style()->standardIcon(QStyle::SP_DirIcon)), list.at(i));
        folders.append(f);
    }

    items.at(0)->appendRows(folders);
    dir.setFilter(QDir::Hidden | QDir::NoSymLinks | QDir::Files);
    list = dir.entryList();
    amount = list.count();
    QList<QStandardItem*>files;

    for (int i = 0; i < amount; i++)
    {
        QStandardItem* f = new QStandardItem(QIcon(QApplication::style()->standardIcon(QStyle::SP_FileIcon)), list.at(i));
        files.append(f);
    }

    items.at(0)->appendRows(files);
    setNewModel(model);
}
