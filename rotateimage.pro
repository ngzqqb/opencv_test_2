
TEMPLATE = app

CONFIG += c++17

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



