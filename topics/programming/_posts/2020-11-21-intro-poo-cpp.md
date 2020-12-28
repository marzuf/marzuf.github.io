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

##### Héritage: concepts

l'héritage permet de regrouper des caractéristiques communes dans une super-classe dont héritent les sous-classes qui en sont des versions enrichies, étendues; cet outil permet de définir une relation "est-un"

une sous-classe est dite enrichie par des attributs et des méthodes supplémentaires, et spécialisée si elle redéfinit des méthodes héritées de C

l'héritage permet d'organiser et de clarifier le code en explicitant les relations structurelles entre des classes, tout en limitant la redondance de code

l'héritage ne doit pas être une relation "possède-un": ce lien doit être établi par l'encapsulation par le fait de déclarer un attribut 

transitivité: l'héritage est transitif, i.e. si une super-classe hérite d'une super-super-classe, alors la sous-classe possède également tous les attributs et méthodes de cette dernière

ces relations "est-un" définissent une hiérarchie de classe entre les classes les plus générales, classes parentes en haut et classes enfant spécialisées et enrichies en bas

syntaxe pour faire hériter d'une super-classe

```
class NomSousClasse: public NomSuperClasse{
  // déclaration de méthodes et attributs spécifiques à la sous-classe 
  // ...
};
```

##### Héritage: droit protégé

dans une relation d'héritage, la sous-classe dispose aussi des membres privés de la super-classe mais n'y a pas accès (le droit d'accès privé limite la visibilité à l'enceinte de la classe)

il existe un autre type d'accès au sein d'une hiérarchie de classe, le droit d'accès protégé (mot-clé `protected`): assure la visibilité des membres d'une classe dans toutes les classes de la descendance; extension du niveau privé qui accorde des droits d'accès privilégiés uniquement aux sous-classes (restent privés à tout autre endroit du code)

un membre protégé est uniquement accessible dans les sous-classes dans leur propre portée

la portée de classe permet de manipuler directement tous les attributs et méthodes de quelconque instance d'une classe (courante ou non) au sein de la définition; e.g. si une classe `B` admet un attribut privé `b`, alors on peut accéder dans les méthodes de `B` au `b` de l'instance courante (`this->b`) mais également d'une autre instance `autreB` passée en paramètre (`autreB.b`); ainsi `b` est accessible dans la classe `B` à travers tout type d'objet de type `B` (i.e. `b` est de portée `B`)

accès possible d'une classe `B` à l'attribut protégé `a` de la super-classe `A` mais uniquement dans sa portée; un attribut privé de `A` n'est pas accessible en dehors de la super-classe; au sein de `B`, on peut accéder au `a` protégé de l'instance courante ou d'une autre instance `autreB` de la même classe, mais pas à celui d'une autre classe comme A (il s'agirait d'un accès externe à un attribut protégé, interdit), exemple:
```
class A
{
  protected: int a;
  private: int prive;
};
class B: public A
{
  public: 
  //...
     void f(B autreB, A autreA, int x)
     {
       a = x;  // ok A::a est protected -> accès possible
       prive = x; // ERREUR ! A::prive est private
       a += autreB.prive; // ERREUR ! même raison
       a += autreB.a; // ok même portée (B::)
       a += autreA.a; // INTERDIT this n'est pas de la même portée que autreA
     }
};
```
en conclusion:
* les membres publics sont accessibles à tous les utilisateurs d'une classe
* les membres privés sont accessibles qu'au programmeur de la classe
* les membres protégés sont accessibles à tous les programmeurs d'extension par sous-classes

##### Héritage: masquage

spécialiser en redéfinissant les méthodes de la super-classe 

situation de masquage: un appel à la méthode par cette sous-classe renverra à la version spécialisée, qui l'emporte sur la version héritée de la super-classe; masquage = partage d'un même nom d'attribut ou de méthode sur plusieurs niveaux d'une hiérarchie de classe 

pour les attributs, masquage souvent source de confusion: nommer un attribut par le même nom (pas forcément le même type) qu'un attribut hérité, qui masquera ce dernier

pour les méthodes, masquage courant, permet de les spécialiser; la méthode héritée est dite méthode générale, appelée par les sous-classes qui ne la masquent pas; la méthode spécifique à la sous-classe est dite méthode spécialisée

