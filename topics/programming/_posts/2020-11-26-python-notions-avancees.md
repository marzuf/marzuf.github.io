Source: zeste de savoir (15.01.2019)

### Notions avancées de Python

##### Conteneurs

conteneur = objet ayant vocation à en contenir d'autres (e.g. chaines de caractères, listes, dictionnaires, etc.)

plusieurs types de conteneurs (e.g. subscriptables)

subscriptables (i.e. objets sur lesquels l'opéraeur `[]` peut être utilisé); 2 catégories non exclusives
1) indexables = ceux pouvant être indexés avec des nombres entiers
2) sliceables = ceux pouvant être indexés avec des slices

séquence = indexable + sliceable

mapping = conteneur associant des valeurs à des clefs (e.g. dictionnaires)

les séquences et mappings se caractérisent aussi par le fait qu'ils possèdent une taille

les conteneurs sont des objets contenant d'autres objets; se caractérisent par l'opérateur `in`

 l'opérateur `in` fait appel à la méthode `__contains__` (opérande gauche en paramètre); il suffit d'implémenter cette méthode pour faire d'un objet un conteneur

de nombreux conteneurs sont également caractérisés par le fait qu'ils possèdent une taille (nombre fini et connu d'éléments); peuvent être passés en argument à la fonction `len`; cette fonction fait appel à la méthode spéciale `__len__` (aucun paramètre)

objets indexables: accès aux éléments par l'opérateur `[]`; comportement interne régi par 3 méthodes: `__getitem__`, `__setitem__`, `__delitem__`

on peut créer un proxy (= objet prévu pour se substituer à un autre) pour une liste en implémentant ces méthodes
 
slices: pour découper un objet en morceaux; sont une syntaxe particulière pour l'indexation à l'aide du caractère `:` lors des appels à `[]`

le slice peut prendre jusqu'à 3 nombres (indice de départ, indice de fin, pas)

les slices peuvent également servir pour la modification et la suppression

ce sont les 3 mêmes méthodes (`__getitem__`, `__setitem__`, `__delitem__`) qui sont appelées; c'est juste que dans ce cas le paramètre qui leur est passé n'est pas un nombre mais un objet de type slice 

```
s = slice(1,-1)
'abcdef'[s]
# 'bcde'
'abcdef'[slice(None, None,2)]
# 'ace'
```

le slice se construit avec 3 nombres et l'objet contient ainsi 3 attributs `start`, `end` et `step`

```
s = slice(1,2,3)
s.start
# 1
s.end
# 2
s.step
# 3
```

le module `collections` contient des conteneurs utiles de la bibliothèque standard

* `namedtuple`: similaire aux tuples dont ils héritent; ajoutent la possibilité de référencer les champs du tuple par un nom plutôt que par un index

```
from collections import namedtuple

Point2D = namedtuple('Point2D', ['x', 'y'])
p = Point2D(3,5)
p.x
# 3
p.y
# 5
Point2D(x=1,y=2)
# Point2D(x=1,y=2)
```

* `deque`: double-ended queues; les éléments sont vus comme maillons liés les uns aux autres plutôt que comme des éléments d'un tableau; meilleures performances pour l'insertion/suppression d'éléments en tête et queue de liste, mais moins bonnes pour l'accès en milieu de liste; méthodes `appendleft`, `extendleft` et `popleft` qui travaillent sur l'extrémité gauche, en plus des habituelles `append`, `extend` et `pop` qui travaillent sur celle de droite; elles ont aussi la possibilité d'être limitées en taille, en supprimant les éléments les plus à droite lors d'une insertion à gauche et inversement

```
from collections import deque
d = deque([1,2,3])
d.append(4)
d.appendleft(0)
d
# deque([0,1,2,3,4])
d = deque([],2)
d
# deque([], maxlen=2)
d.append(1)
d.append(2)
d
# deque([1,2], maxlen=2)
d.append(3)
d
# deque([2,3], maxlen=2)
```

* `ChainMap`: structures permettant de grouper (chainer) plusieurs dictionnaires (ou mappings) sans les fusionner, ce qui leur permet de se tenir à jour; se comportent comme des dictionnaires et s'occupent de rechercher les éléments dans les mappings qui lui ont été donnés à la construction; lors d'insertion, nouveaux éléments ajoutés au premier mapping; l'attribut `mappings` permet d'obtenir la liste des mappings; la méthode `new_child` pour créer un nouveau `ChainMap`à partir de l'actuel en ajoutant un dictionnaire à gauche; l'attribut `parents` pour obtenir les parents de l'actuel (i.e. le `ChainMap` composé des mêmes mappings excepét le plus à gauche); utile pour gérer des contextes/espaces de noms imbriqués

```
from collections import ChainMap
d1 = {'a':0, 'b':1}
d2 = {'b':2, 'c':3}
d3 = {'d':4}
c = ChainMap(d1,d2,d3)
c
# ChainMap({'b':1,'a':0'}, {'c':3,'b':2}, {'d':4})
c['a'], c['b'], c['c'], c['d']
# (0,1,2,3,4)
c['e'] = 5
c
# ChainMap({'e':5,'b':1,'a':0'}, {'c':3,'b':2}, {'d':4})
d1
# {'e':5,'b':1,'a':0'}
d2['f'] = 6
c['f']
# 6

c.maps
# [{'e':5,'b':1,'a':0'}, {'c':3,'b':2,'f':6}, {'d':4}]
c.new_child()
# ChainMap({},{'e':5,'b':1,'a':0'}, {'c':3,'b':2,'f':6}, {'d':4})
c.new_child({'a':7})
# ChainMap({'a':7},{'e':5,'b':1,'a':0'}, {'c':3,'b':2, 'f':6}, {'d':4})
c.parents
# ChainMap({'c':3,'b':2, 'f':6}, {'d':4})
```
* les compteurs sont des dictionnaires un peu spéciaux qui servent à compter les éléments; il existe quelques méthodes utiles pour manipuler les Counter (e.g. `elements()`, `most_common()`, `update()`, `substract()`)

```
from collections import Counter
c = Counter([1,2,3,1,3,1,3,1,5])
c
# Counter({1:3,3:2,2:1,5:1})
c[3]
# 2
c[4]
# 0
c[5] += 1
c
# Counter({1:3,3:2,5:2,2:1})
c + Counter({1:2,2:3)
# Counter({1:5,2:4,3:2,5:2})

list(c.elements())
# [1,1,1,2,3,3,5,5]
c.most_common()
# [(1,3),(3,2),(5,2),(2,1)]
c.most_common(2)
# [(1,3),(3,2)]
c.update({5:1})
c
# Counter({1:3,5:3,3:2,2:1})
c.substract({2:4})
# Counter({1:3,5:3,3:2,2:-3})
+c # éléments positifs
# Counter({1:3,5:3,3:2})
-c # éléments positifs
# Counter({2:3})
```

* les dictionnaires ordonnés (OrderedDict) sont des dictionnaires où l'ordre d'insertion est conservé et sont itérés dans cet ordre; sinon semblable à tout autre dictionnaire

```
from collections import OrderedDict
d = OrderedDict(b=0,a=1,c=2)
# dans les versions précédentes, l'ordre des paramètres nommés n'est pas assuré, il faut passer par un conteneur
d = OrderedDict([('b', 0), ('c', 2), ('a', 1)])
```

