#!/bin/bash
$EMULATOR @$AVD_NAME -no-window -noaudio &

OUT=`adb shell getprop init.svc.bootanim`
RES="stopped"
 
while [[ ${OUT:0:7}  != 'stopped' ]]; do
		OUT=`adb shell getprop init.svc.bootanim`
		echo 'Waiting for emulator to fully boot...'
		sleep 1
done
 
echo "Emulator booted!"
