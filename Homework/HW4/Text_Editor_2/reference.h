#ifndef REFERENCE_H
#define REFERENCE_H

#include <QWidget>
#include <QFileDialog>

namespace Ui {
class Reference;
}

class Reference : public QWidget
{
    Q_OBJECT

public:
    explicit Reference(QWidget *parent = nullptr);
    ~Reference();

private:
    Ui::Reference *ui;
};

#endif // REFERENCE_H