* dictionnaires à valeurs par défaut: les compteurs sont un exemple de dictionnaires à valeurs par défaut (quand un élément n'existe pas, 0 est retourné); les `defaultdict` sont plus génériques, prennent en paramètre une fonction servant à initialiser les éléments manquants

```
from collections import defaultdict
d = defaultdict(lambda: 'x')
d[0] = 'a'
d[2]
# 'x'
```
* wrappers: 3 classes permettent par héritage de créer ses propres types de dictionnaires (`UserDict`), listes (`UserList`) ou chaines de caractères (`UserString`); ces classes datent cependant du temps où il était impossible d'hériter des types dict, list, ou str (ont perdu de leur utilité)

##### Iterables

itérable = objet dont on peut parcourir les valeurs (e.g. à l'aide d'un `for`)

comment fonctionne un `for`à l'interne ?
* appel à la fonction `__iter__`; cette méthode retourne un itérateur; l'itérateur est l'objet qui va se déplacer le long de l'itérable
* pas à pas le `for`appelle `next` en lui précisant l'itérateur; `next` en appelant `__next__` fait avancer l'itérateur et retourne la nouvelle valeur découverte à chaque pas
* une exception `StopIteration` est levée quand l'itérateur arrive à la fin (`for` capture cette exception pour nous)

```
numbers = [1,2,3,4,5]
iter(numbers)
# list_iterator
iterator = iter(numbers)  # iter() retourne un itérateur
next(iterator)  # next() s'appliquer sur l'itérateur et fait retourner la valeur suivant à chaque pas
# 1
next(iterator) 
# 2
next(iterator) 
# 3
next(iterator) 
# 4
next(iterator) 
# 5
next(iterator)
StopIteration
```
résumé:
* iter() fait appel à la méthode `__iter__` de l'itérable
* next() fait appel à la méthode `__next__` de l'itérateur

donc:
* un itérable est un objet possédant une méthode `__iter__` retournant un itérateur
* un itérateur est un objet possédant une méthode `__next__` retournant la valeur suivante à chaque appel et levant une exception de type `StopIteration` en fin de cours

à noter que les itérateurs sont des itérables à part entir: ils doivent aussi avoir une méthode `__iter__` où il se retourne lui-même 

particularité des indexables et de la fonction `iter`, qui est capable de créer un itérateur à partir de ces derniers (implémentation de la méthode `__iter__` pas nécessaire); l'itérateur se contente d'appeler `__getitem__` sur l'objet avec des indices successifs (en partant de 0, jusqu'à lever une exception `IndexError`)$

