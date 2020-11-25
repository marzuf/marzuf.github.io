Source: zeste de savoir (31.07.2019)

### Variables, scopes et closures en Python

##### Références multiples

les listes étant des objets mutables (i.e. que l'on peut modifier), 2 instanciations différentes de listes donnent nécessairement des objets distincts

```
a = []
b = a
a is b
# True
c = []
a is c
# False
```

en revanche, les objets type `int`, `tuple`, `str` , etc. étant immutables, Python se permet dans certains cas de n'avoir qu'une seule instance pour plusieurs objets
(il sait que 2 objets initialement égaux ne pourront être modifiés)
```
a = 5
b = 5
a is b
# True
```

optimisation ou non, le fait que `b = a` ajoute une étiquette supplémentaire à la valeur existante est vrai pour tout type de valeur
(i.e. après `b = a`, `a is b` sera toujours vrai)

##### Multiplication de listes

```
table = [[0] * 4] * 3
table[0][0] = 1
table
# [[1,0,0,0],[1,0,0,0],[1,0,0,0]]
```

la multiplication d'une liste ne fait que multiplier les références que contient cette liste, elle ne procède pas à une copie des valeurs

pour pallier ce problème, il faut utilisé une liste en intension avec `range`

```
table = [[0] * 4 for _ in range(3)]
table[0][0] = 1
table
# [[1,0,0,0],[0,0,0,0],[0,0,0,0]]
```


##### Valeur par défaut d'un paramètre de fonction

```
def append_to_list(value, dest=[]):
  dest.append(value)
  return dest
append_to_list(10)
# [10]
append_to_list(15)
# [10,15]
```

le problème ici est que les valeurs par défaut des paramètres sont définis une bonne fois pour toutes lors de la définition de la fonction, et conservée pour tous les appels; chaque appel à `append_to_list` en utilisant la valeur par défaut référencera la même liste

pour contourner ce problème, il est conseillé d'éviter les valeurs par défaut mutables ou d'utiliser des sentinelles (`None` par exemple):

```
def append_to_list(value, dest=None):
  if dest is None:
      dest = []
  dest.append(value)
  return dest
append_to_list(10)
# [10]
append_to_list(15)
# [15]
```
##### Supprimer une valeur

pour supprimer une valeur et libérer l'espace mémoire il est nécessaire de déférencer totalement (i.e. supprimer toutes les références vers cette valeur)

`del`ne suffit pas si la valeur est toujours référencée par une autre variable

ce n'est pas l'utilisation d'un `del` qui déclenche l'appel à `__del__` mais bien le référencement total

##### Références cycliques

si un objet `obj1`contient une référence vers un objet `obj2` qui contient lui-même une référence vers `obj1`

```
obj1 = Obj()
obj2 = Obj()
obj1.ref = obj2
obj2.ref = obj1
del obj1
del obj2
```
dans ce cas, il ne se passe rien; les références cycliques seront résolues à la fin du programme

on peut invoquer manuellement le ramasse-miettes:

```
obj1 = Obj()
obj2 = Obj()
obj1.ref = obj2
obj2.ref = obj1
del obj1
del obj2

import gc
gc.collect()
# là les références sont supprimées
```

##### Références faibles

problème des références cycliques: le ramasse-miettes ne peut collecter les objets tant qu'ils sont référencés

une autre manière de le résoudre est d'utiliser des références qui n'empêchent pas ce ramasse-miettes de supprimer les valeurs;
on les appelle les "références faibles" (fournie par le module `weakref`)

une référence faible est similaire à un appel de fonction qui renvoie l'objet si celui-ci est toujours référencé ou None s'il a été supprimé

```
import weakref
obj1 = Obj()
obj2 = Obj()
obj1.ref = obj2
obj2.ref = weakref.ref(obj1)
```

##### Scope

lorsqu'on quitte un scope, le scope ainsi que les variables qu'il contient sont détruits, ce qui permet de supprimer les valeurs si elles ne sont plus référencées

une variable globale est une variable qui existe dans le scope global du module

le corps d'une fonction a accès aux variables définies dans le scope courant (variables locales) mais aussi à celles des scopes parents (variables extérieures) (pas uniquement les variables globales)

les variables extérieures peuvent être utilisées de la même manière que les variables locales; lors de la résolution du nom, si elles sont plusieurs à porter le même nom, c'est la variable du scope parent le plus proche qui sera utilisée en priorité

```
var = 10

def outer():
  var = 20
  def inner():
  	print(var)
  inner()

outer()
# 20
variable
# 10
```
subtilité: nous pouvons définir dans une fonction une nouvelle variable portant le nom d'une variable extérieure, sans que cela n'affecte la variable extérieure

comment redéfinir la valeur d'une variable extérieure ? il est nécessaire d'indiquer à Python qu'une variable de ce nom est déjà déclarée à l'extérieur (2 mots-clés: `global` et `nonlocal`)

`global` indique qu'une variable est globale et Python comprend qu'elle devra être déclarée et définie dans le scope global
pour la déclaration, peut être suivi d'un ou plusieurs noms de variables (e.g. `global foo` ou `global foo, bar`)

```
x=5

def define_globals():
  global x
  x = 10
x
# 5
define_globals()
x
# 10
```

la variable n'a pas besoin d'avoir déjà été définie dans le scope global pour être utilisée dans la fonction




```
def define_globals():
  global y
  y = 2
y
# error: y Not defined
define_globals()
y
# 2
```

`nonlocal` est similaire mais pour indiquer qu'une variable existe dans un scope local parent; au contraire de `global`, cette variable doit nécessairement avoir été définie dans un scope parent (autre que le scope global)

```
def outer():
  x = 0
  def inner():
    y = 0
    def inception():
	nonlocal y
	y = 10
    inception()
    nonlocal x
    x = y
  inner()
  return x
outer()
# 10
```

omettre un des deux `nonlocal` aurait pour effet de redéclarer une variable locale (`x` ou `y`) et donc ne permettrait pas de remonter la valeur `10`

si plusieurs scopes parents déclarent une variable du même nom, c'est la variable du scope le plus proche qui sera utilisée

ces mots-clés ne sont nécessaires que pour redéfinir une variable (pas pour la modifier, y accéder en écriture); il est par exemple possible d'utiliser depuis une fonction la méthode `append` d'une liste définie au niveau global, sans avoir à utiliser le mot-clé `global`

```
values = []
def append_value(value):
  values.append(value)
append_value(0)
append_value(1)
values
# [0,1]
```

ainsi en général les utilisation de `global` et `nonlocal`sont plutôt rares et il est généralement déconseillé de les utiliser

##### Closure (fermeture)

les closures permettent de capturer des variables locales pour qu'elles soient toujours accessibles dans un contexte particulier

```
def cached_addition():
  cache = {}
  def addition(x,y):
    if(x,y) not in cache:
      print(f'Computing {x} + {y}')
      cache[x,y] = x + y
    return cache[x,y]
  return addition
addition = cached_addition()
addition(1,2)
# Computing 1 + 2
# 3
addition(1,2)
# 3
addition(2,3)
# 
# Computing 2 + 3
# 5
```
l'idée est que la fonction retourne à chaque appel une nouvelle fonction `addition` créée dynamiquement, utilisant un cache particulier;
ce cache est une variable définie localement dans `cached_addition` et donc accessible depuis `addition`

une fois l'appel à `cached_addition` terminé, son scope local est détruit, ce qui implique la destruction des valeurs qu'il contient; le `cache` lui survit puisqu'il continue à être utilisé par la fonction `addition`

ce qu'il se passe c'est que la fonction `addition` crée une closure qui emprisonne les variables des scopes parents qu'elle utilise; cela permet à des valeurs d'être toujours référencées (la fonction `addition` possède un attribut spécial `__closure__`)

l'intérêt des closures c'est que plusieurs appels à `cached_addition` distincts renverront des fonctions utilisant un cache différent, parce qu'il s'agira à chaque fois d'une nouvelle variable locale

le mécanisme des closures est souvent utilisé au sein des décorateurs puisqu'il permet de facilement attacher des variables à une fonction créée dynamiquement

la closure permet la persistance en mémoire de certaines valeurs en les capturant; mais elle n'est pas éternelle et disparait naturellement quand elle est elle-même déréférencée (i.e. quand la fonction qui emprisonne ces valeurs disparait)

```
def cached_addition():
  cache = {}
  def addition(x,y):
    if(x,y) not in cache:
      print(f'Computing {x} + {y}')
      cache[x,y] = x + y
    return cache[x,y]
  return addition
addition = cached_addition()
addition(1,2)
# Computing 1 + 2
# 3
addition(1,2)
# 3
addition(2,3)
# 
# Computing 2 + 3
# 5
```

##### Délimitation d'un scope

le niveau d'indentation n'a pas d'incidence sur le scope; seules les classes et les fonctions permettent de définir des nouveaux scopes
(cela peut être particulièrement dans les boucles `for`: leur variable d'itération n'est pas propre à la boucle !)

peut être embêtant si capturé dans une closure dans une closure propre à la boucle

```
functions = []
for i in range(3):
  def add_func(x):
    return i+x
   functions.append(add_func)   
[f(0) for f in functions]
#[2,2,2]

```

toutes les fonctions renvoient la même valeur car toutes accèdent à la même variable `i` qui vaut 2 en sortie de boucle

dans ce genre de cas, la solution peut être de créer une fonction englobante et de l'appeler afin de tirer profit du mécanisme des closures

```
functions = []
for i in range(3):
  def get_add_func(i):
    def add_func(x):
      return i+x
    functions.append(get_add_func(i))   
[f(0) for f in functions]
#[0,1,2]
```

##### Variables non déclarées ou  non définies

`NameError`: levée si le nom d'une variable n'existe pas, i.e. n'est pas déclarée ni dans le scope courant ni dans les parents

```
def func():
  print(x)
func()
# NameError 'x' not defined
```

`UnboundLocalError`: levée pour une variable déclarée mais non définie

```
def func():
  print(x)
  x = 0
func()
# UnboundLocalError 'x' referenced before assignment
```
erreur courante quand on souhaite redéfinir une variable globale après l'avoir utilisée mais en omettant le mot-clé global

```
var = 0
def func1():
  print(var)
  var = 10
func1()
# UnboundLocalError 'var' referenced before assignment
```
après correction

```
var = 0
def func2():
  global var
  print(var)
  var = 10
func2()
#0
var
#10
```
















