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

##### Constructeurs: introduction

on pourrait utiliser des manipulateurs mais cela serait contraire à l'encapsulation et obligerait l'utilisateur à initialiser explicitement tous les attributs 

meilleure solution est d'utiliser le constructeur = une méthode dédiée à l'initialisation des attributs et qui prend en paramètres les valeurs que prendront les attributs; peut aussi servir à vérifier la validité des données

constructeur = méthode invoquée systématiquement lors de la création d'un objet et chargée d'effectuer les opérations d'initialisation de celui-ci, notamment de ses attributs

le constructeur a le même nom que la classe et n'a pas de type de retour; on peut faire des surcharges de constructeurs (sera appelé celui dont les paramètres correspondent aux arguments donnés) et donner des valeurs par défaut à leurs paramètres

pour appeler directement le constructeur d'un attribut-objet, mais aussi pour initialiser des attributs des types de base, on utilise la liste d'initialisation en dehors du corps du constructeur; usage recommandé pour éviter les copies superflues et par souci de lisibilité; pour les attributs de types de base, il suffit de spécifier la valeur entre parenthèses, après le nom de l'attribut, pour l'initialiser; cela évite également les problèmes de masquages: la liste d'initialisation distingue attributs et paramètres

exemple:

```
class Rectangle
{
  public:
    Rectangle(double h, double L) 
    {
      double hauteur = h;
      double largeur = L;
    }
  private:
    double hauteur;
    double largeur;
}; 				// !!! ne pas oublier le ";" !!!

classe RectangleColore
{
  public:
    RectangleColore(double h, double L, Couleur c): rectangle(h, L), couleur(c){}
  private:
    Rectangle rectangle;
    Couleur couleur;
}

int main(){
  Rectangle rect1(3.0,4.0);
} 
```
les initialisations par cette liste peuvent ensuite être modifiées dans le corps du constructeur; un avantage de la liste d'initialisation est donc de donner une valeur initiale aux attributs avant même de rentrer dans le corps du constructeur, qui reste souvent vide

exemple:

```
Rectangle(double L, double h)
  : hauteur(h)  // seulement hauteur initialisée ici avant le corps de la fonction 
{
  // largeur indéfinie jusqu'ici
  largeur = 2.0 * L + h; 
  // largeur est désormais définie
}
```
##### Constructeurs par défaut

le constructeur par défaut est appelé lors de la déclaration d'un objet sans valeurs d'initialisation; constructeur qui ne prend pas de paramètre ou dont tous les paramètres ont une valeur par défaut, e.g.

```
// constructeur par défaut
Rectangle(): hauteur(1.0), largeur(2.0){}
// 2ème constructeur 
Rectangle(double h): hauteur(h), largeur(2.0*h){}  
// 3ème constructeur 
Rectangle(double h, double l): hauteur(h), largeur(l){}    
```

l'appel au constructeur par défaut se fait avec la syntaxe:

```
NomClasse NomInstance; 
```
attention: ne pas ajouter de parenthèses vides après le nom de l'instance !!! (autrement interprété comme le prototype d'une fonction)

constructeur par défaut par défaut = si aucun constructeur n'est explicité, le compilateur génère automatiquement une version minimale du constructeur par défaut; responsable d'appeler le constructeur par défaut des attributs lorsqu'il s'agit d'objets, et laisse les attributs de base (`int`, `double`, `char`, `bool`, ...) non initialisés

dès qu'un constructeur, par défaut ou non, est spécifié, le constructeur par défaut par défaut n'est plus fourni; ainsi, si un constructeur est défini sans spécifier un constructeur par défaut, l'utilisateur se voit obligé d'initialiser explicitement les objets

depuis C++11 il est possible de réactiver le constructeur par défaut par défaut (choix surtout pertinent quand les attributs sont des objets); syntaxe: 

```
NomClasse() = default;
```

remarques:
* réactiver une variante par défaut est généralisable à d'autres méthodes
* il est possible de supprimer une méthode avec `= delete;` après le prototype de la méthode à supprimer

depuis C++11 il est autorisé qu'un constructeur en appelle un autre en utilisant la liste d'initialisation et les arguments correspondants; plutôt que de réactiver le constructeur par défaut par défaut qui n'initialise pas les types de base, il est conseillé d'employer cette tournure 

exemple:

