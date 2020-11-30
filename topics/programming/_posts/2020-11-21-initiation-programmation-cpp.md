---
title: Initiation à la programmation en C++
description: introduction C++
tags: [c++] 
category : programming
status: reading
update: 2020-11-21
authors:
  - id: marzuf
    corresponding: true
---

Notes de lecture - cours EPFL par Chappelier et al.


##### Opérateurs logiques

* `and` ou `&&`
* `or` ou `||`
* `not` ou `!`

##### Boucles conditionnelles

ne pas oublier le `;` dans la boucle `do...while`

```
do
{
  instructions
} while(condition);
```

##### Blocs d'instructions

en C++ les instructions peuvent être regroupées dans des blocs, indépendamment de toute structure de contrôle, il suffit d'entourer une séquence d'instructions avec les accolades, e.g.:

```
{
  int i;
  double x;
  
  cout << "Valeurs pour i et x " << endl;   # sens: de ce qui suit vers le cout (sens dans lequel circule l'information)
  cin >> i >> x; # sens: on va de cin vers la mémoire
  cout << " vous avez entré i = " << i << ", x = " << x << endl;
}
```

en C++ on peut avoir des variables de même nom mais de portée différente; la variable la plus proche est choisie lors de l'utilisation par les règles de résolution de portée

##### Fonctions: introduction

une fonction est caractérisée par: 1) corps, 2) nom, 3) paramètres, 4) type et valeur de retour

3 facettes d'une fonction
1) le prototype = résumé de ce que doit faire la fonction; contient i) le nom, ii) les paramètres qui sont les valeurs nécessaires pour le fonctionnement de la fonction, et iii) le type et valeur de retour de la fonction
2) la définition: contient le prototype et le corps de la fonction (= code exécuté lors de l'utilisation de la fonction)
3) l'appel correspond à l'utilisation de la fonction en lui donnant des valeurs effectives pour ses paramètres; la fonction fournit une valeur que l'on utilise dans une expression

le prototype est utile car suffit de le connaitre pour utiliser la fonction; sert d'accord entre le programmeur-utilisateur et le programmeur-concepteur


##### Fonctions: appels

les arguments passés à la fonction au moment de l'appel correspondent aux paramètres attendus par la fonction pour qu'elle puisse s'exécuter

paramètres = données nécessaires à la fonction pour qu'elle puisse s'exécuter telle que décrite dans le prototype

arguments = valeurs que l'on passe effectivement à la fonction au moment de l'appel

appel d'une fonction se passe en 5 étapes:
1. les expressions passées en arguments sont évaluées; on ne peut pas en C++ présupposer de l'ordre selon lequel cette évaluation est faite
2. les valeurs résultant de l'évaluation des expressions sont affectées aux paramètres de la fonction
3. les paramètres de la fonction disposent désormais de valeurs concrètes avec lesquelles toutes les instructions du corps de la fonction sont exécutées
4. l'expression qui suit la 1ère commande `return` recontrée à l'exécution est évaluée
5. le résultat de cette évaluation `return` est retournée comme résultat de l'appel 

simplification dans certains cas:
* les étapes 1 et 2 n'ont pas lieu lorsqu'une fonction fournit un résultat en sortie mais n'a pas besoin d'arguments (pas de paramètres)
* les étapes 4 et 5 n'ont pas lieu lorsque la fonction ne fournit pas de valeur concrète (type de retour est `void`)
* l'étape 2 n'a pas lieu lors du passage par référence

##### Passage des arguments

* passage par valeur = la fonction travaille sur une copie de l'argument dans la  zone locale à la fonction; toute altération n'a d'incidence que sur la zone locale et ne se répercute pas sur la variable passée en argument

```
void f(int x)
{
  x += 1
  cout << "x = " << x << endl;
}
int main()
{
  int val(1);
  f(val)
  cout << " val = " << val << endl;
  return 0;
}
# x=2 
# val=1
```

