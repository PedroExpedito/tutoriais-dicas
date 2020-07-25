# Wifi Chines no Debian

### Bem para quem possui o Debian 10 e está com problemas de usar este adptador aqui

<img src="https://cdn.awsli.com.br/600x450/361/361767/produto/18368472/3c59a19703.jpg" alt="drawing" width="200"/>

## **Antes de iniciar esse processo vamos verificar se o seu adptador é o mesmo que o meu com o comando**

```lsusb | grep "Realtek Semiconductor Corp. 802.11n"```

Causo o log for parecido com este:

"Bus 001 Device 004: ID 0bda:f179 Realtek Semiconductor Corp. 802.11n" siga o tutorial,
causo não for parecido e não imprimir nada na tela recomendo que procure outro tutorial.

criar uma pasta no diretorio temporario:

```mkdir /tmp/wifi```

entrar na pasta criada:
```bash
cd /tmp/wifi
```

Instalar as depedencias para compilar o firmware:

```sudo apt-get install build-essential git dkms linux-headers-$(uname -r)```

Baixar o source do firmware:

```git clone https://github.com/kelebek333/rtl8188fu```

Adicionar ao dkms:

```sudo dkms add ./rtl8188fu```

fazer a build com o dkms:
sudo dkms build rtl8188fu/1.0

Instalar o firmware com o DKMS:

```sudo dkms install rtl8188fu/1.0```

Copiar o binario para a lib firmware causo tiver erro nessa parte que o diretorio não
foi encontrado faça

```mkdir /lib/firmware/rtlwifi/```

Por ultimo

```sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/```

pronto já deve estár funcionando.
