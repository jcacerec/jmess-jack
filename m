#!/bin/bash
#####################################
APP_NAME=jmess
######################################
## Created by Juan-Pablo Caceres

#Cleanup
rm -r obj
rm -r moc
rm $APP_NAME.pro
rm Makefile
rm $APP_NAME
echo "Makefile deleted"

#Create project (.pro) file
qmake-qt4 -project -o $APP_NAME.pro

echo "qmake-qt4 .pro built."

#Create Makefile
qmake-qt4 -makefile -unix -o Makefile \
"QMAKE_CXXFLAGS+=-Wno-deprecated -pg -g" \
"OBJECTS_DIR=obj" "MOC_DIR=moc" \
"QT+=xml" \
"unix:LIBS+=-Xlinker -ljack -lpthread -lrt" \
"unix:TARGET=$APP_NAME" \
"unix:target.path=/usr/bin" \
"unix:INSTALLS+=target" $APP_NAME.pro

echo "done"
