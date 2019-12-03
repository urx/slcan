#!/bin/sh
gdbcfg=gdb.cfg
elf=$PWD/slcan.elf

cat > $gdbcfg << EOF
set prompt (arm-gdb)
set remotetimeout 30
target remote localhost:3333
monitor reset halt
monitor adapter_khz 1000
monitor load_image $elf 0x00 elf
set \$pc = main
EOF

arm-none-eabi-gdb -x $gdbcfg $elf
