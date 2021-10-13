#!/bin/bash
CURPWD=`pwd`
PROJNAME=${PWD##*/}

cp -f ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/vscode-esp32-example-config.json ${CURPWD}/${PROJNAME}-config.json
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/CMakeLists.txt ${CURPWD}/CMakeLists.txt
MY_COMMAND="sed -i 's/vscode-esp32-example/${PROJNAME}/g' ${CURPWD}/CMakeLists.txt"
eval ${MY_COMMAND}
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/partitions.csv ${CURPWD}/partitions.csv
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/sdkconfig ${CURPWD}/sdkconfig
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/main/vscode-esp32-example.c ${CURPWD}/main/${PROJNAME}.c
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/main/main.c ${CURPWD}/main/main.c
MY_COMMAND="sed -i 's/vscode-esp32-example/${PROJNAME}/g' ${CURPWD}/main/main.c"
eval ${MY_COMMAND}
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/main/pki_certs.h ${CURPWD}/main/pki_certs.h
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/main/CMakeLists.txt ${CURPWD}/main/CMakeLists.txt
cp ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/main/Kconfig.projbuild ${CURPWD}/main/Kconfig.projbuild
cp -r ${EXAMPLEPATH}/ESP32-Code/IoTivity-lite/vscode-esp32-example/.vscode ${CURPWD}
