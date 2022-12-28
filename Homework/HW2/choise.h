#ifndef CHOISE_H
#define CHOISE_H

#include <QDialog>
#include "insert_spec_char.h"
#include "languages_list.h"

namespace Ui {
class Choise;
}

class Choise : public QDialog
{
    Q_OBJECT

public:
    explicit Choise(QWidget *parent = nullptr);
    ~Choise();

private slots:
    void on_pushButton_clicked();

private:
    Ui::Choise *ui;
    Insert_Spec_Char isc;
    Languages_list ll;
};

#endif // CHOISE_H
