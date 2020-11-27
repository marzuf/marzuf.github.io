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



```
```
```
```
```
```


```
```

```
```
```
```

```
```
```
```
```

```





