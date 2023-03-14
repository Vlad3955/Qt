#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->frame->setFrameStyle(QFrame::Panel | QFrame::Raised);
    login = "login";
    password = "password";
    ui->lineEdit_2->setEchoMode(QLineEdit::EchoMode::Password);

    effect = new QGraphicsOpacityEffect(this);
    effect->setOpacity(1);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    if (ui->lineEdit->text() == login && ui->lineEdit_2->text() == password)
    {

        ui->frame->setGraphicsEffect(effect);
        effect->setOpacity(0.5);
        effect->setOpacity(0);
        qDebug() << "Yes!";
    }
    else
    {
        QPointF pos = ui->frame->pos().toPointF();
        QPropertyAnimation *anim = new QPropertyAnimation(ui->frame, "geometry");
        anim->setDuration(150);
        anim->setEasingCurve(QEasingCurve::Linear);
        //anim->setKeyValueAt(0.25f, QRect(pos.x() + 5, pos.y(), 320, 200));
        anim->setKeyValueAt(0.25f, QRect(pos.x() + 5, pos.y(), ui->frame->geometry().width(), ui->frame->geometry().height()));
        //anim->setKeyValueAt(0.5f, QRect(pos.x() - 5, pos.y(), 320, 200));
        anim->setKeyValueAt(0.5f, QRect(pos.x() - 5, pos.y(), ui->frame->geometry().width(), ui->frame->geometry().height()));
        anim->setEndValue(QRect(pos.x(), pos.y(), 320, 200));
        anim->start(QPropertyAnimation::DeleteWhenStopped);
        qDebug() << "No!";
    }
}

