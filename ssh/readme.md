# Desabilitar autenticação por senha

Abrir o aquivo `/etc/ssh/sshd_config`


E colocar essa linha `PasswordAuthentication no`

# Gerar par de chaves

`ssh-keygen -t rsa`

Enviar a chave publica para o servidor.

`scp ~/.ssh/id_rsa.pub root@xxx.xxx.xxx.xxx:~/`

# Reiniciar serviço

`systemctl restart sshd`