* passage par référence = le paramètre de la fonction est un nom supplémentaire pour la variable passée en argument; toute altération du paramètre altère aussi la variable passée en argument; doit être explicitement indiqué dans l'entête de la fonction en utilisant le symbole `&` après le type, e.g. `double f(double& x)` 

```
void f(int& x)  # passage par référence, on indique que x est un autre nom pour val
{
  x += 1
  cout << "x = " << x << endl;
}
int main()
{
  int val(1);
  f(val)
  cout << " val = " << val << endl;
  return 0;
}
# x=2 
# val=2
```

utilisation du passage par référence:

1) lorsqu'une fonction doit être capable de modifier une variable passée en argument 

e.g. pour saisir une valeur 
```
void saisie_entier(int& a_lire);

int i(0);

saisie_entier(i);

# alternative: la fonction retourne la valeur: int saisie_entier(); i = saisie_entier();
```

2) lorsqu'une fonction retourne plusieurs résultats; puisqu'en C++ une fonction ne peut retourner qu'un résultat, on lui fournit en paramètre les variables passées par références qui stockent le résultat final si celui-ci doit être composé de plusieurs variables

e.g. pour convertir coordonnées cartésiennes en coordonnées polaires:
```
void cartesienne_vers_polaires(double x, double y, double& angle, double& rayon);
```
3) lorsqu'on échange le contenu de deux variables, e.g.:

```
void swap(int& i, int& j);
```

##### Prototypes

les fonctions doivent être annoncées avant d'être utilisées: c'est le prototype, qui sert à déclarer
* le nom de la fonction
* les paramètres
* le type de la valeur de retour  
`type nom (type1 id_param1, type2 id_param2, ...);`

la partie qui précède le point-virgule est appelé entête de la fonction

il est toujours préférable de commencer par écrire le prototype de la fonction; permet de clarifier les paramètres que la fonction doit recevoir et le type de retour qu'elle doit fournir

##### Définitions

la définition (= entête + corps) d'une fonction sert à spécifier l'ensemble des instructions que la fonction exécute

le corps de la fonction est simplement un bloc d'instructions compris entre accolades 

l'instruction `return` permet de préciser la valeur de retour et termine l'exécution du corps de la fonction

remarques sur l'instruction `return`:
* une fonction peut en contenir plusieurs
* l'expression qui la suit doit être de même type que le type de retour indiqué dans l'entête 
* elle est la dernière instruction de la fonction exécutée
* le compilateur doit toujours pouvoir exécuter un `return` (e.g. si un `return` est placé dans un bloc `if` sans autres `return`, le compilateur renvoie une erreur)

procédures = fonctions qui n'ont aucune valeur de retour à fournir; elles commencent par le mot réservé `void`; dans ce cas l'instruction `return` est optionnelle 

la fonction `main` est appelée au début du programme; elle n'a que 2 protoypes autorisés:
1) `int main();`
2) `int main(int argc, char** argv);`

##### Fonctions: arguments par défaut et surcharge

les paramètres avec valeur par défaut doivent forcément apparaitre en dernier dans la liste des paramètres de la fonction 

les valeurs par défaut doivent être spécifiées lors de leur déclaration dans le prototype de la fonction et non pas dans la définition de la fonction; lors de l'appel à une fonction à plusieurs paramètres ayant des valeurs par défaut, les arguments omis doivent être les derniers et omis dans l'ordre de la liste des paramètres 

```
void f(int i, char c = 'a', double x = 0.0);
f(1)
f(1, 'b')
f(1, 'b', 3.0)
# f(1, 3.0) # INCORRECT !
# f(1, , 3.0) # INCORRECT !
```

surcharge de fonctions: il est possible de définir plusieurs fonctions qui ont le même nom si le nombre ou le type des paramètres sont différents

2 fonctions sont différenciées non seulement par leur nom, mais aussi par le type de leurs paramètres (= signature de la fonction) (e.g. on peut avoir `void affiche(int x);`, `void affiche(double x);`, `void affiche(int x1, int x2);`)

on ne peut pas avoir 2 fonctions de même nom et de mêmes paramètres même si le type de retour est différent (e.g. on ne peut pas avoir `int f(int);` et `double f(int);`)

