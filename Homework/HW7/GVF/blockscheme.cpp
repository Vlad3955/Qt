#include "blockscheme.h"



BlockScheme::BlockScheme(QObject *parent)
    : QObject{parent}
{
    x = 0;
    y = 0;
    brush.setColor(QColor(rand() % 256, rand() % 256, rand() % 256));
    brush.setStyle(Qt::BrushStyle::SolidPattern);

    Geo();
    ++geo;
    setPos(0,0);
    moving = false;
}



void BlockScheme::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter->setBrush(brush);
    if (geometry == Geometry::ELLIPS) painter->drawEllipse(x, y, 250, 190);
    if (geometry == Geometry::RECTANGLE) painter->drawRect(x, y, 250, 190);
    QPolygon poly;
    poly << QPoint(x, y+85) << QPoint(x+75, y+75)
         << QPoint(x+100, y+10) << QPoint(x+125, y+75)
         << QPoint(x+200, y+85) << QPoint(x+150, y+125)
         << QPoint(x+160, y+190) << QPoint(x+100, y+150)
         << QPoint(x+40, y+190) << QPoint(x+50, y+125)
         << QPoint(x, y+85);
    QPainterPath path;
    path.addPolygon(poly);
    if (geometry == Geometry::STAR) painter->fillPath(path, brush); //painter->drawPolygon(poly);


    Q_UNUSED(option)
    Q_UNUSED(widget)
}

QRectF BlockScheme::boundingRect() const
{
    return QRectF(x, y, 250, 190);
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
    case 3:
        geometry = Geometry::STAR;
        break;
    default:
        break;
    }


    if (geo == 3)
    {
        geo = 0;
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

int BlockScheme::geo = 1;
