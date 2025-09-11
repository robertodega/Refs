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

def executions():
    print(tupla)
    print(tupla[2])
    print(type(tupla))
    print(tupla_2)
    print(type(tupla_2))
    print(tupla_3)
    print(type(tupla_3))
    print(tupla_4)
    print(type(tupla_4))
    print(tupla_4[0])       #   permesso perchè tupla
    print(swap_tuple(tupla, tupla_4))

executions()