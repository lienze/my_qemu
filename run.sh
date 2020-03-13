#!/bin/bash
if [ x$1 == x"kvm" ];then
	qemu-system-x86_64 \
		-s \
		-kernel ../linux-4.19.108/arch/x86/boot/bzImage \
		-initrd initramfs.cpio.gz \
		-nographic \
		-cpu host \
		-enable-kvm \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"4" ];then
	qemu-system-x86_64 \
		-s \
		-kernel ../linux-4.19.108/arch/x86/boot/bzImage \
		-initrd initramfs.cpio.gz \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
else
	echo "Hello World"
fi
