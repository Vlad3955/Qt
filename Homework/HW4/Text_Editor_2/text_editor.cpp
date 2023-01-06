#include "text_editor.h"
#include "ui_text_editor.h"


Text_Editor::Text_Editor(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Text_Editor)
{
    path = nullptr;
    pathSave = nullptr;
    ui->setupUi(this);

    ui->comboBox->addItems(QStringList() << "Russian" << "English");
    ui->pb_open->setText(tr("Open"));
    ui->pb_save->setText(tr("Save"));
    ui->pb_reference->setText(tr("Reference"));


    connect(ui->comboBox, static_cast<void(QComboBox::*)(const QString &)>(&QComboBox::currentTextChanged),
               [this](const QString &str){
           if (str == "English")
           {
               translator.load(":/Translators/QtLanguage_en.qm");
               qApp->installTranslator(&translator);
           }
           else
           {
               translator.load(":/Translators/QtLanguage_ru.qm");
               qApp->installTranslator(&translator);
           }
       });

    translator.load(":/Translators/QtLanguage_ru.qm");
        qApp->installTranslator(&translator);
}

void Text_Editor::pb_open()
{
    path = QFileDialog::getOpenFileName();
    if (path.isEmpty())
    {
        return;
    }
    QFile file(path);
    if (file.open(QIODevice::ReadOnly))
    {
        QByteArray ba = file.readAll();
        QString text(ba);
        ui->plainTextEdit->setPlainText((text));
    }
}

void Text_Editor::pb_save()
{
    pathSave = QFileDialog::getSaveFileName();
    if (pathSave.isEmpty())
    {
        return;
    }
    QFile file(pathSave);
    if (file.open(QIODevice::WriteOnly))
    {
        QString text = ui->plainTextEdit->toPlainText();
        QByteArray ba = text.toUtf8();
        file.write(ba, ba.length());
    }
}

void Text_Editor::destr_save()
{
    if (path != nullptr)
    {
        QFile file(path);
        if (file.open(QIODevice::WriteOnly))
        {
            QString text = ui->plainTextEdit->toPlainText();
            QByteArray ba = text.toUtf8();
            file.write(ba, ba.length());
        }
        return;
    }

    if (pathSave == nullptr)
    {
        pathSave = QFileDialog::getSaveFileName();
        if (pathSave.isEmpty())
        {
            return;
        }
        QFile file(pathSave);
        if (file.open(QIODevice::WriteOnly))
        {
            QString text = ui->plainTextEdit->toPlainText();
            QByteArray ba = text.toUtf8();
            file.write(ba, ba.length());
        }
    }
}



Text_Editor::~Text_Editor()
{
    destr_save();
    delete ui;
}

void Text_Editor::changeEvent(QEvent *event)
{
    if (event->type() == QEvent::LanguageChange)
    {
        ui->retranslateUi(this);
    }
}

void Text_Editor::keyPressEvent(QKeyEvent *event)
{
    switch (event->key()) {
    case Qt::Key_O:
        if (event->modifiers() & Qt::ControlModifier)
        {
            this->on_pb_open_clicked();
        }
        break;
    case Qt::Key_S:
        if (event->modifiers() & Qt::ControlModifier)
        {
            this->on_pb_save_clicked();
        }
        break;
//    case Qt::Key_N:
//        if (event->modifiers() & Qt::ControlModifier)
//        {

//        }
//        break;
//    case Qt::Key_Q:
//        if (event->modifiers() & Qt::ControlModifier)
//        {

//        }
//        break;
    default:
        break;
    }
}


void Text_Editor::on_pb_open_clicked()
{
    pb_open();
}


void Text_Editor::on_pb_save_clicked()
{
    pb_save();
}


void Text_Editor::on_pb_reference_clicked()
{
    ref.show();
}



