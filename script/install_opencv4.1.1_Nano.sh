echo "** Remove OpenCV3.3 first"
sudo sudo apt-get purge *libopencv*

echo "** Install requirement"
sudo apt-get update
sudo apt-get install -y build-essential cmake git libgtk2.0-dev libcanberra-gtk-module pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python2.7-dev python3.6-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y curl

# May not find
sudo apt-get install -y libjasper-dev

sudo apt-get update

echo "** Download opencv-4.1.1"
cd /opt/OpenCV
curl -L https://github.com/opencv/opencv/archive/4.1.1.zip -o opencv-4.1.1.zip
curl -L https://github.com/opencv/opencv_contrib/archive/4.1.1.zip -o opencv_contrib-4.1.1.zip
unzip opencv-4.1.1.zip 
unzip opencv_contrib-4.1.1.zip 
cd opencv-4.1.1/

echo "** Building..."
mkdir build
cd build/
cmake -D WITH_CUDA=ON -D CUDA_ARCH_BIN="7.5" -D CUDA_ARCH_PTX="" -D BUILD_opencv_world=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.1/modules -D BUILD_PROTOBUF=ON -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j3
sudo make install

echo "** Install opencv-4.0.0 successfully"
echo "** Bye :)"
