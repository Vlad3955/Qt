#ifndef BLOCKSCHEME_H
#define BLOCKSCHEME_H


#include <QObject>
#include <QGraphicsItem>
#include <QContextMenuEvent>
#include <QBrush>
#include <QPainter>
#include <QGraphicsSceneMouseEvent>



class BlockScheme : public QObject, public QGraphicsItem
{
    Q_OBJECT
    Q_INTERFACES(QGraphicsItem)
public:
    explicit BlockScheme(QObject *parent = nullptr);
    void setBrush(QBrush brush) {this->brush = brush; emit reDraw();}

signals:
    void reDraw();

private:
   void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget
*widget) override;
   QRectF boundingRect() const override;
   void Geo();

private:
   enum Geometry {RECTANGLE, ELLIPS, STAR};
   int x, y;
   Geometry geometry;
   QPoint bpoint;
   bool moving;
   QBrush brush;
   static int geo;

protected:
   void mousePressEvent(QGraphicsSceneMouseEvent *event) override;
   void mouseReleaseEvent(QGraphicsSceneMouseEvent *event) override;
   void mouseMoveEvent(QGraphicsSceneMouseEvent *event) override;

};

#endif // BLOCKSCHEME_H
