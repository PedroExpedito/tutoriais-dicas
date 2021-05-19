Esse é o dynamic linker/loader.  Se você der um file /bin/ls tu ver que uma das informações que o file irá exibir é um tal de "interpreter". Que é justamente o endereço para o dynamic linker. Aqui é /lib64/ld-linux-x86-64.so.2.

Para mais informações sobre ele:
$ man ld.so
