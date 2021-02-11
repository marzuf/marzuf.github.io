---
title: Initiation à la programmation (en Java)
description: introduction Java
tags: [c++] 
category : programming
status: reading
update: 2020-11-21
authors:
  - id: marzuf
    corresponding: true
---

Notes de lecture - cours EPFL

Une variable est une zone en mémoire qui possède trois caractéristiques :
– un identificateur, qui est le nom par lequel la donnée est désignée ;
– une valeur, le contenu de la variable (un nombre par exemple) ;
– un type, qui définit le « genre » de donnée de la variable. Il peut s’agir par exemple d’un entier ou du type
chaîne de caractères.

Lors de la déclaration, on peut omettre l’initialisation (c’est-à-dire le fait de donner une valeur initiale à la
variable).

Il faut cependant être prudent
puisqu’une variable non initialisée ne peut pas être utilisée. Dans ce cas, il faut donner une première valeur
à la variable avant de l’utiliser, ceci se fait au moyen de l’affectation.

Il est licite en Java de déclarer plusieurs variables sur une même ligne en séparant le nom des variables
par une virgule et en ne déclarant le type qu’une seule fois.

```
int m = 1;
int p = 1, q = 0;
double x = 0.1, y;
```

Les trois types élémentaires fondamentaux en Java sont :
– int , pour les valeurs entières (integer en anglais) ;
– double , pour les nombres à virgule ;
– char , pour les caractères.

Pour changer la valeur d’une variable déjà déclarée, il faut utiliser la notion d’affectation. Une affectation se
fait à l’aide du signe `=`

DÉCLARATION DE CONSTANTES
Il peut arriver que la valeur d’une variable ne doive pas changer après sa déclaration ; il s’agit d’une constante.
Dans ce cas, il faut ajouter le mot-clé final devant sa déclaration. Par convention, les noms des constantes
sont en majuscules, chaque mot est séparé par un caractère « __ ».

exemple pour afficher une variable à l'écran

```
System.out.println("n plus nCarre = " + n + nCarre) ;
```

Pour échanger leurs valeurs, il faut avoir
recours à une troisième variable intermédiaire

Pour une lecture au clavier:
La valeur affectée à une variable n’est pas nécessairement fournie de manière explicite dans le code du
programme, il peut s’agir d’une valeur lue au clavier par exemple. La lecture d’un entier que l’on souhaite
affecter à la variable n se fait selon les étapes suivantes :
```//  importer la classe Scanner
import java.util.Scanner ;
// créer une variable de type Scanner
Scanner keyb = new Scanner(System.in) ;
// utiliser la variable keyb autant de fois que nécessaire pour demander des valeurs au clavier.
// ex: pour affecter à n une valeur lue au clavier
int n = keyb.nextInt() ;
```
`nextDouble()` permet de lire une valeur de type double

`nextLine()` permet de lire une ligne complète constituée de tous les caractères tapés par l’utilisateur jusqu’à l’appui de la touche `return`; exemple:
```
Scanner keyb = new Scanner(System.in);
String s = keyb.nextLine();
System.out.println("Vous avez saisi " + s);
```

attention: `nextLine()` permet de lire tous les caractères tapés par l’utilisateur jusqu’au
retour à la ligne, aussi les caractères vides 

En Java, il est impossible d’affecter une valeur décimale (type `double`) à une variable entière (type `int`)

En revanche, il est possible d’affecter une valeur entière à
une variable de type décimale.

Java fournit certaines fonctions et constantes mathématiques usuelles; exemple:

```
Math.sin(x) // pour la fonction sinus 

Math.PI // qui fournit la valeur de pi
```

exemple de branchements conditionnels et opérateurs logiques

```
if(n >= 1) && (n <= 10)) {
  System.out.println("correct");
} else {
  System.out.println("incorrect");
}
```
Le type `boolean` est le type des conditions. Il permet de déclarer des variables
contenant une valeur de vérité, c’est-à-dire uniquement `true` ou `false`. L’initialisation des booléens se
fait directement à l’aide de ces mots-clés ou à l’aide de conditions. Exemples:

```
int a = 1, b = 2;
boolean c = true;
boolean e = (a==b);
```

exemple d'itérations avec boucle `for`

```
for(int i = 1; i <= 10; i++){
  System.out.println("i = " + i);
})
```

exemple de boucle `do...while`:

