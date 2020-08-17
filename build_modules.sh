#!/bin/bash
this_dir=`pwd`

sudo mount -o loop ./disk.raw ./img
cd ../kernel_src/
sudo make modules_install INSTALL_MOD_PATH=../my_qemu/img/

