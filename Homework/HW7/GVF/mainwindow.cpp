#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    srand(clock());
    scene = new QGraphicsScene(0, 0, 780, 537, this);
    ui->graphicsView->setScene(scene);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        BlockScheme *sch = new BlockScheme(this);
        //QPointF p = event->pos().toPointF();
        //sch->setPos(p.x(), p.y());

        sch->setPos(event->pos());

        scene->addItem(sch);

        connect(sch, SIGNAL(reDraw()), this, SLOT(reDraw()));
    }
}

void MainWindow::reDraw()
{
    scene->update();
    update();
}


