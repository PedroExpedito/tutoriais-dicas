"o" para inserir na linha abaixo

"O" para inserir na linha acima

"shift V" modo visual linha

"w" para ir pular uma palavra a frente

"b" para pular uma palavra atraz

"$" para  ir ate o final de uma linha

"0" para ir ate começo de uma linha

"gg" para ir ate o começo de um arquivo

"shif + g" para para ir ate a ultima linha


Dica para quem programa e não usa IDE e não tem algumas regalias como renomear variável e suas referencias! Mas isso é fácil resolver com o find, xargs e sed programas comuns do Gnu/Linux a sintaxe é simples:

`find <diretorio> -name "<tipo de arquivo ex: *.cs" | xargs sed -i -e 's/<nome-antigo>/<novo-nome>/g'`





