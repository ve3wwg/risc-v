#!/bin/bash

exec /usr/local/bin/qemu-system-riscv64 \
   -nographic \
   -machine virt \
   -smp 4 \
   -m 2G \
   -kernel Fedora-Minimal-Rawhide-20200108.n.0-fw_payload-uboot-qemu-virt-smode.elf \
   -bios none \
   -object rng-random,filename=/dev/urandom,id=rng0 \
   -device virtio-rng-device,rng=rng0 \
   -device virtio-blk-device,drive=hd0 \
   -drive file=Fedora-Minimal-Rawhide-20200108.n.0-sda.raw,format=raw,id=hd0 \
   -device virtio-net-device,netdev=usernet \
   -netdev user,id=usernet,hostfwd=tcp::10000-:22
