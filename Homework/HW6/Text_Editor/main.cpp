#include "text_editor.h"


#include <QApplication>
//#include <QTranslator>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Text_Editor w;
    w.show();
    return a.exec();
}