```
int nombre_de_notes;
do{
  System.out.println("Entrez le nombre de notes : ");
  nombre_de_notes = clavier.nextInt();
} while(nombre_de_notes <= 0);
```

CHOIX DE BOUCLE À UTILISER
Quand le nombre d’itérations est connu avant d’entrer dans la boucle, il vaut mieux utiliser la boucle `for`.
Si les instructions doivent être effectuées au moins une fois, la boucle `do...while` est adaptée. Sinon, on
utilise la boucle `while` .

En Java, les instructions peuvent être regroupées en blocs identifiés par des délimiteurs de début et de fin :
`{` et `}`. Nous les avons déjà utilisés par exemple dans les structures de contrôle, mais on peut regrouper les
instructions en blocs en dehors de ces structures de contrôle

Les blocs en Java ont une grande autonomie puisqu’ils peuvent contenir leurs propres déclarations et
initialisation de variables. Ces variables déclarées à l’intérieur d’un bloc sont appelées variables locales (au
bloc). Elles ne sont accessibles qu’à l’intérieur du bloc où elles ont été déclarées. Les variables déclarées
en dehors de la fonction main sont de portées globales (à la classe), elles sont accessibles dans toute la
classe. Pour ces dernières, on distinguera (dans le cours de Programmation Orientée Objet) les variables
de classes et les variables d’instances.
Une bonne pratique est de déclarer les variables au plus près de leur utilisation.

Cette notion d’endroits où l’on peut utiliser une variable s’appelle la portée. La portée d’une variable est
l’ensemble des lignes de code où cette variable est accessible et a donc un sens. En Java, on ne peut pas
utiliser le nom d’une variable déclarée plus globalement pour déclarer une autre variable.

Exemple de création et utilisation de tableaux:

```
System.out.println("Donnez le nombre de joueurs");
int n = keyb.nextInt();
if(n > 0){
  double moyenne = 0;
  int scores = new int[n];
}
// ...
```

En Java, on dispose principalement de deux types, seule la distinction de savoir si la taille doit varier à
l’exécution est faite. Si la taille varie au cours du temps alors nous utiliserons le type prédéfini ArrayList ,
sinon nous utiliserons des tableaux de taille fixe.

DÉCLARATION D’UN TABLEAU DE TAILLE FIXE

Par exemple, on déclare un tableau d’entiers de la manière suivante :
```
int[] scores ;
// Notons que Java autorise aussi la syntaxe :
int score[] ;
```
les
tableaux sont des types évolués, comme les chaînes de caractères, et ils se manipulent différemment des
types simples vus jusqu’à présent.


Les types évolués sont stockés via des références, c’est-à-dire que les variables de ces types ne stockent
pas directement la valeur, mais une référence vers l’endroit où est stockée la vraie valeur. Cela
impacte la sémantique de l’affectation, de la comparaison et de l’affichage de ces données.


INITIALISATION D’UN TABLEAU DE TAILLE FIXE
Il existe deux façons en Java d’initialiser les éléments d’un tableau. 
1) initialiser le tableau
avec des éléments donnés au moment de sa déclaration :
```
int[] scores = {1000, 1500, 2000} ;
```
2) initialiser un tableau sans élément, puis de le remplir ailleurs dans le programme.
Dans ce cas, il faut quand même initialiser le tableau avec une taille fixée; pour remplir ensuite le tableau, on accèder à ses éléments par indexation 
(accès aux éléments selon leur position dans le tableau exemple)
```
int[] scores = new int[4] ;
//...
scores[0] = 1;
```
Cette deuxième façon remplit le tableau avec des valeurs par défaut (`0` pour des `int`, `0.0` pour des `double`, `false` pour les `boolean`, `'\u0000'` pour des `char`, `(null)` pour un objet quelconque).

Attention: le premier élément d’un tableau est situé à l’index 0, et non 1 ! ainsi, `tableau[tableau.length]` n’existe pas !

ACCÈS AUX ÉLÉMENTS D’UN TABLEAU DE TAILLE FIXE

Exemple avec boucle `for`

```
for(int i=0 ; i < tab.length ; i++) {
  System.out.println(tab[i]) ;
}
```

autre façon: sans passer par les indices
```
for(int val : tab) {  
  System.out.println(val) ;
}
```

