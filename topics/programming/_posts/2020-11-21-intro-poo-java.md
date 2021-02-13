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

PUBLIC ET PRIVATE

tout élément déclaré avec `private` est inaccessible en dehors de la classe

par défaut, droit d'accès par défaut, c'est-à-dire visible, accessible et utilisable partout à l'intérieur du même paquetage (visibilité de paquetage)

masquage: quand un identificateur en cache un autre; risque d'ambiguïté. On peut désambiguïser le nom en indiquant l'attribut de la classe.
On utilise pour cela la référence `this`qui est une référence sur l'instance courante (syntaxe: `this.attribut`)

```
class MaClass{
  private int x;
  public void uneMethode(int x) {
    //...
    this.x //...
  }
}
```

Comme les `String` et les tableaux et contrairement aux types élémentaires, les objets sont manipulés via des références indiquant la zone en mémoire
où sont stockées les valeurs.

Attention! Avec `==` on compare seulement les références; de même pour l'affichage, ce sont les références qui sont en jeu.

Pour indiquer qu'une variable ne contient la référence à aucun objet, on peut lui attribuer la valeur `null`,
puis tester ultérieurement si cet objet existe:
```
if(nomVariable != null) {...}
if(nomVariable == null) {...}
```

CONSTRUCTEURS

Ils doivent avoir le même nom de la classe et ne doivent pas avoir de type de retour; ils peuvent être surchargés.

```
class Rectangle
{
  private double hauteur;
  private double largeur;
  double surface(){
    return hauteur*largeur;
  }
  // constructeur:
  public Rectangle(double h, double l){
    hauteur = h;
    largeur = l;
  }
  
}
```

Déclaration avec initialisation:

```
NomClasse  nomInstance = new NomClasse(valeur_arg1,  ...,  valeur_argN)
```

Le constructeur par défaut est un constructeur qui n'a pas de paramètre.

Si aucun constructeur n'est spécifié, le compilateur génère automatiquement une version minimale du constructeur par défaut = constructeur par défaut par défaut.
C'est celui qui initialise les attributs avec les valeurs par défaut: `0` pour les entiers, `0.0`pour les doubles, `false` pour les booléens, `null` pour les objets.
Dès qu'un constructeur est spécifié (constructeur par défaut ou non), ce constructeur par défaut n'est plus fourni.

Il est autorisé qu'un constructeur en appelle un autre; avec `this()`, qui reçoit les arguments correspondant aux paramètres du constructeur que l'on souhaite appeler.
2 règles s'appliquent pour cette tournure:
1. il ne peut y avoir qu'un seul appel à un autre constructeur depuis un constructeur
2. cet appel doit être la toute première ligne du constructeur

```
class Rectangle
{
  private double hauteur;
  private double largeur;
  double surface(){
    return hauteur*largeur;
  }
  // constructeur à 2 arguments:
  public Rectangle(double h, double l){
    hauteur = h;
    largeur = l;
  }
  // constructeur sans argument
  public Rectangle(){
    // appel du constructeur à 2 arguments
    this(0.0,0.0);
  }
}
```

Initialisation par défaut des attributs

On peut donner des valeurs par défaut aux attributs, par exemple:
```
private double hauteur = 0;
private double largeur = 0;
```

Si le constructeur appelé ne modifie pas ces valeurs, elles gardent les valeurs par défaut.
Il est toutefois conseillé de donner des valeurs par défaut dans les constructeurs.

CONSTRUCTEUR DE COPIE

Créer une copie d'une instance au moyen du constructeur de copie; s'utilise comme les autres constructeurs, prend comme argument
l'instance à copier:

```
NomClasse  nomInstance1 = new NomClasse(liste_arguments);
NomClasse  nomInstance2 = new NomClasse(nomInstance1);
```
`nomInstance1` et `nomInstance2` sont deux instances distinctes mais avec des attributs de mêmes valeurs

Attention ! Contrairement à d'autres langages, Java ne propose pas de constructeur de copie par défaut.

Il faut donc affecter champ à champ chaque valeur à copier.

```
public Rectangle(Rectangle autreRectangle){
  hauteur = autreRectangle.hauteur;
  largeur = autreRectangle.largeur;
}
```
Une autre manière de copier consiste à définir une méthode en charge de la copie (usuellement la méthode `clone()`) (voir plus loin).

FIN DE VIE

