#include "insert_spec_char.h"
#include "ui_insert_spec_char.h"

Insert_Spec_Char::Insert_Spec_Char(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::Insert_Spec_Char)
{
    ui->setupUi(this);
}

 void Insert_Spec_Char::spec_char_proc(QString &txt, QString &remove_char, QString &spec_char, qint32 pos)
 {
     //QString dd = "DD";
     //txt.replace(fnd, d.size(), dd);
     txt.remove(pos, remove_char.size());

     ui->plainTextEdit->setPlainText(txt);


     QTextCursor cursor = ui->plainTextEdit->textCursor();
     cursor.movePosition(QTextCursor::End);
     ui->plainTextEdit->setTextCursor(cursor);

     ui->plainTextEdit->textCursor().insertHtml(spec_char);
 }


Insert_Spec_Char::~Insert_Spec_Char()
{
    delete ui;
}


void Insert_Spec_Char::on_plainTextEdit_textChanged()
{
    QString txt = ui->plainTextEdit->toPlainText();
    qint32 pos = 0;
    while (1)
    {
        QString euro = "euro";
        QString euroH = "&#8364";
        QString rub1 = "#@RUB@";
        QString rub2 = "руб.";
        QString rubH = "&#8381";
        QString ppm = "ppm";
        QString ppmH = "&#137";
        QString cpy = "copy";
        QString cpyH = "&#169";


         qint32 fnd = 0;
         if((fnd = txt.indexOf(rub1, pos)) != -1)
         {
             spec_char_proc(txt, rub1, rubH, fnd);
         }
         else if((fnd = txt.indexOf(rub2, pos)) != -1)
         {
             spec_char_proc(txt, rub2, rubH, fnd);
         }
         else if((fnd = txt.indexOf(euro, pos)) != -1)
         {
             spec_char_proc(txt, euro, euroH, fnd);
         }
         else if((fnd = txt.indexOf(ppm, pos)) != -1)
         {
             spec_char_proc(txt, ppm, ppmH, fnd);
         }
         else if((fnd = txt.indexOf(cpy, pos)) != -1)
         {
             spec_char_proc(txt, cpy, cpyH, fnd);
         }
         else
         {
             return;
         }
    }
}

