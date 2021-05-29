#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1r_xtx2C7xO5JbrgKispXNGqDq0BqRs5W" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1r_xtx2C7xO5JbrgKispXNGqDq0BqRs5W" -o mediapipe-0.8-cp38-none-linux_aarch64.whl
echo Download finished.
