#include "text_editor.h"


#include <QApplication>
//#include <QTranslator>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
//    QTranslator translator;
//    translator.load(":/Translators/QtLanguage_ru.qm");
//    //a.installTranslator(&translator);
//    qApp->installTranslator(&translator);
    Text_Editor w;
    w.show();
    return a.exec();
}
