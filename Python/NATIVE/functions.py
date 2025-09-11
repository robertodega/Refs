import os

os.system('clear')

#   calcola la media dei valori di una lista di numeri
def media_in_lista(L):
    listLength = len(L)
    sum = 0
    if(listLength):
        for i in range(listLength):
            sum += L[i]
        avg = sum / listLength
    else:
        avg = 'empty list!'
    return avg

#   accetta una lista di stringhe e una lettera - conta quante iniziano con la lettera passata
def conta_lista_stringhe(L,c):
    count = 0
    for s in L:
        if s[0].lower() == c.lower():
            count += 1
    return count

#   restituisce la somma degli lementi della lista e info se c'è almeno un numero negativo
def somma_con_info(L):
    sum = 0
    negativeFound = False
    for i in L:
        sum += i
        if not negativeFound and i < 0:
            negativeFound = True
    return sum, negativeFound

#   accetta 2 liste e restituisce una lista unione delle due senza elementi duplicati
def listUnion(L1, L2):
    resultList = []
    
    # for i in L1:
    #     if i not in resultList:
    #         resultList.append(i)
    # for j in L2:
    #     if j not in resultList:
    #         resultList.append(j)

    for i in L1 + L2:
        if i not in resultList:
            resultList.append(i)

    resultList.sort()
    return resultList



def executions():
    print('list numbers average result: ', media_in_lista([1,2,3,4,5]))
    print('list numbers average result (empty list): ', media_in_lista([]))
    print('string list count (l) result: ', conta_lista_stringhe(['ciao', 'miao', 'cosa', 'machecacchioscrivi', 'lavora'], 'l'))
    print('string list count (c) result: ', conta_lista_stringhe(['ciao', 'miao', 'Cosa', 'machecacchioscrivi', 'lavora'], 'c'))
    print('somma con in info result: ', somma_con_info([1,2,3,-1]))
    a,b = somma_con_info([1,2,3,-1])
    print('somma con in info a 2 variabili result:\n\tsomma:', a, ' - negativeFound:', b)
    print('Unione di liste - ', listUnion(['Roby', 'Twix', 'Gio', 'Giada', 'Twix'],['Sabbatò', 'Mariarosa', 'Daniele', 'Ambra', 'Twix']))

executions()