itérables souvent utilisés dans les fonctions builtins de Python (e.g. `map` retourne un itérable, `list` peut prendre n'importe quel itérable) 

`iter`: crée un itérateur à partir d'un itérable; peut aussi créer un itérateur à partir d'une fonction et d'une valeur de fin (i.e. fonction appelée tant que valeur de fin pas retournée), e.g.:

```
n = 0
def iter_func():
  global n
  n += 1
  return n
for i in iter(iter_func, 10):
  print(i)
```

fonctions pratiques du module `itertools`:

* `chain(p,q,...)`: met bout à bout plusieurs itérables
* `islice(p,start,stop,step)`: semblable aux slices, mais avec des itérables (pas besoin d'avoir un objet indexable)
* `combinations(p,r)`: retourne toutes les combinaisons de `r` éléments possibles dans `p`
* `zip_longest(p,q,...)`: similaire à `zip` mais s'aligne sur l'itérable le plus grand plutôt que le plus petit (permet de spécifier valeur de remplissage)

unpacking: permet de décomposer un itérable en plusieurs variables

utilisé par exemple quand on assigne chaque valeur à une variable différente sur une ligne; dans ce cas, tout type d'itérable est accepté; c'est cette fonctionnalité qui est à l'origine de l'assignement multiple et de l'échange de variables

```
values = [1,3,5]
a,b,c = values

a,b,c = range(1,6,2)
a,b,c = {1,3,5} # l'ordre n'est pas assuré dans ce cas

x,y = 10,20    # à gauche et à droite sont des tuples; celui de droite eset décomposé pour correspondre aux variables de gauche
x,y = y,x

# on peut avoir la même chose avec des listes
x,y = 10,20
(x,y) = (10,20)
[x,y] = [10,20]
```

il est possible de faire de l'unpacking avec des variables imbriquées les unes dans les autres

```
a, ((b,c,d), e), (f,g) = [0, (range(1,4),5),'67']
```

l'opérateur splat: représenté par `*`; il s'agit dans ce cas d'un opérateur unaire; à gauche lors d'une assignation, il permet de récupérer plusieurs éléments lors d'une décomposition; la variable précédée du splat devient une liste dont la taille s'ajuste en fonction du nombre d'éléments

```
head, *tail  = range(10)
head
# 0
tail
# [1,2,3,4,5,6,7,8,9]
head, second, *middle, last  = range(10)
head
# 0
second
# 1
middle
# [2,3,4,5,6,7,8]
last
# 9
```
depuis Python 3.5, le splat peut aussi être utilisé à droite; effet inverse: décompose un itérable comme si les valeurs étaient rentrées une à une

```
values = *[0,1,2], 3,4, *[5,6], 7
values
# 0,1,2,3,4,5,6,7

first, *middle, last = *[0,1,2], 3,4, *[5,6], 7
first 
# 0
middle
# 1,2,3,4,5,6
last
# 7
```

##### Objets mutables et hashables

mutabilité = capacité des objets à être altérés, modifiés (ne pas confondre modification et réassignation (=fait correspondre un nom de variable à un nouvel objet) !)

hashabilité = possibilité pour un objet d'être hashé, i.e. en calculer un condensat qui permet entre autres d'être utilisé comme clé dans un dictionnaire

objets immutables: `bool`, `int`, `str`, `bytes`, `tuple`, `range`, `frozenset` 
objets mutables: tous les autres (listes, dictionnaires, classes personnalisées)

utiliser les objets mutables avec prudence car peuvent être changés à notre insu

```
# avec une liste, la liste initiale est modifiée
def append_42(values):
  values.append(42)
  return values
v = [1,2,3,4]
append_42(v)
[1,2,3,4,42]
v
[1,2,3,4,42]

# ce qui  n'arrive pas avec  un tuple
def append_42(values):
  return values + (42,)
v = (1,2,3,4)
append_42(v)
# (1,2,3,4,42)
v
# (1,2,3,4)
```

il n'est pas vraiment possible de créer un nouveau type immutable (simuler en créant les méthodes qui l'émulent); la seule manière sûre est d'hériter d'un type immutable (e.g. `namestuple` héritent de `tuple`)

égalité = valeurs partagent le même état (`==`)
identité = valeurs sont la même instance, i.e. un même objet en mémoire (`is`)

différence fondamentale pour les types mutables (deux valeurs distinctes peuvent être égales à un moment mais pas à un autre; mais deux valeurs identiques resteront égales puisque les modifications sont perçues sur les deux variables)

```
values1, values2 = [1,2,3], [1,2,3]
values1 == values2
# True
values1 in values2
# False

values = othervalues = [0,1,2]
values = [0,1,2,3] # réassignation
values
# [0,1,2,3]
othervalues
# [0,1,2]

values1 = values2 = [0,1,2]
values1 == values2
# True
values1 is values2
# True
values1.append(4)
values1 == values2
# True
```
l'opérateur d'égalité est surchargeable via la méthode spéciale `__eq__`

l'opérateur d'identité testant si 2 objets sont une même instance, il n'est évidemment pas possible de le surcharger; en absence de surcharge, l'opérateur d'égalité donnera le même résultat que l'identité

généralement c'est l'opérateur `== ` que l'on utilise; `is`s'utilise principalement avec `None`; `None` est  une valeur unique (singleton): il n'en existe qu'une instance (pour comparer une valeur avec `None`, on vérifie qu'elle est `None`, et non qu'elle vaut `None`)

globalement:
* `is` s'utilise pour la comparaison avec des singletons
* `==` s'utilise pour le reste

on appelle condensat (hashable) un nombre calculé depuis une valeur quelconque unique et invariable pour cette valeur; 2 valeurs égales partageront un même hash, deux valeurs différentes auront dans la mesure du possible des hashs différents (le condensat étant de taille fixe, il existe un nombre limité de hash); deux valeurs différentes peuvent avoir le même hash (collision); l'égalité entre hashs ne doit jamais remplacer l'égalité entre les valeurs (étape préliminaire qui peut servir à optimiser le calcul)

le condensat peut se calculer avec la fonction `hash`

pourquoi les listes ne sont pas hashables ? le hash est invariable, mais il doit pourtant correspondre à une valeur; mais en modifiant une liste, le condensat calculé auparavant deviendrait invalide; il est donc impossible de hasher les listes, de même que les dictionnaires et les sets; tous les autres types d'objets sont par défaut hashables

corrélation entre hashable et mutable: plus facile d'assurer l'invariabilité du condensat quand l'objet est immutable; pour les objets mutables, le hash n'est possible que si la modification n'altère pas l'égalité entre 2 objets (i.e. 2 objets égaux le resteront même si l'un est modifié)

des types immutables peuvent contenir des mutables (e.g. une liste dans un tuple); dans ce cas, la non-hashabilité des valeurs contenues rend non-hashable le conteneur

```
t = ((0,1),(1,2))
hash(t)
# possible car contient des non-mutables
t = ([0,1],[1,2])
hash(t)
# TypeError: unhashable type: list # -> impossible car contient des mutables
```
les dictionnaires utilisent des condensats (parfois appelés tables de hashage); doivent permettre un accès rapide aux éléments; à l'aide des hash, les dictionnaires disposent les éléments tels que dans un tableau et offrent un accès direct à la majorité d'entre eux

les hash sont en outre aussi utilisés dans les `set` (ensembles non ordonnés de valeurs uniques)

les objets non hashables ne peuvent pas être utilisés en tant que clefs de dictionnaire ou dans un ensemble

```
{[0]: 'foo'}
# TypeError: unhashable type list
{{'foo':'bar'}}
# TypeError: unhashable type dict
```
les hash peuvent être utilisés pour optimiser les tests d'égalité entre 2 objets; le hash étant invariable, il est possible de ne le calculer qu'une fois par objet (en stockant sa valeur)

lors d'un test d'égalité on peut facilement dire que les objets sont différents si les hash le sont (inverse pas vrai à cause des collisions); si les hash sont égaux, le test d'égalité (`==`) doit toujours être fait si les hash sont égaux

les types personnalisés sont par défaut hashables puisuqe l'égalité entre objets vaut l'identité; la question de hashabilité se pose seulement si l'opérateur `__eq__` est surchargé; dans ce cas, il convient normalement de surcharger également `__hash__` (méthode spéciale qui sera appelée par `hash()`)

il est aussi possible d'assigner `None` à `__hash__` afin de rendre l'objet non-hashable; Python le fait par défaut lorsque nous surchargeons `__eq__`; si `__hash__` est quand même surchargée, il faut veiller à 
* l'invariabilité du hash
* l'égalité entre deux hash de valeurs égales
ces conditions sont plus faciles à respecteur pour des variables immutables

le résultat de la méthode `__hash__` est tronqué par `hash` afin de tenir sur un nombre fixe de bits

##### Les callables

un callable est un objet que l'on peut appeler (opérateur `()`)

callables: les fonctions, mais aussi tous les objets derrière lesquels on peut placer une paire de parenthèses pour les appeler

on peut vérifier si un objet est callable avec la fonction `callable()`

paramètres = décrits lors de la définition de la fonction; ont un nom et potentiellement une valeur par défaut

arguments = valeurs passées lors de l'appel 

l'appel de fonction peut se faire avec des arguments positionnels ou nommés (selon la définition)

packing: l'opérateur splat permet ici de récupérer le tuple des arguments positionnels passés lors d'un appel; peut être  utilisé avec d'autres paramètres; les paramètres avant `*args` peuvent recevoir des arguments positionnels ou nommés, mais ceux placés après ne peuvent recevoir que des arguments nommés (puisque `*args` aura récupéré la liste des arguments positionnels)

```
def func(*args):  # souvent appelé args par convention
  print(args)
func(1,2,3,'a')
(# 1,2,3,'a')

def func2(foo, *args):  # souvent appelé args par convention
  print(foo)
  print(args)
func(1,2,3,'a')
# 1
# (2,3,'a')

def func3(foo, *args, bar):
  print(foo)
  print(args)
  print(bar)
func(1,2,3,'a', 'b', None)
# TypeError: func() missing 1 required keyword-only argument 'bar'
func(1,2,'a', bar='c')
# 1
# (2,'a')
# 'c'
```

splat peut s'utiliser sans nom de paramètre pour marquer une distinction entre type d'arguments; dans ce cas, aucune récupération de la liste des arguments nommés n'est opérée; paramètre à gauche peut prendre un argument positionnel ou nommé, alors que celui à droite ne peut recevoir qu'un argument nommé; à droite (contrairement à gauche) du splat, les paramètres reçoivent des arguments nommés donc sans notion d'ordre

le double splat (`**`) sert à récupérer le dictionnaire des arguments nommés; doit se placer après tous les paramètres; habituellement nommé `kwargs`

```
def func(a, b=1, **kwargs):
  print(kwargs)
func(0)
# {}
func(0,b=2)
# {}
func(0, c=3)
# {'c':3}
```
en combinant splat et double splat on peut ainsi récupérer l'ensemble des arguments (positionnels et nommés)

à côté des arguments de fonction, le splat sert aussi pour les assignations; le double splat n'a lui aucune autre signification

ces opérateurs servent aussi pour l'appel de fonctions: unpacking; permet de transformer un itérable en arguments positionnels avec le splat et un dictionnaire (ou autre mapping) en arguments donnés avec le double splat

```
def addition_3(a,b,c):
  return a + b + c

addition_3(*[1,2,3])
# 6
addition_3(*[1,2],3)
# 6
addition_3(**{'b':1, 'a':2, 'c':3})
# 6
addition_3(3, **{'b':1, 'a':2})
# 6
addition_3(1, *[2], **{'c':3})
# 6
addition_3(*range(3)) # splat fonctionne avec tous les itérables
# 6
```

il est ainsi également possible de relayer les paramètres reçus par  une fonciton à une autre fonction sans les préciser explicitement

```
def proxy_addition_3(*args, **kwargs):
  return addition_3(*args, **kwargs)
```
pour Python < 3.5, chaque opérateur splat ne pouvait être utilisé qu'une fois dans l'appel et `*` devait être placé après tous les arguments positionnels

un callable est un objet qui possède une méthode spéciale `__call__`; les paramètres sont les arguments passés lors de l'appel et la valeur renvoyée est le retour de l'appel

deux modules contenant des collections de callables: `operator` et `functools`; `operator` regroupe l'ensemble des opérateurs Python et a la particularité de retourner des callables

* `operator.itemgetter` permet de récupérer un élément précis depuis un indexable à la manière de l'opérateur `[]`
* `operator.methodcaller` permet d'appeler une méthode prédéterminée d'un objet avec ses arguments
* `functools.partial` permet de réaliser un appel partiel de fonction 
* `functools.reduce` permet de transformer un itérable en une valeur unique (itère sur l'ensemble et applique une fonction à chaque valeur)
utilisation de `partial`: e.g. dans le cas d'une fonction prenant divers paramètres que l'on veut appeler en fixant un seul premier paramètre, l'application partielle de la fonction crée un nouveau callable'

```
from functools import partial
import operator

mul_5 = partial(operator.mul, 5)
mul_5(3)
# 15
mul_5('z')
# 'zzzzz'

from functools import reduce
reduce(operator.add, [5,8,1])
# 14
```
##### Annotations et signatures

```
def addition(a: int, b: int) -> int:
  return a+b
```
annoter un paramètre en le faisant suivre de `:` et ajouter le type attendu après `->`; les annotations ne sont là qu'un titre indicatif, dans un but de documentation

le module `typing` présente une collection de classes pour copmoser des types

```
from typing import Union
Number = Union[int, float, complex]

def addition(a:Number,b:Number) -> Number:
  return a+b 
```

autres types génériques de ce module pour des annotations plus précises, e.g.: List[str], Sequence[str], Callable[[str,int], str], etc.

il est aussi possible d'annoter les variables et les attributs; même syntaxe que pour les paramètres; aussi purement indicatif, mais stockées dans le dictionnaire `__annotations__` du module ou de la classe

```
max_value:int = 10 # définition d'une variable max_value annotée comme int
min_value:int # annotation, mais sans définition
__annotations__
# {'max_value': <class 'int'>, 'min_value': <class 'int'>}
min_value
# NameError: name 'min_value' not defined
```
les docstrings sont des chaines de caractères à placer en tête de fonction, d'une classe ou d'un module; servent à décrire ces objets et sont accessibles dans l'aide fournie par `help`; sont aussi accessibles par l'attribut spécial `__doc__`

`inspect`est un module de la bibliothèque standard qui permet d'extraire des informations complémentaires sur les objets Python; ex: `ismodule`, `isclass`, `isfunction`, `isbuiltin`, `getsource`, `getdoc` (par rapport à l'attribut `__doc__`, la documentation est nettoyée par la fonction `cleandoc`)...

ce module contient également la méthode `signature` qui retourne la signature d'une fonction

signature = ensemble des paramètres (avec noms, positions, valeurs par défaut et annotations) ainsi que l'annotation de retour d'une fonction

les objets retournés par `signature` sont de type `Signature` et comportent notamment un dictionnaire ordonné des paramètres (attribut `parameters`) et l'annotation de retour (`return_annotation`)

les paramètres sont encore un nouveau type d'objets, `Parameter`; ces objets possèdent un nom (`name`), une valeur par défaut (`default`), une annotation (`annotation`) et un type de positionnement (`kind`)

les types de positionnement peuvent être: POSITIONAL_ONLY, POSITIONAL_OR_KEYWORD (les plus courants: tous les paramètres à gauche d'`*args`), VAR_POSITIONAL, KEYWORD_ONLY (paramètres à droite d'`*args'), VAR_KEYWORD

il n'existe aucune syntaxe en Python pour définir des paramètres positional-only (existent dans certains builtins, e.g. `range`)

rappel: il est possible d'avoir des paramètres keyword-only sans pour autant définir `*args` (en ayant `*` dans la liste des paramètres, juste à gauche des keyword-only)

les objets Signature sont aussi pourvus d'une méthode `bind` qui reçoit les mêmes arguments que la fonction cible et retourne un objet de type `BoundArguments` qui fait la correspondance entre paramètres et arguments; l'objet `BoundArguments` avec ses attributs `*args`et `**kwargs` pourra ensuite être utilisé pour appeler la fonction cible; cela permet de résoudre les paramètres pour n'avoir dans les `kwargs` que les keyword-only et les autres (ceux qui peuvent être positionnels) dans `args`; permet ainsi d'avoir une représentation unique des arguments de l'appel

Python >= 3.5: autre fonctionnalité de `BoundArguments` est de pouvoir appliquer les valeurs par défaut aux paramètres

la méthode `replace`des objets `Signature` et `Parameter` permettent de retourner une copie de l'objet en modifiant un ou plusieurs attributs; sur les signatures elle permet de modifier `parameters` et `return_annotation`


##### Décorateurs

décoration: appliquer un décorateur à une fonction afin de retourner un nouvel objet (généralement une fonction)

le décorateur est un callable prenant un callable en paramètre et pouvant retourner tout type d'objet

le décorateur est appliqué au moment de la définition de la fonction, et non lors de ses appels

```
def print_decorator(function):
  def new_function(a,b): # nouvelle fonction se comportant comme la fonction à décorer
    print('addition des nombres {} et {}'.format(a,b))
    ret = function(a,b) # appel de la fonction originale
    print('retour: {}'.format(ret))
    return ret
  return new_function
  
@print_decorator
def addition(a,b):
  return a+b
addition(1,2)
# addition des nombres 1 et 2
# retour: 3
```

on peut spécifier autant de décorateurs que l'on veut, en les plaçant les uns à la suite des autres; les décorateurs spécifiés en premiers sont ceux qui seront appliqués en dernier

les décorateurs s'appliquent aux fonctions et aux méthodes, s'appliquent aussi aux déclarations de classe

décorateur paramétré: `@` ne doit pas nécessairement être suivi d'un nom d'objets, des arguments peuvent s'y ajouter à l'aide de parenthèses; un décorateur paramétré est un callable retournant un décorateur simple

```
def param_print_decorator(before, after):   # décorateur paramétré
  def decorator(function): # décorateur
    def new_function(*args, **kwargs):   # fonction qui remplacera la fonction décorée)
```

les fonctions `update_wrapper` et `wraps` du module `functools` permettent de copier les informations d'une fonction vers une nouvelle

`update_wrapper` prend en 1er paramètre la fonction à laquelle ajouter les informations et celle dans laquelle les puiser en second

`wraps` retourn un décorateur lorsqu'appelé avec une fonction; la fonction décorée prendra les informations de la fonction passée à l'appel de `wraps`

##### Générateurs

les générateurs sont des itérables mais aussi des itérateurs (i.e. se consomment quand on les parcourt); sont généralement créés par des fonctions construites à l'aide du mot-clef `yield`; par abus de langage ces fonctions génératrices sont parfois elles-mêmes appelées générateurs

un générateur est construit à partir d'une fonction; pour être génératrice, une fonction doit contenir un ou plusieurs `yield`

`yield` peut être suivi ou non d'une expression; la valeur retournée par `next` sera celle apposée au `yield`, ou `None` dans le cas où aucune valeur n'est spécifiée

```
def function():
  yield 4
  yield 
  yield 'haj'
gen = function()
next(gen)
# 4
next(gen)
# None
next(gen)
# 'haj'
next(gen)
# StopIteration
list(gen)   # tout le générateur a été parcouru
# []
# peut aussi se parcourir avec un for
for i in function():
  print(i)
# 4
# None
# 'haj'
```
il est possible pour une fonction génératrice d'utiliser `return`, qui aura pour effet de le stopper par `StopIteration`
```
def function():
  yield 4
  yield 
  return 2
  yield 'haj'
gen = function()
next(gen)
# 4
next(gen)
# None
next(gen)
# StopIteration :2
```

le générateur en lui-même ne retourne rien (n'est pas callable), il produit des valeurs à l'aide de `yield`; le générateur peut également être paramétré via les arguments passés à la fonction

```
def fibonacci(n, a=0, b=1):
  for _ in range(n):
    yield a
    a,b = b,a+b
list(fibonacci(10))
# [0,1,1,2,3,5,8,13,21,34]
list(fibonacci(5,6,7))
# [6,7,13,20,33]
```
altérer un générateur avec `send`: les générateurs sont dotés d'une méthode `send`; le paramètre reçu par cette méthode sera transmis au générateur

au moment où il arrive sur une instruction `yield`, le générateur se met en pause; lors de l'itération suivante, l'exécution reprend au niveau de ce même `yield`; quand ensuite on appelle la méthode `send` du générateur, en lui précisant un argument, l'exécution reprend; et `yield` retourne la valeur passée à `send`

attention donc: un appel à `send` produit une itération supplémentaire dans le générateur; `send` retourne alors la valeur de la prochaine itération comme le ferait `next`

```
gen = fibonacci(10)
next(gen)
# 0
next(gen)
# 1
gen.send('test') # le send consomme une itération (assign 'test' to entry point)
# 1
next(gen)
# 2
```

```
x = yield i  # value i returned by next; x assigned by send; same statement that does both
```

```
yield i # stopped here; won't continue until next() or send() is called & entrypoint of next() or send()
x = input_of_send 
```

```
def fibonacci(n, a=0, b=1):
  for _ in range(n):
    ret = yield a
    print('retour:', ret)
    a,b = b,a+b
gen = fibonacci(10)
next(gen)
# 0
next(gen)
# retour: None
# 1
gen.send('test')
# retour: 'test'
# 1
next(gen)
# retour: None
# 2
```
il est impossible d'utiliser `send` avant le premier `yield` (puisqu'il n'existe aucun précédent `yield` qui retournerait la valeur)

`send` peut servir pour implémenter une file (queue) par l'intermédiaire d'un générateur; on peut ajouter de nouveaux éléments à la queue via `send`

```
def queue(*args):
  elems = list(args)
  while elems:
    new = yield elems.pop(0)
    if new is not None:
      elems.append(new)
q = queue('a', 'b', 'c')
next(q)
# 'a'
q.send('d')
# 'b'
next(q)
# 'c'
next(q)
# 'd'
```

les générateurs possèdent des méthodes `__next__` et `send`, également des méthodes `throw` et `close`

`throw` permet de lever une exception depuis le générateur à l'endroit où ce dernier s'est arrêté; elle a pour effet de réveiller le générateur pour lui faire lever une exception du type indiqué; possède 3 paramètres dont 2 facultatifs
1) `type`: type d'exception à lever
2) `value`: valeur à passer en instanciant cette exception
3) `traceback`: permet de passer une pile d'appel (traceback object) particulière à l'exception

l'exception surivent au niveau du `yield` et peut être attrapée par le générateur; si c'est le cas `throw` retournera la prochaine valeur produite par le générateur ou lèvera  une exception `StopIteration` indiquant que le générateur a été entièrement parcouru, à la manière de `next`

si l'exception n'est pas attrapée par le générateur, elle provoque alors sa fermeture et remonte logiquement jusqu'à l'objet ayant fait appel à lui

un cas particulier d'appel à la méthode `throw` est de demander au générateur de s'arrêter en lui faisant lever une exception `GeneratorExit`; à la réception de cette dernière, il est attendu que le générateur se termine (`StopIteration`) ou lève à son tour une `GeneratorExit`

la méthode `close` du générateur permet de réaliser cet appel et d'attraper les `StopIteration`/`GeneratorExit` en retour; puisqu'elle attrape les `StopIteration`, il est possible d'appeler plusieurs fois la méthode `close` sur un même générateur

```
def generator_function():
  for i in range(5):
    try:
      yield i
    except GeneratorExit:
      break
gen = generator_function()
next(gen)
# 0
next(gen)
# 1
gen.close()
next(gen)
# StopIteration
gen.close()
gen.close()
```
`close` s'occupe aussi de lever une `RunTimeError` dans le cas où le générateur ne s'arrêterait pas et continuerait à produire des valeurs

déléguer à un autre générateur avec `yield from`; ce mot clef permet de déléguer l'itération à un sous-générateur pris en paramètre; la rencontre du `yield from` provoque une interruption du générateur courant; le temps d'itérer et produire les valeurs du générateur délégué

```
def big_queue():
  yield 0
  yield from queue(1,2,3)
  yield 4
```

celui-ci agit comme si nous itérons sur `queue(1,2,3)` depuis `big_queue` tout en yieldant toutes ses valeurs

avec `yield from` les paramètres passés lors d'un `send` sont aussi relégués aux sous-générateurs; tout comme sont relayés aux sous-générateurs les appels aux méthodes `throw` et `close`

`yield from` n'attend pas nécessairement un générateur en paramètre, mais n'importe quel type d'itérable

les listes en intension (comprehension lists) sont une syntaxe courte pour définir des listes à partir d'un itérable et d'une expression à appliquer sur chaque élément (un peu à la manière de `map` qui lui ne permet que d'appeler un callable pour chaque élément)

expression = tout ce qui possède une valeur (même `None`), i.e. tout ce qui n'est pas une instruction (`if`, `while`, etc.); les ternaires sont des expressions (`a if predicat() else b` et peuvent donc y être utilisés

cette syntaxe permet aussi d'appliquer des filtres à la manière de `filter` 
```
[x**2 for x in range(10) if x**2 > = 10]
```
une liste en intension peut directement être passée en paramètre à une fonction
```
sum([x**2 for x in range(10)])
```

étant des expressions, elles peuvent être imbriquées
```
[[x+y for x in range(5)] for y in range(3)]
```

il est possible de parcourir plusieurs niveaux de listes dans une seule liste en intension
```
matrix = [[0,1,2],[3,4,5],[6,7,8]]
[elem + 1 for line in matrix for elem in line]
```
les `for` se placent dans l'ordre des dimensions !

de la même manière que pour les listes, on peut définir des générateurs en intension (generator expressions); la syntaxe est similaire, il suffit de remplacer les crochets par des parenthèses pour passer d'une liste à un générateur; garder à l'esprit qu'ils se consomment !

```
squares = (x**2 for x in range(10))
# squares est ici un generator object
list(squares)
# [0,1,4,9,16,25,36,49,64,81]
list(squares)
# []
```

il est possible de simplifier encore la syntaxe quand un générateur en intension est seul paramètre d'une fonction en supprimant les parenthèses redondantes

```
sum((x**2 for x in range(10)))
# 285
# est équivalent à 
sum(x**2 for x in range(10))
# 285
```

liste ou générateur
* les listes prennent généralement plus de place en mémoire (tous les éléments existent en même temps); pour un générateur, l'élément n'existe que quand l'itérateur l'atteint et n'existe plus après
* les générateurs peuvent être infinis
* les générateurs ne sont pas indexables
* les générateurs ont une durée de vie plus courte (ne contiennent plus rien une fois qu'on a itéré dessus)
* du fait que les générateurs occupent peu d'espace mémoire, on peut les enchainer sans crainte
```
# ex d'un générateur infini 
def infinite():
  n = 0
  while True:
    yield n
    n+=1

# peuvent être enchainés sans crainte
numbers = (x**2 for x in range(100))
numbers = zip(infinite(), numbers)
numbers = (a+b for (a,b) in numbers)
```

il est possible de tirer profit de l'un et de l'autre en récupérant une liste en fin de chaine, e.g.

```
numbers = [a+b for (a,b) in numbers]
# ou 
numbers = list(numbers)
```

##### Gestionnaires de contexte

contexte = portion de code cohérente, avec des garanties en entrée et en sortie; un contexte est ainsi un scope particulier, avec des opérations exécutées en entrée et en sortie

il est possible de gérer plusieurs contextes dans un même bloc

```
with expr1 as x, expr2 as y:
  ...
```
est équivalent à 
```
with expr1 as x:
  with expr2 as y:
    ...
```
exemple pour ouverture de fichier (avec fermeture implicite)

```
with open('filename', 'w') as f:
  ...
```

les gestionnaires de contexte sont en fait des objets disposant de deux méthodes spéciales `__enter__` et `__exit__`, appelées à l'entrée et à la sortie du bloc; le retour de la méthode `__enter__` sera attribué à la variable spécifiée derrière le `as`

`__enter__` ne prend aucun paramètre 

`__exit__` prend 3 paramètres (`exc_type`, `exc_value`, `traceback`); retourne un booléen intervenant dans la propagation des exceptions

le module `contextlib` fournit des outils utiles pour la gestion de contextes; par exemple 
* le décorateur `contextmanager` qui permet de transformer une fonction génératrice en context manager; cette fonction génératrice devra disposer d'un seul et unique `yield` (tout ce qui est présent avant `yield` sera exécuté en entrée et ce qui se situe sera ensuite exécuté en sortie)
* `closing`: gestionnaire de contexte qui permet de fermer automatiquement un objet 
* `suppress`: gestionnaire de contexte qui permet de supprimer certaines exceptions
* `redirect_stdout`: gestionnaire pour rediriger temporairement la sortie standard du programme

un gestionnaire de contexte peut être utilisé plusieurs fois si l'expression est chaque fois une même variable:

```
class MyContext:
  def __enter__(self):
    print('enter')
    return self

  def __exit__(self, exc_type, exc_value, traceback):
    print('exit')

ctx = MyContext()
with ctx:
  pass
# 'enter'
# 'exit'
with ctx:
  pass
# 'enter'
# 'exit'
```

`MyContext` est un gestionnaire de contexte réutilisable: on peut utiliser ses instances à plusieurs reprises dans les blocs `with` successifs; mais les fichiers tels que retournés par `open` ne sont pas réutilisables par exemple

réentrance: un cas particulier de réutilisabilité, quand un gestionnaire de contexte peut être utilisé dans des `with` imbriqués

```
ctx = MyContext()
with ctx:
  with ctx:
    pass
#enter
#enter
#exit
#exit
```

##### Accesseurs et descripteurs

```
foo.bar
# est équivalent à
getattr(foo, 'bar')

del foo.bar
# est équivalent à
delattr(foo, 'bar')
```

`setattr` appelle la méthode spéciale `__setattr__`

`delattr` appelle la méthode spéciale `__delattr__` 

ces deux méthodes spéciales prennent les mêmes paramètres (en plus de `self`) que les fonctions auxquelles elles correspondent

`getattr`: 2 méthodes spéciales lui correspondent qui prennent en paramètre le nom de l'attribut
* `__getattribute__`: appelée lors de la récupération de tout attribut; par défaut, retourne les attributs définis dans l'objet (i.e. contenus dans le dictionnaire `__dict__`), lève  une `AttributeError` si l'attribut ne l'est pas
* `__getattr__`: réservée aux cas où l'attribut n'a pas été trouvé (si `getattribute` lève une `AttributeError`); n'est pas présente de base dans l'objet, donc pas de comportement par défaut; plutôt conseillé de passer par cette méthode pour impléter les attributs dynamiques

`__dict__` est le dictionnaire contenant les attributs d'un objet Python; créé par défaut lors de la création de l'objet; par défaut, contient tous les attributs définis sur un objet; `__getattribute__` se contente de rechercher l'attribut dans le dictionnaire de l'objet et de ses parents (type de l'objet et classes dont ce type hérite)

si la classe définit un itérable `__slots__` contenant les noms des attributs possibles de l'objet, une structure dynamique telle que le dictionnaire n'est plus nécessaire, `__dict__` ne sera donc pas instancié; si la classe définit un `__slots__`, on ne peut définir d'autres attributs sur l'objet que ceux décrits dans les slots

method resolution order (MRO), e.g. `__getattribute__` qui consulte d'abord le dictionnaire de l'objet puis celui de ses parents

chaque classe possède la méthode `mro` qui retourne un tuple contenant l'ordre des classes à interroger lors de la résolution d'un appel sur l'objet; c'est ce MRO qui définit la priorité des classes parentes lors de l'héritage multiple; c'est lui qui est utilisé lors d'un appel à `super`; en interne la méthode `mro` fait appel à l'atribut `__mro__` de la classe

pour résumer, comportement par défaut de `foo.get_attribute__('bar')`:
1. recherche dans `foo.__dict__` la présence d'une clef `'bar'`, dont on retourne la valeur si la clef existe
2. recherche dans les `__dict__` de toutes les classes référencées par `type(foo).mro()` en s'arrêtant à la première valeur trouvée
3. exception `AttributeError` si l'attribut n'est pas trouvé

dans la liste retournée par la méthode `mro`, les classes à gauche sont prioritaires; le mécanisme de MRO permet d'éviter la présence de doublons dans la hiérarchie

les descripteurs sont une manière de placer des comportements plus évolués derrière des attributs; plutôt que de recourir à `__getattr__`, ils sont un autre moyen d'avoir des attributs dynamiques; les propriétés sont des exemples de descripteurs


un descripteur se définit comme un attribut d'une classe et devient accessible en tant qu'attribut de ses instances; pour cela le descripteur peut implémenter des méthodes spéciales `__get__`/`__set__`/`__delete__` pour la lecture/écriture/suppression respectivement

la méthode `__get__` du descripteur prend 2 paramètres: `instance` et `owner.instance` correspond à l'objet depuis lequel on accède à l'attribut

`__set__` prend simplement l'instance et la nouvelle valeur et `__delete__` se contente de l'instance; contrairement à `__get__`, ne peut s'utiliser que sur les instances

les descripteurs peuvent être pourvus d'une méthode `__set_name__`, appelée pour chaque assignation d'un descripteur à un attribut dans le corps de la classe

le descripteur peut ainsi agir dynamiquement sur la classe en fonction du nom de son attribut

les propriétés sont un moyen de simplifier l'écriture des descripteurs et de leurs 3 méthodes spéciales; `property` est une classe qui, à la création d'un objet, prend en paramètre les fonctions `fget`, `fset` et `fdel` qui seront respectivement appelées par `__get__`, `__set__` et `__delete__`

```
class Temperature:
  def __init__(self):
    self.value = 0
  
  @property
  def celsius(self): # le nom de la méthode devient le nom de la propriété
    return self.value
  @celsius.setter
  def celsius(self, value): # le setter doit porter le même nom
    self.value = value
  @property
  def fahrenheit(self):
    return self.value * 1.8+32
  @fahrenheit.setter:
    self.value = (value-32)/1.8
```
(complément sur les propriétés - source: https://openclassrooms.com/fr/courses/235344-apprenez-a-programmer-en-python/232793-definissez-des-proprietes)

Une propriété ne se crée pas dans le constructeur mais dans le corps de la classe; il s'agit d'une classe, son nom est `property`. Elle attend 4 paramètres, tous optionnels :
1. la méthode donnant accès à l'attribut ;
2. la méthode modifiant l'attribut ;
3. la méthode appelée quand on souhaite supprimer l'attribut ;
4. la méthode appelée quand on demande de l'aide sur l'attribut.

En pratique, on utilise surtout les 2 premiers paramètres.

```
class Personne:
    def __init__(self, nom, prenom): # constructeur
        self.nom = nom
        self.prenom = prenom
        self.age = 33
        self._lieu_residence = "Paris"   # Notez le souligné _ devant le nom !

    def _get_lieu_residence(self):
        print("On accède à l'attribut lieu_residence !")  # comme on est dans la classe, on "peut" accéder à l'attribut même s'il commence par _
        return self._lieu_residence

    def _set_lieu_residence(self, nouvelle_residence):
        print("Attention, il semble que {} déménage à {}.".format(self.prenom, nouvelle_residence))
        self._lieu_residence = nouvelle_residence

    # On va dire à Python que notre attribut lieu_residence pointe vers une propriété
    lieu_residence = property(_get_lieu_residence, _set_lieu_residence)

jean.lieu_residence
# On accède à l'attribut lieu_residence !
# 'Paris'

jean.lieu_residence = "Berlin"
# Attention, il semble que Jean déménage à Berlin.

jean.lieu_residence
# On accède à l'attribut lieu_residence !
# 'Berlin'

```
remarques:

* dans le constructeur, on ne crée pas un attribut `self.lieu_residence` mais `self._lieu_residence` (convention veut qu'on n'accède pas, depuis l'extérieur de la classe, à un attribut commençant par un souligné _)
* on définit une première méthode, commençant elle aussi par un souligné, `_get_lieu_residence`, qui se contente de renvoyer le lieu de résidence (accesseur)
* la seconde méthode, `_set_lieu_residence`, a la forme d'un mutateur, elle prend un paramètre : le nouveau lieu de résidence.
* la dernière ligne est la définition d'une propriété. On lui dit que l'attribut `lieu_residence` (cette fois, sans signe souligné _) doit être une propriété. On définit dans notre propriété, dans l'ordre, la méthode d'accès (l'accesseur) et celle de modification (le mutateur).

Quand on veut accéder à `objet.lieu_residence`, Python tombe sur une propriété redirigeant vers la méthode `_get_lieu_residence`. Quand on souhaite modifier la valeur de l'attribut, en écrivant `objet.lieu_residence = valeur`, Python appelle la méthode `_set_lieu_residence` en lui passant en paramètre la nouvelle valeur.

Il est aussi possible de définir, en 3ème position du constructeur `property`, une méthode qui sera appelée quand on fera `del objet.lieu_residence` et, en 4ème position, une méthode qui sera appelée quand on fera `help(objet.lieu_residence)`.


autre exemple avec utilisation de décorateurs


```
class Mask:
...     def __init__(self, category, price=0):
...         self.brand = category
...         self._price = price
... 
...     @property
...     def price(self):
...         return self._price
... 
...     @price.setter
...     def price(self, new_price):
...         self._price = new_price
... 
...     @price.deleter
...     def price(self):
...         del self._price
... 
mask0 = Mask('N95', 4.5)
# get the price
mask0.price
# 4.5
# set the price
mask0.price = 4.0
mask0.price
# 4.0
# delete the mask
del mask0.price
mask0.price
# Traceback (most recent call last):
#   File "<stdin>", line 1, in <module>
#   File "<stdin>", line 7, in price
# AttributeError: 'Mask' object has no attribute '_price'
```
passer par les propriétés: principe de POO (https://python.doctor/page-apprendre-programmation-orientee-objet-poo-classes-python-cours-debutants)

pourquoi utiliser les propriétés (https://ichi.pro/fr/post/162024459831021):
1. validation des données
2. opérations sur les données (encapsulation)
3. chargement paresseux (les calculs nécessaires sont effectués au moment de la récupération des données)
4. débogage et surveillance

différents types de méthode 
* méthodes de classe 
* méthodes statiques
* méthodes préparées (bound methods)

en fait les méthodes sont des descripteurs vers les fonctions définies à l'intérieur de la classe; ce sont des non-data descriptors, i.e. des descripteurs qui ne définissent ni setter,  ni deleter

```
class A:
  def method(self):
    return self
  @staticmeth
  def staticmeth():
    pass
  @classmethod
  def clsmeth(self):
    return cls
```
comment l'objet courant arrive dans `self`? c'est justement parce qu'il s'agit d'une bound method, i.e. une méthode dont le 1er paramètre est déjà préparé, et il n'y aura pas besoin de le spécifier à l'appel; c'est le descripteur qui joue ce rôle, il est le seul à savoir si on utilise la méthode depuis une instance ou depuis la classe (`instance` valant `None`dans ce dernier cas), et connait toujours le 1er paramètre à passer (`instance`, `owner` ou rien); il peut ainsi construire un nouvel objet (bound method) qui lorsqu'il sera appelé se chargera de relayer l'appel à la vraie méthode en lui ajoutant ce paramètre 

le même comportement est utilisé pour les méthodes de classe où la classe de l'objet doit être passée en 1er paramètre (`cls`)

le cas des méthodes statiques est le plus simple: il ne s'agit que de fonctions qui ne prennent pas de paramètres spéciaux, donc qui ne nécessitent pas d'être décorées par le descripteur

à noter que `A.method` retourne une fonction et non une méthode préparée, il faut indiquer une instance lors de l'appel

##### Types

tout n'est pas objet en Python (e.g. une instruction n'est pas un objet); mais toutes les valeurs que l'on peut manipuler sont des objets

comment reconnaitre un objet ? tout ce qui peut être assigné à une variable

tout objet est instance d'une classe; la classe est le type de l'objet; donc tout objet a un type, qui peut être récupéré grâce à la fonction `type`

si les classes sont des objets, quel est leur type ? une classe est une instance de la classe `type` (i.e. nous instancions la classe `type` pour en créer une nouvelle; `type(myclass)` vaudra `<class 'type'>)

une classe telle que `type` permet d'instancier d'autres classes est appelée métaclasse

dans le cas où nous créons une classe par héritage, c'est aussi une instanciation de `type` qui est réalisée en interne

les classes (ou type objects) sont un ensemble d'objets qui possèdent quelques caractéristiques communes
* elles héritent d'object (mise à part object elle-même)
* elles sont des instances plus ou moins directes de type (de type ou de classes héritant de type)
* on peut en hériter
* elles peuvent être instanciées (sont des callables, qui retournent des objets de ce type)

la méthode spéciale `__init__` est souvent appelée constructeur de l'objet; c'est un abus de langage: cette méthode ne construit pas l'objet mais intervient après la création de ce dernier pour l'initialiser

le vrai constructeur d'une classe 'est `__new__`; cette méthode prend la classe en 1er paramètre (le paramètre `self` n'existe pas encore puisque l'objet n'est pas créé) et doit retourner l'objet nouvellement créé (contrairement à `__init__`); les autres paramètres sont identiques à ceux reçus par `__init__`); c'est aussi `__new__` qui est chargée d'appeler l'initialisateur `__init__` (ce que fait `object.__new__` par défaut, en lui passant aussi la liste d'arguments)

`__new__` est particulièrement utile pour les objets immutables: étant impossible d'agir sur les objets dans la méthode `__init__` puisque celle-ci intervient après la création et que l'objet n'est pas modifiable; si l'on souhaite hériter d'un type immutable  (`int`, `str`, `tuple`) et agir sur l'initialisation de l'objet, il est nécessaire de redéfinir `__new__`

quand nous créons une classe, il est possible de spécifier entre parenthèses les classes à hériter; il est aussi possible de préciser des arguments nommés

```
class A(B, C, foo='bar', x=3):
  pass
```

par exemple on peut implémenter la méthode de classe `__init_subclass__` qui recevra tous les arguments nommés; la méthode ne sera pas applée pour la classe courante mais le sera pour toutes ses classes filles

##### Métaclasses

une métaclasse = une classe dont les instances sont des classes

avec un seul paramètre, `type` en retourne le type

autre utilisation de `type` pour créer une métaclasse:
1) `name`: une chaine de caractères représentant le nom de la classe à créer
2) `bases`: un tuple contenant les classes dont nous héritons (`object` est implicite)
3) `dict`: le dictionnaire des attributs et méthodes de la nouvelle classe

