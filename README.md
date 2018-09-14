# 2011 Mac Book Pro GPU Disable
This script disables the GPU on 15 inch 2011 macbook pros. 

# Guide

1) Create an Arch linux USB and put this script on it
2) While booting add `nomodeset` to the kernel params
3) Run the script
4) Reboot into safemode
5) Remove R8911 on the 15″ MBP (It's a 1 ohm resistor) 
6) Solder a jumper wire between PIN 2 of R9704 and PIN 1 of C9711 (needed for high serria)

Note: Do not do an NVRAM reset, it disables the fix.