```
class Rectangle
{
  private:
    double hauteur; double largeur;
  public:
    Rectangle(double h, double L): hauteur(h), Largeur(L){}
    Rectangle(): Rectangle(0.0, 0.0) {}  // mieux que Rectangle() = default;   // constructeur par défaut qui appelle le 1er constructeur 
    // ...
}
```
il est possible de donner directement une valeur par défaut aux attributs (e.g. pour ci-dessus: `double hauteur = 0.0; double largeur = 0.0;`); lorsqu'une instance de cette classe est initialisée, si le constructeur appelé ne modifie pas la valeur de cet attribut, ce dernier prend alors la valeur par défaut; il est toutefois conseillé d'affecter des valeurs par défaut aux attributs à l'intérieur des constructeurs plutôt que d'utiliser les valeurs par défaut

##### Constructeurs de copie

constructeur de copie permet de créer une copie d'une instance; s'utilise comme les autres et prend pour seul argument l'instance à copier

exemple:
```
NomClasse Instance1(liste_arguments);
NomClasse Instance2(Instance1);
```
après ces instructions, `Instance1` et `Instance2` sont 2 instances distinctes, mais leurs attributs ont les mêmes valeurs

le constructeur de copie est notamment utilisé lorsque l'argument d'une fonction passé par valeur est ainsi copié dans une variable locale

s'agissant d'un constructeur dont le paramètre est une instance de la même classe, le prototype du constructeur de copie est le suivant:

```
NomClasse(NomClasse const& autre) {...}
```

attention !!! l'usage de la référence (constante puisque l'instance copiée n'est pas modifiée) est important pour ne pas avoir de copie qui induirait un appel récursif (fonction s'appelant elle-même) de ce constructeur 

exemple:

```
Rectangle(Rectangle const& autre): hauteur(autre.hauteur), largeur(autre.largeur){}
```

il n'est souvent pas nécessaire de définir explicitement le constructeur de copie: le compilateur fournit une version par défaut, souvent suffisante. Cet outil réalise alors une copie de surface, qui recopie la valeur des attributs; la redéfinition de ce constructeur est nécessaire dans certains cas particuliers (e.g. utilisation de pointeurs)

règle à mémoriser: si on redéfinit une des méthodes que sont le constructeur de copie, le destructeur et l'opérateur d'affectation, alors il faut s'interroger sur la redéfinition des deux autres.

lorsqu'une instance de classe occupe trop de mémoire pour être dupliquée, C++11 permet d'en empêcher la copie; pour cela, il faut placer `=delete` à la fin du prototype du constructeur de copie 

```
class PasCopiable {
/* ...*/
  PasCopiable(PasCopiable const&) = delete;
}
```

##### Destructeurs

la gestion de la fin de vie devient nécessaire lorsque l'initialisation de ce dernier mobilise des ressources (e.g. périphériques, portions de mémoire, etc.)

destructeurs: méthodes dont la particularité est d'être invoquées automatiquement en fin de vie de l'instance; leur nom est le même que celuli de la classe, précédé de `~`; méthode sans paramètre, qui ne peut donc pas être surchargée; syntaxe:

```
~NomClasse () { //opération de libération}
```

si le destructeur n'est pas défini explicitement, le compilateur en génère automatiquement une version minimale par défaut dont le corps est vide (n'est pas toujours suffisante même sans allocation de ressources, e.g. si on maintient un compteur du nombre d'instances)

rappel de la règle à mémoriser: si on redéfinit une des méthodes que sont le constructeur de copie, le destructeur et l'opérateur d'affectation, alors il faut s'interroger sur la redéfinition des deux autres; à cette liste de méthodes liées, on peut ajouter le constructeur de déplacement et l'opérateur de déplacement 

NB: sémantique de déplacement, voir http://olivierpisano.over-blog.com/article-influence-de-la-semantique-de-deplacement-dans-la-stl-de-c-11-58905115.html


Déplacement contre copie: 

La nouvelle norme du langage C++ introduit une nouveauté de taille, les rvalue references, destinées à réduire le nombre de copies d'objets en privilégiant le déplacement d'un objet plutôt que sa copie lorsque cela est possible. Une rvalue reference est une référence vers un objet anonyme temporaire et s'écrit au moyen de `&&` au lieu de `&`. Exemple d'une forme canonique d'une classe T:

```
class T
{
  int* pi;
  public:
    T() : pi(new int[100000]) { }
    ~T() { delete[] pi; }
 
    // Sémantique de copie
    T(const T& t) : pi(new int[100000]) { memcpy(pi, t.pi, 
    100000 * sizeof(int)); } 
    T& operator=(const T& t) {memcpy(pi, t.pi, 100000 * sizeof(int));}
 
    // Sémantique de déplacement
    T(T&& t) : pi(t.pi) {t.pi = nullptr; }
    T& operator=(T&& t) {std::swap(pi, t.pi); return *this; }
 };
```

