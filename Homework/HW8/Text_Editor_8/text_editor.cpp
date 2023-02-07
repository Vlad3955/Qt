#include "text_editor.h"
#include "ui_text_editor.h"


Text_Editor::Text_Editor(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Text_Editor)
{
    ui->setupUi(this);
    n_w = new New_Window;

    QMenu *file_menu = menuBar()->addMenu(tr("File"));
    file_menu->addAction(tr("Open       CTRL+O"), this, SLOT(pb_open()));
    file_menu->addSeparator();
    file_menu->addAction(tr("New window CTRL+N"), this, SLOT(new_window()));
    file_menu->addSeparator();
    file_menu->addAction(tr("Save       CTRL+S"), this, SLOT(destr_save()));
    file_menu->addSeparator();
    file_menu->addAction(tr("Save as... CTRL+S"), this, SLOT(pb_save()));
    file_menu->addSeparator();
    file_menu->addAction(tr("Print"), this, SLOT(print_doc()));
    file_menu->addSeparator();
    file_menu->addAction(tr("Reference"), this, SLOT(reference()));



    QMenu *view_menu = menuBar()->addMenu(tr("View"));
    QMenu *sub_lang_menu = new QMenu(tr("Language"));
    sub_lang_menu->addAction(tr("English"), this, SLOT(ts_engl()));
    sub_lang_menu->addSeparator();
    sub_lang_menu->addAction(tr("Russian"), this, SLOT(ts_rus()));
    view_menu->addMenu(sub_lang_menu);
    view_menu->addSeparator();
    QMenu *sub_theme_menu = new QMenu(tr("Theme"));
    sub_theme_menu->addAction(tr("Light"), this, SLOT(light_theme()));
    sub_theme_menu->addSeparator();
    sub_theme_menu->addAction(tr("Dark"), this, SLOT(dark_theme()));
    view_menu->addMenu(sub_theme_menu);

    QMenu *format_menu = menuBar()->addMenu(tr("Format"));
    format_menu->addAction(tr("Random color"), this, SLOT(rand_color()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Font"), this, SLOT(set_font()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Left"), this, SLOT(set_left()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Center"), this, SLOT(set_center()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Right"), this, SLOT(set_right()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Copy format"), this, SLOT(copy_format()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Paste format"), this, SLOT(paste_format()));
    format_menu->addSeparator();
    format_menu->addAction(tr("Date & Time"), this, SLOT(date_time()));

    srand(clock());


    //ts_rus();
    ts_engl();
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
        ui->textEdit->setPlainText((text));
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
        QString text = ui->textEdit->toPlainText();
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
            QString text = ui->textEdit->toPlainText();
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
            QString text = ui->textEdit->toPlainText();
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
                  "QTextEdit { background-color: #2F4F4F; color: #2F4F4F}");

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
    ui->textEdit->print(&printer);
}

void Text_Editor::copy_format()
{
    fmt = ui->textEdit->textCursor().charFormat();
}

void Text_Editor::paste_format()
{
    ui->textEdit->textCursor().setCharFormat(fmt);
}

void Text_Editor::rand_color()
{
    QTextCharFormat rand_fmt = ui->textEdit->textCursor().charFormat();
    rand_fmt.setForeground(QBrush(QColor(rand() % 256, rand() % 256, rand() % 256)));
    rand_fmt.setBackground(QBrush(QColor(rand() % 256, rand() % 256, rand() % 256)));
    ui->textEdit->textCursor().setCharFormat(rand_fmt);
}

void Text_Editor::set_font()
{
    QFont font = ui->textEdit->textCursor().charFormat().font();
    QFontDialog fntDlg(font, this);

    bool b[] = {true};
    font = fntDlg.getFont(b);
    if (b[0])
    {
        QTextCharFormat fmt = ui->textEdit->textCursor().charFormat();
        fmt.setFont(font);
         ui->textEdit->textCursor().setCharFormat(fmt);
    }
}

void Text_Editor::set_left()
{
    ui->textEdit->setAlignment(Qt::AlignLeft);
}

void Text_Editor::set_center()
{
    ui->textEdit->setAlignment(Qt::AlignCenter);
}

void Text_Editor::set_right()
{
    ui->textEdit->setAlignment(Qt::AlignRight);
}

void Text_Editor::date_time()
{
    QDateTime today = QDateTime::currentDateTime();
    QString dt = today.toString("h:m:s ap ddd MMMM d yy");

    ui->textEdit->insertPlainText(dt);
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
    msgBox.setText(tr("Save this document?"));
    msgBox.setIcon(QMessageBox::Icon::Question);
    msgBox.addButton(tr("Yes"), QMessageBox::YesRole);
    msgBox.addButton(tr("No"), QMessageBox::NoRole);
    msgBox.addButton(tr("Cancel"), QMessageBox::RejectRole);

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





