#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1EkgKpqtw35W3g2BHefRi9mAutn2z8ycf" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1EkgKpqtw35W3g2BHefRi9mAutn2z8ycf" -o mediapipe-0.8-cp37-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1E8F48-IWjpZyWAe3fb1axUhXXHoXK_Da" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1E8F48-IWjpZyWAe3fb1axUhXXHoXK_Da" -o cmake-3.20.2-cp37-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1QooeLQWaZvGg5EQ8lg0iOSvbKNNKgx-b" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1QooeLQWaZvGg5EQ8lg0iOSvbKNNKgx-b" -o numpy-1.19.3-cp37-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1alYSAFdcFvo0BE1BRNAa3S6FCoRuIe42" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1alYSAFdcFvo0BE1BRNAa3S6FCoRuIe42" -o opencv_contrib_python-4.5.2.52-cp37-none-linux_aarch64.whl

echo Download finished.
