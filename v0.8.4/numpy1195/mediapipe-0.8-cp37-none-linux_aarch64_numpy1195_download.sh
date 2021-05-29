#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1EkgKpqtw35W3g2BHefRi9mAutn2z8ycf" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1EkgKpqtw35W3g2BHefRi9mAutn2z8ycf" -o mediapipe-0.8-cp37-none-linux_aarch64.whl
echo Download finished.
