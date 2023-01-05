#ifndef TEXT_EDITOR_H
#define TEXT_EDITOR_H

#include <QMainWindow>
#include <QFileDialog>
#include "reference.h"
#include <QTranslator>
#include <QEvent>


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

private slots:
    void on_pb_open_clicked();

    void on_pb_save_clicked();

    void on_pb_reference_clicked();

private:
    void pb_open();

    void pb_save();

    void destr_save();

private:
    Ui::Text_Editor *ui;
    Reference ref;
    QString pathSave;
    QString path;
    QTranslator translator;
};
#endif // TEXT_EDITOR_H