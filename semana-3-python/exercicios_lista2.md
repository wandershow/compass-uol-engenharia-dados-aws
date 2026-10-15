# Semana 3: Python (lista 2)

Resoluções dos exercícios da segunda lista de Python do programa.

## 1. Elementos em comum entre duas listas (sem repetições)

~~~python
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

print(set(a) & set(b))
~~~

## 2. Nova lista só com números ímpares

~~~python
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
b = []
for i in a:
    if i % 2 != 0 and i not in b:
        b.append(i)
print(b)
~~~

## 3. Palíndromo

~~~python
frase = input('Digite uma frase: ').strip().lower()
palavra = frase.replace(' ', '')
inverso = palavra[::-1]
if inverso == palavra:
    print('{} é palíndromo'.format(frase))
else:
    print('{} não é palíndromo'.format(frase))
~~~

## 4. Combinar listas de nomes, sobrenomes e idades

~~~python
primeirosNomes = ['Joao', 'Douglas', 'Lucas', 'José']
sobreNomes = ['Soares', 'Souza', 'Silveira', 'Pedreira']
idades = [19, 28, 25, 31]

for c in range(0, len(idades)):
    print("{} {} está com {} anos".format(primeirosNomes[c], sobreNomes[c], idades[c]))
~~~

## 5. Função que remove duplicados de uma lista

~~~python
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 2, 13, 55, 89]

def remove_duplicados(lista):
    return list(set(lista))

print(remove_duplicados(a))
~~~

## 6. Ler e imprimir um arquivo de texto

~~~python
with open("basico_python.txt") as arquivo:
    for linha in arquivo:
        print(linha)
~~~

## 7. Ler um JSON e imprimir o conteúdo

~~~python
import json

with open("person.json", "r") as arquivo:
    data = json.load(arquivo)
for k, v in data.items():
    print(f'{k} : {v}')
~~~

## 8. Implementar o map

~~~python
l = [1, 2, 3, 4, 5]

def dobrar(valor):
    return valor * valor

def my_map(lista, f):
    resultado = []
    for i in lista:
        resultado.append(f(i))
    return resultado

print(my_map(l, dobrar))
~~~

## 9. Parâmetros não nomeados e nomeados

~~~python
def func(*args, **kwargs):
    print(f'Parametros não nomeados: {list(args)}')
    print(f'Parametros nomeados: {list(kwargs.values())}')

func(1, 2, 3, 4, 5, 6, 7, 8, arg2=90, arg3=99, arg1=95)
~~~

## 10. Classe Lampada (orientação a objetos)

~~~python
class Lampada:
    def __init__(self, ligada):
        self.__ligada = ligada

    def liga(self):
        self.__ligada = True

    def desliga(self):
        self.__ligada = False

    def esta_ligada(self):
        return self.__ligada
~~~

## 11. Somar números digitados separados por vírgula

~~~python
entrada = input('Digite os numeros separados por virgula: ')
somatorio = sum(int(n) for n in entrada.split(','))
print('o somatório é {}'.format(somatorio))
~~~

## 13. Valores únicos de um dicionário

~~~python
speed = {'jan': 47, 'feb': 52, 'march': 47, 'April': 44, 'May': 52, 'June': 53, 'july': 54, 'Aug': 44, 'Sept': 54}
print(list(set(speed.values())))
~~~

## 14. Mínimo, máximo, média e mediana

~~~python
import random
import statistics

random_list = random.sample(range(500), 50)
print(max(random_list), 'máximo')
print(min(random_list), 'mínimo')
print(statistics.mean(random_list), 'média')
print(statistics.median(random_list), 'mediana')
~~~

## 15. Lista de trás para frente

~~~python
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
print(a[::-1])
~~~
