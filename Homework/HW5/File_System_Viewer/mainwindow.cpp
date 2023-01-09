#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    f_s_v = new File_System_Viewer(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

