#!/bin/bash
$EMULATOR @$AVD_NAME -no-window -noaudio &

WAIT_CMD="$ANDROID_SDK/platform-tools/adb wait-for-device shell getprop sys.boot_completed"

until $WAIT_CMD | grep -m 1 stopped; do 
  echo "Waiting..."
  sleep 1
done
