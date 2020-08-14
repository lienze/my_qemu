#!/bin/bash

debug=''
if [ x$2 == x"debug" ];then
	debug='-S'
fi

if [ x$1 == x"kvm" ];then
	qemu-system-x86_64 \
		$debug \
		-s \
		-kernel ../ubuntu_src/arch/x86/boot/bzImage \
		-initrd rootfs.cpio.gz \
		-nographic \
		-cpu host \
		-enable-kvm \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"5" ];then
	qemu-system-x86_64 \
		$debug \
		-s \
		-kernel ../linux_5.4.52/arch/x86/boot/bzImage \
		-initrd rootfs.cpio.gz \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"trunk" ];then
	qemu-system-x86_64 \
		$debug \
		-s \
		-kernel ../linux_trunk/arch/x86/boot/bzImage \
		-initrd rootfs.cpio.gz \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"debian" ];then
	qemu-system-x86_64 \
		$debug \
		-s \
		-kernel ../debian/arch/x86/boot/bzImage \
		-initrd rootfs.cpio.gz \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"disk" ];then
	qemu-system-x86_64 \
		$debug \
		-s \
		-kernel ../ubuntu_src/arch/x86/boot/bzImage \
		-drive format=raw,file=./disk.raw \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-hdb ./hd \
		-append "console=ttyS0 init=/linuxrc root=/dev/sda rw"
else
	echo "use kvm, 5, trunk para to start..."
fi
