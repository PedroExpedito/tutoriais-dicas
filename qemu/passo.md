# Criando VM

### Instalando qemu
`sudo apt install qemu`
### qual instancia ?
exemplo:

`qemu-system-x86_64`

### Instalando KVM para o qemu
`sudo apt-get install qemu-kvm libvirt-clients libvirt-daemon-system`

criando HD virtual
Sintaxe [qemu-img] = commando, [create] = criar [-f] = force,
[qcow2] = tipo de hd virtual,
[windows10.qcow2] = nome(pode ser qualquer coisa), [50G] = tamanho do hd virtual

`qemu-img create -f qcow2 windows10.qcow2 50G`

### Dando boot

### Sintaxe

[qemu-system-x86_64] = comando para arqueterura de 64 e 32 bits
[-enable-kvm] = habilitar o kvm, [-m 2048] = -m memoria,
[-name] = nome exemplo:'Windows 10'
[-boot d -hda windows10.qcow2] seta o disco virtual para bootar,
[-cdrom] endereço da iso exemplo: ./windows10.iso

`qemu-system-x86_64 -enable-kvm -m 2048 -name 'Windows 10' -boot d -hda windows10.qcow2 -cdrom ./windows10.iso`

### Após instalar o sistema pode "remover" o cdrom e usar apenas:

`qemu-system-x86_64 -enable-kvm -m 2048 -name 'Windows 10' -boot d -hda windows10.qcow2`

Para mais informações `man qemu`