##### Tableaux

tableau = collection de valeurs homogènes (collection ordonnée de valeurs de même type)

en C++, 2 types de tableaux existent:
1) tableaux dynamiques (vector)
2) tableaux statiques (array)
3) aussi les tableaux "à la C", mais dépréciés au profit des arrays

##### Tableaux: déclaration et initialisation des vector  (tableaux dynamiques)

tableau dynamique = collection de données homogènes dont le nombre (i.e. la taille du tableau) peut changer au cours du déroulement du programme; implémentation par le type `vector`

syntaxe:
```
# include<vector>
vector<type> nom;
```
depuis C++11, il existe 5 manières d'initialiser des tableaux dynamiques
1) initialiser un tableau vide: `vector<type> nom;`
2) initialiser un tableau avec des valeurs initiales différentes: `vector<type> nom({val1, val2, ...});` ou `vector<type> nom = {val1, val2, ...};`
3) initialiser un tableau avec une taille initiale: `vector<type> nom(taille);`; les éléments seront tous nuls; le tableau peut néanmoins toujours changer de taille
4) initialiser un tableau avec la même valeur (les éléments ne sont pas initialisés à zéro, mais à `valeur`, qui doit être  du même type que `type`): `vector<type> nom(taille, valeur);`
5) initialiser un tableau à l'aide d'une copie d'un autre tableau: `vector<type> nom(autre);`; chaque élément de `autre` est copié dans le nouveau tableau, mais on obtient 2 tableaux distincts, `autre` n'est pas modifié

exemple:
```
vector<int> tab;
vector<int> tab({1,2,3});
vector<int> tab(5);
vector<int> tab(5, 1);
vector<int> tab(tab2);
```

##### Tableaux: utilisation des vector

affectation globale: comme toute variable, un tableau peut être affecté globalement; l'affectation signifie sa copie élément par élément dans un 2ème tableau, les deux tableaux restent indépendants 

```
vector<int> tab1({1,2,3});
vector<int> tab2;
tab2 = tab1;  // copie de tout tab1 dans tab2
```

accès à l'élément `i+1` du tableau `tab` s'écrit `tab[i]` (e.g. `tab[0]` pour accéder au 1er élément)

il n'y a pas de contrôle de débordement: le compilateur n'affiche aucune erreur si on tente d'accéder à un élément dont l'indice est supérieur à la taille du tableau; cependant à l'exécution le programme risque de produire l'erreure `Segmentation Fault`

lorsqu'on initialise un tableau vide, sa taille est égale à zéro; donc il ne contient même pas 1 case; pour le remplir, il faut utiliser la fonction spécifique `push_back()`

itération sur l'ensemble des valeurs: depuis C++11 ont peut utiliser la syntaxe suivante 

```
for (auto element: tab)
```

où `element` prendra tour à tour chacune des valeurs de `tab`)

si on veut modifier les éléments de `tab` à travers de `element`il faut utiliser le symbole `&` après `auto` (comme pour les fonctions, symbole de passage par référence), e.g.

```
vector<int> ages(5);

for(auto& age: ages)
{
  cout << "âge suivant ? " << endl;
  cin >> age;
}
```

l'utilisation d'une itération classique est nécessaire dans certains cas; e.g. lors du parcours simultané de plusieurs tableaux, de l'accès à plusieurs éléments ou alors lors d'un parcours plus complexe des éléments (e.g. deux à deux), dans ce cas, utiliser:

```
for(size_t i(0); i < tab.size(); ++i)
```
où on accède à chaque élément avec `tab[i]`

la fonction spéciale `size()` retourne la taille du tableau sous la forme d'une valeur de type `size_t` (entier positif ou nul)

```
vector<int> ages(5);
for(size_t i(0); i < ages.size(); i++)
{
  cout << "âge n° " << i+ 1 << " ?";
  cin >> ages[i];
}
```

