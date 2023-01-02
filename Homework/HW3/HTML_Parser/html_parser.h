#ifndef HTML_PARSER_H
#define HTML_PARSER_H

#include <QMainWindow>
#include <QFileDialog>
#include <QRegularExpression>
#include <QRegularExpressionMatch>
#include <QRegularExpressionMatchIterator>

QT_BEGIN_NAMESPACE
namespace Ui { class HTML_Parser; }
QT_END_NAMESPACE

class HTML_Parser : public QMainWindow
{
    Q_OBJECT

public:
    HTML_Parser(QWidget *parent = nullptr);
    ~HTML_Parser();

private slots:
    void on_pb_get_clicked();

private:
    QStringList getData(const QString &text, const QString &reg_ex);

private:
    Ui::HTML_Parser *ui;
};
#endif // HTML_PARSER_H
