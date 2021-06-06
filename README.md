# mediapipe-bin
MediaPipe Python Wheel installer for RaspberryPi OS aarch64, Ubuntu aarch64 Debian aarch64, L4T/Jetson Nano aarch64.

## 1. Binary type
|Device|OS|Distribution|Architecture|Python ver|Numpy ver|Note|
|:--|:--|:--|:--|:--|:--|:--|
|RaspberryPi3/4|RaspberryPiOS/Debian|Buster|aarch64 / armv8|3.7.3|1.19/1.20|64bit, glibc2.28|
|RaspberryPi3/4|Ubuntu 18.04|Bionic|aarch64 / armv8|3.6.9|1.19|64bit, glibc2.27|
|RaspberryPi3/4|Ubuntu 20.04|Focal|aarch64 / armv8|3.8.2|1.19/1.20|64bit, glibc2.31|
|(Experimental/WIP) Jetson Nano|L4T (Ubuntu 18.04)|32.5.1|aarch64 / armv8|3.6.9|(mandatory) 1.19.4|64bit, glibc2.27, Pose/Holistic/Selfie Segmentation/Multi Hand Tracking only,OpenGL ES3.2|
|(Experimental) RaspberryPi3/4|Debian|Bullseye|aarch64 / armv8|3.9.2|1.20|64bit, glibc2.31, gcc-8.5|
|RaspberryPi3/4|Ubuntu 21.04|Hirsute|aarch64 / armv8|3.9.5|1.20|64bit, glibc2.33, gcc-7.5|

## 2. Install
```bash
### RaspberryPi OS 64bit Buster
$ sudo apt update && \
  sudo apt install -y python3-dev protobuf-compiler python3-pip git make libssl-dev
$ sudo pip3 install pip --upgrade
$ git clone https://github.com/PINTO0309/mediapipe-bin && cd mediapipe-bin
$ ./v0.8.4/numpy120x/mediapipe-0.8-cp37-none-linux_aarch64_numpy120x_download.sh
$ sudo pip3 install \
cmake-3.20.2-cp37-none-linux_aarch64.whl \
numpy-1.20.3-cp37-none-linux_aarch64.whl \
opencv_contrib_python-4.5.2.52-cp37-none-linux_aarch64.whl \
mediapipe-0.8-cp37-none-linux_aarch64.whl
$ sudo pip3 install opencv-python

### Ubuntu 20.04 aarch64
$ sudo apt update && \
  sudo apt install -y python3-dev protobuf-compiler python3-pip git make libssl-dev
$ sudo pip3 install pip --upgrade
$ git clone https://github.com/PINTO0309/mediapipe-bin && cd mediapipe-bin
$ ./v0.8.4/numpy120x/mediapipe-0.8-cp38-none-linux_aarch64_numpy120x_download.sh
$ sudo pip3 install \
opencv_contrib_python-4.5.2.52-cp38-none-linux_aarch64.whl \
mediapipe-0.8-cp38-none-linux_aarch64.whl
$ sudo pip3 install opencv-python

### Jetson Nano L4T 32.5.1 aarch64
$ sudo apt update && \
  sudo apt install -y python3-dev protobuf-compiler python3-pip git make libssl-dev
$ sudo pip3 install pip --upgrade
$ git clone https://github.com/PINTO0309/mediapipe-bin && cd mediapipe-bin
$ ./v0.8.5/numpy119x/mediapipe-0.8.5_cuda102-cp36-cp36m-linux_aarch64_numpy119x_jetsonnano_L4T32.5.1_download.sh
$ sudo pip3 install \
numpy-1.19.4-cp36-none-manylinux2014_aarch64.whl \
opencv_contrib_python-4.5.2.52-cp36-none-linux_aarch64.whl \
mediapipe-0.8.5_cuda102-cp36-none-linux_aarch64.whl
$ sudo pip3 install opencv-python
```
## 3. Sample
### 3-1. RaspberryPi4 + RaspberryPi OS 64bit (aarch64) + Python3.7 + CPU only (9.0FPS)
```bash
$ cd ~
$ git clone https://github.com/Kazuhito00/mediapipe-python-sample && cd mediapipe-python-sample
$ python3 sample_hand.py
```
![ezgif com-gif-maker (7)](https://user-images.githubusercontent.com/33194443/120130242-a4774300-c200-11eb-8a74-d7f74384a4eb.gif)
### 3-2. Jetson Nano + L4T 32.5.1 64bit (aarch64) + Python3.6 + GPU (22.0FPS)
```bash
$ cd ~
$ git clone https://github.com/Kazuhito00/mediapipe-python-sample && cd mediapipe-python-sample
$ python3 sample_hand.py
```
![ezgif com-gif-maker (15)](https://user-images.githubusercontent.com/33194443/120900199-76fe1f80-c66e-11eb-9b06-812b38b7600a.gif)

## 4. Build
```bash
$ sudo apt update && \
  sudo apt install -y \
  python3-dev cmake protobuf-compiler \
  python3-pip git make openjdk-11-jdk-headless

$ sudo pip3 install pip setuptools --upgrade

$ git clone -b v0.8.4 https://github.com/google/mediapipe && cd mediapipe

$ sed -i -e "/\"imgcodecs\"/d;/\"calib3d\"/d;/\"features2d\"/d;/\"highgui\"/d;/\"video\"/d;/\"videoio\"/d" third_party/BUILD
$ sed -i -e "/-ljpeg/d;/-lpng/d;/-ltiff/d;/-lImath/d;/-lIlmImf/d;/-lHalf/d;/-lIex/d;/-lIlmThread/d;/-lrt/d;/-ldc1394/d;/-lavcodec/d;/-lavformat/d;/-lavutil/d;/-lswscale/d;/-lavresample/d" third_party/BUILD

$ sed -i -e "/^        # Optimization flags/i \        \"ENABLE_NEON\": \"OFF\"," third_party/BUILD
$ sed -i -e "/^        # Optimization flags/i \        \"WITH_TENGINE\": \"OFF\"," third_party/BUILD

$ wget https://github.com/PINTO0309/Bazel_bin/raw/main/3.7.2/aarch64/install.sh
$ sudo chmod +x install.sh
$ ./install.sh

$ sudo python3 setup.py gen_protos
$ sudo bazel clean --expunge
$ sudo python3 setup.py bdist_wheel
```

## 5. Reference
1. I was inspired by **[jiuqiant's](https://github.com/jiuqiant/mediapipe_python_aarch64)** **[mediapipe_python_aarch64](https://github.com/jiuqiant/mediapipe_python_aarch64)** to create this repository. Thank you so much! 🌠
2. Article: **[How to enjoy MediaPipe easily with Raspberry Pi - karaage0703 - Zenn](https://zenn.dev/karaage0703/articles/63fed2a261096d)** 🌟
3. Sample: **[mediapipe-python-sample - Kazuhito00 - GitHub](https://github.com/Kazuhito00/mediapipe-python-sample)** 🌟
4. OS Image: **https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2021-05-28/**
