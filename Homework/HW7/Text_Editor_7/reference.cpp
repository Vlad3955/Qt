#include "reference.h"
#include "ui_reference.h"

Reference::Reference(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Reference)
{
    ui->setupUi(this);

    QFile file(":/Doc/reference.txt");
    if (file.open(QIODevice::ReadOnly))
    {
        QByteArray ba = file.readAll();
        QString text(ba);
        ui->plainTextEdit->setReadOnly(true);
        ui->plainTextEdit->setPlainText((text));
    }
}

Reference::~Reference()
{
    delete ui;
}
