#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1EY6Lwo-Tnpam0_kHqR1jr2RDVldo3fGh" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1EY6Lwo-Tnpam0_kHqR1jr2RDVldo3fGh" -o mediapipe-0.8-cp39-none-linux_aarch64.whl

# curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1-ljSN7qFhfLz358pX_d4TjuHlVPJk8F2" > /dev/null
# CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
# curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1-ljSN7qFhfLz358pX_d4TjuHlVPJk8F2" -o opencv_contrib_python-4.5.2.52-cp39-none-linux_aarch64.whl

echo Download finished.
