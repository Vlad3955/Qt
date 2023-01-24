#include "languages_list.h"
#include "ui_languages_list.h"

Languages_list::Languages_list(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Languages_list)
{
    ui->setupUi(this);


    //QStringList list {"C#", "Python", "Java", "C++", "PHP", "JavaScript"};
    model = new QStandardItemModel(list.size(), 1, this);
    for (int i = 0; i < model->rowCount(); ++i)
    {
        QModelIndex index = model->index(i, 0);
        QString str = list[i];
        model->setData(index, str, Qt::DisplayRole);
        model->setData(index, "Tooltip for " + str, Qt::ToolTipRole);
        model->setData(index, QIcon(":/Icons/" + str + ".png"), Qt::DecorationRole);
    }
    ui->listView->setModel(model);
    ui->listView->setEditTriggers(QAbstractItemView::EditTrigger::DoubleClicked);
}

Languages_list::~Languages_list()
{
    delete ui;
}

void Languages_list::on_pb_add_lang_clicked()
{
    int const row_count = model->rowCount();
    model->insertRow(row_count);
    model->setData(model->index(row_count, 0), QIcon(":/Icons/.png"), Qt::DecorationRole);
}



void Languages_list::on_pb_del_lang_clicked()
{
    int row = ui->listView->currentIndex().row();
    model->removeRow(row);
}




void Languages_list::on_cb_list_mode_stateChanged(int arg1)
{
    if(arg1 == Qt::Checked)
    {
        ui->listView->setViewMode(QListView::ListMode);
    }
}


void Languages_list::on_cb_icon_mode_stateChanged(int arg1)
{
    if(arg1 == Qt::Checked)
    {
        ui->listView->setViewMode(QListView::IconMode);

    }
}

