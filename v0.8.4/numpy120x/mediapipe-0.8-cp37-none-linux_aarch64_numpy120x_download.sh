#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1s7R57n2klUsdC0MfbA0FwrzF1JJV0FQG" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1s7R57n2klUsdC0MfbA0FwrzF1JJV0FQG" -o mediapipe-0.8-cp37-none-linux_aarch64.whl
echo Download finished.
