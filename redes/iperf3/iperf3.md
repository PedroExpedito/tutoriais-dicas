## iperf3

iperf3 é um simples software para medir largura de banda tcp/udp dentro de uma
rede é extremamente fácil de usar.

#### abrindo servidor

`iperf3 --server`

#### conectando a servidor

`iperf3 -c <ip>`

#### Casos de uso ?

* verificar qual dispositivo mobile tem melhor Wireless **(Obs: Lembre que pode
ser limitado pelo cabo a +- 90mb/s)**.

* Verificar qual a banda máxima de uma rede via radio.

* Verificar transferência por cabo

Em suma é um ferramenta para testar banda de escopo bem aberto.

#### instalando:

Debian/based:

`apt install iperf3`


