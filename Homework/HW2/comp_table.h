#ifndef COMP_TABLE_H
#define COMP_TABLE_H

#include <QMainWindow>

namespace Ui {
class Comp_Table;
}

class Comp_Table : public QMainWindow
{
    Q_OBJECT

public:
    explicit Comp_Table(QWidget *parent = nullptr);
    ~Comp_Table();

private:
    Ui::Comp_Table *ui;
};

#endif // COMP_TABLE_H