e.g. 2 manières d'affecter la même valeur (1.2) à tous les éléments d'un tableau 
1) affectation élément par élément, symbole du passage par référence (avec `&`) est nécessaire 
2) affectation globale: on crée un tableau anonyme, de la taille de `tab`, avec 1.2 dans toutes les cases
```
for(auto& e1: tab)
{
  e1 = 1.2;
}
tab = vector<double>(tab.size(), 1.2);
```

##### Tableaux: fonctions spécifiques des vector

* `tab.size()`
* `tab.front()`: renvoie une référence au 1er élément (équivalent à `tab[0]`)
* `tab.back()`: renvoie une référence au dernier élément (équivalent à `tab[tab.size()-1]`)
* `tab.empty()`: renvoie un `bool` indiquant si le tableau est vide
* `tab.clear()`: supprime tous les éléments, le transformant en tableau vide (ne renvoie rien)
* `tab.pop_back()`: supprimer le dernier élément (ne renvoie rien)
* `tab.push_back(val)`: ajoute un élément à la fin (ne renvoie rien)

##### Tableaux: tableaux dynamiques multidimensionnels

un tableau de dimension `n` correspond à un tableau de tableaux de dimension `n-1`

déclaration de tableaux dynamiques multidimensionnels, e.g.:

```
vector<vector<int>> tab(5, vector<int>(6));
```
`tab` est un vector de vector de int; initialisé à 5 lignes avec un tableau dynamique de 6 cases

l'accès à la case de la ligne `i+1` et de la colonne `j+1` s'écrit `tab[i][j]` (`tab[i]` retourne le tableau représentant la ligne `i+1`)

petite subtilité syntaxique: la syntaxe de fermeture des types (`>>` juste avant `tab`) n'est supportée que par les compilateurs C++11, sinon il faut écrire avec un espace `> > ` 

ces tableaux étant dynamiques, ce ne sont pas nécessairement des matrices au sens mathématique: les lignes sont également représentées par des tableaux dynamiques, donc chaque ligne peut avoir une taille différente

exemple:
```
vector<vector<int>> tableau(
  { {0,1,2,3,42},
    {4,5,6},
    {7,8},
    {9,0,1} }
);
```
##### Tableaux: array

2 types d'implémentation
1) par les tableaux "à la C"
2) type `array` depuis C++11

