QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    choise.cpp \
    comp_table.cpp \
    languages_list.cpp \
    main.cpp \
    insert_spec_char.cpp

HEADERS += \
    choise.h \
    comp_table.h \
    insert_spec_char.h \
    languages_list.h

FORMS += \
    choise.ui \
    comp_table.ui \
    insert_spec_char.ui \
    languages_list.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    Resources.qrc
