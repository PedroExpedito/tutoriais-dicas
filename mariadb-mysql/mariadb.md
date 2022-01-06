# Docker

Baixar [imagem](https://hub.docker.com/_/mariadb)  na docker hub:

```docker pull mariadb```

Criar um container:

`docker run -p 127.0.0.1:3306:3306  --name some-mariadb -e MARIADB_ROOT_PASSWORD=my-secret-pw -d mariadb:tag`

acessar container:

`docker exec -it <containerID> /bin/bash`

# MariaDB

[getting start](https://mariadb.com/kb/en/mariadb-basics/)

Acessando:

`mysql -u root -p -h localhost`

saindo:

`quit`

Criar usuario que qualquer ip pode acessar

`CREATE USER '<usuario>'@'%';`

Criar um banco de dados:

`create database <nome do banco>;`

Todos os privilegios do banco para o usuario:

`grant all privileges on <db>.* to '<user>'@'<ip>'`

Setando senha:

`ALTER USER '<user>'@'<ip>' IDENTIFIED BY 'nova senha'



