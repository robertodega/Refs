import os

os.system('clear')

def stampa(L):
    #   ciclo WHILE
    i = 0
    print('Ciclo WHILE: ', end='')
    while i < len(L):
        print(L[i], end=' ')
        i += 1
    print()
    #   ciclo FOR
    print('Ciclo FOR:')
    
    for i in L:
        print(i, end=' ')
    print()

    print('for con range:')
    for i in range(len(L)):
        print(L[i], end=' ')
    print()

    print('for con enumerate:')
    for i, x in enumerate(L):
        print(i,' => ', x)
    print()

stampa([1,2,3,4,5])