# STM32F105RCT6 slcan


## Building

 - git clone https://github.com/urx/slcan --recursive
 - make

## Openocd

 - 2can2lin.cfg - board config for openocd. use 'openocd -f ./2can2lin.cfg'
 - start_gdb.sh - starts gdb and loads slcan.elf