En Java, il n'est pas nécessaire d'expliciter quand un objet est en fin de vie (i.e. sa référence n'est plus utilisée) et qu'il faut libérer sa zone mémoire.
Un "garbage collector" est en effet lancé périodiquement pendant l'exécution d'un programme Java.

AFFECTATION

Dans l'exemple ci-dessous, `r1` et `r2` sont deux références vers un même objet; la référence `r1` est copiée dans `r2`; on se retrouve avec 2 références vers la même zone mémoire.
Ainsi, si un attribut de `r1` est modifié, le changement est visible dans `r2`.

```
Rectangle r1 = new Rectangle(5.0, 4.0);
Rectangle r2 = r1;
```

Pour obtenir copie distincte, il faut passer par le constructeur de copie.

```
Rectangle r2 = new Rectangle(r1);
```

AFFICHAGE

Si on utilise `println` sur l'objet directement, c'est la référence qui est affichée - pas très utile. Java prévoit qu'une méthode retourne une représentation de l'instance sous forme de chaine de caractères. Cette méthode doit être déclarée dans la classe de l'objet avec la syntaxe suivante:

```
String toString(){...}
```

Cette méthode est ensuite automatiquement évoquée par la méthode `println`.

COMPARAISON

Avec `==`, on ne compare que les références de deux objets (dans la plupart des cas, elles sont différentes même si le contenu est identique). Java prévoit donc une méthode dédiée pour la comparaison de deux objets: `equals()`; il faut l'implémenter dans la classe, par exemple:

```
class Rectangle{
//...
	public boolean equals(Rectangle true)
	{
	  if(autre == null){
	    return false;
	  } else {
	    return(hauteur == autre.hauteur && largeur == autre.largeur);
	  }
	}
}
```

On commence en général par vérifier que l'argument n'est pas `null` avant de comparer champ à champ.

2 entêtes possibles pour la méthode `equals()`:
(voir plus loin)

```
boolean equals(UneClasse c);
boolean equals(Object c);
```

HERITAGE

Pour faire hériter une classe d'une super-classe, on utilise la syntaxe

```
class NomSousClasse extends NomSuperClasse{
	//...
}
```

Le droit d'accès `protected` assure la visibilité des membres dans toutes les classes de sa descendance; extension du mode privé (visible que dans la classe), accorde la visibilité 
à toutes les sous-classes mais également à toutes les classes du même paquetage !


SPECIALISATION

Si une méthode est redéfinie dans la sous-classe, la version spécialisée l'emporte sur la version héritée (redéfinition = partage d'un même nom de méthode sur plusieurs niveaux d'une hiérarchie de classe). Redéfinir les méthodes (méthodes générales) est courant, permet de les spécialiser (méthodes spécialisées).

Aussi le masquage = déclaration d'un attribut dans une sous-classe ayant le même nom qu'un attribut d'une classe plus haute dans la hiérarchie. Consiste à nommer un attribut par le même nom (pas forcément le même type !) qu'un attribut hérité, qui masquera ce dernier.

Un objet dont un des membres est spécialisé dispose également du membre hérité bien qu'il ne soit jamais appelé en raison de la résolution de portée.
Peut être désigné en utilisant le mot-clé `super` (`super.method()` ou `super.attribut`).

HERITAGE: CONSTRUCTEURS

L'instanciation de la classe s'accompagne de l'initialisation de ses attributs; ne peut pas être pris en charge uniquement par le constructeur de la sous-classe puisque celle-ci hérite des attributs, parfois privés de la super-classe, qu'elle ne peut pas initialiser.

Chaque constructeur de la sous-classe doit donc faire appel au constructeur de la super-classe. En Java, l'appel au constructeur de la super-classe depuis le constructeur de la sous-classe se fait au tout début du corps du constructeur avec `super`, selon la syntaxe:

```
SousClasse(liste de paramètres){

/* Arguments = liste d'arguments attendus par le constructeurs de la superclasse
  super(Arguments)
  
  //initialisation des attributs de SousClasse ici
  
}
```

Exemple:

```
class FigureGeometrique{
  private Position position;
  public FigureGeometrique(double x, double y){
    position = new Position(x,y);
  }
  //...
}

class Rectangle extends FigureGeometrique{
  private double largeur;
  private double hauteur;
  public Rectangle(double x, double y, double h, double l){
    super(x,y);
    largeur = l;
    hauteur = h;
  }
}

class Carre extends Rectangle {
  public Carre(double taille){
    super(taille, taille);
  }
}
```

Un appel explicite au constructeur de la super-classe n'est pas nécessaire si elle possède un constructeur par défaut puisque l'appel est alors effectué par le compilateur.
Sans constructeur par défaut, l'appel doit être explicite.

Rappel: le constructeur par défaut (sans arguments) existe par défaut uniquement si la classe n'a pas de constructeur.

Il est conseillé de toujours déclarer au moins un constructeur pour chaque classe et d'effectuer un appel explicite à un constructeur de la super-classe, même à celui par défaut.

ORDRE D'APPEL DES CONSTRUCTEURS

La construction d'une sous-classe appelle d'abord le constructeur de la super-classe la plus générale, puis dans l'ordre, les constructeurs des super-classes qui en héritent, avant de terminer par l'initialisation de la partie spécifique de la classe instanciée.

LE POLYMORPHISME

Le polymorphisme permet à un code de s'adapter aux types de données auxquels il s'applique.

2 approches:
1. résolution statique des liens = regarder le type apparent (i.e. le type de variable qui contient la référence vers l'objet)
2. résolution dynamique des liens = observer le type effectif de l'objet stocké dans la variable

En Java, c'est la deuxième qui est mise en oeuvre. L'héritage de type et à la résolution dynamique rendent possibles le polymorphisme, qui permet à un même code puisse s'exécuter de façon différente à la donnée à laquelle il s'applique.

```
//...
Personnage unPersonnage = new Guerrier();
unPersonnage.rencontrer(unAutrePersonnage);
//...

class Jeu{
  private Personnage joueur;
  private Personnage[] adversaires;
  //...
  public void tourDeJeu(){
    for(int i = 0; i < adversaires.length; i++){
      adversaires[i].rencontrer(joueur);
    }
  }
  //...
}
```

CLASSES ET METHODES ABSTRAITES

Méthodes abstraites: en Java, elles sont précédées par le mot-clé `abstract`, ne possèdent pas de corps et se terminent par un point-virgule:

```
public abstract double surface();
```

Ceci permet d'imposer à toutes les sous-classes que l'on souhaite instancier une redéfinition de cette méthode héritée. Toutes les sous-classes que l'on veut instancier seront obligées de spécifier une définition concrète pour la méthode.

Classes abstraites: toute classe possédant au moins une méthode abstraite est automatiquement une classe abstraite; ces classes sont non instanciables ! Elles doivent être précédées par le mot-clé `abstract`; il est impossible de créer une instance d'une classe abstraite.

```
public abstract class Forme {...}
```

Ces classes permettent de définir des concepts génériques qui sont communs à toutes les sous-classes mais trop abstraits pour être codés en toute généralité.

HERITAGE DE METHODES ABSTRAITES

Une classe est abstraite si elle contient une méthode abstraite. Cela reste vrai pour des méthodes abstraites héritées. Une sous-classe dérivant directement ou indirectement d'une classe abstraite doit redéfinir toutes les méthodes abstraites héritées pour devenir non abstraite (i.e. pour devenir instantiable). 

CONSTRUCTEUR ET POLYMORPHISME

Un constructeur a comme vocation d'initialiser l'instance courante. Donc par essence non polymorphique. Peut invoquer des méthodes polymorphiques, mais cela est déconseillé.

SUPER-CLASSE OBJECT

En Java, tout type évolué est en fait une sous-classe de la classe `Object` (c'est de là que viennent les méthodes `equals()` et `toString()` par exemple). Tous les objets héritent donc automatiquement de cette super-classe universelle à la racine de leur arbre d'héritage.

SURCHARGE ET REDEFINITION

En Java il existe 2 façons possibles d'avoir des méthodes avec le même nom dans une seule classe:
1. surcharge (overloading): il existe plusieurs méthodes avec le même nom dans une classe.
2. redéfinition (overriding): n'existe que pour les méthodes héritées. Si une sous-classe définit une méthode qui est déjà spécifiée dans une super-classe en utilisant exactement le même nom, la même liste de paramètres et un type de retour compatible alors la méthode est redéfinie. Il s'agit dès lors d'une méthode polymorphique.

Pour les types de base, un type de retour compatible = ce même type (une méthode qui retourne un `int` ne peut être redéfinie que par une méthode qui retourne un `int`). Mais pour les types évolués, il est possible de retourner un objet d'une sous-classe du type de retour de la méthode héritée. 

LE MODIFICATEUR FINAL

Le modificateur `final` a plusieurs fonctions; peut s'appliquer à des variables, des méthodes et des classes; s'écrit après le modificateur de droit d'accès. Exemple: 

```
public final int plus(){...}
```

METHODES FINALES

Ces méthodes ne peuvent pas être redéfinies dans des éventuelles sous-classes de la classe. Permet de fixer le comportement de la méthode une fois pour toute, se comportant de la même manière pour toutes les sous-classes.

CLASSES FINALES

Une classe définie comme finale ne peut avoir de sous-classe (ne peut pas être étendue par héritage).

VARIABLES FINALES

A une variable finale, on ne peut affecter une valeur qu'une seule fois; cette valeur ne pourra pas être modifiée par la suite (vrai pour les variables locales, les variables d'instance ainsi que les paramètres d'une méthode).
Par exemple, si un attribut est déclaré comme `final`, une valeur doit lui être affectée soit lors de son initialisation soit dans le constructeur, mais pas les deux. S'il existe plusieurs constructeurs, on doit lui affecter une valeur dans tous les constructeurs (un seul constructeur est exécuté par objet).

VARIABLES FINALES DE TYPE EVOLUE

Java ne stocke que la référence vers un objet dans une variable du type évolué.
Si une variable contenant la référence à un objet est finale, elle ne peut pas contenir la référence à un autre objet. La variable ne peut pas être modifiée. 

Attention ! Cela ne signifie pas que l'objet référencé par la variable ne puisse être modifié. `final` n'est pas équivalent à non modifiable pour l'objet référencé:

```
class Conteneur{
  private int valeur;
  public void setValeur(int val) { valeur = val;}
}
class Test{
  public static void main(String[] args) {
    Conteneur c = new Conteneur();
    c.setValeur(42);
    modifier(c);
  }
  static void modifier(final Conteneur c){
    c.setValeur(1); // modifie l'objet référencé !!! 
    // c = new Conteneur(); FAUX !!!
  }
}
```

ATTRIBUTS STATIQUES

Types de variables:
1. variables locales, déclarées dans un corps de méthode
2. paramètres de méthodes
3. variables d'instance (aussi appelées attributs, stockent les variables spécifiques à une instance)
4. variables statiques


En Java, il est possible de définir des variables de classe ou statiques pour les attributs (pas pour les variables locales !). S'écrit en ajoutant le mot-clé `static` à la définition:

```
private static int ageRetraite = 65;
```

Les variables statiques sont des attributs partagés par toutes les instances d'une classe. Si leur valeur change, elle change pour toutes les instances. Elles n'ont pas besoin d'objets pour être utilisables. Elles sont initialisées au chargement du programme et peuvent être appelées sans création préalable d'une instance de classe. Exemple d'appel:

```
Employe.ageRetraite = 67;
```

On utilise le nom de la classe pour accéder à l'attribut statique, sans devoir s'occuper d'une instance. Mais il est également possible de manipuler la variable statique comme l'attribut normal d'un objet:

```
Employe e = new Employe();
e.ageRetraite = 66;
```

Grandes différences entre variables statiques et non statiques:
1. les variables d'instance sont stockées dans la zone mémoire de leur instance; les attributs statiques sont stockés dans une zone mémoire unique liée à la classe et non aux instances (initialisés au début du programme)
2. si on change la valeur d'une variable d'instance, elle ne change que pour son instance; avec une variable statique, le changement sera visible pour tous les objets

La bonne manière est d'utiliser les attributs statiques uniquement pour représenter les valeurs communes à tous les objets (typiquement des constantes).

METHODES STATIQUES

Comme pour les variables statiques, il existe des méthodes statiques ou méthodes de classe. Elles se définissent aussi avec le mot-clé `static`; comme les variables statiques, elles sont accessibles sans avoir besoin d'instance de classe; une méthode statique peut également être appelé sur un objet existant (mais cette façon de faire n'est pas usitée).

```
class A {
  static void method1(){
    System.out.println("méthode 1");
  }
  void method2(){
    System.out.println("méthode 2");
  }
}
class ExempleMethodeStatique{
  public static void main(String[] args){
    A.methode1(); // OK
    //A.methode2(); // NON
    A v = new A();
    v.methode1(); // ok, alternative
    v.methode2(); // ok
  }
}
```

Attention ! Comme il n'est pas garanti qu'un objet existe lors de l'exécution d'un programme, on n'a pas le droit d'utiliser des membres non statiques de la même classe dans une méthode statique.
Typiquement, la référence `this` et les variables d'instances sont interdites.
Mais il est permis d'appeler les méthodes et variables statiques.

Il est également possible de créer un objet dans une méthode statique et d'utiliser des méthodes non statiques de l'objet que l'on vient de créer via cet objet.

Les méthodes statiques sont utilisées pour des méthodes générales non spécifiques à un objet. Ce sont typiquement des méthodes auxiliaires (méthodes outils).

En principe, 3 bonnes raisons d'utiliser `static`:
1. définir des constantes avec le mot-clé supplémentaire `final` (courant)
2. définir des valeurs communes à toutes les instances qui peuvent changer (rare)
3. définir des méthodes outils qui ne sont pas attachées à un objet (moins courant; voir aussi INTERFACES)

INTERFACES

Attention ! Java ne tolère que l'héritage simple.

La notion d'interface permet de pallier. Elle permet d'imposer un contenu à des classes sans pour autant mettre en place un lien d'héritage.

Une interface s'écrit presque comme une classe, avec la syntaxe suivante:

```
public interface Interactif {...}
```

Les interfaces ressemblent beaucoup aux classes; conçues initialement pour ne comprendre que des méthodes abstraites et des constantes (cela a changé depuis Java 8).

Comme les classes abstraites, les interfaces ne peuvent pas être instanciées. Elles ne possèdent pas de constructeur. Les méthodes abstraites sont celles qui doivent être imposées à certaines classes. 

Java ne nous oblige pas à ajouter le mot `abstract` puisque toutes ses méthodes sont nécessairement abstraites, ainsi que publiques. Le mot-clé `public` n'est donc pas nécessaire non plus.

Idem pour les constantes d'une interface, elles sont toutes publiques. Comme ce sont des constantes, elles sont également toutes finales et statiques. Elles sont initialisées en même temps qu'elles sont déclarées. Exemple:

```
public interface Interactif{
  int CONSTANTE = 3;
}

```
Les interfaces peuvent être liées entre elles par un lien d'héritage; les sous-interfaces héritent du contenu des super-interfaces, et le lien d'héritage est établii par le mot-clé `extends`.
Exemple:
```
interface Interactif{...}
interface GerableParClavier extends Interactif{...}
```

Afin de contraindre une classe à définir une méthode sans pour autant la faire hériter d'une classe abstraite, il faut la lier à une interface contenant la méthode en question. Exemple:


```
public class Balle extends Entite implements Interactif {}

public class A implements B,C{...}
```

Une classe peut donc implémenter plusieurs interfaces.

Implémenter une interface = une classe liée à une interface est forcée de donner une définition concrète de toutes les méthodes abstraites de l'interface pour pouvoir l'instancier.

Attention ! Comme une méthode d'interface est nécessairement publique, son implémentation dans une classe devra l'être aussi.

Ceci est valable partout en Java ! Lors d'une redéfinition, il n'est permis que d'élargir les droits d'accès à une méthode et non de les restreindre.

Si une classe implémente plusieurs interfaces et que 2 interfaces possèdent le même entête de méthode abstraite, il n'y a pas ambiguïté car ce que fait la méthode n'est pas encore défini. La méthode choisie sera de toute façon celle présente dans la classe qui implémente l'interface.

Par contre, si 2 interfaces ont une constante avec le même nom, il y a ambiguïté. De telles constantes ne pourront être utilisées sans indiquer explicitement à quelle interface elles appartiennent (sinon erreur du compilateur).

La composition/délégation est le cas de figure où une classe possède un attribut qui est l'instance d'une autre (relation "a-un").

L'héritage est lui une relation "est-un".

Les interfaces introduisent un nouveau type de relation: "se comporte comme". Vocation première d'une interface: imposer un contrat de comportement aux classes qui l'implémente.

OBJETS DE TYPE INTERFACE

Une interface définit un nouveau type dans un programme; un objet qui implémente une interface possède donc le type d'interface comme type supplémentaire.

On peut donc déclarer des variables ayant pour type celui d'une interface. La création des objets affectés à ces variables devra cependant nécessairement se faire par le biais des constructeurs de la classe à laquelle ils appartiennent: il n'y a pas de constructeurs dans les interfaces !

Exemple: il est possible de créer un tableau de `Graphique` est de le remplir d'objets de type `Balle`, `Raquette`, etc. qui implémentent `Graphique`; par contre, pour assigner un `Graphique` à une `Balle` nécessiterait un transtypage.

```
Graphique graphique;
Balle balle = new Balle(...);
graphique = balle;
Entite entite = new Balle(...);
graphique = (Graphique) entite;  // transtypage indispensable !!!
```

INTERFACES EN JAVA 8

Concept d'interface augmenté. Depuis Java 8 il est également possible de déclarer des méthodes avec définition par défaut et méthodes statiques dans une interface.

Depuis Java 8, une méthode d'interface peut être dotée d'un corps. Il s'agit dès lors d'une définition par défaut, à indiquer avec le mot-clé `default`; exemple:


```
default void peutDescendre(){...}
```

Mais ambiguïté possible: si une classe implémente 2 interfaces qui comportent toutes deux une méthode par défaut de même nom avec des comportements différents. 
4 règles fondamentales pour lever les ambiguïtés:

1. les définitions par défaut s'héritent. Les interfaces peuvent hériter d'interface. Les méthodes héritées sont automatiquement incluses. La sous-interface a toutefois la possibilité de redéfinir une méthode pour changer le comportement d'une méthode par défaut héritée ou pour définir concrètement une méthode qui était abstraite dans la super-interface.

2. une classe implémentant une interface n'est plus obligée de redéfinir les méthodes par défaut de celle-ci. Habituellement une classe doit redéfinir toutes les méthodes des interfaces qu'elle implémente pour instanciable. Toujours vrai, mais seulement pour les méthodes abstraites. Les méthodes avec définition par défaut sont héritées par les classes, de la même façon qu'une méthode d'une super-classe. Avantage de cette règle: elle permet l'ajout de méthodes à des interfaces qui sont déjà en usage. Avant Java 8, si l'on voulait ajouter une nouvelle méthode à une interface existante, il fallait ensuite retoucher toutes les classes qui implémentaient l'interface. Sinon ces classes n'étaient plus instanciables car elles ne définissaient plus toutes les méthodes. Depuis Java 8, il est de nouveau possible de changer les interfaces existantes en leur ajoutant des méthodes avec des définitions par défaut.

3. en cas d'ambiguïté, les méthodes de classe ont la préséance sur les méthodes par défaut des interfaces. Cette règle est appliquée dans le cas d'une classe qui, d'un côté, hérite d'une méthode depuis une super-classe, et, de l'autre, implémente une interface contenant une méthode par défaut de même nom que celle héritée de la super-classe. Par défaut, la méthode de la super-classe sera appelée lors de l'invocation de la méthode sur la classe en question. Par défaut, la méthode de la super-classe sera appelée lors de l'invocation de la méthode sur la classe en question. Néanmoins, il est également possible d'utiliser la méthode de l'interface. L'appel à une méthode par défaut d'une interface doit se faire avec la syntaxe `nomInterface.super.nomMethode()`. Le mot-clé `super` aide à distinguer un tel appel d'un appel à une méthode statique (`nomClasse.nomMethode()`)

```
class Guerrier extends Personnage implements Cavalier{
  public void seDeplace(){
    Cavalier.super.seDeplace();
  }
}
```

4. si une classe implémente deux interfaces proposant toutes deux une définition par défaut pour une même méthode, elle est en charge de lever l'ambiguïté. Dans ce cas, il s'agit d'un conflit entre 2 méthodes par défaut provenant de 2 interfaces différentes. On lève l'ambiguïté de la même manière que la règle précédente. La classe doit redéfinir la méthode et faire un appel à l'une des 2 méthodes par défaut en utilisant la syntaxe ci-dessous. Le choix de la méthode peut aussi se faire dynamiquement, par exemple en fonction de l'état de la classe.

```
interface Dragonier extends Chevauchant{
  default void seDeplace(){System.out.println("vole");}
}

interface SeTeleporte{
  default void seDeplace(){System.out.println("plop!");}
}

class MageUltime extends Magicien implements Dragonier, SeTeleporte{
  // conflit sur la définition de seDeplace
  //utiliser la même syntaxe que précédemment, exemple:
  public void seDeplace(){Dragonier.super.seDeplace();}
}
```

INTERFACES VS. CLASSES ABSTRAITES

Principale différence: les interfaces ne peuvent pas avoir d'état - de variables d'instances. Elles ne possèdent que des constantes et elles n'ont pas de constructeur.

Ainsi, on utilise des interfaces quand on veut modéliser un comportement ou un lien fonctionnel qui est indépendant d'un éventuel état de l'objet.

On utilise des classes abstraites quand les objets ont des états.

GESTION DES EXCEPTIONS

Une exception est un objet (type prédéfini `Exception`) dédié à la gestion de situations d'erreur.
Une méthode qui détecte une situation anormale sans savoir comment la gérer elle-même peut créer un tel objet et le lancer, afin d'informer les autres niveaux du programme de la situation.
Cet objet se propage automatiquement aux méthodes appelantes. Ces dernières peuvent alors, si elle le juge opportun, attraper l'exception et l'utiliser pour gérer la situation d'erreur de manière appropriée.
Une exception lancée et jamais attrapée provoque simplement l'arrêt du programme.

La mise en oeuvre de la gestion des exceptions se fait au moyen de 4 mécanismes
1. le lancement d'une exception dans une méthode découvrant une situation anormale sans pouvoir la traiter directement se fait au moyen du mot-clé `throw`
2. une méthode qui juge opportun de traiter une exception lancée par un certain nombre de ses instructions, englobera ces dernières dans un bloc précédé du mot réservé `try` (elle essaie d'exécuter ces instructions sachant qu'elles peuvent potentiellement lancer un objet exception). Le bloc `try` signale donc un endroit réceptif aux exceptions lancées
3. un bloc `try` est suivi de 1 ou plusieurs blocs désigné par le mot-clé `catch`; ce sont vers ces blocs d'instructions que va se diriger l'exécution si une instruction du bloc `try` a lancé une exception; les blocs `catch` attrapent donc l'exception pour la traiter
4. les blocs `catch` sont parfois suivis d'un bloc associé au mot-clé `finally` qui se charge de faire le ménage (e.g. libérer certaines ressources) après qu'une exception ait été traitée' 

TYPES D'EXCEPTIONS

Le lancement d'une exception consiste à créer un objet de type `Exception` et à déclencher un mécanisme qui rendra cet objet accessible à d'autres parties du programme.
La classe `Exception` est fournie par l'API de Java et elle est une sous-classe de la classe `Throwable`. Cette dernière possède quelques méthodes très utiles (e.g. `getMessage()`).

De la super-classe `Throwable` dérive 2 sous-classes
1. `Error`: représente les erreurs fatales (e.g. erreurs de mémoire), trop graves pour être gérées par le programmeur; nécessitent l'arrêt du programme
2. `Exception`: représente les exceptions (situations anormales), 2 sous-catégories: i) checked exceptions = exceptions que le programmeur est obligé de considérer (doit les traiter ou les signaler selon des syntaxes montrées plus loin, sinon le programme ne compile pas); ii) unchecked exceptions = exceptions que le programmeur n'est pas forcé de traiter (typiquement parce que ne devraient pas se produire si le codage avait été correct)

