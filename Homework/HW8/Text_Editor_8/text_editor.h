#ifndef TEXT_EDITOR_H
#define TEXT_EDITOR_H

#include <QMainWindow>
#include <QFileDialog>
#include <QTranslator>
#include <QEvent>
#include <QKeyEvent>
#include <QMenuBar>
#include <QMenu>
#include <QApplication>
#include <QCloseEvent>
#include <QMessageBox>
#include <QtPrintSupport/QPrinter>
#include <QtPrintSupport/QPrintDialog>
#include <QTextDocumentFragment>
#include <QTextDocument>
#include <QTextCharFormat>
#include <QFontDialog>
#include <QDateTime>



#include "reference.h"
#include "new_window.h"

QT_BEGIN_NAMESPACE
namespace Ui { class Text_Editor; }
QT_END_NAMESPACE

class Text_Editor : public QMainWindow
{
    Q_OBJECT

public:
    Text_Editor(QWidget *parent = nullptr);
    ~Text_Editor();

protected:
    void changeEvent(QEvent *event) override;

    void keyPressEvent(QKeyEvent *event) override;

    void closeEvent(QCloseEvent *event) override;

private slots:
    void pb_open();

    void new_window();

    void pb_save();

    void destr_save();

    void reference();

    void ts_engl();

    void ts_rus();

    void light_theme();

    void dark_theme();

    void print_doc();

    void copy_format();

    void paste_format();

    void rand_color();

    void set_font();

    void set_left();

    void set_center();

    void set_right();

    void date_time();

private:


private:
    Ui::Text_Editor *ui;
    Reference ref;
    QString pathSave;
    QString path;
    QTranslator translator;
    New_Window *n_w;
    QTextCharFormat fmt;

//    QAction *actionAlignLeft;
//    QAction *actionAlignCenter;
//    QAction *actionAlignRight;
};
#endif // TEXT_EDITOR_H
