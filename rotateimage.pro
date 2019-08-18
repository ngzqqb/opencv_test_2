
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
#opencv_core411d.lib
#opencv_imgcodecs411d.lib
#opencv_imgproc411d.lib
#zlibd.lib
#libpngd.lib
#libjpeg-turbod.lib
#libtiffd.lib
#quircd.lib
#IlmImfd.lib
#libwebpd.lib
}else{
    DEFINES *= NDEBUG
     QMAKE_CFLAGS_RELEASE += -MT
     QMAKE_CXXFLAGS_RELEASE += -MT
#opencv_core411.lib
#opencv_imgcodecs411.lib
#opencv_imgproc411.lib
#zlib.lib
#libpng.lib
#libjpeg-turbo.lib
#libtiff.lib
#quirc.lib
#IlmImf.lib
#libwebp.lib
}

CONFIG(debug,debug|release){
    TARGET = rimage_debug
}else{
    TARGET = rimage
}

SOURCES += $$PWD/main.cpp

SOURCES += $$PWD/ImageTool.cpp
HEADERS += $$PWD/ImageTool.hpp