! attention ! dans les méthodes à implémenter pour le déplacement, le paramètre n'est pas constant, puisque celui-ci est destiné à être invalidé par le déplacement.

Le constructeur de déplacement sera utilisé par le compilateur lorsqu'on affectera un temporaire anonyme, par exemple avec le code suivant :

```
T creerGrosObjet()
{
  T obj1;
  return obj1;
}
 
int main(int argc, char** argv)
{
  T obj2 = creerGrosObjet(); // On ne copie pas, on déplace.
  return 0;
}
```

##### Variables et méthodes de classe

un attribut de classe peut contenir une information commune à toutes les instances; sa déclaration est précédée du mot-clé `static`; peut être `private` ou `public`

pour les attributs d'instance, chaque instance d'une classe en a des valeurs spécifiques; mais pour l'attribut de classe, une zone mémoire unique est accessible pour toutes les instances; elle est accessible sans qu'aucune instance ne soit encore créée, au travers du nom de la classe et de l'opérateur de résolution de portée; syntaxe pour accéder à l'attribut de classe en dehors de celle-ci:

```
NomClasse::AttributClasse
```

un attribut de classe est généralement initialisé lors de la construction; un attribut de classe existe indépendamment de toute instance et ne peut donc pas être initialisé par un constructeur; pour l'initialiser il faut utiliser la syntaxe suivante en dehors de la classe  

```
Type NomClasse::AttributClasse(Valeur);
```

les attributs de classe permettent d'éviter des duplications inutiles et des problèmes de maintenance; un attribut de classe stocke souvent une constante

méthode de classe = méthode définie à l'intérieur d'une classe dont la déclaration est précédée du mot-clé `static`; peut être invoquée grâce à l'opérateur de résolution de portée sans qu'aucun objet de la classe n'existe (ce n'était pas le cas pour les méthodes d'instances, directement liées à une instance précise); une méthode de classe peut également être appelée au travers d'une instance (tout comme un attribut statique s'il est accessible)

exemple:

```
class A
{
  public:
    static void method1() { cout << "Meth 1" << endl;}
    void method2() { cout << "Meth 2" << endl;}
};
int main()
{
  A::method1(); // ok
  A::method2(); // ERREUR !
  A x; 
  x.method1(); // ok   
  x.method2(); // ok  
}
```
une méthode de classe est indépendante de l'existence d'un objet courant sur lequel elle s'appliquerait et ne peut donc pas exploiter de méthode ou d'attribut d'instance dans sa définition, mais uniquement d'autres membres de la classe ("statiques")

l'utilisation du `static` est à limiter à des attributs de classe constants (si nécessaires): un membre statique brise l'approche orientée objet puisqu'il est indépendant de tout objet

##### Surcharge d'opérateurs: introduction

pour étendre l'utilisation des opérateurs usuels à des nouvelles classes

une expression qui contient un opérateur fait appel à une fonction et à une méthode, ainsi on peut écrire

```
a Op b
# soit la fonction
operatorOp(a,b)
# soit la méthode 
a.operatorOp(b)

# pour les opérateurs unaires
operatorOp(a)
a.operatorOp()

```

à noter que l'opérateur `operator=` correspond systématiquement à une méthode de classe et jamais à une fonction

surcharge = quand une fonction a le même nom qu'une autre dont elle se différencie par ses arguments

surcharge d'opérateur = étendre l'utilisation des opérateurs couramment employés à de nouvelles classes; le nom est conservé mais pas leurs arguments; peut se faire de 2 manières:
1) surcharge externe: utiliser une fonction qui prend les opérandes comme argument, prototypée et définie à l'extérieur de la classe 
2) surcharge interne: méthode de la classe, dont l'instance courante est un opérateur

##### Surcharge d'opérateurs: surcharge externe

surcharge externe = définir les opérateurs comme des fonctions externes à la classe sur laquelle on travaille

pour optimiser l'appel on passe les arguments par référence constante (`const&`) et on qualifie de `const` le type de retour également; en C++11 une meilleure optimisation est encore possible

```
// base:
Complexe operator+(Complexe z1, Complexe z2);
// optimisation
const Complexe operator+(Complexe const& z1, Complexe const& z2);
// avancé et C++11
const Complexe operator+(Complexe z1, Complexe const& z2);
const Complexe operator+(Complexe const& z1, Complexe const&& z2);
```
il existe des situations, peu courantes, dans lesquelles la surcharge interne n'est pas possible; e.g. quand les opérandes sont de types différents ou pour surcharger un opérateur d'affichage

