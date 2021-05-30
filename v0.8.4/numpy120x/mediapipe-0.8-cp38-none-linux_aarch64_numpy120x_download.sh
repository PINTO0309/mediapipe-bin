#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1TH5Bg0DL0Avlf1N_VKaarf9LujMwaRWG" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1TH5Bg0DL0Avlf1N_VKaarf9LujMwaRWG" -o mediapipe-0.8-cp38-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1u49TaAetEvRGIdZfyIKW7iPCBgHCM1jN" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1u49TaAetEvRGIdZfyIKW7iPCBgHCM1jN" -o opencv_contrib_python-4.5.2.52-cp38-none-linux_aarch64.whl

echo Download finished.
