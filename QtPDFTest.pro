#-------------------------------------------------
#
# Project created by QtCreator 2018-01-09T16:54:11
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QtPDFTest
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        widget.cpp \

HEADERS += \
        widget.h \

FORMS += \
        widget.ui

#mupdf include file

INCLUDEPATH += $$PWD/mupdf/include/

#llibmupdf

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/mupdf/lib/release/ -llibmupdf
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/mupdf/lib/debug/ -llibmupdf

INCLUDEPATH += $$PWD/mupdf/lib/debug
DEPENDPATH += $$PWD/mupdf/lib/debug

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/release/liblibmupdf.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/debug/liblibmupdf.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/release/libmupdf.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/debug/libmupdf.lib

#llibthirdparty

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/mupdf/lib/release/ -llibthirdparty
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/mupdf/lib/debug/ -llibthirdparty

INCLUDEPATH += $$PWD/mupdf/lib/debug
DEPENDPATH += $$PWD/mupdf/lib/debug

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/release/liblibthirdparty.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/debug/liblibthirdparty.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/release/libthirdparty.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/debug/libthirdparty.lib

#llibresources

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/mupdf/lib/release/ -llibresources
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/mupdf/lib/debug/ -llibresources

INCLUDEPATH += $$PWD/mupdf/lib/debug
DEPENDPATH += $$PWD/mupdf/lib/debug

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/release/liblibresources.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/debug/liblibresources.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/release/libresources.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/mupdf/lib/debug/libresources.lib
