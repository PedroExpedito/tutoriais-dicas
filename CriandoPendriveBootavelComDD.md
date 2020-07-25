# Apesar de existir muitas ferramentas gráficas o programa dd é ótimo, vamos ver como utilizar.

## Para isto siga os passos abaixo:

1. Conecte um pendrive "vazio" formatado em FAT32, e deixe-o desmontado.

2. Monte a pasta onde se encontra a "imagem.iso" com o comando cd. No meu caso, é a pasta Downloads.

```bash cd Downloads```

3. Digite o comando dd:

```sudo dd if=imagem.iso of=/dev/sdX``` imagem.iso sendo a sua iso e sdX o seu dispostivo

4. Aguarde alguns momentos!

5. Pronto.





