# EP1 - Lógica Computacional

## Objetivo

Implementar o algoritmo de fecho reflexivo e transitivo de uma relação binária R C AxA sobre um conjunto finito A que é descrita por meio de um grafo direcionado. Deve ser construído por meio de recursão.

## Fecho Reflexivo e Transitivo

R* = R U {(a,b) E R se Existe(c) E A | (a,c) E R ^ (c,b) E R} U {(a,a) E R paraTodo(a) E A}

## Teorema: 

O fecho R* sobre R é equivalente a R U {(a,b) | há uma cadeia de a para b em R}

## Abordagem

Levando em conta o teorema acima, nota-se que encontrar R* é equivalente a encontrar todos os caminhos a partir de todos os nós para todos os outros nós (incluindo o próprio nó analisado).

Sendo assim basta implementar um algoritmo que faça esta função. Uma possibilidade seria um algoritmo baseado no de busca em profundidade recursivo.

## Representação do grafo

Para representar um grafo ordenado deve-se representar seus nós, que contém a sua identificação (numero de 0 a n) e suas conexões com outros nós, sendo representado da seguinte maneira:

```
Nó: {numero, [nós_filhos]}
```

Sendo que os nós sem nós filhos devem ser representados nos grafos da seguinte maneira: ``` {n, []} ```

A representação do grafo nada mais é do que uma lista contendo seus respectivos nós de forma ordenada: 

```
  [{0, [nos_filhos_0]}, {1, [nos_filhos_1]}, ...]
```

### Exemplo de grafo:

Suponha um grafo com 4 nós, sendo '0' a raíz, '1' e '2' os nós-filhos de '0' e '3' o nó-filho de '1':

```
  0 --> 1 --> 3
  |--> 2
```
A representação deste grafo seria: ``` [{0, [1,2]}, {1, [3]}, {2, []}, {3, []}] ```

### Executando o programa

No diretório do projeto basta executar ```iex -S mix run``` para compilar e rodar o projeto.

Dentro da shell interativa basta chamar a função execute do módulo Ep1Logica com o grafo como argumento, exemplo:

``` Ep1Logica.execute([{0, [1,2]}, {1, [3]}, {2, []}, {3, []}]) ```

A execução deste exemplo retorna ``` [{0, 0}, {0, 1}, {0, 3}, {0, 2}, {1, 1}, {1, 3}, {2, 2}, {3, 3}] ```, sendo este o feicho reflexivo-transitivo da relação R representada pelo grafo ordenado passado como argumento.

Pode-se também utilizar ``` mix test ``` para efetuar os testes com casos descritos no arquivo 'test/ep1_logica_test.exs'.

