# mediapipe-bin
MediaPipe Python Wheel installer for RaspberryPi OS aarch64, Ubuntu aarch64 and Debian aarch64.

## 1. Binary type
|Device|OS|Distribution|Architecture|Python ver|Numpy ver|Note|
|:--|:--|:--|:--|:--|:--|:--|
|RaspberryPi3/4|RaspberryPiOS/Debian|Buster|aarch64 / armv8|3.7.3|1.19/1.20|64bit, glibc2.28|
|RaspberryPi3/4|Ubuntu 18.04|Bionic|aarch64 / armv8|3.6.9|1.19|64bit, glibc2.27|
|RaspberryPi3/4|Ubuntu 20.04|Focal|aarch64 / armv8|3.8.2|1.19/1.20|64bit, glibc2.31|

## 2. Install
```bash
### RaspberryPi OS 64bit Buster
$ sudo apt update && \
  sudo apt install -y python3-dev protobuf-compiler python3-pip git make libssl-dev
$ sudo pip3 install pip --upgrade
$ ./v0.8.4/numpy120x/mediapipe-0.8-cp37-none-linux_aarch64_numpy120x_download.sh
$ sudo pip3 install *.whl
$ sudo pip3 install opencv-python

### Ubuntu 20.04 aarch64
$ sudo apt update && \
  sudo apt install -y python3-dev protobuf-compiler python3-pip git make libssl-dev
$ sudo pip3 install pip --upgrade
$ ./v0.8.4/numpy120x/mediapipe-0.8-cp38-none-linux_aarch64_numpy120x_download.sh
$ sudo pip3 install *.whl
$ sudo pip3 install opencv-python
```

## 3. Build
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

## 4. Reference
1. I was inspired by **[jiuqiant's](https://github.com/jiuqiant/mediapipe_python_aarch64)** **[mediapipe_python_aarch64](https://github.com/jiuqiant/mediapipe_python_aarch64)** to create this repository. Thank you so much!
2. **[How to enjoy MediaPipe easily with Raspberry Pi - karaage0703 - Zenn](https://zenn.dev/karaage0703/articles/63fed2a261096d)**
