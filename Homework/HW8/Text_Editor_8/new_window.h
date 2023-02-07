#ifndef NEW_WINDOW_H
#define NEW_WINDOW_H

#include <QWidget>
#include <QFileDialog>

namespace Ui {
class New_Window;
}


class New_Window : public QWidget
{
    Q_OBJECT

public:
    explicit New_Window(QWidget *parent = nullptr);
    ~New_Window();

private:
    Ui::New_Window *ui;
    QString save;
};

#endif // NEW_WINDOW_H
