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