```
type('A', (), {})
<class '__main__.A'>
A = type('A', (), {'x':4})
A.x
# 4
A().x
# 4
type(A)
# <class 'type'>
type(A())
# <class '__main__.A'>
```

les métaclasses rendent plus difficile la compréhension du code; il est préférable de s'en passer; l'intérêt principal des métaclasses est d'agir sur les classes lors de leur création, dans la méthode `__new__` de la métaclasse; par exemple pour ajouter à la classe de nouvelles méthodes ou des attributs supplémentaires, ou encore pour transformer les attributs définis dans le corps de la classe

une métaclasse opérera plus souvent lors de la création d'une classe que lors de son initialisation; c'est donc dans le constructeur (méthode `__new__`) que tout va s'opérer

si la métaclasse est dotée d'une méthode de classe `__prepare__` celle-ci sera appelée en lieu et place de `dict`; cette méthode doit toutefois retourner  un dictionnaire ou objet similaire

les métaclasses répondent à des problèmes bien spécifiques; e.g. les énumérations sont implémentées à l'aide de métaclasses

```
from enum import Enum
class Color(Enum):
  red = 1
  green = 2
  blue = 3
Color.red
# <Color.red: 1>
Color(1) is Color.red 
# True
```

en héritant d'`Enum`, on hérite aussi de sa métaclasse (`EnumMeta`)