un objet dont un des membres est spécialisé dispose également du membre hérité même s'il est masqué; on utilise l'opérateur de résolution de portée pour y avoir accès; syntaxe:

```
NomSuperClasse::méthode // ou ::attribut
```

##### Héritage: constructeurs - partie 1

l'instanciation d'une classe s'accompagne d'une initialisation des attributs; cette tâche ne peut plus être prise en charge par le constructeur d'une sous-classe: celle-ci hérite des attributs, parfois privés, d'une super-classe qu'elle ne peut pas initialiser; l'initialisation des attributs hérités doit se faire dans la classe où ils sont explicitement définis: chaque constructeur de la sous-classe fait donc appel à un constructeur de la super-classe

l'appel au constructeur de la super-classe depuis le constructeur de la sous-classe se fait dans la liste d'initialisation (ou section deux points); syntaxe:

```
SousClasse(liste de paramètres): SuperClasse(arguments), Attribut1(valeur1), ... 
{ 
  // corps du constructeur}
}
```
le constructeur de la super-classe porte son nom et est placé au début de la section d'appel aux constructeurs des attributs

exemple:
```
class FigureGeometrique
{
  protected: Position position;
  public:
    FigureGeometrique(double x, double y): position(x,y){}   // constructeur
    //...
};
class Rectangle: public FigureGeometrique
{
  protected: double largeur; double hauteur;
  public:
    Rectangle(double x, double y, double l, double h): FigureGeometrique(x,y), largeur(l), hauteur(h){}  // constructeur de la sous-classe qui appelle constructeur de la super-classe
    //...
};
// il n'est pas nécessaire qu'une sous-classe définisse des attributs supplémentaires:
class Carre: public Rectangle{
  public:
    Carre(double taille): Rectangle(taille, taille){}
};
```

un appel explicite au constructeur de la super-classe n'est pas nécessaire si cette dernière possède un constructeur par défaut (l'appel est alors effectué par le compilateur); si la classe n'a pas de constructeur par défaut, l'appel doit être explicite

rappel: le constructeur par défaut, qui ne prend pas d'arguments, existe par défaut si la classe n'a pas de constructeur, mais disparait et doit être réécrit dès la création d'un constructeur

il est conseillé de toujours déclarer au moins un constructeur pour chaque classe et d'effectuer un appel explicite à un constructeur de la super-classe, même à celui par défaut


##### Héritage: constructeurs - partie 2

ordre d'appel des constructeurs: la construction d'une sous-classe appelle d'abord le constructeur de la super-classe la plus générale, puis, dans l'ordre, les constructeurs des super-classes qui en héritent, avant de terminer par l'initialisation de la partie spécifique de la classe instanciée

les destructeurs sont appelés dans l'ordre inverse des constructeurs

constructeurs de copie: une redéfinition du constructeur de copies d'une sous-classe s'accompagne toujours d'un appel explicite au constructeur de copies de la super-classe; sinon, son constructeur par défaut est appelé et la copie est souvent mal réalisée

```
Rectangle(Rectangle const& autre): FigureGeometrique(autre), largeur(autre.largeur), hauteur(autre.hauteur) {}
```

en appelant comme ci-dessus le constructeur de copie de `FigureGeometrique` avec l'instance copiée en argument (étant `Rectangle`, elle est aussi une `FigureGeometrique`), l'attribut propre à cette super-classe, la position, sera copiée dans la nouvelle instance ; si l'on n'avait spécifié, dans le constructeur de copie de `Rectangle`, que les valeurs des attributs spécifiques à `Rectangle`, sans appeler le constructeur de copie `FigureGeometrique`, alors un appel implicite sera fait à son constructeur par défaut

héritage des constructeurs: les constructeurs ne sont pas hérités dans une relation d'héritage; mais depuis C++11, il est possible de demander à ce qu'ils le soient:

```
using SuperClasse::SuperClasse;
```

ceci force l'héritage de tous les constructeurs de la super-classe de sorte que la sous-classe peut être construite avec les mêmes arguments; il s'agit d'une pratique peu recommandée puisque les constructeurs de la super-classe n'itialisent pas les attributs de la sous-classe: on limitera son utilisation, si nécessaire, à des sous-classes qui n'ont pas de nouvel attribut

