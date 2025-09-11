import os

os.system('clear')

rob_dictionary = {'name' : "Roberto",
                      "surname": "De Gaetano",
                      "age": 49,
                      "family": ["Giovanna", "Giada", "Twix"],
                      "active" : True}

novedrate_family = {"first" : {"name" : "Roberto", "surname": "De Gaetano", "age" : 49, "gender" : "man", "active" : True},
                    "second" : {"name" : "Giovanna", "surname": "Fortugno", "age" : 44, "gender" : "woman", "active" : True},
                    "third" : {"name" : "Giada", "surname": "Piacenza", "age" : 18, "gender" : "woman", "active" : True} }


def visualize(dict):
    print("\n------ visualize ------\n")

    print(rob_dictionary)
    
    if(dict['active']):
        print('chiave name: ', dict["name"])
        print('chiave surname: ', dict["surname"])
        print('chiave age: ', dict["age"])
        print('chiave family: ', dict["family"])

def dict_surfer(dict):
    print("\n------ dict_surfer ------\n")
    if "active" in dict and dict['active']:
        for k in dict:
            print(k,' => ',dict[k])

def dict_update(dict,key,val):
    print("\n------ dict_update ------\n")
    if key not in dict:
        dict[key] = val
    return dict

def dict_pop(dictname, dict_key):
    print("\n------ dict_pop ------\n")
    if dict_key in dictname:
        return dictname.pop(dict_key)
    return None



def executions():

    print("\n------ START ------\n")

    # visualize(rob_dictionary)
    # dict_surfer(rob_dictionary)
    # dict_val_update = dict_update(rob_dictionary,'province','Como')
    # for k in dict_val_update: print(k,' => ',dict_val_update[k])
    # for k in novedrate_family: dict_surfer(novedrate_family[k])
    # print(dict_pop(novedrate_family, "first"))

    print("\n------ END ------\n")

executions()