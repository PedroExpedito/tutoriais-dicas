# Gentoo

Gentoo é uma meta distribuição com suporte a diversas arquiteturas e neste
artigo vou tentar explicar como foi minha experiencia.

## Mitos

**No gentoo você vai ter que compilar tudo** Isso é falso, primeiro quem compila
é o compilador HEHE, e a pacotes bin também não se diferencia muito oque vai ter
de diferente é a [USE]() que

**Gentoo é mais rápido** Rápido em que ? Seria a primeira pergunta  a se fazer
quando alguém faz uma afirmação dessas. Este mito começou por causa do fork do GCC
conhecido como  EGCS que gerava binários cerca de 10% mais eficiente, porém hoje
as mudanças do EGCS já foram integradas ao GCC oficial.

**Gentoo compila espefificamente para seu hardware** Essa é uma das piores, o
que você pode fazer é um kernel para seu hardware que vai ser mais limpo e com
muitos menos modulos.

## Pontos positivos

* **portage** Portage é um gerenciador de pacotes incrível só usando para entender

* **Documentação** A documentação é muito bem explicada

* **Minimalismo** Com gentoo você faz muitas escolhas muitas mesmo e você tem mais vantagem
de utilizar um sistema enxuto.

## Pontos negativos

* Utiliza muito espaço em disco! Fazendo um comparativo com o Debian com pacotes que ocupariam
2gb no gentoo ocupa 23gb ou mais, isso acontece por que o gentoo guarda muitos arquivos em cache
além que para compilar precisa de muitas bibliotecas de desenvolvimento.

* Tempo de compilação para quem tem um processador comum pode ser muito lerdo chegando ate
dias para compilar um sistema "completo" exemplo chromium+kde-full






