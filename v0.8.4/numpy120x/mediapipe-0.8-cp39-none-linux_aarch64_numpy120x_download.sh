#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1kd1P4E2nEfkXj0zNJY9zqGf8fzEv-dCO" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1kd1P4E2nEfkXj0zNJY9zqGf8fzEv-dCO" -o mediapipe-0.8-cp39-none-linux_aarch64.whl

#curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1u49TaAetEvRGIdZfyIKW7iPCBgHCM1jN" > /dev/null
#CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
#curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1u49TaAetEvRGIdZfyIKW7iPCBgHCM1jN" -o opencv_contrib_python-4.5.2.52-cp39-none-linux_aarch64.whl

echo Download finished.
