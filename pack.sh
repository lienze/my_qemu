#!/bin/bash
this_dir=`pwd`

function delete_dir()
{
	if [ -d $1 ];then
		rm -rf $1
		echo "delete $1 succeed"
	fi
}

function make_dir()
{
	if [ -d $1 ];then
		rm -rf $1
		echo "delete $1 succeed"
	fi
	mkdir -p $1
}

make_dir ./rootfs/proc
make_dir ./rootfs/sys

make_dir ./rootfs/lib/modules
cp ../debian/drivers/atfs/atfs.ko ./rootfs/lib/modules

cd ./rootfs
make_dir ./dev
sudo cp -a /dev/{null,console,tty,tty1,tty2,tty3,tty4} ./dev
find ./ -print0 | cpio --null -ov --format=newc | gzip -9 > ../rootfs.cpio.gz

