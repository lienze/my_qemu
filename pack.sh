#!/bin/sh
find ./initramfs -print0 | cpio --null -ov --format=newc | gzip -9 > ./rootfs.cpio.gz

