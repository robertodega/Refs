import os

os.system('clear')

#   creazione lista
a = [7,14,21,28]
print(a)

#   append di elemento
a.append(35)
print(a)

#   append di lista
a.append([1,2,3,4])
print(a)

#   aggiunta di lista come singoli elementi
a.extend([5,6,10,11])
print(a)

#   rimozione di ultimo elemento da lista (memorizzando valore rimosso)
b = a.pop()
print(a)
print(b)

#   rimozione di elemento con indice da lista
c = a.pop(2)
print(a)
print(b)
print(c)

#   somma di più liste
d = [20,21]
e = a + d
print(e)

#   moltiplicazione di lista
f = a * 3
print(f)

#   dimensione di lista
print(len(a))

#   metodo if + index su lista
if 35 in a: print("position of '35': ", a.index(35))
else: print('non presente')

#   metodo sort
g = [5,9,2,67,23]
print(g)
g.sort()
print(g)
g.sort(reverse=True)
print(g)

#   range (creazione automatica di liste)
list_1 = list(range(25))
print('list_1: ', list_1)

list_2 = list(range(5, 10))
print('list_2: ', list_2)

list_3 = list(range(5, 50, 3))
print('list_3: ', list_3)

list_4 = list(range(5, -50, -3))
print('list_4: ', list_4)

#   string split
s = "Roberto,Giovanna,Giada,Daniele,Sabbatò,Mariarosa"
splitter = s.split(',')
print(splitter, ': ', len(splitter))