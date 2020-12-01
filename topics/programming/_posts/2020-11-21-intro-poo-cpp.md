---
title: Introduction à la programmation orientée objet (en C++)
description: introduction POO C++
tags: [c++] 
category : programming
status: reading
update: 2020-11-21
authors:
  - id: marzuf
    corresponding: true
---

Notes de lecture - cours EPFL par Chappelier et al.

##### Introduction

POO permet le regroupement des traitements et des données en une seule et même entité; en C++, donne davantage de robustesse, de modularité et de lisibilité; repose sur 4 concepts
1. encapsulation
2. abstraction
3. héritage
4. polymorphisme

encapsulation = regrouper dans une seule et même entité des données (les attributs) et des traitements (les méthodes) qui agissent sur celles-ci; le tout est défini au sein d'une classe, qui constitue un nouveau type de données, une catégorie d'objets; une variable de ce type est désignée par le terme d'instance 

abstraction = identifie des caractéristiques et des mécanismes communs aux entités utilisées, permettant une description générique, abstraite de l'ensemble

encapsulation et abstraction consistent également à dissimuler les détails de l'implémentation à l'utilisateur, qui  n'exploite plus que l'interface d'utilisation de l'objet (i.e. les diverses fonctionnalités qui lui sont accessibles pour sa manipulation); 2 niveaux de perception de l'objet: niveau externe visible du programmeur utilisateur et niveau interne du programmeur qui se charge des détails de l'implémentation

le programmeur concepteur définit différents niveaux de visibilité; l'accès limité à l'utilisateur protège le programme des erreurs

##### Classe, objets, attributs et méthodes

une classe se déclare avec le mot-clé `class`, qui définit un nouveau type; une fois défini, ce dernier peut être utilisé pour déclarer des variables, instances de cette classe

au sein de la classe, la déclaration des attributs est similaire à celle des champs d'une structures

les méthodes sont des fonctions qui sont déclarées au sein de la classe

le prototype d'une méthode indique le type de retour, le nom de la méthode et ses paramètres (entre parenthèses); l'entête est complété par son corps (i.e. sa définition) entre accolades

portée de classe = les attributs sont des variables globales à la classe; les paramètres d'une méthode sont des variables externes à la classe: chaque méthode d'une classe a accès aux attributs de celle-ci; ils ne doivent donc pas être passés en arguments 

pour rendre le code plus lisible et favoriser la modularisation, on peut choisir de définir les méthodes à l'extérieur de la classe; le prototype de la méthode devra cependant rester à l'intérieur de la classe; en dehors de la classe, pour indiquer au compilateur que l'on définit une méthode et non pas une fonction; il faut souligner la classe à laquelle elle appartient grâce à l'opérateur de résolution de portée `::`

à distinguer:
* actions = méthodes qui modifient les attributs de l'instance manipuée 
* prédicats = celles qui ne le font pas; il est bien d'indiquer qu'une méthode est un prédicat avec le mot `const` après la liste des paramètres pour indiquer qu'elle ne modifie pas l'instance à laquelle elle s'applique 

##### public: et private:

le mot-clé `private` est employé pour signaler quelle partie de la classe restera inaccessible à un utilisateur; tout élément de la classe qui suit `private:` (attributs, méthodes internes) est inaccessible depuis l'extérieur de la classe; ne pourront être appelés qu'au sein de la classe, et pas depuis le `main` par exemple; par défaut (sans spécification, tout élément d'une classe est `private`)

le mot-clé `public` indique quels membres d'une classe sont accessibles, visibles et utilisables

en général, on définit les attributs comme `private` et, si besoin, on propose des méthodes publiques pour les manipuler
* accesseurs (getters) = méthodes qui retournent la valeur de l'attribut; ce sont des prédicats (`const` suit leur entête)
* manipulateurs (setters) = permettent de modifier la valeur des attributs; sont des actions (prend en paramètre la valeur à affecter et ne retourne rien)

garder les attributs privés permet de limiter les erreurs de l'utilisateur; l'interface permet au concepteur de librement modifier sa représentation de la classe sans que l'utilisateur ne soit affecté

masquage: lorsqu'un identificateur en cache un autre; e.g. quand une variable locale prend le pas sur une variable plus globale

avec les manipulateurs notamment, risque d'avoir le même nom que l'attribut à modifier comme  nom de paramètre (le même nom désigne le paramètre et l'attribut); pour éviter un message d'erreur du compilateur, on peut
* utiliser un autre nom pour le paramètre (recommandé)
* désambiguïser le nom en indiquant quand il désigne l'attribut de classe; utiliser le pointeur `this` sur l'instance courante; en tant que pointeur il faut utiliser `this->attribut` (recommandé) équivalent à `(*this).attribut`

il est cependant recommandé d'éviter les situations de masquage

exemple

```
class MaClasse
{
  private:
    int x ;
    int y;
  public:
    void une_methode(int x)
    {
    	... y...
    	... x ...
    	this -> = x;
    }
}
```

##### Encapsulation et abstraction: résumé

il est conseillé de marquer les prédicats (= méthodes ne modifiant pas les attributs, avec le mot-clé `const`)

une bonne encapsulation (séparation entre détails privés et interface publique) permet au programmeur concepteur de modifier plus librement son implémentation sans impact pour l'utilisateur

l'écriture d'une classe est rendue plus lisible quand ses méthodes sont uniquement prototypées à l'intérieur de celle-ci; la définition reste à l'extérieur, rattachée à la classe par l'opérateur de résolution de portée `::`

prototype de classe = les éléments qui sont écrits au sein de celle-ci, i.e. le prototype de ses méthodes et de ses attributs

définition de la classe = les définitions des méthodes qui la constituent 

exemple 

```
class Rectangle
{
  public:
    //prototype des méthodes 
    double surface() const;
    //accesseurs
    double hauteur() const;
    double largeur() const;
    //manipulateurs
    void hauteur(double);
    void largeur(double);
  private:
    double hauteur_;
    double largeur_;
}; 				// !!! ne pas oublier le ";" !!!

double Rectangle::surface() const 
{
  return hauteur_ * largeur_;
}
double Rectangle::hauteur() const 
{
  return hauteur_ ;
}
double Rectangle::largeur() const 
{
  return largeur_;
}
void Rectangle::hauteur(double h)  
{
  hauteur_ = h;
}
void Rectangle::largeur(double l)  
{
  largeur_ = l;
}
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

