##### Copie profonde

copie de surface: des constructeurs et destructeurs par défaut sont fournis par le compilateur s'ils ne sont pas définis; le constructeur de copie par défaut effectue une copie de surface qui consiste à copier membre à membre la valeur de chaque attribut; cette copie est d'ordinaire suffisante, mais elle peut poser problème notamment quand des attributs sont des pointeurs

copie profonde: dans des situations où les attributs sont des pointeurs, le constructeur de copie doit être redéfini pour réaliser une copie profonde qui ne copie pas les adresses mais duplique les zones pointées; les attributs d'un objet copié devraient pointer vers des variables à même valeur mais stockées dans des zones mémoires distinctes de l'objet d'origine; cette indépendance implique que la manipulation de l'objet copié (et notamment sa destruction), n'a plus aucune incidence sur l'objet d'origine

pour les mêmes raisons si une classe contient des pointeurs, il est parfois important de redéfinir d'une façon similaire, l'opérateur d'affectation `=`: sa version par défaut effectue aussi une copie de surface (ne pas oublier de considérer également le destructeur)


##### Polymorphisme et résolution dynamique des liens

le polymorphisme permet à un même code de s'adapter à aux types des données auxquelles il s'applique; rend le code générique, écrit de façon unifiée pour différents types de données

dans une hiérarchie de classe, le type est hérité: on dit qu'une instance de la sous-classe est aussi une instance de la super-classe, et cette relation est transitive

l'héritage de type s'applique dans le cadre de l'affectation, mais aussi du passage des arguments

en C++, par défaut, le type de la variable détermine la méthode à appeler = résolution statique des liens: le choix de la méthode se fait statiquement avant l'exécution

le polymorphisme fait que, lors d'affectations ou de passages d'arguments, des instances d'une sous-classe soient substituables aux instances de leurs super-classes tout en gardant leurs propriétés propres; la méthode à invoquer est choisie pendant l'exécution, en fonction de la nature réelle des instances = résolution dynamique des liens

pour avoir recours à la résolution dynamique des liens, il faut réunir les 2 conditions suivantes
1. les méthodes concernées doivent être déclarées comme virtuelles
2. elles doivent s'exercer sur les instances réellement concernées grâce à des références ou des pointeurs 

##### Polymorphisme: méthodes virtuelles

les méthodes virtuelles permettent la résolution dynamique des liens, au travers de références ou de pointeurs; ainsi le choix de la méthode se fait en fonction du type réel de l'instance

une méthode à résoudre dynamiquement doit être déclarée comme virtuelle, en précédant son prototype de `virtual`

toute spécialisation d'une méthode virtuelle dans une sous-classe est aussi virtuelle par transitivité, même sans spécifier le mot-clé `virtual`

pour activer la résolution dynamique des liens il est également essentiel que le passage des arguments des méthodes virtuelles soit fait par le biais de références ou de pointeurs: elles opèrent ainsi sur les instances réelles (si le passage se faisait par valeur, le polymorphsime serait impossible car lors de l'appel l'objet serait copié dans une variable du type de la super-classe, en perdant ses spécificités)

pour éviter qu'une destruction d'un objet en soit que partielle, il est conseiller de toujours déclarer les destructeurs comme virtuels

au contraire, puisqu'un constructeur est chargé d'initialiser l'instance courante, il ne peut pas être virtuel; s'il appelle dans son corps des méthodes virtuelles, la virtualité de ces méthodes est ignorée

##### Masquage, substitution et surcharge

surcharge = quand des fonctions ou des méthodes dans la même portée portent le même nom mais se distinguent par des paramètres différents

masquage de méthodes = lorsque des méthodes de portée différente ont le même nom; celles dont la portée est la plus proche masquent les plus lointaines, indépendamment de leurs paramètres; il suffit d'une méthode avec le même nom pour masquer plusieurs méthodes surchargées dans une autre portée

subtitution de méthodes virtuelles = redéfinition d'une méthode virtuelle héritée d'une super-classe, dans le but de résoudre dynamiquement des liens; la substitution d'une seule méthode virtuelle, même avec des paramètres différents, masque toutes les autres qui portent le même nom 

