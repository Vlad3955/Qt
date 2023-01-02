#include "html_parser.h"

#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    HTML_Parser w;
    w.show();
    return a.exec();
}
