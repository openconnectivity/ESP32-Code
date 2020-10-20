#!/bin/bash
CURPWD=`pwd`
PROJNAME=${PWD##*/}

cp -f ${EXAMPLEPATH}/Arduino-Code/IoTivity-lite/due-example/devbuildmake ${CURPWD}/devbuildmake
cp -f ${EXAMPLEPATH}/Arduino-Code/IoTivity-lite/due-example/due-example-config.json ${CURPWD}/${PROJNAME}-config.json
cp ${EXAMPLEPATH}/Arduino-Code/arduino/due-example/due-example.json ${CURPWD}/${PROJNAME}.json
cp ${EXAMPLEPATH}/Arduino-Code/IoTivity-lite/due-example/due-example.c ${CURPWD}/src/${PROJNAME}.c
cp ${EXAMPLEPATH}/Arduino-Code/IoTivity-lite/due-example/due-example-gen.c ${CURPWD}/src/${PROJNAME}-old.c
cp ${EXAMPLEPATH}/Arduino-Code/IoTivity-lite/due-example/due-example-main.cpp ${CURPWD}/src/${PROJNAME}-main.cpp