depuis C++11, deux mots-clés placés après le prototype pour mieux spécifier redéfinitions ou surcharges:
* `override`: indique que l'on redéfinit une méthode virtuelle héritée d'une super-classe (le compilateur vérifie qu'il s'agit bien d'une substitution de méthode virtuelle; si aucun prototype identique n'existe, il signale une erreur; constitue donc une protection contre les erreurs)
* `final`: empêche toute substitution future de la méthode dans les sous-classes; peut également interdire la création de sous-classes d'une classe en le plaçant après le nom de la classe dans son prototype

##### Classes abstraites

au niveau le plus élevé de la classe, il est parfois impossible de définir une méthode générale qui devra pourtant exister dans toutes les sous-classes

méthode virutelle pure = méthode abstraite = méthode qui doit exister et être redéfinie dans toutes les sous-classes que l'on souhaite instancier sans qu'il soit nécessaire de la définir dans la super-classe; la super-classe ne donne souvent que son prototype sans la définir explicitement; signalée en ajoutant `=0` à la fin de son prototype

```
virtual Type nom_methode(liste paramètres) = 0;
```

une telle méthode peut être appelée au niveau de la super-classe

```
classe FigureFermee
{
  public:
    virtual double surface() const =0;
    virtual double perimetre() const =0;
    
    //une méthode virtuelle pure peut être appelée dans la super-classe 
    double volume(double hauteur) const 
    {
      return hauteur*surface();
    }
};
```
classe abstraite = classe qui contient au moins une méthode virtuelle pure et qui ne peut pas être instanciée; toute sous-classe héritant d'une classe abstraite l'est aussi tant qu'elle ne redéfinit pas toutes ses classes virtuelles pures héritées

les classes abstraites sont idéales pour construire la racine des arbres d'héritage; grâce à l'outil des méthodes virtuelles pures, le polymorphisme complète l'abstraction; elles permettent de définir des concepts génériques communs à toutes les sous-classes mais trop abstraits pour être codés à haut niveau

##### Collections hétérogènes

collections hétérogènes = ensemble d'objets d'une même super-classe mais traités de façon polymorphique, spécifique; sont une application importante du polymorphisme

pour permettre la résolution dynamique des liens il faut utiliser une méthode virtuelle et accéder aux instances par le biais de pointeurs ou références; lorsque c'est possible il est conseillé d'utiliser des références; cependant, on ne peut pas réaliser des tableaux de références; dans le cadre d'une collection hétérogène, on utilise donc un tableau de pointeurs vers des instances de la super-classe

il est important de passer les éléments du tableau par référence: les `unique_ptr` ne peuvent pas être copiés; dans le cas contraire, plusieurs pointeurs partageraient la même zone mémoire; si la valeur n'est pas modifiée, on peut utiliser une référence constante

pour garantir l'intégrité d'une collection hétérogène, la durée de vie des éléments pointés doit être au moins aussi longue que celle des pointeurs

l'allocation dynamique est l'outil qui permet de préserver la zone mémoire allouée aussi longtemps que la collection qui la contient; grâce à l'utilisatio du mot-clé `new`, la zone mémoire nouvellement allouée existe jusqu'à l'emploi du mot `delete`; dans une collection d'`unique_ptr`, la désallocation sera faite automatiquement (recommandé de les favoriser par rapport aux pointeurs à la C); les `unique_ptr` permettent également d'assurer qu'un objet n'est pointé que par un pointeur à la fois, ce qui limite les erreurs de manipulation

la question de l'intégrité des données se pose également avec l'emploi de pointeurs dans une classe: il faut garantir la durée de vie des données pointées aussi longtemps que la classe qui les exploite (autant pour les pointeurs intelligents que pour les pointeurs à la C); d'autres problèmes se posent avec les pointeurs à la C: la désallocation et le partage de données entre collections. Selon la conception de la classe, il est souvent nécessaire de redéfinir des outils qui le permettent, comme le constructeur de copie, le destructeur et l'opérateur d'affectation

désallocation: contrairement aux pointeurs intelligents, les pointeurs à la C doivent être manuellement désalloués

