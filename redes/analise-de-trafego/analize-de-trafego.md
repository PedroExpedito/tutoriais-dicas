# Analize de trafego TCP/IP com TCPDUMP

Todo técnico em TI deveria saber fazer analise de trafego,
seja programador, sysadmin etc.

Baseado no conteúdo do Eriberto Morta

## aviso!!!
Se você caiu aqui de paraquedas não sera util a leitura destas
anotações é melhor ver o
[vídeo](https://youtu.be/gK3gl3Vh8L0) original

## Analise de trafego permite:

* Encontrar pontos de bloqueios na rede.

* Detectar anomalias na rede.

* Descobrir equipamentos e cabeamento defeituosos.

* Observar importantes mensagens do sistema não mostrado pelas
aplicações.

## Curiosidade:

Em muitas faculdades e até mesmo hoje redes é uma matéria que
não se dão muito foco, por que demorou um tempo para disseminar
a internet pelo mundo.

## BASE:

* protocolo
* trafego

## Melhorias:

* livro Ilustred TCP/IP

## RFCs

Documetos que regulam o funcionamento da internet é a fonte
principal de estudo.

RFCs importantes para analise de trafego são
768,791,792,793,1122,6890,1122,6890 e todas as atualizações

disponivel em http://iet.org/standars

Ferramenta principal: TCPDUMP

Ferramentas de auxiolio: tshark, wireshark, mrt, ping,netcat,
iptraf, packit etc.

Auxilio para testes e estudo: simulador de redes CORE.

## pocket books

TCP/IP and tcpdum Pocket Reference Guide SANS:

https://www.sans.org/security-resources/tcpip.pdf(IPv4)
https://www.sans.org/security-resources/ipv6_tcpip_pocketguide.pdf
(ipv6)

Resumão do Eriberto

http://eriberto.pro.br/files/guia_tcpdump.pdf

Simulador de redes CORE

Não está mais nos repos do Debian por ter falha de segurança a
famosa shell root porém está disponivel em

https://github.com/coreemu/core

Ou por docker: https://buh.docker.com/r/d3f0/coreemu_vnc/

## qual a linguagem padrão de um protocolo de rede?

Inglês ou seja um padrão literal

A implementação é em qualquer linguagem de programação

## Estrutura básica

* Header (frente do caminhão)
Parte fundamental
* payload (carroceria)
Dados ou seja carga

## Programas

### mtr ( my trace route)

mtr é um programa que funciona tanto por linha de comando
passando o argumento ```-t``` ou por interface grafíca passando
o ```-g``` do gtk. É possivel analizar qual a rota para chegar
em determinado ponto exemplo:

```mtr -t www.google.com```

Não é possivel saber todos os IP mesmo havendo um roteador por
que o my trace route utiliza icmp baseado no ttl

### ping

Curiosidade por que chama ping ? ```ping-pong``` ou seja eu
```ping -c4 www.google.com``` e recebo o pong(log).

rrt = round tripe time Portugues( tempo de viagem de ida e volta)

### traceroute

No linux o padrão do traceroute é usar udp para usar icmp
precisa passar a tag ```-I```

## Curiosidade:

  Normalmente um pacote não faz mais que 30 saltos.

## TTL de OS

* Unix e derivados: ttl 255

* Windows 10: ttl 128

* Linux: ttl 64

## proc

O proc internefe diretamente no kernel

## Como funciona o traceroute e o mtr ?

é bem simples ambos seta o ttl a 1 e envia, então o roteador que
recebe responde de volta que o pacote foi destruido por que o
ttl chegou a zero, então ele manda denovo com o ttl setado a 2
para descobrir o segundo roteador e assim vai até chegar no
destino

## Header checksum

Por que o ip só garante o cabeçalho e não também o payload ?

Por que é lento demais calcular checksum, toda vez que muda o
ttl o roteador precisa recalcular o novo checksum

curiosidade ipv6 não tem checksum no cabeçalho

## Ver os protocolos

```/etc/protocols```

## tcpdump

```tcpdump -n ip -c 1 -x```

## O IP não engloba os protocolos é apenas uma visão didática

Podemos ver com o tcpdump que é sequencial ou seja aonde acaba o
cabeçalho ip começa o cabeçalho do protocolo em seguida são
preambulos.

## Protocolos mais importantes do IP

* TCP
* UDP
* ICMP

Destes apenas o UDP e TCP utilizam porta

## Endereços de IP especiais e para oque servem

[RFC6890](https://tools.ietf.org/html/rfc6890)

127.0.0.0/8 é loopback
Quem da o pong da loopback ? **O kernel**

0.0.0.0 Está maquina
0.0.0.0/8 está rede

Ou seja está rede é todas as redes que os sitema operacional tem
contato

## Em qualquer sistema operacional rede está dentro do kernel

## DHCP fornece dados e rede e não ip

Como é feito um pedido dhcp sendo que o campo ip é obrigatorio e
a maquina não sabe o IP ?  Oque vai estar escrito no campo ip ?
**0.0.0.0**

## Toda rede precisa de um servidor ?

Sim

## Yana

Define que a porta numero 0 é reservada

## Cabeçalho tcp

```

   0                   1                   2                   3
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |          Source Port          |       Destination Port        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                        Sequence Number                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Acknowledgment Number                      |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Data |           |U|A|P|R|S|F|                               |
   | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
   |       |           |G|K|H|T|N|N|                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |           Checksum            |         Urgent Pointer        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             data                              |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

```

## TCP flags

* **Syn** (synchonize) inicia conexões

* **Fin** (finish) Sinaliza conexões

* **Psh** (push) envia dados

* **Ack** (acknowledgment) Confirmação que é conhecido o numero de sequencia do
proximo segmento a ser enviado pelo lado oposto

* **Rst** (reset) "não entendi".

## Sempre o cliente inicia a conexão

Por ser um protocolo orientado a conexão só se comunica apos
estabelecer conexão

## Métodos de difusão de dados

* **Simplex** Um fala outro escuta

* **Half duplex** os dois falam porém a cada um no seu tempo

* **Full duplex** Aonde ambos podem falar ao mesmo tempo

TCP é full Duplex

## Exemplo para estabelecer conexão

**Canal 1:**

Cliente -> Servidor = Syn

Servidor -> Cliente = Ack

**Canal 2:**

Servidor -> cliente = Syn

Cliente -> Servidor = Ack

No caso o servidor envia Syn e Ack ao mesmo tempo

Aperto de mão em três vias

**Apenas o push tem payload**



## Pergunta
Quando um cliente faz um pedido para visualizar uma pagina web
como ficaria ?
R: IP->TCP->HTTP

Formas de finalizar uma conexão tcp:

1º: 1/2 fechamento

F
A
F
A

2º:

F
A/F
F


**Importante:** As flags TCP são disparadas contra as portas e
somente a flag push possui payload

O TCP é interno, então não escuta na porta 80, e sim o servidor
envia o pacote para o IP e apos o pacote entrar é desgastado o
IP e fica apenas com o TCP e então o tcp procura a porta

## Pratica TCPDUMP

Capturar do loopback na porta 80 no caso usei outra placa usando
`ip a` para saber

`tcpdump -ni lo port 80 -w /tmp/t1.pcap`

Para visualizar os pacotes capturados

`tcpdump -nr /tmp/t1.pcap`

Socket é o ip junto com a porta

Socket do servidor é fixo

Por padrão o TCP mantem conexão por 5 minutos até o timeout caso
os dois lados continuarem sem comunicação

## Pesquisar

Se tudo vai no payload qualquer comunicação sem criptografia da
para ser lida por todos que receberem o pacote ?

## Dicas de analise

* Toda rede que tem muitas flag rst no TCP tem algo errado

### TcpDump

`tcpdump -n port 443`

## UDP

É o protocolo mais rapido da familia TCP/IP

[RFC 768](https://tools.ietf.org/html/rfc768)

**dica** Um pacote UDP nunca deve passar de 576 bytes não correr
risco de não ser aceito, por que a RFC estabelece como minimo de
576 bytes que um roteador deve aceitar.

## ICMP




```

                  0      7 8     15 16    23 24    31
                 +--------+--------+--------+--------+
                 |     Source      |   Destination   |
                 |      Port       |      Port       |
                 +--------+--------+--------+--------+
                 |                 |                 |
                 |     Length      |    Checksum     |
                 +--------+--------+--------+--------+

```
### NC (netcat)


`nc -u -l "IP" -p "port"`

connect:

`nc -u "IP" "port"`


UDP não tem flags e não estabelece conexão e então usa o ICMP,
    obs: Todos os protocolos IP utilizam o ICMP com excessão do
TCP.


## Packit


Para fazer pacotes na "mão"

```packit -d 192.168.0.108 -F SPR```

## ICMP

RFC 792

Header:

```
       0                   1                   2                   3
       0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      |     Type      |     Code      |          Checksum             |
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      |                                                               |
      |                         Message Body                          |
      |                                                               |
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

```

Types:

* Tipo 8: Echo Request

* Tipo 0: Echo Reply

* Tipo 3, Código 3: Porta de destino inacessível

* Tipo 11, código 0: TTL experado em trânsito.

ICMP pode ser bloqueado pelo sistema de firewall

# Modelo OSI

São 7 camadas



| Type       | Camada            |  Exemplos                                          |
| -----------| ------------------|---------------------------|
| Dados      | Aplicação         | Usuario, http, ftp, smtp etc                       |
| Dados      | Apresentação      | SSL, conversão de padrões                          |
| Dados      | Sessão            | Sessão de aplicações                               |
| Segmentos  | Transporte        | TCP, UDP                                           |
| Pacotes[1] | Rede              | IP e protocolo IP(exceto TCP/UDP)                  |
| Quadros[2] | Enlace            | Ethernet, ATM, PPP, Frame relay/switch, bridge     |
| Bits       | Física            | hub, cabos, placa de rede, ondas eletromagneticas  |

MTU é o maximo de bytes que pode ser transportado em payload

## Tecnicas de analize de tráfego

## Payload que falam!

Exemplo um programa simples feito em nodejs com eletron que
utiliza um banco de dados postgress que é parrudo, só que está
aplicação está com problemas e não tem um log decente, olhar o
payload com TCPDUMP com a tag `-A` pode ajudar.

## Bridge

[Bridges no Debian]
(http://eriberto.pro.br/wiki/index.php?title=Cria%C3%A7%C3%A3o_de_uma_bridge_no_Debian_GNU/Linux)

## Conclusão

* Analise de trafego é fundamental para todo profissional que tem
contato com redes, Sem ela em momentos de panes e de problemas
de rede, o administrador será um mero testador de possibilidades
infundadas.

* tcpdump é a melhor alida de análise de tráfego

* Ouça payloads

* Não se bloqueia ICMP

## Lucro

Caminhos para aprofundar em redes

## Simulador CORE


