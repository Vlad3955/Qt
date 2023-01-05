#include "text_editor.h"
#include "ui_text_editor.h"


Text_Editor::Text_Editor(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Text_Editor)
{
    path = nullptr;
    pathSave = nullptr;
    ui->setupUi(this);

    ui->comboBox->addItems(QStringList() << "ru_RU" << "en_US");
    ui->pb_open->setText(tr("Open"));
    ui->pb_save->setText(tr("Save"));
    ui->pb_reference->setText(tr("Reference"));


    connect(ui->comboBox, reinterpret_cast<void(QComboBox::*)(const QString &)>(&QComboBox::currentIndexChanged),
               [=](const QString &str){
           translator.load("QtLanguage_" + str, ".");   // Загружаем перевод
           qApp->installTranslator(&translator);        // Устанавливаем перевод в приложение
       });

    translator.load(QString("QtLanguage_") + QString("ru_RU"));
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
    // В случае получения события изменения языка приложения
        if (event->type() == QEvent::LanguageChange) {
            ui->retranslateUi(this);    // переведём окно заново
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



