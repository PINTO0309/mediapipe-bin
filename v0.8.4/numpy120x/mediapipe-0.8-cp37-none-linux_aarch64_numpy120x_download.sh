#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1s7R57n2klUsdC0MfbA0FwrzF1JJV0FQG" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1s7R57n2klUsdC0MfbA0FwrzF1JJV0FQG" -o mediapipe-0.8-cp37-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1FlazQNEAFn_jxiPIoK9XyrFHrVGwbSuw" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1FlazQNEAFn_jxiPIoK9XyrFHrVGwbSuw" -o cmake-3.20.2-cp37-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1n7WMghkR8149djGMDXEQrvZYKJ1srBqO" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1n7WMghkR8149djGMDXEQrvZYKJ1srBqO" -o numpy-1.20.3-cp37-none-linux_aarch64.whl

# curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1qrAtG7FB3SFUKzll817d4P_tuzSQCItE" > /dev/null
# CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
# curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1qrAtG7FB3SFUKzll817d4P_tuzSQCItE" -o opencv_contrib_python-4.5.2.52-cp37-none-linux_aarch64.whl

echo Download finished.
