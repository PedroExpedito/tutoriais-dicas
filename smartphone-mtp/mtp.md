# Protocolo MTP (Media Transfer Protocol)

O protocolo MTP pode ser utilizado na maioria dos
smartphones.

Muitas distribuições Gnu/Linux mainstream ao plugar seu Smartphone todo o
processo é feito automaticamente.  Porém se tu montou sua distribuição pacote
por pacote ou está em alguma sem suporte por padrão vamos a dica.

1 - Vamos instalar os pacotes necessários no caso do Debian.

```sudo apt-get install jmtpfs mtp-tools```

2 - Executar

```mtp-detect```

Nesse momento muito provavelmente vai aparecer na tela do seu
smartphone para tu permitir o acesso.

2 - Criar pasta para montar os dados, pode ser em qualquer lugar com qualquer nome.

```mkdir /mnt/device-nome-do-smartphone```

3 - montando:

```jmtpfs /mnt/device-nome-do-smartphone```

4- Pronto seus dados do smartphone estão em /mnt/device-nome-do-smartphone

5- Para desmontar:

```fusermount -u /mnt/device-nome-do-smartphone```

## Referencias:

[Arch Wiki](https://wiki.archlinux.org/title/Media_Transfer_Protocol)

[askubuntu](https://askubuntu.com/questions/342319/where-are-mtp-mounted-devices-located-in-the-filesystem)
