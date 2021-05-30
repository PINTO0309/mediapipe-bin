#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1INJaP0aTqGKgqT7sY-OkxSpMme8CLBUP" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1INJaP0aTqGKgqT7sY-OkxSpMme8CLBUP" -o mediapipe-0.8-cp36-none-linux_aarch64.whl
echo Download finished.