à utiliser pour des tableaux dont la taille ne varie pas (e.g. grille de jeu d'échecs)

```
#include<array>
const size_t taille(5);
array<int, taille> ages({1,2,3,4,5}); 
# ou
array<int, taille> ages = {1,2,3,4,5}; 
```

le nombre `taille` doit être connu lors de la compilation, sinon il faut  utiliser `vector`

certains compilateurs ne tolèrent que la deuxième manière d'initialiser

un `array` doit toujours être initialisé car un `array` non initialisé contient des valeurs aléatoires, tout comme les types élémentaires

les `array` s'utilisent comme les tableaux dynamiques, sauf que les fonctions spécifiques modifiant le nombre d'éléments du tableau (e.g. `push_back()` ou `pop_back`) ne sont pas disponibles

les tableaux statiques peuvent aussi être multidimensionnels, mais la taille de chaque tableau doit être spécifiée lors de la déclaration; l'initialisation d'un `array` multidimensionnel diffère légèrement de celle d'un `vector` multidimensionnel: les compilateurs ne supportent actuellement qu'une seule paire d'accolades; exemple:

```
array<array<double, 2>, 2> rotation;
array<array<int, nb_stats>, nb_cantons> statistiques;
array<array<array<double, 4>, 2, 3> tenseur;

array<array<int, 3>, 4> matrice = {      # une seule paire d'accolades !!!
  0,1,2,
  3,4,5,
  6,7,8
  9,0,1
};
```

##### String

le type `string` permet de représenter des chaines de caractères (= liste de caractères); défini dans la bibliothèque `string`; la chaine de caractères est délimitée par `""`; exemple:

```
#include <string>
//déclaration d'une chaine vide
string un_nom;
// déclaration avec initialisation
string message("Bonjour");
```

le type `char` est un type élémentaire qui permet de représenter un seul caractère; délimitation avec `'`; une variable de type `char` ne peut tenir qu'un seul caractère; exemple:

```
char c('x');
char u;
//...
u = 's';
```

la conversion de `char` vers `string` est automatique; la conversion inverse n'est pas possible
```
string chaine;			
string chaine2("test");
chaine = "test3";
chaine = chaine2;
chaine = 'a';
chaine = "test4";
```

la concaténation de 2 chaines se fait avec `+`; on peut concaténer 2 variables `string` ou une variable `string` avec une valeur littérale (entre `""`) ou une variable `string` avec une variable `char`

```
chaine4 = chaine2 + chaine3;
```

comme pour les types élémentaires, on peut comparer deux chaines avec `!=` et `==`

##### String: traitements

on peut accéder à l'élément `i+1` de la même manière qu'un tableau, i.e. `chaine[i]`; le caractère retourné est de type `char`

fonctions spécifiques:
* `chaine.size()`: retourne la taille de la chaine `chaine` sous la forme de variable de type `size_t`
* `chaine.insert(position, chaine2)`: insère la chaine `chaine2` à la position `position` dans `chaine`
* `chaine.replace(position, n, chaine2)`: remplace `n` caractères de la chaine `chaine` à partir de la position `position`par `chaine2`
* `chaine.find(souchaine)`: retourne l'indice dans `chaine` du 1er caractère de l'occurence la plus à gauche de `souschaine` dans `chaine` (`rfind` pour la plus à droite); la valeur prédéfinie `string::npos` est retournée si aucune occurence n'est trouvée
* `chaine.substr(depart, longueur)`: retourne la sous-chaine de `chaine`, de longueur `longueur`, commençant à la position `depart`

##### typedef: alias de types

un `typedef` permet de créer un nouveau nom pour un type déjà existant

un alias de type permet de donner un autre nom à un type déjà défini; par exemple la syntaxe des tableaux (en particulier les multidimensionnels) étant un peu lourde, on peut lui donner de nouveaux noms:

```
typedef vector<double> Vecteur; 
typedef vector<Vecteur> Matrice;
Matrice rotation(3, Vecteur(3, 1.0));
# il est donc équivalent d'écrire
vector<vector<double>> m;
# ou
Matrice m;
```

pourquoi utiliser `typedef`:
1) définition claire et conceptuelle des données
2) faciliter les changements ultérieurs
3) écriture plus claire et plus compacte

##### Structures

une structure permet de regrouper des données de différents types (pour des données homogènes, on peut utiliser des tableaux par exemple)

utilisation des structures

* pour représenter des entités qui doivent être décrites par plusieurs données et qui peuvent être manipulées comme un tout
* pour permettre à une fonction de retourner plusieurs valeurs  
* pour simplifier la conception et l'écriture des programmes en regroupant les données de manière conceptuelle

les structures sont également intéressantes pour créer des tableaux de structures: cela permet de créer des tableaux regroupant des données hétérogènes

les champs d'une structure peuvent être de type complexe, e.g. d'autres structures 

```
struct Simple
{
  int sous_champ1;
  double sous_champ2;
};   # ne pas oublier les ; après l'accolade! 

struct Compliquee
{
  vector<double> champ1;
  int champ2;
  Simple champ3;
};
```

une variable de type structure peut être intialisée ainsi:
```
Type identificateur = {val_1, val_2, ...};
```

ceci est possible en C++11; avant il fallait affecter chaque champ un par un

pour accéder aux champs, utiliser la syntaxe
```
structure.champ
```

attention à l'ordre de priorité; e.g. `++` est prioritaire sur l'opérateur `.`; pour incrémenter champ il faut écrire
```
++(structure.champ); # et non pas ++structure.champ
```

une structure étant généralement une variable de grosse taille, il est préférable lorsqu'elle est en argument d'une fonction, de la passer par référence ou en référence constante si elle n'est pas modifiée; cela permet d'éviter d'effectuer une copie coûteuse, ce qui aurait été le cas avec passage par valeur

on peut créer une nouvelle structure en initialisant à partir d'une autre structure

