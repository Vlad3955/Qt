#include "text_editor.h"
#include "ui_text_editor.h"


Text_Editor::Text_Editor(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Text_Editor)
{
    ui->setupUi(this);
    n_w = new New_Window;

    QMenu *file_menu = menuBar()->addMenu("File");
    file_menu->addAction("Open       CTRL+O", this, SLOT(pb_open()));
    file_menu->addSeparator();
    file_menu->addAction("New window CTRL+N", this, SLOT(new_window()));
    file_menu->addSeparator();
    file_menu->addAction("Save       CTRL+S", this, SLOT(destr_save()));
    file_menu->addSeparator();
    file_menu->addAction("Save as... CTRL+S", this, SLOT(pb_save()));
    file_menu->addSeparator();
    file_menu->addAction("Print", this, SLOT(print_doc()));
    file_menu->addSeparator();
    file_menu->addAction("Reference", this, SLOT(reference()));



    QMenu *view_menu = menuBar()->addMenu("View");
    QMenu *sub_lang_menu = new QMenu("Language");
    sub_lang_menu->addAction("English", this, SLOT(ts_engl()));
    sub_lang_menu->addSeparator();
    sub_lang_menu->addAction("Russian", this, SLOT(ts_rus()));
    view_menu->addMenu(sub_lang_menu);
    view_menu->addSeparator();
    QMenu *sub_theme_menu = new QMenu("Theme");
    sub_theme_menu->addAction("Light", this, SLOT(light_theme()));
    sub_theme_menu->addSeparator();
    sub_theme_menu->addAction("Dark", this, SLOT(dark_theme()));
    view_menu->addMenu(sub_theme_menu);

    ts_rus();
    light_theme();
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

void Text_Editor::new_window()
{
    n_w->show();
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

void Text_Editor::reference()
{
    ref.show();
}

void Text_Editor::ts_engl()
{
    translator.load(":/Translators/QtLanguage_en.qm");
    qApp->installTranslator(&translator);
}

void Text_Editor::ts_rus()
{
    translator.load(":/Translators/QtLanguage_ru.qm");
    qApp->installTranslator(&translator);
}

void Text_Editor::light_theme()
{
    setStyleSheet("QPushButton { background-color: #DCDCDC}"
                  "QComboBox { background-color: #DCDCDC}"
                  "QMainWindow { background-color: #F5F5F5}");
}

void Text_Editor::dark_theme()
{
    setStyleSheet("QPushButton { background-color: #2F4F4F}"
                  "QComboBox { background-color: #2F4F4F}"
                  "QMainWindow { background-color: #000000}"
                  "QPlainTextEdit { background-color: #2F4F4F; color: white}");
}

void Text_Editor::print_doc()
{
    QPrinter printer;
    QPrintDialog dlg(&printer, this);
    dlg.setWindowTitle("Print");
    if (dlg.exec() != QDialog::Accepted)
    {
        return;
    }
    ui->plainTextEdit->print(&printer);
}



Text_Editor::~Text_Editor()
{
    //destr_save();
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
            this->pb_open();
        }
        break;
    case Qt::Key_S:
        if (event->modifiers() & Qt::ControlModifier)
        {
            this->pb_save();
        }
        break;
    case Qt::Key_N:
        if (event->modifiers() & Qt::ControlModifier)
        {
            n_w->show();
        }
        break;
    case Qt::Key_Q:
        if (event->modifiers() & Qt::ControlModifier)
        {
            this->pb_save();
            exit(0);
        }
        break;
    default:
        break;
    }
}

void Text_Editor::closeEvent(QCloseEvent *event)
{
    QMessageBox msgBox(this);
    msgBox.setText("Save this document?");
    msgBox.setIcon(QMessageBox::Icon::Question);
    msgBox.addButton("Yes", QMessageBox::YesRole);
    msgBox.addButton("No", QMessageBox::NoRole);
    msgBox.addButton("Cancel", QMessageBox::RejectRole);

    int result = msgBox.exec();
    if (result == 0)
    {
        this->destr_save();
        event->accept();
    }
    else if (result == 1)
    {
        event->ignore();
        qApp->quit();
    }
    else
    {
        event->ignore();
    }
}





