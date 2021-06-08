#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=15JN3sYMuKsV1AVmNHRFlN5pQ1LVh8MVa" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=15JN3sYMuKsV1AVmNHRFlN5pQ1LVh8MVa" -o numpy-1.19.4-cp36-none-manylinux2014_aarch64.whl

# curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1M7LdJjHZoz648KnZreKZawRmWK3UD3ib" > /dev/null
# CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
# curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1M7LdJjHZoz648KnZreKZawRmWK3UD3ib" -o opencv_contrib_python-4.5.2.52-cp36-none-linux_aarch64.whl

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1ZNh4omIMQwS8RFc8289Yk29cNRNCkkdZ" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1ZNh4omIMQwS8RFc8289Yk29cNRNCkkdZ" -o mediapipe-0.8.4_cuda102-cp36-none-linux_aarch64.whl

echo Download finished.
