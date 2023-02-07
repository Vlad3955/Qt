#include "new_window.h"
#include "ui_new_window.h"

New_Window::New_Window(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::New_Window)
{
    save = nullptr;
    ui->setupUi(this);
}

New_Window::~New_Window()
{
    if (save == nullptr)
    {
        save = QFileDialog::getSaveFileName();
        if (save.isEmpty())
        {
            return;
        }
        QFile file(save);
        if (file.open(QIODevice::WriteOnly))
        {
            QString text = ui->plainTextEdit->toPlainText();
            QByteArray ba = text.toUtf8();
            file.write(ba, ba.length());
        }
    }

    delete ui;
}
