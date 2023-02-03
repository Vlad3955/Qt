#include "blockscheme.h"



BlockScheme::BlockScheme(QObject *parent)
    : QObject{parent}
{
    x = 0;
    y = 0;
    brush.setColor(QColor(rand() % 256, rand() % 256, rand() % 256));
    brush.setStyle(Qt::BrushStyle::SolidPattern);

    Geo();

    setPos(0,0);
    moving = false;
}



void BlockScheme::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(brush);
    if (geometry == Geometry::ELLIPS) painter->drawEllipse(x, y, 200, 100);
    if (geometry == Geometry::RECTANGLE) painter->drawRect(x, y, 200, 100);
    Q_UNUSED(option)
    Q_UNUSED(widget)
}

QRectF BlockScheme::boundingRect() const
{
    return QRectF(x, y, 200, 100);
}

void BlockScheme::Geo()
{
    switch (geo) {
    case 1:
        geometry = Geometry::ELLIPS;
        break;
    case 2:
        geometry = Geometry::RECTANGLE;
        break;
    default:
        break;
    }


    if (geo == 2)
    {
        geo = 1;
    }
    else if (geo == 1)
    {
        geo = 2;
    }
}

void BlockScheme::mousePressEvent(QGraphicsSceneMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        moving = true;
        bpoint = event->pos().toPoint();

    }
    if (event->button() == Qt::RightButton)
    {
       delete this;
    }
}

void BlockScheme::mouseReleaseEvent(QGraphicsSceneMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        moving = false;
        emit reDraw();
    }
}

void BlockScheme::mouseMoveEvent(QGraphicsSceneMouseEvent *event)
{
    if (moving)
    {
        QPoint p = event->pos().toPoint() - bpoint;
        x += p.x();
        y += p.y();
        bpoint = event->pos().toPoint();
        emit reDraw(); // Переотрисовываем
    }
}

void BlockScheme::mouseDoubleClickEvent(QGraphicsSceneMouseEvent *event)
{
    if (event->button() == Qt::LeftButton)
    {
        emit dblClick();
    }
}

int BlockScheme::geo = 1;