LANCEMENT D'ERREUR

Syntaxe pour lancer un objet de type `Exception`

```
throw new Exception("message erreur");
```

`Exception` peut être remplacé par le nom de n'importe laquelle des sous-classes (e.g. `RuntimeException`, `IOException`); tous ces objets peuvent aussi être lancés sans le `String` du message d'erreur.

Pour que les exceptions lancées puissent être attrapées, il faut que le `throw` ait été exécuté depuis un **endroit réceptif aux erreurs** dans le programme. Un endroit réceptif est un bloc précédé du mot-clé `try`. Exemple:

```
try{
  //...
  if(...) {
    throw new Exception("quelle erreur!");
  }
  //...
}
catch(Exception e){
  //...
}
```

Si l'exécution d'une instruction contenue dans un bloc `try` lance une exception, le programme  ne passera pas à l'instruction suivante. L'exécution se poursuivra en revanche dans le bloc `catch` permettant de traiter le type d'exception lancée.

Un bloc réceptif peut avoir plusieurs `catch` associés, tous avec la même syntaxe (voir ci-dessus). Il est ainsi possible d'exécuter un traitement spécifique à un type d'exception donné.

si l'exécution d'un bloc `try` ne suscite aucun lancement d'exception, les blocs `catch` sont ignorés et l'exécution se poursuit aussi depuis l'endroit suivant le dernier bloc `catch`.

