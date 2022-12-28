#ifndef LANGUAGES_LIST_H
#define LANGUAGES_LIST_H

#include <QMainWindow>
#include <QStandardItemModel>

namespace Ui {
class Languages_list;
}

class Languages_list : public QMainWindow
{
    Q_OBJECT

public:
    explicit Languages_list(QWidget *parent = nullptr);
    ~Languages_list();

private slots:
    void on_pb_add_lang_clicked();

    void on_pb_del_lang_clicked();


    void on_cb_list_mode_stateChanged(int arg1);

    void on_cb_icon_mode_stateChanged(int arg1);

private:
    Ui::Languages_list *ui;
    QStandardItemModel *model;
    QStringList list {"C#", "Python", "Java", "C++", "PHP", "JavaScript"};
};

#endif // LANGUAGES_LIST_H
