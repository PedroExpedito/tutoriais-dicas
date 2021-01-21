## Criando uma pen drive com Debian

### Objetivo

O intuito é usar um pen drive para portar um sistema minimo que seja possivel
executar na maioria dos dos computadores

Preparando pen drive:

Como meu pen drive é usb faço `lsusb` para verificar se está realmente plugado
e reconhecido pelo kernel.

**saida:**

`Bus 001 Device 003: ID 0781:5567 SanDisk Corp. Cruzer Blade`

Agora precisa indenficar qual o dispositivo em /dev/s??

`dmesg |grep removable`

entre parentes vai aparecer algo como sdd sde etc. Você pode confirmar pela
capacidade de armazém aneto

## Criando partição com fdisk

`fdisk /dev/sdd`

Criar partição:

1 = 2M bios TIPO FAT16 HEXCODE 4
2 = 256 UEFI
3 = swap ??? talvez
4 = /

No meu caso não criei swap pen drive muito pequeno 16gb apenas

Formatar partição:

mkfs.fat -F 32 /dev/sdd1
mkfs.fat -F 32 /dev/sdd2

O barra pode ser outros filesystem

mkfs.ext4 /dev/sdd3

#### Baixando Debian com debootstrap


Antes vamos montar para evitar ter que copiar depois:

`mount /dev/sdd3 /mnt/debian`

`debootstrap stable /mnt/debian http://deb.debian.org/debian/`

Bem com isso vai ser feito o download do sistema base do debian.

#### chroot

`mount --types proc /proc /mnt/debian/proc`

`mount --rbind /sys /mnt/debian/sys`

`mount --make-rslave /mnt/debian/sys`

`mount --rbind /dev /mnt/debian/dev`

`mount --make-rslave /mnt/debian/dev`

### Configurar fstab

precisamos do blkid de cada particação então é só fazer
`blkid`

no meu caso ficou apenas uma linha

`UUID=b6b8e9ac-ae1c-4d44-9a11-017b13efdf97       /        ext4           noatime     0 1`

No caso do Debian chrootado é apenas instalar o kernel e o grub2 com o apt

### Desmontando

`umount -l /mnt/debian/dev{/shm,/pts,}`
`umount -R /mnt/debian/`

Já é suficiente para bootar em BIOS