```
Struct Personne
{
  string nom;
  double taille;
  int age;
  char sexe;
};

Personne naissance()
{
  Personne p;
  //...
  return p;
}

int main()
{
  Personne untel(naissance());
  //...
  return 0;
}
```

l'affectation est la seule opération que l'on peut faire globalement sur les structures; toutes les autres opérations doivent se faire champ par champ

une fonction ne peut retourner qu'une seule valeur; astuces pour retourner plusieurs valeurs
1. renvoyer une structure
2. passer les variables de retour par référence et les affecter dans la fonction 
3. renvoyer un tableau dynamique (si les valeurs de retour sont de même type)
4. combiner 1 et 3 (renvoyer des tableaux de structures ou des structures contenant des tableaux)

##### Pointeurs et références: introduction

un pointeur est tout simplement une adresse; les pointeurs permettent de créer un lien, une référence universelle vers une variable

3 situations typiques d'utilisation des pointeurs
1. référence: partager des données sans les dupliquer (plusieurs pointeurs sur une seule donnée)
2. généricité: choisir des éléments non connus a priori (un seul pointeur qui pointe tour à tour sur plusieurs données)
3. allocation dynamique: manipuler des objets dont la durée de vie dépasse la portée dans laquelle ils ont été définis; permet à une variable de survivre à sa portée (i.e. ne pas être supprimée quand sa portée prend fin)

portée = ensemble des lignes de code dans lesquelles cette variable est définie

durée de vie = temps pendant lequel un objet existe en mémoire

depuis C++11, il y a 3 sortes de pointeurs

1. les références: ne sont pas de vrais pointeurs, mais permettent de créer un lien vers une variable; sont sûres car totalement gérées par le compilateur
2. les pointeurs intelligents (smart pointers): disponibles depuis C++11; sont utilisés pour l'allocation dynamique et doivent être gérés par le programmeur, mais fournissent des gardes fous; il en existe 3: i) `unique_ptr`, ii) `shared_ptr`, iii) `weak_ptr`
3. les pointeurs à la C: les plus puissants car permettent de tout faire, mais aussi les plus dangereux car doivent être gérés par le programmeur

