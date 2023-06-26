cat /usr/src/rpi4_kernel_build.sh
#!/bin/bash

KERNEL=kernel8

cd linux

make -j 4 bcm2711_defconfig && make prepare && make oldconfig && make menuconfig && make -j 4
make -j 4 modules dtbs
make modules_install

cp -v arch/arm64/boot/Image /boot/kernel8.img
cp -v arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb /boot/
cp arch/arm64/boot/dts/broadcom/*.dtb /boot/
cp arch/arm64/boot/dts/overlays/*.dtb* /boot/overlays/
cp arch/arm64/boot/dts/overlays/README /boot/overlays/
