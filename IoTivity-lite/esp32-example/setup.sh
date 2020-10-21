#!/bin/bash
CURPWD=`pwd`
PROJNAME=${PWD##*/}

cp -f ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/esp32-example/devbuildmake ${CURPWD}/devbuildmake
cp -f ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/esp32-example/esp32-example-config.json ${CURPWD}/${PROJNAME}-config.json
cp ${EXAMPLEPATH}/ESP32-Code/esp32/esp32-example/esp32-example.json ${CURPWD}/${PROJNAME}.json
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/esp32-example/esp32-example.c ${CURPWD}/src/${PROJNAME}.c
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/esp32-example/esp32-example-main.c ${CURPWD}/src/${PROJNAME}-main.c
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/esp32-example/pki_certs.h ${CURPWD}/src/pki_certs.h
