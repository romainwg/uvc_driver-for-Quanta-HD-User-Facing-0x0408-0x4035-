#!/bin/bash 

#Test linux distribution and version
source /etc/os-release
if [ "$ID" != "ubuntu" ]; then 
	echo "Sorry, this script works only for Ubuntu distribution"
	exit
fi

if [ "$VERSION_ID" != "22.04" ]; then 
	echo "Sorry, this script works only for Ubuntu 22.04 LTS"
	exit
fi

sudo apt update # update package list
sudp apt upgrade # upgrade packages
sudo apt install build-essential cheese -y # install tools needed for module compilation & cheese for test webcam

#get driver code to compile a patch it
cd ~  # change to your home directory

# from https://github.com/Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-/issues/3#issuecomment-1715009720
wget http://archive.ubuntu.com/ubuntu/pool/main/l/linux-hwe-6.2/linux-hwe-6.2_6.2.0.orig.tar.gz && \
	tar -xzf linux-hwe-6.2_6.2.0.orig.tar.gz
cd ~/linux-*/drivers/media/usb/uvc # change to the currently created uvc directory
mv uvc_driver.c uvc_driver.old  # rename/backup the uvc driver soruce file, that need to be updated
wget https://raw.githubusercontent.com/Giuliano69/uvc_driver-for-Quanta-HD-User-Facing-0x0408-0x4035-/main/uvc_driver.c # download the updated driver source file

#compile and install
make -j4 -C /lib/modules/$(uname -r)/build M=$(pwd) modules  # complie the updated video modules for your kernel version
sudo cp /lib/modules/$(uname -r)/kernel/drivers/media/usb/uvc/uvcvideo.ko ~/linux-*/drivers/media/usb/uvc/uvcvideo.ko.backup # backup
sudo cp uvcvideo.ko /lib/modules/$(uname -r)/kernel/drivers/media/usb/uvc/ # install the video driver module in the system (overwrite the previous one)

# Remove and add uvcvideo module
sudo rmmod uvcvideo && sudo modprobe uvcvideo

# check if it is ok - no need to reboot for me :)
cheese
