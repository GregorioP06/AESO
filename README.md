# UniPi Informatica - Architettura e Sistemi Operativi 26/27

## Setup

> [!NOTE]  
> Setup per EndeavourOS/Arch Linux

```
sudo pacman -S distrobox podman

distrobox create -i ubuntu:26.04 -n arm-env
distrobox enter arm-env

sudo apt update && sudo apt install gcc-arm-linux-gnueabihf qemu-user gdb-multiarch
```

## Uso

```
# Entra nell'ambiente Ubuntu
distrobox enter arm-env

# Compilazione
arm-linux-gnueabihf-gcc -static -ggdb3 -o test test.s

# Esecuzione
qemu-arm ./test

# Debugging
./armdebug ./test

# Esci dall'ambiente Ubuntu
exit
```