une copie de surface des pointeurs fait pointer plusieurs instances vers les mêmes entités et expose souvent à des erreurs de manipulation; avec `unique_ptr` la question ne se pose pas: la copie est interdite puisque ces pointeurs ne peuvent pas partager une zone mémoire; lorsqu'on utilise des pointeurs à la C, il faut s'interroger sur la nécessité de redéfinir le constructeur de copie

##### Héritage multiple

rappel: les notions principales de la POO
* l'encapsulation et abstraction = regrouper des données et traitements en une seule et même entité, séparer l'interface d'utilisation des détails de manipulation
* l'abstraction = établit une relation "est-un" entre différentes classes, permet le polymorphisme d'inclusion
* le polymorphisme = nécessite l'emploi de méthodes virtuelles au travers de références ou pointeurs, induit une adaptation de l'exécution selon le type de données traitées

héritage multiple = extension de l'héritage simple; une sous-classe peut hériter directement de plusieurs classes parentes; une sous-classe va hériter du type, des attributs et des méthodes (hormis constructeurs et destructeurs) de toutes ses super-classes

pour déclarer une relation d'héritage multiple, on indique l'ensemble des super-classes dont hérite une sous-classe dans sa déclaration, séparées par des virgules; attention: l'ordre de déclaration des liens d'héritage joue un rôle important dans la destruction et la destruction d'une instance !

```
class Sous-Classe: public SuperClass1, ..., public SuperClasseN
{
  //...
};
```

de façon analogue à l'héritage simple, l'initialisation d'attributs hérités se fait dans la liste d'initialisation du constructeur de la sous-classe, par appel aux constructeurs des classes parentes

si une super-classe adment un constructeur par défaut, une invocation explicite n'est pas obligatoire, mais recommandée pour éviter tout oubli

attention: dans un contexte d'héritage multiple, l'ordre d'appel des constructeurs parents n'est pas donné par la liste d'initialisation du constructeur de la sous-classe mais par l'ordre de la déclaration de l'héritage; l'ordre d'appel des destructeurs se fait toujours dans l'ordre inverse de l'appel des constructeurs

la plupart des compilateurs donneront un message d'alerte lorsque la liste d'initialisation ne respecte pas l'ordre des liens d'héritage 

##### Héritage multiple: masquage

dans l'héritage mulitple les droits d'accès s'appliquent comme dans une relation d'héritage simple: une sous-classe peut directement accéder aux membres publics et protégés de ses super-classes; des situations d'ambiguïté surviennent lorsque plusieurs super-classes contiennent un membre portant le même nom

dans l'exemple ci-dessous, invoquer la méthode `afficher()` d'une instance `Ovovivipare` provoquera une erreur de compilation due à un problème de résolution de portée; il s'agit en effet d'une situation de masquage, qui pose souci même si les méthodes héritées prennent des paramètres différents; la portée des méthodes étant différente, il ne s'agit pas d'une situation de surcharge !

```
classe Ovipare
{
  // ...
  void afficher() const;
};
classe Viviapre
{
  // ...
  void afficher(string const& entete) const;
};
class Ovovivipare: public Ovipare, public Vivipare
{
  //...
};
int main()
{
  Ovovivipare o(...);
  o.afficher("un orvet");
  return 0;
}
```

solutions possibles à ce problème:
1. lever l'ambiguïté par l'opérateur de résolution de portée qui indique au compilateur la classe dont on appelle la méthode; cette solution est déconseillée car elle délègue à l'utilisateur externe le choix de comment afficher un objet de cette classe 
2. ajouter dans la super-classe une déclaration spéciale explicitant quelle méthode héritée sera invoquée lors d'un appel ambigu, avec la syntaxe:
```
using SuperClasse::nomMethodeouAttributAmbigu;
```
attention: pas de parenthèses ni type de retour; cette déclaration ne donne que le nom du membre concerné
3. clarifier en définissant proprement une méthode au sein de la sous-classe, par exemple
```
class Ovovivipare: public Ovipare, public Vivipare
{
  //...
  public:
    void afficher() const
    {
      Ovipare::afficher();
      Vivipare::afficher("mais aussi pour sa partie vivipare");
    }
};
```
##### Classes virtuelles 

