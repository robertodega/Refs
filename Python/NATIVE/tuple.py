import os

os.system('clear')

#   LE TUPLE SONO LISTE IMMUTABILI
tupla = (7,14,21,28)
tupla_2 = 7,14,21,28        #   presenza di virgole e mancanza di [] definisce che è una tupla
tupla_3 = (7)               #   un solo elemento viene letto come intero
tupla_4 = (7,)              #   la virgola definisce la tupla

def swap_tuple(a, b):
    a,b = b,a
    return a,b

def dict_creation(a, b):    #   creazione dizionario da 2 tuple
    dictionary = {}
    if len(a) == len(b):
        for i, j in enumerate(a):
           dictionary[j] = b[i] 
    return dictionary

def executions():
    # print(tupla)
    # print(tupla[2])
    # print(type(tupla))
    # print(tupla_2)
    # print(type(tupla_2))
    # print(tupla_3)
    # print(type(tupla_3))
    # print(tupla_4)
    # print(type(tupla_4))
    # print(tupla_4[0])       #   permesso perchè tupla
    # print(swap_tuple(tupla, tupla_4))
    # print(dict_creation(('a','b','c','d','e'), (1,2,3,4,5)))    # {'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5}
    pass

executions()