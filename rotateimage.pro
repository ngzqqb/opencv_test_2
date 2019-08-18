
TEMPLATE = app

QT -= gui
QT -= core

QMAKE_CXXFLAGS += /std:c++latest

INCLUDEPATH += $$PWD/StaticOpenCV/include

CONFIG(debug,debug|release){
     LIBS += -L$$PWD/StaticOpenCV/staticlib -lopencv_core411d
     LIBS += -L$$PWD/StaticOpenCV/staticlib -lopencv_imgcodecs411d
     LIBS += -L$$PWD/StaticOpenCV/staticlib -lopencv_imgproc411d.lib
}else{
    DEFINES *= NDEBUG
}

CONFIG(debug,debug|release){
    TARGET = rimage_debug
}else{
    TARGET = rimage
}

SOURCES += $$PWD/main.cpp

