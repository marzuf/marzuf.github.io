---
title: Introduction à la programmation orientée objet (en Java)
description: introduction POO Java
tags: [java] 
category : programming
status: reading
update: 2020-11-21
authors:
  - id: marzuf
    corresponding: true
---

Notes de lecture - cours EPFL

ENCAPSULATION ET ABSTRACTION

encapsulation = regrouper dans une seule et même entité des données et des traitements qui agissent sur celles-ci

ces données sont désignées par le terme "attribut" et les traitements par les termes "méthodes"; le tout défini au sein d'une classe

CLASSES

une classe est un nouveau type de données dont les instances sont des objets

Exemple:

```
class Exemple
{
  public static void main(String[] args){
    Rectangle rect1 = new Rectangle();
    rect1.hauteur = 3.0;
    rect2.largeur = 2.0;
    System.out.println("hauteur = " + rect1.hauteur);
    System.out.println("hauteur = " + rect1.surface());
  }
}
class Rectangle
{
  double hauteur;
  double largeur;
  double surface(){
    return hauteur*largeur;
  }
}
```

pour initialiser une instance: avec le mot-clé `new`

```
nom_instance = new nom_classe();
```

pour déclarer et initialiser en une seule ligne 

```
nom_classe nom_instance = new nom_classe();
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


