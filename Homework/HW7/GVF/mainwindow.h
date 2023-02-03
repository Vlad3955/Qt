#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QGraphicsScene>
#include <QGraphicsView>
#include "blockscheme.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

protected:
    virtual void mousePressEvent(QMouseEvent *event) override;

private:
    Ui::MainWindow *ui;
    QGraphicsScene *scene;
    BlockScheme *bscheme, *bscheme1;

private slots:
    void reDraw();

};
#endif // MAINWINDOW_H
