
TEMPLATE = app

QT -= gui
QT -= core

QMAKE_CXXFLAGS += /std:c++latest

INCLUDEPATH += $$PWD/StaticOpenCV/include

CONFIG(debug,debug|release){
     QMAKE_CFLAGS_DEBUG += -MTd
     QMAKE_CXXFLAGS_DEBUG += -MTd
     LIBS += -L$$PWD/StaticOpenCV/staticlib -lopencv_core411d
     LIBS += -L$$PWD/StaticOpenCV/staticlib -lopencv_imgcodecs411d
     LIBS += -L$$PWD/StaticOpenCV/staticlib -lopencv_imgproc411d
}else{
    DEFINES *= NDEBUG
     QMAKE_CFLAGS_RELEASE += -MT
     QMAKE_CXXFLAGS_RELEASE += -MT
}

CONFIG(debug,debug|release){
    TARGET = rimage_debug
}else{
    TARGET = rimage
}

SOURCES += $$PWD/main.cpp