en cas d'héritage multiple, attention à ce que les métaclasses soient compatibles: la hiérarchie entre les différentes métaclasses doit être linéaire

par extension, on appelle parfois métaclasse tout callable qui renverrait une classe lorsqu'il serait appelé; cependant on ne peut pas à proprement parler de métaclasse car celle de la classe sera toujours `type`  

##### Classes abstraites

le module `abc` donne accès à la classe `ABC` qui permet par héritage de construire une classe abstraite et au décorateur `abstractmethod` pour définir des méthodes abstraites; dans le même module `ABCMeta` est la métaclasse de la classe `ABC` et donc le type de toutes les classes abstraites; c'est `ABCMeta` qui s'occupe de référencer dans l'ensemble `__abstractmethods__` les méthodes abstraites définies dans la classe

outre le fait de pouvoir spécifier les méthodes à implémenter, les classes abstraites de Python ont un autre but: définir une interface

`isinstance` permet de vérifier qu'un objet et du bon type

`issubclass` permet de vérifier qu'une classe hérite d'une autre; plus précisément, permet de vérifier qu'une classe est une sous-classe (ou sous-type d'une autre); quand une classe hérite d'une autre elle en devient un sous-type (sauf cas exceptionnels); mais elle peut aussi être sous-classe de classes dont elle n'hérite pas (c'est le but de la méthode `register` des classes `ABC` qui sert à enregistrer une classe comme sous-type de la classe abstraite)

ces deux fonctions sont en fait des opérateurs qui font appel à des méthodes spéciales et sont à ce titre surchargeables

e.g. imaginons une classe abstraite `Sequence` correspondant aux types de séquences connues (list, str, tuple); ces types sont des builtins, il n'est donc pas possible de les redéfinir pour les faire hériter de Sequence; mais la méthode `register` de notre classe abstraite `Sequence` permet de les enregistrer comme sous-classes

la surcharge d'opérateur se fait par la définition d'une méthode spéciale dans le type de l'objet (e.g. `__add__` pour l'opérateur `+`)

