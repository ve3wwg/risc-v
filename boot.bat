@REM boot.bat For Windows launch of QEMU

@REM Ajust PATH if necessary if your qemu software is installed
@REM somewhere else

@REM Adjust the *.elf and *.raw file name references if your
@REM image files are located somewhere other than \riscv,
@REM or they have different file names.

PATH="C:\Program Files\qemu:%PATH%"

cd C:\Program Files\qemu
qemu-system-riscv64 -nographic -machine virt -smp 2 -m 2G ^
 -kernel \riscv\Fedora-Developer-Rawhide-20200108.n.0-fw_payload-uboot-qemu-virt-smode.elf ^
 -bios none ^
 -device virtio-blk-device,drive=hd0 ^
 -drive file=\riscv\Fedora-Developer-Rawhide-20200108.n.0-sda.raw,format=raw,id=hd0 ^
 -device virtio-net-device,netdev=usernet ^
 -netdev user,id=usernet,hostfwd=tcp::10000-:22

@REM end boot.bat