en règle générale, il vaut mieux utiliser des références lorsqu'on le peut et utiliser des pointeurs lorsqu'on le doit; principe d'utilisation
* référence: les références mais aussi les pointeurs à la C (utilisables dans tous les cas)
* généricité: les pointeurs à la C (ou les indexes d'un tableau si les données peuvent être regroupées dans un tableau)
* allocation dynamique: les pointeurs intelligents (en particulier `unique_ptr` ou les pointeurs à la C)

##### Références

une référence est un alias, un autre nom pour une variable existant déjà; une référence permet de désigner indirectement un objet; c'est ce qui est utilisé lors d'un passage par référence dans le cadre de l'appel d'une fonction, qui permet de désigner la même variable par des "étiquettes" différentes, une hors de la fonction, et une dans la fonction

une référence se déclare ainsi

```
type& nom_reference(identificateur);
```
ce n'est pas une nouvelle variable mais une nouvelle étiquette; après cette déclaration, la référence peut être utilisée partout où la variable peut l'être et de la même façon

attention ! il convient de distinguer la déclaration d'une référence sur une variable et l'initialisation d'une variable à l'aide de la copie d'une autre

```
int i(3);
int& j(i);
// i et j sont la *même* case mémoire
i = 4; // j *aussi* vaut 4
j = 6; // i *aussi* vaut 6

int i(3);
int j(i); 
// copie ! i et j vivent leur vie séparément
i = 4; // j vaut encore 3
j = 6; // i vaut encore 4
```

il est possible de définir une `const`-référence sur une variable qui elle n'est pas constante, i.e. on pourra modifier le contenu de la variable au travers de la variable mais pas au travers de la référence

```
int i(3);
const int& j(i);   
// i et j sont les mêmes
// on ne peut pas changer la valeur via j (mais on peut le faire par ailleurs)
// j = 12; IMPOSSIBLE !
i = 12; // possible, et j vaudra aussi 12
```

comme les pointeurs, les références permettent de créer un lien vers les données; mais ne sont pas des pointeurs, sont moins souples
1. une référence doit absolument être initialisée; on ne peut pas déclarer une référence et la lier plus tard à un objet  
```
int i;
int& ri(i);
//int& rj;    IMPOSSIBLE: rj doit être lié à un objet
```
2. on ne peut pas modifier la variable sur laquelle une référence est liée; c'est pour cela que la généricité est impossible avec des références

```
int i;
int& ri(i);
int j(2);
ri = j;     // ne veut pas dire que ri est alias de j, mais que i prend la valeur de j
j = 3;
cout << i << endl;
# 2
```
3. on ne peut pas référencer une référence car une référence n'est pas un objet en mémoire, mais une étiquette 

```
int i(3);
int& ri(i);
//int& rri(ri);  IMPOSSIBLE
//int&& rri(ri);  AUSSI IMPOSSIBLE
```

4. on ne peut pas faire des tableaux de références

##### Pointeurs: concept 

différence fondamentale entre pointeurs et références: un pointeur n'est pas seulement une étiquette mais une variable à part entière qui contient l'adresse en mémoire de la variable pointée

toute variable (y.c. les pointeurs) est physiquement identifiée de manière unique à l'aide d'une adresse, qui correspond à l'adresse de l'emplacement mémoire qui contient la valeur 

un pointeur est une variable à part entière; c'est pour cela qu'on peut faire des pointeurs de pointeurs ainsi que des tableaux de pointeurs 

exemples de manipulation basique:
* déclarer un pointeur: `int* ptr;`; un pointeur non initialisé peut contenir n'importe quelle adresse 
* affecter un pointeur: `ptr = &x;`; stocke l'adresse de `x` dans `ptr`
* allouer un pointeur: `ptr = new int(42);`; réserve une zone mémoire et stocke son adresse dans le pointeur
* libérer un pointeur: `delete ptr;`; libère la zone mémoire contenant la valeur pointée par `ptr`
* annuler un pointeur: `ptr = nullptr;`; remise à zéro du pointeur (les opérations de libération et d'annulation vont généralement de pair)
* copier un pointeur: `p2 = p1;`

##### Pointeurs: déclaration et opérateurs de base

déclaration d'un pointeur:
```
type* identificateur;
```

initialisation d'un pointeur:
```
type* identificateur(adresse);
```

```
int* ptr(nullptr);
//dans ce cas, ptr est initialisé à nullptr, i.e. ne pointe sur rien

int* ptr(&i);
// ptr initialisé à l'adresse mémoire de la variable i

int* ptr(new int(33));
// ptr initialisé avec l'adresse d'une zone mémoire allouée dynamiquement (cf. plus loin)
```

deux opérateurs sont donc utiles pour manipuler les pointeurs `*` et `&`
* `&` permet de retourner l'adresse mémoire de la valeur d'une variable; se place avant la variable à laquelle il s'applique; `&i` retourne donc l'adresse mémoire de `i`; si `i` est de type `type` alors `&i` est de type `type*`, i.e. un pointeur sur `type` 
* `*` permet de retourner la valeur pointée par un pointeur; se place aussi avant le pointeur auquel il s'applique; `*ptr` retourne la valeur de la zone mémoire sur laquelle `i` pointe; si `ptr` est de type `type*` alors `(*ptr)` est de type `type`

`*&i` est strictement égal à `i`

attention ! les symboles `&` et `*` peuvent être utilisés pour 2 choses différentes:
1. lorsqu'ils sont placés avant une variable ou un pointeur, ils permettent de retourner l'adresse de la variable ou la valeur pointée par le pointeur, respectivement
* `&x` renvoie l'adresse de `x`
* `*ptr` renvoie la valeur pointée par `ptr`
2. lorsqu'ils sont placés après un type, ils définissent une référence sur ce type ou un pointeur sur ce type, respectivement 
* `int& x(y);` définit `x` comme référence sur `y`
* `int* ptr` définit `ptr` comme un pointeur sur un `int`

```

```
```


```


```

```
```
```
