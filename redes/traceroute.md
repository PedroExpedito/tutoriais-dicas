# O comando traceroute é muito interessante, ele traça uma hosta
até um determinado destino exemplo:

```traceroute 8.8.8.8```

traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
 1  _gateway (192.168.0.1)  0.306 ms  0.312 ms  0.349 ms
 2  192.168.88.1 (192.168.88.1)  1.286 ms  1.314 ms  1.436 ms
 3  172.16.0.1 (172.16.0.1)  14.058 ms  14.089 ms  14.132 ms
 4  10.100.100.1 (10.100.100.1)  13.884 ms  13.974 ms  13.921 ms
 5  197.88.36.177.deltainternet.net.br (177.36.88.197)  16.037 ms  16.051 ms  15.971 ms
 6  72.14.213.188 (72.14.213.188)  26.401 ms  23.842 ms 10.62.62.254 (10.62.62.254)  58.180 ms
 7  209.85.148.188 (209.85.148.188)  27.353 ms  27.265 ms 10.23.213.254 (10.23.213.254)  29.132 ms
 8  dns.google (8.8.8.8)  29.192 ms  29.358 ms  29.199 ms

 ele mostra todo o caminho para chegar naquele determinado endereço

