#ifndef INSERT_SPEC_CHAR_H
#define INSERT_SPEC_CHAR_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class Insert_Spec_Char; }
QT_END_NAMESPACE

class Insert_Spec_Char : public QMainWindow
{
    Q_OBJECT

public:
    Insert_Spec_Char(QWidget *parent = nullptr);
    void spec_char_proc(QString &txt, QString &remove_char, QString &spec_char, qint32 pos);
    ~Insert_Spec_Char();

private slots:
    void on_plainTextEdit_textChanged();


private:
    Ui::Insert_Spec_Char *ui;
};
#endif // INSERT_SPEC_CHAR_H