Cette boucle est plus compacte, mais elle présente des inconvénients :
– Elle ne permet pas de modifier le contenu du tableau.
– Elle ne permet d’itérer que sur un seul tableau à la fois : on ne peut pas comparer deux tableaux par
exemple.
– Elle ne permet l’accès qu’à un seul élément, on ne peut pas récupérer l’élément précédent ou le suivant.
– Elle itère d’un pas en avant seulement.

Il faut bien différencier la déclaration de
l’initialisation :
```
int[] entiers1 ;
int[] entiers2 = {1, 2, 3} ;
```
La première ligne déclare un tableau mais ne l’initialise pas, tandis que la deuxième déclare et initialise le
tableau


Comme les tableaux en Java sont des types évolués, la sémantique de l’affectation et de la comparaison est
différente de celle que nous connaissons avec les types simples.

AFFECTATION DE TABLEAUX
Les types évolués sont manipulés avec des références en Java. Donc lorsque nous réalisons l’affectation
`a = b` , c’est la référence qui est copiée et non l’objet.

Ceci implique que les variables `a` et `b` sont indépendantes pour des types simples, mais totalement
dépendantes pour des tableaux, puisque les deux noms de variables désignent le même objet. Ainsi, si
nous modifions `a` après l’affectation, alors `b` sera modifié également.


```
int[] a = new int[10];
int[] b = new int[10];
// à ce stade, a et b sont différents; modifier a ne modifie pas b
b = a:
// après cette in struction, modifier a va aussi modifier b
```

Nous utiliserons donc l’opérateur `=` avec des tableaux uniquement lorsque nous voudrons avoir deux
noms de variable pour le même tableau, ce qui est assez rare en pratique. Pour copier les éléments d’un
tableau vers un autre, il faudra explicitement écrire une « copie profonde » (copie au-delà des références
« de surface ») :
```
for (int i=0 ; i < a.length ; i++) {
  b[i] = a[i] ;
}
```

COMPARAISON DE TABLEAUX

Pour des types évolués, `a == b` teste si `a` et `b` référencent le même emplacement
mémoire. C’est donc le cas lors de l’affectation a = b . 

En revanche, cet opérateur ne teste pas l’égalité
des valeurs contenues dans les tableaux pointés par `a` et `b` ! 

Pour vérifier l’égalité de contenu des tableaux,
il faut écrire explicitement les tests:

```
if(a == null || b == null || a.length != b.length) {
  System.out.println("contenus différents ou nuls");
} else {
  int i = 0;
  while(i < a.length && (a[i] == b[i])){
    i++;
  }
  if(i >= a.length){
    System.out.println("contenus identiques");
  } else {
    System.out.println("contenus différents");
  }
})
```


TABLEAUX À PLUSIEURS DIMENSIONS


Il s’agit simplement de tableaux de tableaux (attention, le premier tableau stocke des
références vers les autres tableaux). 

Il suffit de rajouter un niveau de [] lors de la déclaration.

```
double[][] statistiques = new double[nbCantons][nbCommunes];

int[][] scores = new int[nbJoueurs][nbParties];
```

Il est également possible d’initialiser des tableaux multidimensionnels lors de leur déclaration. Dans ce cas,
les lignes peuvent avoir des longueurs différentes.

```
int[][] tableau = {
		{0,1,5,42},
		{4,5,6},
		{7}};
```

PARCOURIR UN TABLEAU À PLUSIEURS DIMENSIONS

Le moyen le plus naturel: avec des boucles for
imbriquées. Exemple:

```
for(int i = 0; i < y.length; ++i){
  for(int j = 0; j < y[i].length; ++j) {
    System.out.println(y[i][j]);
  }
}
```

LE TYPE STRING

Le type `String` permet de définir des chaines de caractères

Pour déclarer un type `String`:
```
String unNom;
```

Pour initialiser une `String`, on utilise des guillements:
```
String message = "bonjour !";
```

Il existe également le type `char` pour représenter des caractères. Ce type ne peut contenir qu'un caractère et s'initialise avec des apostrophes.

```
char c1 = 'm';
char c2 = ' ';
char c3 = '3';
```

AFFECTATION ET COMPARAISON

Comme pour les tableaux, une variable de type `String` contient une référence vers une chaîne de caractères.
La sémantique des opérateurs `=` et `==` est donc la même que pour les tableaux. 

Attention!!! Cependant, une
différence avec les autres types évolués est que les littéraux de type `String` occupent une zone mémoire
unique. C’est ce qu’on appelle le « Pool » des littéraux. Cela signifie que deux chaînes créées avec les
mêmes littéraux seront stockées à la même adresse.