exemple:

```
ostream& operator<<(ostream&, Complexe const&);
```

il est important de passer le 1er argument par référence puisque l'affichage va modifier le flot en question; les flots ne peuvent d'ailleurs qu'être passés par référence

pour définir le corps de la fonction:
* utiliser des accesseurs
* (préférable) utiliser une méthode préalablement définie)

```
// via des accesseurs:
ostream& operator<<(ostream& sortie, Complexe const& z)
{
  sortie << "(" << z.get_x() << ", " << z.get_y() << ")";
  return sortie;
}
// via une autre méthode:
ostream& operator<<(ostream& sortie, Complexe const& z)
{
  sortie << z.to_string();  // e.g. en utilisant to_string() qui convertit Complexe en chaine de caractères
  return sortie;
}
// via des accesseurs:
ostream& operator<<(ostream& sortie, Complexe const& z)
{
  sortie << "(" << z.get_x() << ", " << z.get_y() << ")";
  return sortie;
}
```

lors de surcharges externes, il est parfois nécessaire d'accéder aux attributs privés; alors fortement recommandé de toujours utiliser l'interface publique de la classe, les accesseurs

mais certains préfèrent briser l'encapsulation en donnant un accès privilégié en faisant précéder le prototype de la fonction par le mot-clé `friend`; cette friendship confère à la fonction le droit d'accéder aux éléments privés de la classe; peu conseillé


```
ostream& operator<<(ostream& sortie, Complexe const& z)   // friend s'utilise dans la classe uniquement, pas dans la définition
{
  sortie << "(" << z.x << ", " << z.y << ")";
  return sortie;
}

class Complexe
{
  friend ostream& operator<<(ostream& sortie, Complexe const& z);  // utiliser le mot-clé friend à l'intérieur de la classe seulement
  //...
  private:
    double x;
    double y;
};
```

##### Surcharge d'opérateurs: surcharge interne

surcharge interne = surchage d'opérateurs à l'intérieur d'une classe (s'agit donc ici d'une méthode)

le prototype se place à l'intérieur de la classe et comme pour une méthode quelconque on peut donner sa définition à l'extérieur au moyen de l'opérateur de résolution de portée 

```
Complexe z1, z2;
//...
z1 += z2;

class Complexe
{
  public:
    //...
    void operator+=(Complexe const& z2); 
    //...
};

void Complexe::operator+=(Complexe const& z2)
{
  x += z2.x;
  y += z2.y;
}
```

une fois l'opérateur `+=` défini, il est possible d'établir le lien sémantique entre celui-ci et l'opérateur `+`; en principe, on préfère définir l'opérateur le plus lourd en fonction du plus léger

```
void Complexe::operator+(Complexe z1, Complexe const& z2)
{
  z1 += z2;
  return z1;
}
```

sauf dans certains cas, on peut généralement choisir entre surcharge interne et surcharge externe; on peut préférer la surcharge externe lorsque le corps de la fonction peut être écrit sans avoir recours au mot-clé `friend` (brise l'encapsulation) et sans devoir coder des accesseurs inutiles et sans copies inutiles (par ex. pour `+` qui exploite `+=`); pour `+=`, qui doit modifier une instance, on préfère une surcharge interne pour donner accès aux variables internes


##### Surcharge d'opérateurs: compléments

dans la pratique du C++, il est possible
1) de ne pas faire de surcharge des opérateurs
2) surchargement simplement les opérateurs de base
3) surcharger les opérateurs en utilisant leur version "auto-affectation" mais sans valeur de retour pour celles-ci
```
`void operator+=(Classe const&);`
```
4) faire la surcharge avec valeur de retour des opérateurs d'auto-affectation:
```
`Classe& operator+=(Classe const&);`
```