dans certaines situations d'héritage multiple, une sous-classe hérite plusieurs fois, indirectement, d'une même classe parente, ce qui peut s'avérer problématique (e.g. `iostream` qui hérite des classes `ostream` et `istream`, super-classes qui héritent elles-mêmes toutes deux de la casse ` ios`)

pour éviter la duplication des attributs d'une super-classe plusieurs fois incluses lors d'héritages multiples, il faut déclarer son lien d'héritage avec toutes ses sous-classes comme virtuel; une telle super-super-classe est appelée super-classe virtuelle 

attention! différence entre classe abstraite et classe virtuelle: une classe abstraite est une classe avec des méthodes virtuelles pures; une classe virtuelle a un lien d'héritage virtuel vers ses sous-classes

signaler un héritage virtuel se fait lors de la déclaration du lien d'héritage 

```
class SousClasse: public virtual SuperClassVirtuelle
{
//...
};
```

c'est la classe pouvant être héritée plusieurs fois qui est virtuelle et non pas directement les classes utilisées dans l'héritage multiple; l'héritage virtuel établit donc une dépendance au niveau de l'implémentation entre différents niveaux d'héritage, raison pour laquelle certains langages refusent l'héritage multiple

dans un héritage simple, le constructeur d'une sous-classe ne fait appel qu'aux constructeurs de ses super-classes direces; mais dans un contexte d'héritage virtuel, le constructeur de la super-super-classe virtuelle doit être explicitement appelé par les constructeurs des sous-classes instanciables qui initialisent ainsi l'unique jeu d'attributs hérité de la classe virtuelle. Par la suite, les appels au constructeur de la super-classe virtuelle par le constructeur des classes intermédiaires sont ignorés; exemple:

```
Ovovivipare::Ovovivipare(//...): Animal(nom, habitat, regime), Ovipare(nb_oeufs), Vivipare(gestation), espece_rare(rarete){}
```

le constructeur appelle directement le constructeur de la super-super-classe virtuelle `Animal` pour initialiser son unique objet `Animal` hérité; ensuite appel aux super-classes directes `Ovipare` et `Vivipare`, dans leur constructeur, l'appel à la classe virtuelle est alors ignoré; enfin le constructeur d'`Ovovivipare` peut initialisé ses propres attributs 

dans le cas où la super-classe virtuelle a un constructeur par défaut,  il n'est pas nécessaire d'expliciter l'appel à ce dernier mais il sera toujours effectué dès la création de l'instance la plus dérivée

l'ordre d'appel des constructeurs de copie vérifie aussi ces règles

##### Etude de cas

le verbe avoir souligne une relation d'encapsulation
le verbe être signifie une relation d'héritage 
varier selon indique l'emploi du polymorphisme 

puisqu'une méthode polymorphique s'adapte à la nature de l'instance traitée, les valeurs qu'elle utilise doivent le faire également (utilisation de pointeurs ou références) 

un bon réflexe à adopter lors de l'introduction d'une méthode virtuelle est de rendre aussi le destructeur virtuel; ainsi on s'assure que sa descendance est correctement détruite

pour rendre une classe abstraite, il faut lui donner une méthode virtuelle pure: en créer une pour cette seule raison est dénué de sens, on préférera donner cette caractéristique au destructeur, qui existe automatiquement dans chaque classe; il est impératif de doter tout destructeur d'un corps et toute méthode virtuelle pure peut avoir un corps à condition qu'il soit externalisé

pour éviter qu'une sous-classe possède plusieurs fois un même attribut, utiliser un lien d'héritage virtuel; les liens d'héritage virtuels ont une incidence sur la construction qui doit en premier lieu appeler le constructeur de la classe virtuelle

par défaut, le constructeur de copie réalise une copie de surface, qui copie leur valeur, c'est-à-dire l'adresse de l'élément pointé, dans une autre instance; de plus, les copies ne sont pas possibles pour les `unique_ptr`; il faut dans certains cas donc réaliser une copie profonde, qui consiste à copier les objets pointés et non leur adresse

copie polymorphique = copie qui conserve la nature des instances

redéfinition de l'opérateur d'affectation: retourner une référence sur l'instance courante permet d'enchainer plusieurs affectations, ex:

```
Montre& operator=(Montre source)
{
  swap(coeur, source.coeur);
  swap(accessoires, source.accessoires);
  return *this;
}
```






























