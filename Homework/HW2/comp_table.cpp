#include "comp_table.h"
#include "ui_comp_table.h"

Comp_Table::Comp_Table(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Comp_Table)
{
    ui->setupUi(this);
}

Comp_Table::~Comp_Table()
{
    delete ui;
}