* retour constant 
on a vu précédemment que le type de retour des opérateurs arithmétiques simples est précédé du mot-clé `const`; ceci déclare e.g. que `z1+z2` (résultat de l'appel à `operator+(z1,z2)` appartenant à la même classe que les opérandes, n'est pas une variable (i.e. on ne peut pas modifier sa valeur); sans déclarer que la valeur de retour est constante, celle-ci pourrait être traitée comme une instance quelconque: il serait alors possible des formules absurdes comme `++(z1 + z2)` ou `(z1+z2)=f(x)`; ainsi, le type de retour de tels opérateurs doit être `const Classe` afin d'empêcher des modifications hasardeuses du résultat

* retour de l'opérateur d'affichage 
`cout << z1 << endl;` est équivalent à `operator<< (cout<<z1, endl);` qui est équivalent à `operator<<(operator<<(cout, z1), endl);`; la valeur de retour de `operator<<(cout, z1)` est le 1er argument d'un autre appel à l'opérateur, il s'agit donc également d'un `ostream&`, passé par référence pour pouvoir être modifié, et identique à celui passé en argument dans le 1er appel; avec un type de retour `void`, enchainer des opérateurs `<<` n'aurait plus de sens

* retour des opérateurs d'auto-affectation
à un premier niveau de surcharge, on peut donner un type de retour `void` aux opérateurs comme `+=`; en C++, toute expression a une valeur, il serait donc concevable d'écrire `z3=(z1+=z2)`; le résultat de `z1+=z2` - qui sera la valeur de `z1` après l'opération d'auto-affectation - pourra être stocké dans `z3`, qui est donc une instance de même classe que `z1`; pour éviter une copie superflue, on peut donc retourner une référence sur `z1`: au niveau avancé, le type de retour des opérateurs d'auto-affectation est une référence sur l'instance courante, de la forme `Classe&`

au sein de la définition de la méthode, il faudra bien retourner, après les diverses opérations d'affecation, la valeur de l'instance courante; puisque `this` est un pointeur sur celle-ci, la valeur à retourner est donc `*this`

dans l'exemple précédent, le type de retour est une référence puisque l'instance résultante existe déjà, ce qui permet d'éviter les copies inutiles

de manière générale il est important d'optimiser la surcharge d'opérateurs à l'aide de références afin de limiter toute copie superflue; conseillé de toujours employer une référence quand on en a la possibilité

exemple: version avec 1 à 3 copies inutiles
```
Complexe Complexe::operator+=(Complexe z2)  // passage par valeur (copie potentielle)
{
  Complexe z3; // crée une nouvelle instance Complexe qui sera retournée dans laquelle on copie l'instance courante modifiée
  x += z2.x;
  y += z2.y;
  z3 = *this;
  return z3;
}
// la valeur de retour est une nouvelle instance de la classe, copiée puisqu'elle n'est pas passée par référence 
```

exemple: version avec 0 copie
```
Complexe& Complexe::operator+=(Complexe const& z2)
{
  x += z2.x;
  y += z2.y;
  return *this;
}
```

opérateur d'affectation: opérateur `=` est particulier, étant l'unique opérateur dit  universel, i.e. fourni d'office pour toutes les classes

différence entre construction de copie et affectation: une construction de copie est appelée lors d'une initialisation d'instance

comme pour le constructeur de copie et le destructeur, la version par défaut de l'opérateur d'affectation fait une copie de surface souvent suffisante (cf. plus loin); sa redéfinition lorsqu'elle s'avère nécessaire, est souvent liée à la redéfinition du constructeur de copie et du destructeur (cf. plus haut)

dans certaines situations on peut aussi supprimer l'usage d'un tel opérateur; si une classe utilise beaucoup de mémoire par exemple; avec une syntaxe similaire à la suppression du constructeur de copie, on peut empêcher des copies d'instances:
```
EnormeClasse& operator=(EnormeClasse const&) = delete;
```

l'opérateur d'affectation ne peut être surchargé qu'en interne; son argument doit être de la même classe que l'instance courante et sera passé par référence constante par souci d'optimisation

pour pouvoir écrire `a=(b=c)`, la valeur de retour d'une affectation sera une référence sur la valeur finale de l'instance courante

l'opérateur d'affectation fourni par défaut est souvent suffisant; s'il est nécessaire de le redéfinir, en C++11 il est conseillé d'utiliser le `swap`

`swap` échange deux arguments: `swap(a,b)` va échanger les valeurs entre les variables `a` et `b`; elle est définie dans la bibliothèque `utility` pour les types de base et doit être étendue à la classe concernée par une surcharge de cette fonction; prend en argument ces 2 instances, par référence afin de pouvoir les modifier

pour redéfinir l'opérateur d'affectation de façon optimale; il faudrait utiliser la fonction `swap` entre l'instance courante et l'argument passé par valeur, qui contient la valeur du 2ème opérande; puisque l'échange se fait avec une copie locale de celui-ci, seule l'instance courante, le 1er opérande, sera modifiée pour prendre sa valeur; l'affectation est ainsi optimisée

```
Classe& Classe::operator=(Classe source)    // passage par valeur !!!
{
  swap(*this, source);
  return *this;
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
```
```
```
```

