on a vu plus haut qu'`isinstance`est un opérateur, donc surchargeable; `isinstance` est un opérateur qui s'applique à une classe; la surcharge se fait dans le type de cette classe (i.e. dans la métaclasse); la méthode spéciale correspondant à cet opérateur est `__instancecheck__`, qui reçoit en paramètre l'objet à tester et retourne un booléen (`True` si l'objet est du type en question, `False` sinon)

`isinstance` peut recevoir en 2ème paramètre un tuple de types plutôt qu'un type simple; il regardera alors si l'objet donné en 1er paramètre est une instance de l'un de ces types; ensuite la méthode `__instancecheck__` n'est pas toujours appelée: lors d'un appel `isinstance(obj, cls)`, la méthode `__instancecheck__` est appelée que si `type(obj)` n'est pas `cls`)

`issubclass` vérifie qu'une classe est sous-classe d'une autre; la surcharge se fait là aussi sur la métaclasse à l'aide de la méthode spéciale `__subclasscheck__`; cette méthode est très semblable à  `__instancecheck__`: en plus de `self` (la classe courante), elle reçoit en paramètre la classe à tester; retourne un booléen (`True` si la classe donnée est une sous-classe de l'actuelle, `False` sinon); comme `isinstance`, `issubclass` peut recevoir en 2ème paramètre un tuple de différentes classes à tester; mais pas de raccourci pour éviter l'appel à `__subclasscheck__`, même quand on cherche à vérifier qu'une classe est sa propre sous-classe

module `collections.abc` fournit des classes abstraites toutes prêtes pour reconnaitre les différentes interfaces du langage (`Container`, `Sequence`, `Mapping`, ...); assez simples à appréhender ces classes abstraites testent la présence des méthodes essentielles au respect de l'interface


```
import collections.abc
issubclass(list, collections.abc.Sequence)
# True
issubclass(dict, collections.abc.Sequence)
# False
isinstance([10], collections.abc.Hashable)
# False
isinstance(10, collections.abc.Hashable)
# True
```

outre la vérification d'interfaces, certaines de ces classes servent aussi de mixins en apportant des méthodes abstraites et des méthodes prêtes à l'emploi






```
```
```
```
```
```

```