```
String chaine1 = "foo";
String chaine2 = "foo";
if(chaine1 == chaine2) {}; // true: Pool des littéraux -> chaine1 et chaine2 contiennent la même adresse
```

AFFICHAGE

Comme les `String` contiennent une adresse vers la zone mémoire contenant les chaînes
de caractères, on pourrait penser que le code suivant affiche une adresse (comme pour les types évolués
en général) :

```
String chaine = "Welcome" ;
System.out.print(chaine) ;
```

Cependant l’affichage du type `String` prend en compte l’objet référencé plutôt que la référence. Le code
précédent affichera donc bien le message "Welcome". 


CONCATÉNATION

Pour les chaines de caractères, l'opérateur `+` est défini de façon à concaténer les valeurs littérales:

```
String nom = "Dupont";
String prenom = "Jean";

nom = nom + " " + prenom; // "Dupont Jean"
```

La concaténation peut aussi s’appliquer entre une chaîne de caractères et un type simple quelconque (`char`,
`int`, etc.).


STRING: COMPARAISONS

Des objets `String` initialisés avec des littéraux peuvent être comparés par les
opérateurs `==` et `!=`, puisque ceux-ci pointent vers la même zone en mémoire. Cependant ceci n’est vrai
que lorsque les chaînes sont initialisées avec des littéraux.

```
String s1  = "abc";	// s1 pointe vers "abc"
String s2  = "abc";	// idem, donc même zone que s1 (Pool)
String s3  = s2;	// s3 stocke la même adresse que s2
String s4 = s1 + "";	// s4 contient une nouvelle adresse (construite par concaténation)

System.out.println((s1 == s2) && (s2==s3)); // true
System.out.println(s4); // "abc"
System.out.println((s1 == s4)); // false
```

`equals()` permet de comparer les objets référencés au lieu
des références, on dispose de l’instruction.

`chaine1.equals(chaine2)` teste
si les chaînes de caractères référencées par `chaine1` et `chaine2` sont constituées des mêmes caractères. 

```
String s1  = "abc";
String s2  = "aBc";
String s4 = s1 + "";
System.out.println(s1.equals(s4)); // "true"
System.out.println(s1.equals(s2)); // "false"
```

En pratique, il est préférable d’utiliser `equals` plutôt que `==` pour les objets de type `String`.

STRING : TRAITEMENTS

TRAITEMENTS DES CARACTÈRES
– `chaine.charAt(index)`: donne le caractère occupant la position `index` dans la String
`chaine`.
– `chaine.indexOf(caractere)`: donne la position de la première occurence du `char`
`caractere` dans la `String` `chaine` , et –1 si `caractere` n’est pas dans la chaîne.
– `chaine.length()` donne la taille de la `String` `chaine` en nombre de caractères
(!!! attention pas comme les tableaux, il y a des parenthèses après `length` !!!).

Attention: les caractères sont numérotés comme les éléments d’un tableau (à partir de 0).

```
String s1 = "abcmbx";			
int longueur = s1.length();		// 6
char c1 = s1.charAt(0);		// a
char c2 = s1.charAt(longueur-1);	// x
int i = s1.indexOf('b');		// 1
```

AUTRES TRAITEMENTS

– Un littéral introduit par l’utilisateur n’est pas dans le « pool » des littéraux. L'instruction `chaine.intern()`
permet de l’y mettre explicitement.
```
Scanner s = new Scanner(System.in );
String response;
do{
  response = s.nextLine();
  //on met le littéral lu dans le pool
  response = response.intern();
  System.out.println("read: " + response);
  // sans le intern la boucle ne s'arrête pas !
} while(response != "oui");
```
– `chaine.replace(char1, char2)` construit une nouvelle chaîne en remplaçant dans
toute la chaîne `char1` par `char2`. Exemple :
```
String exemple = "abracadabra" ;
String avecDesEtoiles = exemple.replace('a', '*') ;  // nouvelle chaine créée: "*br*c*d*br*" 
```
– `chaine.substring(position1, position2)` retourne la sous-chaîne comprise entre
les indices `position1` (compris) et `position2` (non compris). Exemple :
```
String exemple = " anticonstitutionnel" ;
String avecDesEtoiles = exemple.substring(4, 16) ; // nouvelle chaine créée: "constitution " 
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
``````
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