Il est important de toujours ordonner les blocs de traitement par niveau d'exception de plus en plus général (`Exception` toujours en dernier) car le programme choisit le premier bloc `catch` possible. 

```
try{
  //...
  if(age >= 100){
    throw new Exception("age trop grand");
  }
  //...
  if(age == 0.0){
    throw new ArithmeticException("division zero");
  }
  //...
  catch(ArithmeticException e){
    System.out.println(e.getMessage());
    e.printStackTrace();
  }
  catch(Exception e){
    System.out.println("qui peut vivre si vieux");
  }
}
```

`finally` désigne un bloc d'instruction spécifique; ses instructions sont toujours exécutées quel que soit le déroulement du programme, qu'il y ait eu lancement d'exception ou pas.
Si une exception est traitée, le bloc `finally` est exécuté après le bloc `catch`.
Il le sera aussi s'il n'y a pas de lancement d'exception et ce même si le bloc `try` contient un `return` !!!
Le bloc `finally` est aussi exécuté en cas de lancement d'exception non interceptée par un bloc `catch`.

Exemple d'utilisation de `finally`: dans la gestion de fichier, pour assurer qu'un fichier en lecture sera fermé.

RELANCEMENT

Le relancement d'exception: une partie intermédiaire du programme attrape l'exception par le biais d'un `catch`, lui ajoute des informations utiles et la relance avec un nouveau `throw`.
Cette manière de gérer les exceptions est aussi appelée le traitement partiel (la méthode intermédiaire traite partiellement l'erreur avant de la renvoyer aux méthodes appelantes). Exemple:

```
for(int i = 0; i < t.size(); i++) {
  try{
    plot(inverse(t.get(i)));
  } catch(ArithmeticException e) {
     System.out.println("problème indice " + i);
     // RELANCEMENT
     throw e;
  })
})
```

TRAITER OU DECLARER

Les exceptions sont soit de type unchecked exception, soit de type checked exception. Seules les RunTimeException et les Error sont de type unchecked.

Si une méthode `m_1` appelle une méthode `m_2` lançant potentiellement une exception de type `T`. Si l'exception lancée par `m_2` est une checked exception `m_1` a l'obligation de:
- la traiter = englober l'appel à `m_2` dans un bloc `try` auquel est assorti un bloc `catch` traitant l'exception
- ou la déclarer = signifer dans son entête qu'elle peut elle-même lancer une exception de type `T` 

Sans faire l'un ou l'autre, le programme ne compile pas.

Une exception est déclarée dans l'entête de la méthode en employant le mot-clé `throws` suivi de la liste des (checked) exception, exemple:

```
public void exampleMethod() throws IOException;
public void autreMethod() throws IOException, Exception;
```

Il est possible d'indiquer des unchecked exception selon la même syntaxe, en guise d'information.

Les `RunTimeException` sont des erreurs à l'exécution généralement difficiles à corriger. Typiquement évitables par une programmation correcte. Serait lourd d'imposer le traitement systématique à l'utilisateur.

A l'inverse les checked exceptions modélisent des situations anormales non issues d'une programmation mais plutôt de conditions d'utilisation atypiques.

EXCEPTIONS SPECIALISEES

Il est fortement recommandé d'utiliser l'exception la plus spécifique. On peut définir ses propres sous-classe d'`Exception` ou d'une de ses sous-classes existantes, par simple héritage.

```
class MonException extends Exception
{
  public MonException(){
    super("mon message par défaut");
  }
  public MonException(String message){
    super(message);
  }
}
```

Pour préserver le fonctionnement usuel de cette méthode lors de la définition de classes personnalisées d'exceptions, il convient de munir ces classes de 2 constructeurs:
1. un constructeur par défaut, initialisant le message avec une valeur prédéfinie
2. un second constructeur prenant en paramètre une chaine de caractères qu'il utilisera lors de l'appel au constructeur de la super-classe

Conseil: limiter l'utilisation des exceptions aux situations où il s'impose.

```
```
```
```
```
```
```
```
```


