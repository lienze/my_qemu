qemu-system-x86_64 -s -kernel ../linux-4.19.108/arch/x86/boot/bzImage \
	-initrd initramfs.cpio.gz \
	-nographic \
	-cpu max \
	-append "console=ttyS0"
