#!/bin/bash
if [ x$1 == x"kvm" ];then
	qemu-system-x86_64 \
		-s \
		-kernel ../linux_5.4.52/arch/x86/boot/bzImage \
		-initrd initramfs.cpio.gz \
		-nographic \
		-cpu host \
		-enable-kvm \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"5" ];then
	qemu-system-x86_64 \
		-s \
		-kernel ../linux_5.4.52/arch/x86/boot/bzImage \
		-initrd initramfs.cpio.gz \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
elif [ x$1 == x"trunk" ];then
	qemu-system-x86_64 \
		-s \
		-kernel ../linux_trunk/arch/x86/boot/bzImage \
		-initrd initramfs.cpio.gz \
		-nographic \
		-cpu max \
		-smp 2 \
		-m 2048 \
		-append "console=ttyS0"
else
	echo "use kvm, 5, trunk para to start..."
fi
