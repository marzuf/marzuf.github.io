Un tableau croisé dynamique (TCD) permet d'analyser une liste de données. Cette notion est considérée comme la plus
puissante d'Excel ;
Le TCD fournit des statistiques détaillées sur votre liste, selon la manière dont il est construit ;
On construit un TCD en effectuant un glisser-déposer d'étiquettes de colonnes sur l'une des quatre zones du TCD. Le
champ « Plage » permet d'obtenir un filtre.

Un double-clic sur l'étiquette de colonne schématisée dans le menu « Disposition » permet d'accéder à des options de
mises en forme (moyenne, pourcentages etc.)
Les groupes, accessibles à partir du menu « Données » permettent de grouper des éléments du TCD en un paquet, et
donc de simplifier sa lecture.

une macro C'est une suite d'instructions que vous exécutez quand vous voulez.

développeur -> insérer -> bouton de contrôle (ex. bouton de la macro)

Outils d'analyses de simulation

Excel est un outil de gestion de données mais il peut aussi faire le travail à notre place dans beaucoup de situations. C'est le cas
avec les outils d'analyse de simulation. Ces outils permettent de connaître les situations possibles grâce au modèle déjà en place
et donc en émettant des hypothèses et connaître les résultats de ces hypothèses. Il existe plusieurs outils sous Excel, mais les
deux plus importants que nous allons étudier sont la valeur cible et le solveur.
En effet, vous avez, dans votre classeur, un grand nombre de formule dépendante des unes et des autres. Vous souhaitez faire
varier le résultat en changeant les valeurs de certaines cellules. Sans ces outils, vous allez essayer en modifiant les unes après
les autres les valeurs sans vous souvenir du résultat que les différentes combinaisons donnent et donc passer un temps fou à
connaître la meilleur combinaison possible. Nous allons donc apprendre à créer des scénarios qui vont nous donner les
combinaisons les meilleures possibles.
La valeur cible
Commençons doucement avec le premier outil : la valeur cible. Cet outil permet de déterminer le résultat voulu et Excel va changer
lui même les valeurs affectant ce résultat pour trouver une combinaison possible et réelle. Vous aurez plus qu'à regarder si les
valeurs vous conviennent.

onglet Données, dans le groupe Outils de données
cliquez sur Analyse de scénarios puis sur Valeur cible..


Il suffit alors de remplir les trois champs :
La cellule à définir : on ne peut pas la modifier car elle contient la formule. C'est à cette cellule qu'on attribue la valeur fixe.
La valeur à atteindre : c'est la valeur fixe dont je parle juste avant, c'est la valeur à laquelle doit être égale la cellule que l'on
souhaite définir.
La cellule à modifier : c'est la cellule dont la valeur va être modifiée après avoir cliqué sur OK

Un outil très simple et efficace pour trouver une valeur. Seulement maintenant, je souhaiterais modifier les deux valeurs pour
avoir le même résultat... Je veux bien négocier mais je veux bien aussi baisser mon taux de marque. Pour cela, Excel propose un
autre outil : le solveur.
Le solveur
Avant de commencer à l'utiliser, il faudrait qu'il soit disponible. On va donc commencer par l'installer. Pour cela, cliquez sur le gros
bouton Office en haut à gauche du logiciel puis sur Options Excel, dans la catégorie Compléments du volet de gauche. En bas
de la fenêtre, dans la liste Gérer vérifiez que Compléments Excel soit sélectionné. Cliquez sur le bouton Atteindre, dans la
fenêtre qui s'ouvre cochez Complément Solver et cliquez sur Ok. Patientez le temps de l'installation.
Si tout a bien fonctionné, dans l'onglet Données est apparu un groupe tout à droite Analyse avec dans ce groupe Solver.

Macros et VBA


renommage du module: bouton « Fenêtre Propriétés (F4) » 

``` 
Sub nom_de_la_macro()
'Un commentaire commence par une apostrophe '
End Sub
``` 

Le VBA est un langage orienté objet.


L'accès aux objets se fait comme suit :


``` 
nom_de_la_classe("Nom de l'instance de cette classe")
``` 

le big des big objets, c'est Application, qui désigne l'application Microsoft Excel.
Lui-même contient la classe Workbooks, qui regroupe tous les classeurs Workbook ouverts. Et Workbook contient la classe
Worksheets, qui contient toutes les feuilles Worksheet du classeur désigné

la méthode Activate, qui active (qui vous amène) là où vous lui demandez.
Par exemple, je veux aller de la première feuille à la deuxième. Il va falloir donc nommer notre classeur et deux feuilles, afin de
donner un itinéraire.

Enregistrez votre classeur en le nommant "Essai". Renommez une première feuille "Départ" et l'autre "Arrivée".
En se plaçant sur la feuille Départ, On part de l'application, pour aller vers le classeur "Essai" et vers la feuille "Arrivée".
Le code est donc

``` 
Sub trajet()
Application.Workbooks("Essai").Worksheets("Arrivée").Activate
'On part de l'application vers l'instance Essai de la classe
Workbooks
'ensuite, on va à l'objet Arrivée de la classe Worksheets
End Sub
``` 

si on est sûr d'être dans Excels et et dans le classeur Essai, on peut simplement écrire

``` 
Sub trajet()
Worksheets("Arrivée").Activate
'On part de l'application vers l'instance Essai de la classe
Workbooks
'ensuite, on va à l'objet Arrivée de la classe Worksheets
End Sub
```

La classe Workbooks désigne tous les classeurs ouverts.
La classe Worksheets désigne toutes les feuilles du classeur actif.

Autre exemple: en amont, sélectionner des cellules, clic droit -> "Définir un nom", appeler "ma_plage"
Macro pour changer l'emplacement de la cellule active
```
Sub MaSelection()
Range("Ma_Plage").Select
' on sélectionne la plage Ma_Plage, qui relève de la classe Range,
à l'aide de la méthode Select
Range("C11").Activate
'la cellule C11 devient la cellule active de la sélection, avec la
méthode Activate
End Sub
```

Maintenant, nous allons nous intéresser aux propriétés de l'objet ( = instance).

Voici comment nous pourrions accéder à ces propriétés (toujours en supposant que notre maison est bien issue de la classe
Maisons et que l'objet se nomme Ma_Maison) :
```
Maisons("Ma_Maison").couleur = "verte"
'On dit que nous souhaitons accéder à l'objet Ma_Maison, de la
classe Maisons
'nous accédons à la propriété couleur et nous lui affectons une
valeur
```

La taille du texte est contenue dans une propriété appelée Size. Cette propriété n'accepte que des valeurs numériques

La police se trouve dans la propriété Name. Cette propriété attend une chaîne de caractères. 

Le soulignement est géré par la propriété underline. Cette propriété n'accepte que des constantes. Oui, ces mystérieuses
constantes qui commencent par xl. Sachez que la valeur xlUnderlineStyleSingle applique un soulignement simple au texte. En
effet, avec xlUnderlineStyleDouble, on peut appliquer au texte deux traits de soulignement.

Le gras est une propriété à lui tout seul : Bold, qui signifie "gras" en anglais. Vous remarquerez d'ailleurs au fil du cours que le
VBA a une syntaxe très proche de l'anglais. Bold n'accepte que deux valeurs : True ou False ; c'est donc un booléen. Si la
propriété vaut True, le texte sélectionné sera mis en gras.
Dans le même genre, sachez qu'il existe la propriété Italic, qui est également un booléen et qui gère la mise en italique du texte.


``` 
Sub texte()
Selection.Font.Size = 14
Selection.Font.Name = "Euclid"
Selection.Font.Underline = xlUnderlineStyleSingle
Selection.Font.Bold = true
End Sub
``` 


la structure en With ... End With
```
With nom_de_votre_objet
'on fait ici nos
.propriété_1
.propriété_2
.propriété_3
modifications sur les propriétés par exemple :
= valeur_1
= valeur_2
= valeur_3
End With
```

ainsi on peut écrire
```
Sub texte()
With Selection.Font
.Size = 14
.Name = "Euclid"
.Underline = xlUnderlineStyleSingle
.Bold = true
End With
End Sub
```

Sélectionner des cellules

Sélection de la cellule C5:
```
Sub tests_selection()
Range("C5").Select
End Sub
```

sélectionner plusieurs cellules les séparant par des virgules Sélection des cellules C5, D4 et F8 :
``` 
Range("C5, D4, F8").Select
``` 

Votre objet peut aussi être une plage de cellules.

``` 
Range("B2:E8").Select
``` 

Les cellules sont des instances de Range, mais aussi de la classe Cells. Voyez plutôt ces deux codes comparatifs qui exécutent
exactement la même chose :


``` 
' avec Range
Range("E3").Select

' avec Cells
Cells(3, 5).Select 
``` 

syntaxe avec Cells

``` 
Cells(ligne, colonne).Select
``` 
attention: C'est exactement l'inverse de l'adressage que nous connaissons dans le tableur.

NB: pour avoir le numéro de colonne (plutôt que des lettres) -> peut être changé dans « Option Excel ». Dans la fenêtre qui s'ouvre cliquez à gauche sur «
Formules » et dans la rubrique « Manipulation de formules », cochez la case « Style de référence L1C1 » :


Décaler une sélection: 
* La cellule active est gérée par la classe `ActiveCell`. 
* La classe nouvelle qui effectuera le décalage est `Offset`. Cette dernière attend 2 arguments : le nombre de lignes puis le nombre de colonnes du décalage.


``` 
Sub decalages()
'La cellule active ne bouge pas :
ActiveCell.Offset(0, 0).Select
'Décalage d'une ligne vers le bas et d'une colonne vers la droite :
ActiveCell.Offset(1, 1).Select
'Décalage d'une ligne vers le haut et de trois colonnes vers la gauche :
ActiveCell.Offset(-1, -3).Select
End Sub
``` 

Sélectionner des lignes: 
Les lignes du tableur sont des objets de la classe `Rows`. 

Exemple: sélection de la 2ème ligne du classeur actif. On utilise toujours la même méthode (`Select`). C'est juste la classe qui change.
``` 
Rows("2").Select
``` 

On peut aussi sélectionner une plage de lignes contiguës :
``` 
' Sélection des lignes 2 à 5 incluses :
Rows("2:5").Select
``` 

Les lignes peuvent aussi être discontinues. Dans ce cas, la syntaxe est la suivante :
``` 
Range("2:2, 5:5, 6:8").Select
' Les lignes 2, 5 et la plage des lignes 6 à 8 seront sélectionnées.
``` 

Les lignes sont gérées par `Rows` mais pour faire des sélections d'objets discontinus on retourne vers la classe Range. 

Sélection des colonnes: avec la classe `Columns`

```
'Sélection de la colonne C :
Columns("C").Select
'Sélection des colonnes C, D, E et F :
Columns("C:F").Select
```

Et comme pour les lignes, la classe `Range` pour la sélection d'objets discontinus :
```
'Sélection des colonnes A, C et G :
Range("A:A, C:C, G:G").Select
```

création de variable: déclaration explicite

```
Dim ma_variable_explicite [As type]
``` 

Règles pour la déclaration de variables

Il y a des règles à respecter lorsque vous déclarez une variable :
* Elle doit commencer par une lettre
* Elle ne doit contenir que des lettres, des chiffres et le caractère de soulignement. Les espaces sont interdits !
* Elle est limitée à 40 caractères.
* Elle ne doit pas être identique à un mot réservé.


`Dim` est un mot réservé, il sert à déclarer une variable, ne peut pas être utilisé comme nom de variable. 
On ne peut pas non plus attribuer à une variable le nom `Sub`, mot réservé pour déclarer les procédures. 

On peut ensuite attribuer une valeur à notre variable :
```
ma_variable_explicite = 10
```

Déclaration implicite: encore plus simple
```
ma_variable_implicite = 6
```

La variable est utilisée directement. Elle n'a pas été déclarée avec Dim. Le programme
demande automatiquement de créer cette variable, qui sera par défaut de type Variant et aura pour valeur 6.


Cette approche est plus rapide, mais peut poser problème et engendrer des erreurs difficiles à détecter, par exemple si vous n'orthographiez pas correctement le
nom de la variable dans une commande ultérieure du programme.

Une déclaration implicite peut aussi rendre votre code plus difficile à comprendre ultérieurement et pour les autres.


On peut obliger à déclarer les variables grâce à la fonction `Option Explicit`. Doit se placer dans chaque module, avant le code des procédures.

Petit programme pour afficher une boite de dialogue avec le texte "Bonjour"

``` 
Sub bonjour()
  MsgBox "Bonjour"
End Sub
``` 

Autre exemple:

``` 
Sub test()
  Dim ma_variable As String
  ma_variable = "Bonjour"
  MsgBox "Cette phrase affiche la valeur de ma variable : " & ma_variable
  MsgBox "Cette phrase affiche le nom de ma variable : " & "ma_variable"
End Sub
``` 
Le `&` permet la concaténation de chaines.

Type des variables: un type de données peut être attribué à une variable ce qui permet de déterminer le type d'information que la variable peut
stocker. Cette décision peut avoir un effet sur l'efficacité de votre code. Si aucun type de données n'est spécifié, le type par
défaut est Variant. Exemple:

``` 
Dim ma_variable As String
``` 

Une variable de type `Variant` peut stocker tous les types de données, par exemple, du texte, des nombres, des dates ou bien
encore d'autres informations. Elle peut même stocker un tableau entier. Elle peut modifier librement son type
pendant l'exécution du code alors que ceci est impossible à réaliser avec un autre type de données.

La fonction `VarType` permet de trouver le type de données que contient une variable `Variant`.

Exemple:

``` 
Sub TestVariables()
' On déclare implicitement une variable qui est du texte.
ma_variable = "le_site_du_zéro"
'On affiche le type de la variable
MsgBox VarType(ma_variable)
'On change la valeur de la variable pour mettre un nombre
ma_variable = 4
'On affiche le nouveau type de la même variable
MsgBox VarType(ma_variable)
End Sub
``` 

La fonction `VarType` va retourner un chiffre qui correspond à un type:
0 Empty
1 Null
2 Integer
3 Long
4 Single
5 Double
6 Currency
7 Date/Time
8 String

Même si `Variant` stocke tout type de données, il n'est pas indifférent à ce qu'il contient. Exemple: si on essaie d'effectuer des calculs avec une variable de type
`Variant` mais contenant du texte, une erreur apparait.

`IsNumeric` est une fonction qui permet de savoir si la variable est de type numérique ou non, renvoie Vrai si la variable comprend un nombre, sinon elle renvoie Faux.

Les types numériques sont (caractère de déclaration)
* `Byte`: nombre entier sur 1 octet 0 
* `Integer`: nombre entier sur 2 octets (%)
* `Long`: integer sur 4 octets (&)
* `Single`: un nombre en virgule flottant sur 4 octets (!)
* `Double`: `Single` sur 8 octets (#)
* `Currency`: nombre sur 8 octets avec une partie décimale fixe (@)

Tous permettent de stocker des nombres.

Pour de petits entiers -> Integer (Byte si l'on est sûr que c’est un petit nombre)
Pour un très gros entier -> Long. 
C'est la même chose pour Single et Double mais pour les nombres décimaux. 
Currency est moins souvent utilisé.

Le caractère de déclaration est utilisé pour faciliter les déclarations de variable. Au lieu de mettre As Integer, on va simplement coller le caractère % à la variable pour la déclarer comme un Integer.
Exemple:

``` 
'Ces deux lignes exécutent la même chose
Dim ma_variable%
Dim ma_variable As Integer
'D'autres exemples de déclaration de variables
Dim age As Byte
Dim annee As Integer
Dim salaire_Zidane As Long
Dim un_pourcentage As Currency
Dim une_fraction As Single
Dim une_grosse_fraction As Double
``` 

On peut déclarer plusieurs variables sur une même ligne (avec un seul Dim). Mais pour le type, il faut le spécifier à chaque fois. S'il n'est pas spécifié après chaque variable, le type `Variant` est appliqué aux variables sans type spécifique.

Type `String`: pour une variable contenant du texte.

Par défaut, la longueur de la chaîne de caractère est variable. On peut alors, pour économiser de la mémoire, fixer la longueur de la chaîne à un maximum, au moment de la déclaration avec `*`. 
Il existe aussi un caractère de déclaration pour ce type de variable: `$`.

Par exemple pour une chaîne qui ne pourra dépasser 50 caractères: 

``` 
Dim du_texte As String * 50
```

Si la chaîne est inférieure au maximum, elle est comblée avec des espaces. A l'inverse, si elle est trop longue, elle est coupée après le 50ème caractère et le reste est perdu.

Une chaîne de longueur fixe peut comporter jusqu'à 65'500 caractères alors qu'une chaîne de longueur variable peut comporter jusqu'à 2'000'000 de caractères.

Le type `Empty` est attribué à une variable ne contenant rien (ex: variable déclarée mais à laquelle n'est affectée aucune valeur)
On peut vérifier si une variable contient quelque chose ou si elle a été définie avec un type grâce à la fonction `IsEmpty`.

```
' On déclare une variable sans type donc un Variant
Dim ma_variable_vide
' On déclare une variable de type String (du texte)
Dim mon_texte As String
' On n'affecte aucune valeur ni à l'une ni à l'autre variable
' On affiche le type des deux variables
MsgBox VarType(ma_variable_vide)
MsgBox VarType(mon_texte)
```

Le type `Null` : valeur spéciale utilisée pour indiquer des données inconnues ou manquantes. Sauf si indiqué comme tel, les variables ne sont pas initialisées à `Null`. La valeur `Null` n'est pas égale à 0. Pour savoir si une variable est de type Null, utiliser la fonction `IsNull`.

```
Sub TestNull()
' On crée une variable à laquelle on attribue la valeur Null (sans
guillemet)
ma_variable = Null
' On teste le type de la variables
MsgBox IsNull(ma_variable)
End Sub
```

Le type `Date`: on ne peut définir une variable avec le type `Date` dès la déclaration. Elle se "transforme" en type `Date` une fois que la valeur est égale à une date. 
Les dates et heures sont stockées sous forment de nombres en virgule flottante. La partie entière représente le nombre de jours écoulés depuis le 31 décembre 1899. La partie décimale représente les heures, minute et secondes exprimées comme une portion de 24 heures (0,5 = 12 heures). Pour savoir si la valeur d'une variable est une date: la fonction `IsDate`.

```
la_date = "23-07-2010"
MsgBox IsDate(la_date)
' Ce code affiche Vrai.
```

La date peut être renseignée avec différents séparateurs (tirets, points ou slashs).
L'année peut comporter que deux chiffres. Il faut faire attention à la configuration du format de date qui peut faire varier la reconnaissance de date (JJ-MM-AAAA ou MM-JJ-AAAA).

Le type booléen: type de variable qui prend 2 valeurs différentes (`True` ou `False`). L'avantage est que ce type de variable ne demande que 2 octets pour être stockéé. Exemple:
```
' Une variable qui vaut Vrai
ma_variable = True
' Une variable qui vaut Faux
ma_variable = False
```

La fonction `VarType` renvoie 11 quand la variable est un booléen.

Le type `Objet`: variables faisant référence à des objets (e.g. les classeurs, les feuilles, les cellules ou même l'application). Ce type de variable occupe 4
octets. 

L'instruction `Set` permet d'attribuer une référence d'objet à la variable. Par contre, ce type de variable prend de la place et on libère donc la mémoire grâce à `Nothing` (cf. exemple ci-dessous).

```
Sub test()
' On crée une variable qui a pour type une feuille.
' De ce fait, on peut lui attribuer une valeur spécifique : une feuille d'un classeur.
Dim Ws As Worksheet
' On attribue la 1ere feuille du classeur dans la variable grâce à Set
Set Ws = Sheets(1)
' On affiche le nom de la première feuille
MsgBox Ws.Name
' On libère ensuite la mémoire
Set Ws = Nothing
End Sub
```

Ceci est réalisable avec une feuille ou un classeur ou une cellule. En combinant tout ça, on obtient ceci :
```
' On attribue des variables : c comme classeur pour Workbook, f comme feuille pour Worksheet.
Dim c As Workbook, f As Worksheet
' On associe à c le premier classeur
Set c = Workbooks("classeur1")
' On associe à f la feuille 1 du classeur 1
Set f = c.Worksheets("feuil1")
' On affiche la valeur de la première cellule de la première feuille, du premier classeur
MsgBox f.Range("A1").Value
```

On aurait pu aussi associer `Range("A1")` à une variable pour raccourcir le code si on avait à l'utiliser souvent. Ce code est utile et
remplace ce code :
```
Workbooks("classeur1").Worksheets("feuil1").Range("A1").Value
```
Ce que nous avons fait avant peut paraitre plus long, mais très pratique par la suite, en effet, la simple lettre `f` remplace tout ce code :
```
Workbooks("classeur1").Worksheets("feuil1")
```



Les tableaux: pour la déclaration, comme pour les variables simples, on utilise `Dim` puis le nom de la variable et enfin le type de la variable.

Exemple: création d'un tableau de 51 cellules (de 0 à 50) sur une colonne:
```
Dim invite(50) As String
```
Un tableau fonctionne comme une feuille Excel, la colonne A est notre tableau et chaque ligne est une entrée. On peut ainsi mettre en cellule A1 le nom du premier invité en A2, le deuxième, ainsi de suite. En VBA, on n’utilise pas A1, A2... mais invite(0), invite(1)...

Attention ! Un tableau commence à 0 et non à 1.

On peut donc maintenant attribuer un nom à chaque invité, exemple:
```
invite(0)="Robert"
invite(1)="Marcel"
invite(2)="André"
invite(3)="Vital"
'...
```

Un tableau peut prendre tous les types de variables et il est limité à 32 767 éléments.

Les tableaux commencent à 0 mais on peut modifier cette base avec la fonction `Option Base`. Comme pour la fonction `Option Explicit`, il faut la placer avant tout code dans un module dans la section de déclarations comme ceci :

```
Option Base 1
```
Les tableaux commenceront alors à 1. Cette base de 1 peut être unique à un tableau en utilisant le mot-clé `To`.

```
Dim mon_tableau(1 To 15) as String
```
Ce tableau comprend 15 éléments de type `String`.

Les tableaux multidimensionnels: tableaux à plusieurs dimensions. Exemple:

```
' On crée un tableau de 11 colonnes et 5 lignes
Dim mon_tableau(10, 4) As String
' On peut alors attribuer des valeurs aux différents éléments du tableau
mon_tableau(0, 0) = "Première cellule"
mon_tableau(4, 2) = "Cellule de la 5ème colonne et 3ème ligne"
```

Ce n'est pas fini. Même si ce tableau comporte alors 55 cellules, on peut le dupliquer dans une troisième dimension. Ça fonctionne toujours de la même façon :
```
Dim super_tableau(5, 3, 6) As String
```
Ce tableau comporte donc 7 feuilles de 6 colonnes et 4 lignes. Ce qui nous fait 168 cellules et éléments qui peuvent prendre une
valeur.

On dit que le nombre de dimensions peut monter jusqu'à 5, mais la gestion de ces tableaux devient très difficile. De plus, plus on donne de dimensions, plus on augmente l'espace utilisé par la mémoire. De ce fait, au bout d'une certaine quantité de mémoire utilisée, le programme peut ralentir le fonctionnement de la machine. Attention donc à ne pas utiliser de l'espace inutilement.


Si une variable est déclarée au sein d'une procédure, seul le code au sein de cette procédure peut accéder à cette variable. La portée est locale à cette procédure. Parfois il est nécessaire de permettre l'utilisation des variables par plusieurs procédures ou même par la totalité de l'application; on peut déclarer une variable au niveau local, au niveau du module ou bien au niveau global.

Une variable locale est utilisée dans une procédure et uniquement dans cette procédure si bien qu’une fois la procédure terminée, la variable n'est plus accessible. De ce fait, une variable appelée `ma_variable` peut avoir une valeur dans une première procédure et ce même nom de variable utilisé dans une autre procédure peut avoir une autre valeur. En effet, on aura créé deux variables différentes puisque dans deux procédures différentes. Par défaut, on crée des variables locales.

La variable de niveau module permet d'y accéder partout dans un module et donc dans toutes les procédures mais pas dans le reste de l'application. Elle reste en vie durant tout le temps d'exécution de l'application et conserve leur valeur. Pour qu'elle soit utile dans tout le module, la variable doit être déclarée avant toute procédure dans les déclarations.

Les variables globales sont déclarées dans la section des déclarations comme pour les variables de module. Par contre, une variable globale va être précédée de `Global` au lieu de `Dim`. Les variables globales existent et conservent leur valeur pendant toute la durée de l'exécution de l'application. Cette variable globale est déclarée au début de n'importe quel module, car celle-ci
est accessible dans tous les modules.

```
Global ma_variable_globale
```

Toutes les portées de variables que l'on vient de voir ont une durée de vie définie et finissent par mourir. Les variables locales sont réinitialisées quand la procédure se termine, les variables de module et globales sont réinitialisées et donc leurs valeurs sont détruites après la fin de l'exécution de l'application. 

Pour pallier à la destruction des variables, on peut remplacer `Dim` par `Static` pour que les valeurs soient préservées même après la fin de l'exécution de l'application ou de la procédure. On déclare ainsi des variables statiques.

```
Static ma_variable_statique
```

Pour ne pas mettre `Static` devant toutes les variables d'une procédure, on peut ajouter `Static` avant la déclaration de procédure.

```
Static Sub procedure_variables_statiques
```

Une variable ne peut changer sa portée au cours de l'exécution du code. Mais il est possible d'avoir deux variables du même nom, mais pas de la même portée. Par exemple, avoir une variable `ma_variable` de type global et une autre variable `ma_variable` de type local dans une procédure. Dans cette procédure, on peut donc faire référence à deux variables différentes qui portent le même nom. La variable locale aura le dessus sur la variable globale. Si on veut appeler la variable globale dans cette procédure, il faut alors changer le nom d'une des variables. 

Attention! Cette notion de préséance est difficile à intégrer et est une source d'erreur. Le meilleur moyen de l'éviter, c'est de donner des noms différents à toutes les variables.

Les constantes sont en réalité des variables qui ne sont jamais modifiées. Elles contiennent des valeurs qui sont utilisées sans arrêt dans le code et fournissent des raccourcis pour ces valeurs constantes particulières. On ne peut évidement pas modifier une constante et pour la déclarer on n'utilise pas `Dim` mais `Const`. 

```
Const nom_chemin = "D:\Utilisateur\"
```

Il existe des constantes prédéfinies dans le modèle d'objet d'Excel (cf. plus loin dans le cours).

Il est possible de définir un type de variable grâce au mot clé `Type`, pour  créer son propre type de variable à partir des types déjà existant. La définition du type doit être avoir lieu dans la section des déclarations d'un module.

```
Type joueur
  tribu As String
  vies As Byte
  points As Integer
End Type
```

Ce code crée un nouveau type appelé joueur qui contient des informations sur la tribu, le nombre de vies et le nombre de points
d'un joueur. Ce type s'ajoute automatiquement à la liste déroulante comme les autres types déjà existants. On peut l'utiliser
comme les autres types. Exemple :

```
' On déclare une variable joueur
Dim bat538 As joueur
' On renseigne les différents champs du type
bat538.tribu = "Zér0"
bat538.vies = 5
bat538.points = 0
'On affiche un à un les paramètres
MsgBox bat538.tribu
MsgBox bat538.vies
MsgBox bat538.points
```

On peut aussi créer un tableau à partir du nouveau type créé.

Exemple de condition en VBA

```
Sub test_condition()
Dim age As Byte
age = 20
' Si vous avez un age supérieur ou égal à 18 :
If age >= 18 Then
MsgBox "Vous êtes un adulte"
' Sinon :
Else
MsgBox "Vous êtes encore mineur"
End If
End Sub
```

Ou en utilisant `ElseIf`
```
Sub test_condition()
Dim age As Byte
age = 20
If age >= 18 Then
MsgBox "Vous êtes un adulte"
ElseIf age < 8 Then
MsgBox "Vous êtes un surdoué pour être ici à votre âge !"
Else
MsgBox "Vous êtes encore mineur"
End If
End Sub
```

Pour simplifier la comparaison multiple: `Select Case`, permet de simplifier la succession de `ElseIf`. 

Exemple:
```
Sub test_note()
Dim note As Byte
note = 12.4
Select Case (note)
Case Is < 8
MsgBox "Vous n'avez pas votre baccalauréat"
Case Is < 10
MsgBox "Vous devez aller aux rattrapages"
Case Is < 12
MsgBox "Félicitations ! Vous avez votre bac !"
Case Is < 14
MsgBox "Vous avez la mention Assez Bien"
Case Is < 16
MsgBox "Vous avez la mention Bien"
Case Is < 18
MsgBox "Vous avez la mention Très Bien"
Case Else
MsgBox "Vous avez les félicitations du jury et les miennes par la même occasion"
End Select
End Sub
```

Autre forme possible avec `Case`

```
Select Case (note)
Case 1
MsgBox "La note est de 1"
Case 2, 3
MsgBox "La note est de 2 ou 3"
Case 4 To 6
MsgBox "La note est de 4, 5 ou 6"
Case Is > 6
MsgBox "La note est supérieure à 6"
Case Else
MsgBox "La note est inférieure à 1"
End Select
```

Commandes conditionnelles multiples: `And` et `Or`. Exemple:

```
' Pour l'opérateur And c'est comme ceci :
If age < 18 And sexe = "Masculin" Then
MsgBox "Vous n'êtes encore qu'un garçon..."
Else
MsgBox "Soit plus de 18 ans, soit vous êtes de sexe féminin"
End If
' Pour l'opérateur Or C'est la même chose
If pointure < 40 Or taille < 34
...
End If
```

Autres opérateurs logiques:
* `Not`: inverse une condition. Exemple:
```
If Not(2 = 3) Then
MsgBox "Les valeurs ne sont pas égales"
Else
MsgBox "Les valeurs sont égales"
End If
```
* `Xor`: très semblable à Or. Mais pour `Xor` si deux conditions sont vraies, alors c'est le code de la deuxième partie qui est exécutée. VBA considère que deux conditions vraies donnent faux avec `Xor`.
* `Is`: pour comparer deux objets VBA.
* `Like`: 

Comparaison de deux chaînes de caractères: avec `Like`. La correspondance entre deux chaînes peut être seulement les `n` premiers caractères ou simplement au niveau de la casse (majuscule ou minuscule).
On utilise un mot-clé `Option Compare` que l'on doit écrire dans la section des déclarations. Ce mot clé peut être suivi de deux
valeurs : `Binary` (une lettre en majuscule et la même lettre en minuscule ne sont pas considérées comme identiques; défaut si non précisé) ou `Text` (ne fait pas de différences entre minuscule et majuscule). Exemple:

```
Option Compare Binary
Sub test()
If "Site du Zéro" = "site du zéro" Then
MsgBox "Les chaînes sont exactement les mêmes"
Else
MsgBox "Il y a des différences entre les chaînes de caractères"
End If
End Sub
```


Si on veut comparer que quelques caractères, on peut utiliser des caractères joker. 
* `?` remplace un seul caractère, mais n'importe lequel
* `*` remplace quant à lui une chaîne de caractères (zéro ou plusieurs caractères). Je vous présente un tableau avec les caractères de
comparaison et leur signification.
* [Liste_de_caractères] Remplace un seul caractère de la liste
* [!Liste_de_caractères] Un seul caractère absent de la liste.

Simplification pour la liste de caractères: `[a-f]` correspond à `[abcdef]`

Boucle `For ... Next`
```
For nombre = 1 to 10
MsgBox nombre
Next nombre
```
A la fin de la boucle, il faut dire au programme de passer à la valeur suivante par le mot-clé `Next` suivi du nom de la variable.

Modifier le pas grâce à `Step`:

```
For nombre = 0 to 10 Step 2
MsgBox nombre
Next nombre
```

`Step` fonctionne également à l'envers

```
Sub rebours()
For n = 5 To 1 Step -1
MsgBox n
Next n
MsgBox "Boom !"
End Sub
```

Boucle pratique pour balayer lignes et colonnes. Exemple avec l'affectation à chaque entrée d'un tableau une lettre de l'alphabet :

```
Sub alphabet()
Dim lettre(25) as String
For n = 0 To 25
lettre(n) = Chr(n+65)
Next n
For n = 0 To 25
MsgBox lettre(n)
Next n
End Sub
```
Dans un premier temps, on crée un tableau de 26 entrées (nombre de lettres de notre alphabet). 
Dans une première boucle, on affecte à chaque entrée une lettre de l'alphabet, dans la seconde boucle on affiche ces lettres.

`Chr` est une fonction de VBA qui permet de renvoyer la lettre qui correspond à un code numérique. Ce code est le ASCII (American Standard Code of Information Interchange ou Code standard américain pour les échanges d'information). Ainsi avec `Chr(n+65)` ce code chaque nombre correspond à une lettre et par exemple A = 65, B = 66 et ainsi de suite. 
Comme notre code commence à 0, il faut ajouter 65 pour avoir la lettre A. Quand n est égal à 1, on ajoute 65 pour obtenir 66 et la lettre B. `Chr` permet de convertir ce nombre en lettre et on affecte cette valeur à l'entrée du tableau correspondante. 

Les boucles peuvent être imbriquées. Exemple:

```
Sub test_tableau()
For colonne = 1 To 5
For ligne = 1 To 5
MsgBox Chr(colonne+64) & ligne
Next ligne
Next colonne
End Sub
```
Dans la boucle `For Each`, on n'utilise pas d'indice qu'elle parcourt automatiquement tous les éléments de la classe (aussi appelée collection).

Cela est très pratique si vous avez besoin de rechercher un objet particulier (avec une condition à l'intérieur de la boucle) au sein de la collection pour le supprimer. L'objet supprimé va décaler les objets vers le haut et il y aura donc moins d'objets à parcourir. Avec cette boucle, tous les objets sont parcourus sans erreur, avec la boucle For..Next, il y aura une erreur à la fin puisqu'il aura un objet non créé.

Exemple: afficher dans une boite de dialogue le nom de chaque feuille de calculs. 
```
Sub afficher_noms()
Dim une_feuille As Worksheet
For Each une_feuille In Worksheets
MsgBox une_feuille.Name
Next une_feuille
End Sub
```

La boucle `Do Until` est similaire, elle continue de tourner tant qu'une condition est respectée

```
Sub test_boucle()
ma_variable = 0
Do Until ma_variable = 10
ma_variable = ma_variable + 1
MsgBox ma_variable
Loop
End Sub
```

La variable est incrémentée manuellement. Le mot-clé  la variable puis on affiche sa valeur. La fin de la boucle est signalée avec le mot-clé `Loop`.

Attention à ne pas faire de boucles infinies !

La boucle `While ... Wend` continue de boucler tant que la condition spécifiée est vraie. La boucle s'arrête dès que la condition est fausse. Exemple:

```
Sub test_while()
ma_variable = 0
While ma_variable < 12
ma_variable = ma_variable + 1
MsgBox ma_variable
Wend
End Sub
```

Quand la boucle doit remonter on utilise le mot-clé `Wend` (qui signifie s'acheminer) comme on utilise `Loop` dans la boucle `Do Until`.


Sortie anticipée d'une boucle: 
* avec le mot-clé `Exit For` pour les boucles `For ... Next` et `For Each`
* avec le mot-clé `Exit Do` pour une boucle `Do Until`

Dans le cas d'une boucle `For ... Next`, la valeur de l'indice (de la variable) est préservée. 

Si les boucles sont imbriquées, on ne sort que de la boucle dans laquelle on se trouve. Il ne sortira pas de la boucle extérieure à moins d'y placer une autre instruction `Exit`.

Exemple: 

```
Sub test_sortie()
For variable = 1 To 100
If variable = 50 Then
Exit For
End If
Next variable
MsgBox variable
End Sub
```

Pour les variables `Date`, pour obtenir le numéro du jour de la semaine, la fonction WeekDay() attend en paramètre une variable de type `Date` et renvoie un entier (1 pour Dimanche, ..., 7 pour Samedi).

Exemple pour le problème suivant: Combien de premiers du mois sont tombés un dimanche entre le premier janvier 1901 et le 31 décembre 2000 ?


```
Sub probleme19 ()
Dim dateFin As Date, dateActuelle As Date
dateActuelle = "01/01/1901" ' on commence au 01/01/1901
dateFin = "31/12/2000"
Range("A1").Select 'on sélectionne la première cellule pour y
afficher le premier résultat
While dateActuelle <= dateFin
If WeekDay(dateActuelle) = 1 And Day(dateActuelle) = 1 Then
ActiveCell.Value = dateActuelle ' on écrit le résultat dans la
cellule active
ActiveCell.Offset(1, 0).Select
dateActuelle = dateActuelle + 1 ' on passe au jour suivant
Else
dateActuelle = dateActuelle + 1
End If
Wend
End Sub
```

Les modules


Un module représente la feuille dans lequel vous écrivez votre code depuis le début. Ils sont rattachés à des classeurs
et le code de ces modules peut ainsi agir sur tout le classeur.


Deux dossiers: les objets du classeur Microsoft Excel Objets et les modules dans le classeur Modules

Les procédures codées peuvent aussi être exécutées en faisant appel à elle par le biais d'une autre procédure.

Les fonctions créées dans VBA peuvent aussi être appelées dans les cellules directement comme on
appelle la fonction SOMME.

Il y a 2 types de procédures: 
1) les sous-routines: permettent d'exécuter du code mais ne renvoie aucune valeur; se déclarent à l'aide de `Sub` et se termine par `End Sub`
2) les fonctions: renvoient une valeur; se déclarent à l'aide de `Function` et se termine par `End`; les fonction doivent être appelées via une variable pour qu'il y ait une valeur de retour (ex: `maintenant=Now()`).

Les deux types de procédures acceptent les paramètres.

Exemple de fonction:

```
Function multiplier(nombre1, nombre2)
multiplier = nombre1*nombre2
End Function
```
Une fois votre fonction créée, elle apparait dans la liste déroulante de droite au dessus de la zone de code. Elle peut alors être
utilisée dans VBA mais aussi dans Excel.

Exemple: utilisation dans Excel (dans une cellule)

```
=multiplier(3;4)
```
Exemple: utilisation dans une sous-routine

```
Sub test()
Dim variable1 As Byte, variable2 As Byte
variable1 = 3
variable2 = 5
resultat = multiplier(variable1, variable2)
MsgBox resultat
End Sub
```

La sous-routine ne retourne rien du tout directement et elle ne peut donc pas être utilisée directement dans une feuille de calculs à la manière d'une fonction.
Est utile pour éviter d'écrire plusieurs fois la même chose. Les sous-routines permettent de décomposer un gros code en plusieurs portions.

Exemple d'une sous-routine:

```
Sub affichage_prenom(prenom)
MsgBox "Votre prénom est : " & prenom
End Sub
```
Une sous-routine peut être appelée dans une procédure. La sous-routine peut être appelée comme une fonction en affichant son nom puis les paramètres si elle en prend entre
parenthèses. Mais on peut aussi utiliser le mot-clé `Call` (celui-ci permet de voir que c'est une sous-routine et qu'elle ne renvoie rien).

```
' Ces deux lignes font la même chose
Call ma_sous_routine(parametre)
ma_sous_routine(parametre)
```
Exemple d'utilisation de la sous-routine

```
Sub test()
' On crée une variable prénom et on lui attribue une valeur
Dim prenom As String
prenom = "Baptiste"
' On utilise notre sous-routine pour afficher le prénom
affichage_prenom (prenom)
' On crée une variable âge ayant pour valeur 20
Dim age As Byte
age = 20
' On réutilise la sous-routine pour montrer que malgré le code entre les deux,
' la sous-routine continue de faire la même chose.
affichage_prenom (prenom)
End Sub
```

La variable envoyée à la sous-routine ne doit pas forcément être la même que le nom de la variable utilisée dans la sous-routine. on peut très bien faire ça :

```
' On utilise toujours la même sous-routine avec la variable prenom
Sub test()
Dim pseudo As String
pseudo = "Baptiste"
affichage_prenom (pseudo)
Dim age As Byte
age = 20
affichage_prenom (pseudo)
End Sub
```

VBA vous permet de définir vos fonctions ou sous-routines privées ou publiques à l'aide des mots-clés Private ou Public. 

Par défaut, VBA les créées en publiques. Le fait qu'une fonction ou sous-routine soit publique permet à cette procédure d'être accessible dans tous les modules de l'application. De plus, elles feront partie de la liste des macros que l'on peut attribuer sur une feuille de calcul.

Pour les procédures privées, il suffit de mettre le mot-clé `Private` devant la déclaration de fonction ou sous-routine. Ainsi, on peut avoir des procédures qui ont le même nom dans des modules différents et qui exécutent un code différent. Ces fonctions privées ne peuvent être utilisées par un utilisateur dans la feuille de calcul. C'est le même système que pour les variables locales ou globales.

```
Private Sub sous_routine_privee()
End Sub
```


Quand on déclare des procédures avec des paramètres, par défaut, il sont de types `Variant`. Mais on peut attribuer un autre type de données à ces paramètres

```
Function afficher_resultat(resultat As Integer)
```
Avantage à déclarer des types de données : introduire une discipline dans le code car la procédure recherche un certain type d'informations. Avec le type par défaut, Variant, la procédure accepte n'importe quoi. Si on spécifie que le paramètre est une chaîne de caractères, une erreur se produira si ce n'est pas une chaîne de caractères qui est passée en paramètre.


On peut rendre certains arguments optionnels en utilisant le mot-clé `Optional`.
```
Function test(parametre1 As Byte, Optional parametre2 As Byte)
```
Cette fonction demande un paramètre obligatoire de type `Byte` qui est `parametre1` et un paramètre optionnel de type `Byte` qui est `parametre2`. 

Un paramètre optionnel doit être énoncé APRÈS les paramètres obligatoires.

On peut envoyer à une fonction une
variable de deux façon différentes. Soit on envoie la variable elle-même, soit une copie.

Pour envoyer une variable dans une fonction ou sous-routine, sans modifier ce nombre, on peut envoyer une copie de la variable à la fonction.
Se fait en utilisant le mot-clé `ByVal`. De ce fait, la valeur réelle de la variable n'est pas modifiée. 

Si on utilise le mot-clé `ByRef`, on envoie la référence de la variable (l'adresse), la sous-routine peut alors accéder à la
vraie valeur et la modifier. Dans ce cas, la variable est modifiée même dans la procédure qui appelle la sous-routine ou la fonction.
Par défaut, les arguments sont passés par référence.
```
' Passe la référence en argument.
Sub MaProcedure_1(ByRef x As Integer)
x = x * 2
End Sub
' Passe la valeur en argument.
Sub MaProcedure_2(ByVal y As Integer)
y = y * 2
End Sub
' ByRef est la valeur par défaut si non spécifiée.
Sub MaProcedure_3(z As Integer)
z = z * 2
End Sub
Sub Test()
' On utilise une variable pour la faire changer
Dim nombre_a_change As Integer
nombre_a_change = 50
' On applique à notre variable la première sous-routine
MaProcedure_1 nombre_a_change
MsgBox nombre_a_change
' On applique à notre variable la deuxième sous-routine
MaProcedure_2 nombre_a_change
MsgBox nombre_a_change
' On applique à notre variable la troisième sous-routine
MaProcedure_3 nombre_a_change
MsgBox nombre_a_change
End Sub
```
Étant donné que la variable est passée grâce à la référence, la variable est modifiée dans la sous-routine mais aussi dans la procédure qui appelait la sous-routine.
Dans un second temps, on applique la deuxième sous-routine. Dans celle-ci, on envoie une copie de la valeur. Elle fait le même calcul mais avec une copie. 
Enfin, dans la troisième, aucun mot-clé n'est utilisé. Par défaut nous envoyons la référence et donc la vraie valeur à la sous-routine. Celle-ci effectue donc le même calcul et modifie la variable de la procédure appelante.



Les boîtes de dialogue usuelles: `MsgBox` et `InputBox` (qui permet de récupérer des informations)

```
MsgBox (Prompt, [Buttons] As VbMsgBoxStyle = vbOkOnly, [title],
[helpfile], [context]) As VbMsgBoxResult
```

La fonction peut prendre jusqu'à 5 paramètres. Le `As` permet de préciser le type de valeur qu'il faut indiquer ou que la fonction
retourne.

Dans une MsgBox à trois boutons, c'est bien la valeur de retour (stockée dans une variable)
qui permettra de savoir où a cliqué l'utilisateur et d'agir en conséquence ! 
MsgBox() retourne un Long, c'est-à-dire un entier.
```
Sub maBoite()
Dim retour As Long
retour = MsgBox ( Prompt := " Je suis un Zér0 !" )
End Sub
```
`:=` permet d'indiquer le paramètre auquel nous attribuons une valeur

La syntaxe suivante est tout aussi correcte :
```
retour = MsgBox ( " Je suis un Zér0 !" )
```
`prompt` est le seul paramètre obligatoire, il attend une chaîne de caractères (`String`) et représente le message qui sera affiché dans la boîte.


Le paramètre `buttons` n'est pas obligatoire. A la place, il faut mettre une constante du type `VbMsgBox`. Par défaut, VBA applique la constante `vbOkOnly`, ce qui veut dire que par défaut, toutes vos `MsgBox` auront un bouton Ok. VBA met à disposition plusieurs constantes, à appeler par leur nom (`vbOkOnly`, `vbOkCancel`, `vbYesNoCancel`, `vbYesNo`) ou par leur valeur numérique (0, 1, 2, 3; respectivement).

Par exemple, pour créer une `MsgBox` qui affiche " Salut ! " et qui propose comme boutons " Ok " et " Annuler " :
```
retour = MsgBox ( Prompt := " Salut ! ", Buttons := vbOkCancel)
```
ou encore :
```
retour = MsgBox (" Salut ! ", 1)
```
La première solution, plus explicite, est à préférer.


Programmation événementielle: exécuter tel ou tel bloc d'instructions en fonction du signal reçu par le programme - signal généralement émis par l'utilisateur.

La valeur renvoyée par `MsgBox` dépend du bouton pressé par l'utilisateur.

Bouton -> Constante de retour -> Valeur numérique retour
OK -> `vbok` -> 1
Annuler -> `vbCancel` -> 2
Oui -> `vbYes` -> 6
Non -> `vbNo` -> 7

Exemple:
```
Sub questionVitale()
Dim retour As Long
' on crée une MsgBox "Oui - Non ":
retour = MsgBox( Prompt := "Êtes-vous vraiment un Zér0 ?", Buttons
:= vbYesNo )
'Si on a cliqué sur Oui, on souhaite la bienvenue :
If retour = vbYes Then
MsgBox "Bienvenue !"
'Sinon, on affiche un autre message moins amical :) :
Else
MsgBox "Ouste !"
End If
End Sub
```

`If retour = vbYes` peut être remplacé par `If retour = 6`, équivalent.

La fonction `InputBox()` permet de créer une boîte de dialogue avec un champ de texte pour que
l'utilisateur y saisisse quelque chose.  Prototype:
```
InputBox(Prompt, [Title], [Default], [XPos], [YPos], [HelpFile], [Context]) As String
```
La fonction renvoie un `String`, c'est-à-dire une chaîne de caractères. Que soit saisi un mot ou un nombre, il sera converti en `String`.

Quelques fonctions d'Excel utiles:
SOMME, PRODUIT, QUOTIENT, MOD, PGCD, SOMME.SI, SOMMEPROD, RACINE, PI, ARRONDI, ARRONDI.INF, ARRONDI.SUP, SI, ET, OU, SIERREUR, COLONNE, LIGNE, RECHERCHEV, RECHERCHEH, RECHERCHE, TRANSPOSE, MAX, MIN, MOYENNE, MEDIANE, ECARTYPE, FREQUENCE, NB, NBVAL, NB.VIDE, NB.SI, CONCATENER, EXACT, CHERCHE, DROITE, GAUCHE, MAJUSCULE, MINUSCULE, NOMPROPRE, NBCAR, REMPLACER

Quelques fonctions Date et Heure:
AUJOURDHUI, MAINTENANT, ANNEE, MOIS, JOUR, HEURE, MINUTE, SECONDE, JOURSE, NO.SEMAINE, DATE, NB.JOURS.OUVRES, SERIE.JOUR.OUVRE



##### Retour de fonctions
(source: https://docs.microsoft.com/fr-fr/dotnet/visual-basic/programming-guide/language-features/procedures/how-to-return-a-value-from-a-procedure)
(source: https://docs.microsoft.com/fr-fr/dotnet/visual-basic/language-reference/statements/function-statement#returning-from-a-function)
Pour retourner une valeur à partir d’une fonction, on peut affecter la valeur au nom de la fonction ou l’inclure dans une instruction `Return`.

1) `Return` assigne simultanément la valeur de retour et quitte la fonction:
```
Function MyFunction(ByVal j As Integer) As Double
    Return 3.87 * j
End Function
```

2) À au moins un emplacement dans la `Function`, assigner une valeur au nom de la procédure. Quand on exécute `Exit Function End Function`, la dernière valeur assignée au nom de la procédure sera retournée. L’exemple suivant affecte la valeur de retour au nom de la fonction `myFunction`, puis utilise l' `Exit Function` instruction pour retourner.
```
Function MyFunction(ByVal j As Integer) As Double
    MyFunction = 3.87 * j
    Exit Function
End Function
```






Les `Exit Function` et `Return <instructions>` provoquent une sortie immédiate d’une `Function`. Un nombre quelconque d'`Exit Function` et `Return <instructions>` peuvent apparaître n’importe où dans la procédure, et ces instructions peuvent être mélangées (mais on ne peut avoir qu'un seul `End Function`)

Si on utilise `Exit Function` sans assigner de valeur au nom de la fonction, la procédure retourne la valeur par défaut pour le type de données spécifié comme `returntype`. Si `returntype` n’est pas spécifié, la procédure retourne `Nothing`, la valeur par défaut pour `Object`.


Exemple: créer un damier coloré avec 1 case sur 2 grisée 
(source: https://www.excel-pratique.com/fr/vba/boucles_suite)

```
Sub exerciceBoucles()
    
    Dim colonne As Integer, ligne As Integer
    
    'Boucle des lignes
    For ligne = 1 To 10
        
        'Boucle des colonnes
        For colonne = 1 To 10
        
            Cells(ligne, colonne) = (ligne - 1) * 10 + colonne
            
            'Coloration d'une cellule sur 2
            If (ligne + colonne) Mod 2 = 0 Then 'Si le reste de la division par 2 = 0
                Cells(ligne, colonne).Interior.Color = RGB(220, 220, 220)
            End If
            
        Next
        
    Next
    
End Sub
```

Exemple: utilisation d'une variable pour sélectionner une cellule (`&` pour la concaténation !)
(source: https://docs.microsoft.com/fr-fr/office/vba/library-reference/concepts/getting-started-with-vba-in-office)
```
Sub Macro1()
    If Worksheets(1).Range("A1").Value = "Yes!" Then
        Dim i As Integer
        For i = 2 To 10
            Worksheets(1).Range("A" & i).Value = "OK! " & i
        Next i
    Else
        MsgBox "Put Yes! in cell A1"
    End If
End Sub
```
Exemple: supprimer des lignes vides dans une feuille de calcul Excel
(source: https://docs.microsoft.com/fr-fr/office/vba/library-reference/concepts/getting-started-with-vba-in-office)
```
Sub DeleteEmptyRows()
    SelectedRange = Selection.Rows.Count
    ActiveCell.Offset(0, 0).Select
    For i = 1 To SelectedRange
        If ActiveCell.Value = "" Then
            Selection.EntireRow.Delete
        Else
            ActiveCell.Offset(1, 0).Select
        End If
    Next i
End Sub
```

##### Les objets Excel
(source: https://www.lecompagnon.info/vba-excel/vba_objetsExcel.htm)

Les cellules Excel sont des objets de la classe `Range`.

* `Range("plage")` est un objet contenant la plage nommée... `plage` (accessible après avoir nommé cette plage dans Excel).
* `Range("A1:H5")` est un objet contenant la plage `A1:H5`
* `Evaluate("A1:H5")` ou `[A1:H5]` est équivalent exactement à `Range("A1:H5")`.
* `Cells(3,5)` est un objet contenant la cellule `E5` (ligne 3, colonne 5).
Attention ! `Cells` utilise l'adressage Ligne, Colonne, alors que Excel utilise Colonne, Ligne.
* `Range("A1").Offset(3,5)` est un objet contenant la plage F4 soit un déplacement de 3 lignes et 5 colonnes à partir de `A1`.

Ces deux dernières techniques peuvent être utilisées avec l'objet `Range` pour désigner des plages.

* `Range(Cells(3,5), Range("A1").Offset(3,5))` est un objet contenant la plage `E3:F4`.

L'utilisation d'un nom de plage au lieu d'une adresse permettra de déplacer la plage dans Excel sans devoir modifier la programmation VBA.
Il est donc FORTEMENT suggéré de manipuler les lignes d'une liste de données ainsi:
- Nommez la cellule de gauche de l'entête de liste.
- Utilisez la notation `Range(nom).Offset(ligne,colonne)` pour représenter les champs de la liste.

Pas de différence entre une plage et une cellule (une cellule est simplement une plage ne contenant qu'une cellule).
`Range("A1:B9")` est un objet de la même classe que `Range("A1")` et possède donc les mêmes propriétés (dont les valeurs peuvent être différentes) et méthodes.

Un objet `Range` est aussi une collection de cellules. Comme une cellule est un `Range` (d'une cellule), c'est une collection ne comptant qu'un objet.
Un `Range` est donc une collection de collections.

Certaines propriétés du modèle objet Excel contiennent des plages spécifiques:

* `Cells` = Plage qui contient toutes les cellules d'une feuille:
```
    ActiveSheet.Cells
    Sheets("Province").Cells
```
* `UsedRange` = Plage qui contient TOUTES les cellules occupées d'une feuille:
```
    ActiveSheet.UsedRange
    Sheets("Province").UsedRange
```
* `CurrentRegion` = Plage continue (limitée par des lignes et des colonnes vides) dont fait partie la cellule:
```
    Range("Titre").CurrentRegion
```
* `Rows` = Collection des lignes d'une plage. Permet d'obtenir une ligne d'une plage:
```
    Range("ListeProvinces").Rows(1)
    Range("Titre").CurrentRegion.Rows(1)
```
* `Columns` = Collection des colonnes d'une plage. Permet d'obtenir une colonne d'une plage:
```
    Range("ListeProvinces").Columns(1)
    Range("Titre").CurrentRegion.Columns(1)
```
* `SpecialCells` = Plages spéciales d'une plage Excel:
```
    SpecialCells(xlCellTypeBlanks)  Cellules vides
    SpecialCells(xlCellTypeConstants). Cellules contenant des constantes
    SpecialCells(xlCellTypeFormulas). Cellules contenant des formules
    SpecialCells(xlCellTypeLastCell). Dernière cellule dans la plage utilisée
    SpecialCells(xlCellTypeVisible).Toutes les cellules visibles
    ...
```

Quelques propriétés des objets `Range`:
* `Column` 	Numéro de la colonne de gauche de la plage. `Range("B4:H6").Column` vaut 2
* `Columns.Count` 	Nombre de colonnes de la plage. `Range("B4:H6").Columns.Count` vaut 7
* `Row` 	Numéro de la ligne du haut de la plage
* `Rows.Count` 	Nombre de lignes de la plage
* `Count` 	Nombre de cellules de la plage
* `CurrentRegion` 	Plage continue (limitée par des lignes et des colonnes vides) dont fait partie la cellule.
* `End(xlDown)` 	Cellule de la dernière ligne à la fin de la zone qui contient la plage. Correspond aux touches Fin+Bas.
* `End(xlToRight)` 	Cellule de la dernière colonne à la fin de la zone qui contient la plage. Correspond aux touches Fin+Droite.
* `Text` 	Valeur AFFICHÉE de la cellule, donc évaluée et formatée.
* `Value` 	Valeur ÉVALUÉE de la cellule.
* `Worksheet` 	Objet `Worksheet` qui est la feuille qui contient la plage


Les feuilles Excel sont des objets de la classe `Worksheet`.

Elles sont regroupées dans la collection `Worksheets` et dans la collection `Sheets`.

On peut manipuler une feuille de classeur par son nom:

- `Worksheets("Provinces")` est la feuille nommée province.
- `Sheets("Provinces")` est aussi la feuille nommée province.

Différence: la collection `Sheets` contient aussi les objets `Chart` du classeur.

Les classeurs Excel sont des objets de la classe `Workbook`.

Tous les classeurs ouverts sont regroupés dans la collection `Workbooks`.

- `Workbook("VBA Exemples.xls")` est le classeur VBA `Exemples.xls`

La programme Excel lui-même, lorsque démarré, est un objet de la classe `Application`.

Le classeur actif est: `Application.ActiveWorkbook` ou plus simplement `ActiveWorkbook`.

Le classeur contenant le code VBA en cours d'exécution est: `Application.ThisWorkbook` ou plus simplement `ThisWorkbook`.

La feuille active du classeur actif est: `Application.ActiveWorkbook.ActiveSheet` ou plus simplement `ActiveSheet`.

La cellule active de la feuille active du classeur actif est: `Application.ActiveWorkbook.ActiveSheet.ActiveCell` ou plus simplement `ActiveCell`.

La cellule active de la feuille nommée `Province` du classeur actif est: `Application.ActiveWorkbook.Worksheets("Province").ActiveCell` ou plus simplement `Worksheets("Province").ActiveCell`.

L'objet `Selection` est l'objet passe-partout, qui contient ce qui est sélectionné dans le classeur Excel. Ce peut être une plage, un graphique, un tableau croisé ou n'importe quoi. L'utilisation de `Selection` en VBA est à éviter, puisqu'il risque fort de contenir une sélection inattendue lors de l'exécution du programme.

La barre d'état de la fenêtre Excel est l'objet `StatusBar`.

###### Méthodes Excel

La plupart des opérations que l'utilisateur peut faire en Excel peuvent être programmées en VBA grâce aux méthodes des différents objets du modèle objet Excel.

Voici les plus intéressantes:

* `Evaluate` 	Permet d'exécuter en VBA une formule Excel (ce qui est à droite du signe = dans une cellule). Peut être remplacée par les par les crochets: `[2+2]` équivaut à `Evaluate("2+2")` et vaut 4. Attention ! ce qui est incorrect dans une cellule est incorrect pour `Evaluate`. 
```
[A1]` équivaut à `Range("A1").Value`
`[Sum("A2:H6")]` exécute la formule Excel `Somme("A2:H6")`
```
* `Intersect` 	Retourne une plage formée des cellules communes de deux plages. Cette méthode permet de savoir si une cellule appartient à une plage.
```
Intersect(Range("A1:C4"),Range("B2:D5"))` ' équivaut à `Range("B2:C4")
(Intersect(Range("B6"),Range("Provinces") is Nothing)` ' est faux si `B6` fait partie de la plage `Provinces`.
```
* `Calculate` 	Recalcule la feuille ou le classeur Excel. `
Calculate`; `ActiveWorksheet.Calculate`
* `Save` 	Enregistre le classeur
```
ActiveWorkbook.Save
```
* `Quit` 	Ferme Excel. Attention, si le classeur a été modifié mais non sauvegardé, la boîte de dialogue de sauvegarde d'Excel sera affichée.
```
    `Application.Quit`
```

* `Clear`, `ClearContents`, `ClearFormats` 	Effacent respectivement les cellules, les contenus ou les formats d'une plage.
```
    Range("A1").Clear
    Worksheet("Tableaux").Clear
```

* `Copy` 	Copie le contenu d'une plage dans une autre ou dans le presse-papier
```
    Range("A1").Copy Range("B1") 'copie le contenu de A1 dans B1
    Range("A1").Copy 'copie le contenu de A1 dans le presse-papier> 
```
PasteSpecial 	Colle le contenu d'une plage ou du presse-papier dans une plage. On peut spécifier le type de collage spécial: xlPasteAll (défaut), xlPasteAllExceptBorders,  xlPasteColumnWidths. xlPasteComments, xlPasteFormats, xlPasteFormulas, xlPasteFormulasAndNumberFormats, xlPasteValidation, xlPasteValues ou  xlPasteValuesAndNumberFormats.
```
    Range("Total").Copy ' copie la plage Total dans le presse-papier
    Range("A1").PasteSpecial (xlPasteValues)
    copie la VALEUR du presse-papier dans la cellule A1. li> 
```

* `Find` et `FindNext` 	Ces deux méthodes permettent d'effectuer une recherche dans une plage de cellules.
* `Select` 	Sélectionne une cellule ou une feuille Excel. À éviter la plupart du temps en programmation VBA, car le déplacement du curseur Excel est rarement souhaitable pendant l'exécution d'un programme VBA.
* `Sort` 	Tri de plage. Voir l'aide VBA Excel pour en connaître le fonctionnement. Il est aussi utile d'utiliser l'enregistreuse de macro-commandes sur un tri manuel des données pour en analyser les paramètres.

###### Principaux événements Excel

Objet -> Événement -> Paramètres -> Se produit lorsque

* `Workbook` 	`Open` 	 -  	Le classeur Excel est ouvert 	
* `Workbook` 	`BeforeClose` 	`Cancel` 	Lorsqu'une demande de fermeture du classeur a été faite 	
* `Workbook` 	`SheetChange` 	`Sheet` la feuille modifiée; `Target` la plage modifiée 	Lorsqu'une cellule ou plage du classeur est modifiée 	
* `Worksheet` 	`Change` 	`Target` la plage modifiée 	Lorsqu'une cellule ou plage de la feuille qui contient la procédure `Sub` est modifiée 	
* `Worksheet` 	`SelectionChange` 	`Target` la nouvelle plage sélectionnée 	Lors de la sélection d'une autre plage dans un classeur 	

Remarquez que dans les événements `SheetChange`, `Change` et `SelectionChange`, VBA n'a pas directement accès aux valeurs précédant le changement, ni à un paramètre Cancel pour annuler le changement. Il faut utiliser une astuce pour empêcher le changement. 

On peut désactiver le traitement des événements, en utilisant la propriété `EnableEvents`.

###### Autres objets intéressants

* `Me`

C'est un objet Excel ou VBA contenant le code en cours d'exécution. Si le code appartient à une feuille, c'est un objet `Worksheet` contenant cette feuille.
`Me` est le plus souvent utilisé pour désigner le formulaire VBA (`Forms`) contenant le code en cours d'exécution. On évite ainsi de nommer le formulaire
dans le code VBA , ce qui donne des programmes plus faciles à utiliser dans d'autres formulaires.

- `Me.Name` contient le nom du formulaire en cours d'exécution.
- `Me.Close` (utilisation la plus fréquente) ferme le formulaire qui contient cette ligne.

* `Err`

C'est un objet VBA contenant la dernière erreur rencontrée. Ses propriétés permettent d'en connaître la nature:

- `Err.Description` contient la description de la dernière erreur rencontrées par VBA.

VBA peut déclencher une erreur avec `Err`:

-`Err.Raise 18` simule une interruption par l'utilisateur (Ctrl-Break).

* `FileSystemObject`
C'est l'objet contenant des instructions permettant à VBA d'accéder à l'arborescence de dossiers et de fichiers de l'ordinateur.
ATTENTION ce n'est pas un objet VBA ni un objet Excel, mais un objet de la librairie Microsoft Scripting Runtime.

Objets intéressants:
* `Drives` 	Collection d'objets Drive
* `Drive` 	Objet contenant un lecteur
* `Folders` 	Collection d'objets Folder
* `Folder` 	Objet contenant un dossier
* `Files` 	Collection d'objets File
* `File` 	Objet contenant un fichier

Un objet `FileSystemObject` contient une collection `Drives`.
Chaque objet `Drive` de la collection `Drives` contient une collection `Folders` et une collection `Files`.
Chaque objet `Folder` d'une collection `Folders` contient une collection `Folders` et une collection `Files`.
Chaque objet `File` d'une collection `Files` contient un fichier (document Windows).

Cette structure permet de parcourir l'arborescence de documents en VBA comme avec l'explorateur Windows.

#######  Objet implicite (`With`)

Il arrive fréquemment qu'une série d'instructions utilise le même objet. L'écriture (et la lecture) du code VBA devient alors fastidieuse, avec la répétition incessante de la même référence.

L'instruction `With` permet de réduire les répétitions. Par exemple le code:
```
    If Target.Interior.Color = Range("CouleurVerrou").Interior.Color Then
        Application.EnableEvents = False 'Empêcher une boucle d'événements
        Application.Undo                 'Annuler le changement
        Application.EnableEvents = True  'Très important de réactiver
    End If
```
peut être remplacé par celui-ci:
```
    With Application
        If Target.Interior.Color = Range("CouleurVerrou").Interior.Color Then
            .EnableEvents = False 'Empêcher une boucle d'événements
            .Undo                 'Annuler le changement
            .EnableEvents = True  'Très important de réactiver
        End If
    End With
```

##### Boites de dialogue et formulaire:

https://www.lecompagnon.info/vba-excel/vba_dialogues_et_formulaires.htm

##### Exercices Objets Excel
(source: https://www.lecompagnon.info/vba-excel/vba_objetsExcel.htm)
 Exemple 1: Changer la couleur d'arrière-plan des cellules modifiées.
```
 Private Sub Workbook_SheetChange(ByVal Sh As Object, ByVal Target As Range)
'Changer l'arrière-plan d'une cellule modifiée
    'Target est la plage modifiée (voir les paramètres de la procédure, ci-dessus)
    Target.Interior.Color = vbYellow 'Jaune

End Sub
```
Il est possible de restreindre les modifications à une seule feuille:
* en insérant le code dans la procédure événementielle Worksheet_Change du module associé à la feuille voulue; ou 
* en insérant un test sur le nom de la feuille (`Sh.Name`) dans le code suggéré (en le laissant dans le module associé au classeur) (cette solution limite l'éparpillement du code dans plusieurs modules et produit donc un programme plus facile à comprendre et à modifier plus tard)

 Exemple 2: Une fonction qui affiche le contenu réel d'une cellule.

```
  Function fnValeurCellule(rCellule)
'Retourne le contenu (formule ou valeur) de la cellule en paramètre
    If TypeName(rCellule) <> "Range" Then  ' <> est pour "différent de"
        fnValeurCellule = "Erreur de paramètre"
        Exit Function
    End If
    fnValeurCellule = rCellule.Formula
End Function
```
 
  Exemple 3: Empêcher la modification des cellules dont l'arrière-plan est rouge.

```
Private Sub Workbook_SheetChange(ByVal Sh As Object, ByVal Target As Range)
'Empêcher la modification de cellules dont l'arrière-plan est d'une couleur choisie par l'utilisateur
'Note: la feuille doit contenir une cellule nommée CouleurVerrou de la couleur choisie

'Target est la plage modifiée (voir les paramètres de la procédure, ci-dessus)
    If Target.Interior.Color = Range("CouleurVerrou").Interior.Color Then
        Application.EnableEvents = False 'Empêcher une boucle d'événements
        Application.Undo                 'Annuler le changement
        Application.EnableEvents = True  'Très important de réactiver
    End If
End Sub
```
L'utilisation de la propriété `EnableEvents` pour empêcher que l'instruction suivante (la méthode `Undo`) provoque l'événement `Workbook_SheetChange` et entraîne ainsi une succession sans fin d'exécution de la procédure Sub correspondante (`Workbook_SheetChange` appelant `Workbook_SheetChange` appelant `Workbook_SheetChange`, etc.)

 Exemple 4: Empêcher la modification des cellules ne faisant pas partie d'une plage.
 
``` 
Private Sub Workbook_SheetChange(ByVal Sh As Object, ByVal Target As Range)
'Empêcher la modification de cellules en dehors d'une plage nommée ZoneDeSaisie
'Note: le classeur doit contenir une plage nommée ZoneDeSaisie
    'Target est la plage modifiée (voir les paramètres de la procédure, ci-dessus)
    If Intersect(Target, Range("ZoneDeSaisie")) Is Nothing Then
        Application.EnableEvents = False 'Empêcher une boucle d'événements
        Application.Undo                 'Annuler le changement
        Application.EnableEvents = True  'Très important de réactiver
    End If
End Sub
```

 Exemple 5: Empêcher le déplacement du curseur Excel tant qu'une condition n'est pas respectée.

L'événement qui nous intéresse est `SelectionChange`, qui n'a pas de paramètre `Cancel`, donc qu'on ne peut pas annuler directement.
La méthode `Undo` ne fonctionne pas non plus, car elle n'annule pas le déplacement. De plus, elle risquerait d'annuler une modification, alors qu'on ne veut annuler que le déplacement.
Il faudra donc que le programme garde trace de la dernière cellule sélectionnée.

```
 Function fnDéplacementValide()
'Retourne Vrai si la somme des cellules de la plage ZoneDeSaisie est égale à 10

    fnDéplacementValide = ([sum(ZoneDeSaisie)] = 10)

End Function

Function fnPlageAdansPlageB(plageA, PlageB)
'Retourne Vrai si plageA est complètement dans PlageB ou l'inverse

    If Intersect(plageA, PlageB) Is Nothing Then
        fnPlageAdansPlageB = False
    Else
        fnPlageAdansPlageB = (Intersect(plageA, PlageB).Count = plageA.Count)
    End If

End Function
```

 Exemple 6: Trouver toutes les cellules d'une feuille contenant le mot Liberté.
 
``` 
  Function fnTrouveMotDansPlage(sMot, rPlage)
'Retourne une plage formée des cellules de rPlage contenant sMot

Dim rTrouvée As Range 'contiendra les cellules trouvées
Dim rCellule As Range 'contiendra chaque cellule testée, à tour de rôle

    For Each rCellule In rPlage    'Pour chaque cellule de rPlage
        'Si sMot est dans rCellule
        If InStr(UCase(rCellule.Value), UCase(sMot)) > 0 Then
            If rTrouvée Is Nothing Then  'Première cellule trouvée
                Set rTrouvée = rCellule
            Else                         'Cellules trouvées suivantes
                Set rTrouvée = Union(rTrouvée, rCellule)
            End If
        End If   
    Next
    Set fnTrouveMotDansPlage = rTrouvée
End Function
```


Le nombre de cellules contenant le mot Liberté trouvées dans la plage `A1:C6` peut maintenant être obtenu avec l'expression VBA:
```
fnTrouveMotDansPlage("Liberté", Range("A1:C6")).Count
```
ou avec la formule Excel
```
=NBVAL(fnTrouveMotDansPlage("Liberté";A1:C6))
```
On peut mettre ces cellules en rouge avec l'instruction VBA:
```
fnTrouveMotDansPlage("Liberté", Range("A1:C6")).interior.color = vbRed
```


* Puisqu'elle retourne une plage de cellules, elle ne peut pas être utilisée directement dans une cellule du classeur Excel. En effet, une cellule ne peut pas contenir une plage.
* Mais on peut l'utiliser comme paramètre de type plage dans une fonction Excel (cf. deuxième utilisation ci-dessus)
* La fontion `Excel Nb.Si()` joue un rôle semblable, mais dans sa version simple `(=NB.SI(A1:C6;"Liberté"))` ne comptera que les cellules dont la valeur est égale à la valeur cherchée, contrairement à `fnTrouveMotDansPlage` qui trouve les cellules qui contiennent la valeur. De plus, `fnTrouveMotDansPlage` retourne la plage et non le nombre. On peut donc manipuler le résultat en VBA en lui assignant un nom de variable:
```
dim rPlageTrouvée as Range
Set rPlageTrouvée = fnTrouveMotDansPlage("Liberté", Range("A1:C6"))
```

Le même résultat peut être obtenu en utilisant les méthodes `Find` et `Findnext` dans une boucle cherchant les cellules d'une plage. 

```
Function fnTrouveMotDansPlage(sMot, rPlage)
'Retourne une plage formée des cellules de rPlage contenant sMot

Dim rTrouvées As Range
Dim rCelluleTrouvée As Range
Dim rPremièreTrouvée As Range

    Set rCelluleTrouvée = rPlage.Find(sMot)
    If rCelluleTrouvée Is Nothing Then
        Exit Function 'Aucune occurrence
    End If

    'Find et FindNext trouveront toutes les occurrences,
    'puis recommenceront à la première
    'Il faut donc chercher jusqu'à ce qu'on trouve la première à nouveau.
    Set rPremièreTrouvée = rCelluleTrouvée
    Set rTrouvées = rCelluleTrouvée
    Set rCelluleTrouvée = rPlage.FindNext(rCelluleTrouvée)
 
    Do While Not rCelluleTrouvée = rPremièreTrouvée
        Set rTrouvées = Union(rTrouvées, rCelluleTrouvée)
        Set rCelluleTrouvée = rPlage.FindNext(rCelluleTrouvée)
    Loop
    Set fnTrouveMotDansPlage2 = rTrouvées
End Function
```

Exemple 7: Obtenir le nom et la taille du dossier contenant le classeur Excel actif.

```
 Function fnDossier(Optional param = 0)
'Retourne le nom du dossier et/ou l'espace qu'il utilise

'La ligne suivante requiert une référence à Microsoft Scripting Runtime
Dim fso As New Scripting.FileSystemObject

    If param = 1 Then
        fnDossier = ActiveWorkbook.Path
        Exit Function
    ElseIf param = 2 Then
        fnDossier = (fso.GetFolder(ActiveWorkbook.Path).Size) / 1024
        Exit Function
    Else
        fnDossier = ActiveWorkbook.Path & ": " & _
            Round(fso.GetFolder(ActiveWorkbook.Path).Size / 1024, 2) & _
            " Ko"
    End If
End Function
```
Une fonction ne peut retourner qu'une seule valeur, alors qu'ici on veut le nom te la taille du dossier. On utilise donc un paramètre pour spécifier la valeur voulue (1 retourne le nom, 2 retourne la taille), et si le paramètre est omis, la fonction retourne les deux dans une chaîne de caractères. 


##### Exercices Tests et branchements	
(source: https://www.lecompagnon.info/vba-excel/vba_tests.htm)
 Exemple 1: Tester si une cellule Excel nommée "Nombre" contient un nombre.
 
```
Sub sExempleTest2()
'Vérifier si la cellule "Nombre" contient un nombre
    If Not IsNumeric(Range("Nombre").Value) Then
        MsgBox"La valeur n'est pas numérique"
        Exit Sub
    End If
End Sub
```



 Exemple 2: Programmer une fonction qui retourne le nom d'une province, à partir d'un sigle.

```
Function fnNomProvince2(SigleProvince)
'Auteur: Michel Berthiaume
'Retourner le nom d'une province
Dim sSigleProvince As String

    'D'abord tester la validité du paramètre
    If TypeName(SigleProvince) = "Range" Then
        sSigleProvince = UCase(SigleProvince.Value)
    ElseIf TypeName(SigleProvince) = "String" Then
        sSigleProvince = UCase(SigleProvince)
    Else
        fnNomProvince2 = "sigle inconnu"
        Exit Function
    End If

    'Rendu ici, sSigleProvince contient une version en majuscules du sigle
    If sSigleProvince = "AB" Then
        fnNomProvince2 = "Alberta"
    ElseIf sSigleProvince = "BC" Then
        fnNomProvince2 = "Colombie Britannique"
    ElseIf sSigleProvince = "PE" Then
        fnNomProvince2 = "Île-du-Prince-Édouard"
    ElseIf sSigleProvince = "NS" Then
        fnNomProvince2 = "Nouvelle-Écosse"
    ElseIf sSigleProvince = "NU" Then
        fnNomProvince2 = "Nunavut"
    ElseIf sSigleProvince = "ON" Then
        fnNomProvince2 = "Ontario"
    ElseIf sSigleProvince = "QC" Then
        fnNomProvince2 = "Québec"
    ElseIf sSigleProvince = "SK" Then
        fnNomProvince2 = "Saskatchewan"
    ElseIf sSigleProvince = "NF" Then
        fnNomProvince2 = "Québec"
    ElseIf sSigleProvince = "NT" Then
        fnNomProvince2 = "Territoires du Nord-Ouest"
    ElseIf sSigleProvince = "YK" Then
        fnNomProvince2 = "Yukon"
    Else
        fnNomProvince2 = "Sigle inconnu"
    End If
End Function
```

ou en utilisant l'Instruction `Select` (sans avantage important sur la version précédente):

```
Function fnNomProvince3(SigleProvince)
'Retourner le nom d'une province
Dim sSigleProvince As String

    'D'abord tester la validité du paramètre
    If TypeName(SigleProvince) = "Range" Then
        sSigleProvince = UCase(SigleProvince.Value)
    ElseIf TypeName(SigleProvince) = "String" Then
        sSigleProvince = UCase(SigleProvince)
    Else
        fnNomProvince3 = "sigle inconnu"
        Exit Function
    End If

    'Rendu ici, sSigleProvince contient une version en majuscules du sigle
    Select Case sSigleProvince
        Case "AB"
            fnNomProvince3 = "Alberta"
        Case "BC"
            fnNomProvince3 = "Colombie Britannique"
        Case "PE"
            fnNomProvince3 = "Île-du-Prince-Édouard"
        Case "NS"
            fnNomProvince3 = "Nouvelle-Écosse"
        Case "NU"
            fnNomProvince3 = "Nunavut"
        Case "ON"
            fnNomProvince3 = "Ontario"
        Case "QC"
            fnNomProvince3 = "Québec"
        Case "SK"
            fnNomProvince3 = "Saskatchewan"
        Case "NF"
            fnNomProvince3 = "Québec"
        Case "NT"
            fnNomProvince3 = "Territoires du Nord-Ouest"
        Case "YK"
            fnNomProvince3 = "Yukon"
        Case Else
            fnNomProvince3 = "Sigle inconnu"
    End Select
End Function
```

##### Exercices: Erreurs	
(source: https://www.lecompagnon.info/vba-excel/vba_erreurs.htm)

Exemple 1: Capturer n'importe quelle erreur
```
Function fnMoyenneMoinsMin(rPlage)
'Calculer la moyenne 'moins la valeur la plus basse des valeurs d'une plage
Dim cSomme As Currency
Dim cMin As Currency
Dim rCellule As Range

    On Error GOTO Erreur:

    'Initialiser à la 1ère valeur de la plage
    cMin = rPlage.Cells(1, 1).Value

    For Each rCellule In rPlage
        cSomme = cSomme + rCellule.Value
        cMin = fnMin(rCellule.Value, cMin)
    Next

    fnMoyenneMoinsMin = (cSomme - cMin) / (rPlage.Count - 1)

    Exit Function

Erreur:
    fnMoyenneMoinsMin = "Erreur: " & Err.Description

End Function
```

Remarquez la présence de `Exit Function` avant l'étiquette `Erreur`: évite que la gestion d'erreur soit exécutée lorsqu'il n'y a pas d'erreur. La présence d'une étiquette n'interrompt pas la procédure.

Exemple 2: Capturer une erreur spécifique

```
Sub EnregistrerClasseur()
'enregistrer le classeur

    On Error GoTo Erreur:

    ActiveWorkbook.Save

    Exit Sub

Erreur:
    If Err.Number = 1004 Then
        If MsgBox("Le fichier est en lecture seule. SVP corriger et cliquer Ok" & _
            vbCrLf & "ou cliquer annuler", vbOKCancel) = vbOK Then
            Resume
        End If
    End If
End Sub
```

Exemple 3: utiliser la gestion d'erreur à d'autres fins

```
Function fnMin(a, b)
'Retourne le minimum de a ou b
'Retourne Null si la comparaison est impossible

On Error GoTo Erreur

    If a < b Then
        fnMin = a
    Else
        fnMin = b
    End If
   
    Exit Function

Erreur: 'Gère les comparaisons impossibles, comme les pommes vs les oranges
    fnMin = ""
End Function
```

##### Exercices: Boucles
(source: https://www.lecompagnon.info/vba-excel/vba_boucles.htm)

Exemple 1: boucle de collection

Supposons une plage de cellules Excel nommée ListeProvinces: écrire une fonction VBA qui retourne le nom associé au sigle
```
Function fnNomProvince4(SigleProvince)
'Retourner le nom d'une province

Dim sSigleProvince As String
Dim rCellule As Range

    fnNomProvince4 = "sigle inconnu" 'Réponse par défaut

    'D'abord tester la validité du paramètre
    If TypeName(SigleProvince) = "Range" Then
        sSigleProvince = UCase (SigleProvince.Value)
    ElseIf TypeName(SigleProvince) = "String" Then
        sSigleProvince = UCase(SigleProvince)
    Else
        Exit Function
    End If

    'Rendu ici, sSigleProvince contient une version en majuscules du sigle
    'Pour chaque cellule de colonne 1 de la plage nommée ListeProvinces
    For Each rCellule In Range("ListeProvinces").Columns(1).Cells
        If sSigleProvince = UCase(rCellule.Value) Then 'Valeur trouvée
            fnNomProvince4 = rCellule.Offset(0, 1).Value 'Valeur de la cellule à droite
            Exit For 'inutile de continuer: on sort de la boucle.
        End If
    Next
End Function
```
La même, en utilisant un compteur de lignes:

```
Function fnNomProvince5(SigleProvince)
'Auteur: Michel Berthiaume
'Retourner le nom d'une province

Dim sSigleProvince As String
Dim lLigne as Long

    fnNomProvince5 = "sigle inconnu" 'Réponse par défaut

    'D'abord tester la validité du paramètre
    If TypeName(SigleProvince) = "Range" Then
        sSigleProvince = UCase (SigleProvince.Value)
    ElseIf TypeName(SigleProvince) = "String" Then
        sSigleProvince = UCase(SigleProvince)
    Else
        Exit Function
    End If

    'Rendu ici, sSigleProvince contient une version en majuscules du sigle
    'On fait varier lLigne de 1 au nombre de lignes de la plage nommée ListeProvinces
    For lLigne = 1 to Range("ListeProvinces").Rows.Count
        If sSigleProvince = Range("ListeProvinces").Cells(lLigne, 1).Value Then
            fnNomProvince5 = Range("ListeProvinces").Cells(lLigne, 2).Value 'Valeur de la cellule à droite
            Exit For 'inutile de continuer: on sort de la boucle.
        End If
    Next
End Function
```

Exemple 2: boucle avec compteur et accumulateur

On veut une fonction `fnMoyennePlus` qui calcule la moyenne des valeurs positives d'une plage.
```
Function fnMoyennePlus(Plage)
'Calculer la moyenne des valeurs positives d'une plage

Dim cSomme as Currency
Dim cCompteur as Currency
Dim rCellule as Range

    'D'abord tester la validité du paramètre
    If TypeName(Plage) <> "Range" Then
        Exit Function
    End If

    For each rCellule in Plage
        If rCellule.Value > 0 Then
            cSomme = cSomme + rCellule.Value
            cCompteur = cCompteur +1
        End If
    Next
    If cCompteur > 0 Then    'Éviter les divisions par 0
        fnMOyennePlus = cSomme/cCompteur
    EndIf
End Function
```
Une variante de la même fonction:
```
Function fnMoyennePlus1(Plage)
'Calculer la moyenne des valeurs positives d'une plage

Dim lNoCellule As Long
Dim cSomme as Currency
Dim cCompteur as Currency
Dim rCellule as Range

    'D'abord tester la validité du paramètre
    If TypeName(Plage) <> "Range" Then
        Exit Function
    End If

    For lNoCellule = 1 to Plage.Cells.Count
        If Plage.Cells(lNoCellule).Value > 0 Then
            cSomme = cSomme + Plage.Cells(lNoCellule).Value
            cCompteur = cCompteur + 1
        End If
    Next
    If cCompteur > 0 Then    'Éviter les divisions par 0
        fnMoyennePlus1 = cSomme/cCompteur
    EndIf
End Function
```
 

Finalement, une variante plus classique de cette solution, utilisant un compteur de lignes et un compteur de colonnes:
```
Function fnMoyennePlus2(Plage)
'Calculer la moyenne des valeurs positives d'une plage

Dim lNoLigne As Long

Dim lNoColonne As Long
Dim cSomme as Currency
Dim cCompteur as Currency
Dim rCellule as Range

    'D'abord tester la validité du paramètre
    If TypeName(Plage) <> "Range" Then
        Exit Function
    End If

    For lNoLigne = 1 to Plage.Rows.Count              'Pour chaque ligne
        For lNoColonne = 1 to Plage.Columns.Count     'Pour chaque colonne
            If Plage.Cells(lNoLigne,lNoColonne).Value > 0 Then
                cSomme = cSomme + Plage.Cells(lNoLigne,lNoColonne).Value
                cCompteur = cCompteur + 1
            End If
        Next
    Next
    If cCompteur > 0 Then    'Éviter les divisions par 0
        fnMoyennePlus1 = cSomme/cCompteur
    EndIf
End Function
```

Exemple 3: boucles de lecture

Dans une boucle de lecture, le nombre d'itérations n'est pas connu au départ. L'utilisation de `For...Next` n'est donc pas approprié.
```
Ici, on veut saisir une série de nombres qui seront inscrits dans la feuille Excel.
Sub SaisirNombres()

'Saisir des nombres et les inscrire dans une feuille Excel

Dim sSaisie As String
Dim lNoLigne As Long

    'Dans la boucle de lecture "standard", la première valeur est lue AVANT d'entrer dans la boucle
    sSaisie = InputBox("Entrer une valeur", "Inscription de valeurs dans une feuille")

    Do Until sSaisie = ""             'Le bouton Annuler de InputBox renvoie la chaîne nulle
        If IsNumeric(sSaisie) Then
            lNoLigne = lNoLigne + 1   'Prochaine ligne de la feuille Excel
            Range("A1").Offset(lNoLigne, 0).Value = sSaisie
        End If
        sSaisie = InputBox("Entrer une valeur", "Inscription de valeurs dans une feuille")
    Loop
End Sub
```
Ce type de boucle est utilisé pour lire des données venant de requêtes SQL, de fichiers conventionnels, etc.
Notez qu'il y a lecture AVANT d'entrer dans la boucle, puis une autre immédiatement avant la fin, et que le test de fin de lecture est en début de boucle.
La première instruction de lecture est automatique (implicite) dans l'ouverture d'une requête SQL.

Une autre façon d'arriver au même résultat:
```
Sub SaisirNombres1()
'Saisir des nombres et les inscrire dans une feuille Excel

Dim sSaisie As String
Dim lNoLigne As Long

    Do
        Do
            sSaisie = InputBox("Entrer une valeur", "Inscription de valeurs dans une feuille")
        Loop Until IsNumeric(sSaisie) Or Len(sSaisie) = 0
        If Len(sSaisie) = 0 Then 
            lNoLigne = lNoLigne + 1   'Prochaine ligne de la feuille Excel
            Range("A1").Offset(lNoLigne, 0).Value = sSaisie
        End If
    Loop Until sSaisie = ""             'Le bouton Annuler de InputBox renvoie la chaîne nulle
End Sub
```
##### Exercices: Tableaux et collections
(source: https://www.lecompagnon.info/vba-excel/vba_collections.htm)

Exemples

```
Sub ExemplesTableaux()
'Exemples de manipulation de collection et de tableau
Dim cNombres() As Currency
Dim vTableau() As Variant
Dim lLigne As Long, lColonne As Long
Dim tDépart As Date

With Worksheets("Tableaux")

    Cells.Clear

    'Créer une matrice 10000x100 de nombres dans Excel
    tDépart = Now 'Date et heure du départ
    For lLigne = 1 To 10000
        For lColonne = 1 To 100
            .Cells(lLigne, lColonne) = lLigne + lColonne
        Next
    Next
    MsgBox "Création de matrice Excel en " & Round((Now - tDépart) * 24 * 60 * 60, 2) & " secondes"

    'Créer une matrice 10000x100 de nombres dans VBA
    ReDim cNombres(1 To 10000, 1 To 100)
    tDépart = Now 'Date et heure du départ
    For lLigne = 1 To 10000
        For lColonne = 1 To 100
            cNombres(lLigne, lColonne) = lLigne + lColonne
        Next
    Next
    MsgBox "Création de matrice VBA en " & Round((Now - tDépart) * 24 * 60 * 60, 10) & " secondes"

    'Copie d'une matrice Excel dans un tableau VBA
    'ATTENTION: le tableau DOIT ÊTRE DE TYPE Variant
    'Le tableau est automatiquement redimensionné aux dimensions de la plage
    vTableau = Range(.Cells(1, 1), .Cells(1000, 100))

    'Copie d'une matrice VBA dans un tableau Excel
    .Cells.Clear
    .Range(.Cells(1, 1), .Cells(UBound(vTableau, 1), UBound(vTableau, 2))) = vTableau

End With

End Sub
```





##### Autres exemples




https://www.fil.univ-lille1.fr/~sedoglav/VisualBasic/Cours01.pdf

```
 Dim Salaire,RemboursementMensuel As Decimal
 Select Case (RemboursementMensuel/Salaire)*100
 case Is >= 33# MsgBox("ca va pas \^etre possible")
 case 30# To 32# MsgBox("ca va \^etre juste")
 case 20# To 29# MsgBox("c’est OK")
 case Else MsgBox("en chaussette")
 End Select
```

```
Dim mat1(3,3) As Integer = { {1,2,3}, {4,5,6}, {7,8,9} }
Dim mat2(3,3) As Integer = { {9,8,7}, {6,5,4}, {3,2,1} }
Dim res(3,3) As Integer
For i As Integer=0 To 2
  For j As Integer=0 To 2
    res(i,j) = mat1(i,j)+mat2(i,j)
  Next j
Next i
```

https://www.fil.univ-lille1.fr/~sedoglav/VisualBasic/Cours03.pdf
par valeur : c’est une copie qui est pass ́ee en param`etre`a la fonction. Cette derni`ere peut manipuler la copiemais ne peut pas modifier les valeurs des variables de laroutine appelantes ;2.par r ́ef ́erence : c’est une copie de l’adresse d’unevariable d ́efinie dans l’espace d’adressage de la fonctionappelante qui est pass ́ee en param`etre. Cette fois, laroutine appel ́ee peut modifier les variables de la routineappelantes.

```
Function SquareFct( ByVal P As Integer ) As Integer
P *=P     ’le param\‘etre s’utilise comme
Return P  ’ une variable usuelle
End Function

Sub SquareProc( ByRef Q As Integer )
Q *=Q
End Function

Sub Main()
Dim X,Y As Integer
X=2
Y=3
X=SquareFct(X)
SquareProc(Y)
End Sub
```
Attention, sans pr ́ecision sur le type de passage :Function SquareFct( P As Integer ) As Integer

https://www.fil.univ-lille1.fr/~sedoglav/VisualBasic/Cours03.pdf

SurchargeLa signature d’une routine est constitu ́ee d’un identificateuret d’une liste de param`etre — avec de plus d’une valeur deretour pour une fonction.Il est possible d’utiliser plusieurs fois le mˆeme identificateurpour diff ́erentes signatures. Dans ce cas, cette identificateurestsurcharg ́e.

```
Overloads Function Square (ByVal X As Integer) As Integer
return X*X
End Function
```
```
Overloads Function Square (ByVal X As Double) As Double
return X*X
End Function
```
Lors de l’appel, la premi`ere version rencontr ́ee de la fonctioncorrespondant aux param`etres fournis est ex ́ecut ́ee.

https://www.fil.univ-lille1.fr/~sedoglav/VisualBasic/Cours04.pdf
D ́eclaration d’ ́enum ́erationOn peut d ́efinir des valeurs invariables li ́ees logiquemententre elles ; une d ́eclaration de mod`ele d’ ́enum ́eration est :

```
Enum Identificateur [As DataType]
IdentificateurDeMembre1 = ValeurInt1
...
IdentificateurDeMembreN = ValeurIntN
End Enum
```

AvecDataTypeune valeur enti`ere (Byte,ULong, etc). Sanssp ́ecification de valeur d’initialisationValeurIntJ, leJi`ememembre correspondant est initialis ́e `aJ−1. Par exemple, onpeut repr ́esenter les joursouvrablesde la semaine ainsi :

```
Enum  JourOuvrable As UInteger
Lundi = 1
Mardi = 2
Mercredi = 3
Jeudi = 4
Vendredi = 5
End Enum
```

Une  ́enum ́eration se d ́eclare hors des sous-routines.

L’op ́erateur.permet d’avoir acc`es au champs de lad ́eclaration du mod`ele de l’ ́enum ́eration.IOn peut d ́eclarer une variable qui ayant pour type lemod`ele de l’ ́enum ́eration.

```
Function Cours (Dim JoursDeTP As JourOuvrable) As Boolean
If JoursDeTP=JourOuvrable.Mercredi
Or JoursDeTP=JourOuvrable.Vendredi
then return True
End If
Return False
End Function
```

D ́eclaration de structureUnestructureregroupe plusieurs valeurs de types diff ́erentsen une mˆeme entit ́e.Ielle est compos ́ee d’une suite de membres ;Ichaque membre porte un nom interne `a la structure ;Ile type des membres peut ˆetre quelconque (l’imbricationde structure est possible).

```
Structure IdentificateurDeModele
Dim IdentificateurMembre1 As Type1
....
Dim IdentificateurMembreN As TypeN
End Structure
```

Par exemple, on peut d ́eclarer le mod`ele de structure :
```
Structure Eleve
Dim nom As String
Dim note As UByte
End Structure
```
Utilisation de structureL’utilisation d’une structure n ́ecessite — outre les op ́erateurscourants — l’op ́erateur.d’acc`es aux membres :

```
Sub affichage(ByVal param As Eleve)
MsgBox("Nom : " & param.nom & " Note : " & param.note")
End Sub

Sub Main()
Dim etudiant As Eleve
etudiant.nom="Bill Gates"
etudiant.note=0
affichage(etudiant)
End Sub
```

Exemple: calculer la somme d'une plage
(source: http://eric.univ-lyon2.fr/~ricco/cours/excel/EXCEL%20-%20Cours%20-%20Programmation%20VBA.pdf, slide 33)
```
'Travail sur le type Range avec un For Each
Public FunctionMaSommeRangeEach(plageAs Range) As Double
'variables intermédiaires
Dim s As Double, celluleAs Range
'initialisation de la somme
s = 0
'parcours de la plage de cellules
For Each cellule In plage
  s = s + cellule.Value
Next cellule
'renvoyer le résultat
MaSommeRangeEach= s
End Function
```

Le type de variant peut gérer tout type de valeurs. Il est très souple, particulièrement commode quand on ne connaît pas à l’avance le type à utiliser. Mais attention, il ne faut pas en abuser, il est très lent parce que multiplie les vérifications à chaque accès à la variable correspondante
On peut s’en servir pour renvoyer un tableau. Une fonction peut donc renvoyer plusieurs valeurs d’un coup, à l’instar des fonctions matricielles d’Excel (il faut valider la saisie de la fonction avec la séquence de touches CTRL + MAJ + ENTREE).

(dans la barre de fonction d'Excel: c'est bien une fonction matricielle comme peuvent en témoigner les accolades { } qui encadrent l’appel de la fonction)

```
'renvoyer plusieurs valeurs
Public Function MonMinMax(a As Double, b As Double) As Variant
'un tableau interne -matrice 2 lignes et 1 colonne
Dim tableau(1 To 2, 1 To 1) As Double
'identifier le min et le max
If (a < b) Then
  tableau(1, 1) = a
  tableau(2, 1) = b
Else
  tableau(1, 1) = b
  tableau(2, 1) = a
End If
'renvoyer le tableau
MonMinMax= tableau
End Function
```

Simulation valeurs TVA:
(source: http://eric.univ-lyon2.fr/~ricco/cours/excel/EXCEL%20-%20Cours%20-%20Programmation%20VBA.pdf (slide 42))

```
SubSimulationTVA()
'variables
Dim pht As Double, pttc As Double
Dim tva As Double
Dim i As Long
'début d'écriture des valeurs en ligne 2
i = 2
'récupérer la valeur du PHT
pht= Cells(1, 2).Value 'enB1'faire varier la tva de 10%à 30%avec un pas de 5%
For tva= 10 To 30 Step5
'insérer la valeur de la TVA en B2
  Cells(2, 2).Value = tva
  'Récupérer le prix ttc en B3
  pttc= Cells(3, 2).Value
  'inscription des valeurs TVA en colonne D
  Cells(i, 4).Value = tva
  'PTTC en colonne E
  Cells(i, 5).Value = pttc
  'passage à la ligne suivante
  i = i + 1
Next tva
End Sub
```

Exemple mettre en police verte les cellules contenant une valeur paire
http://eric.univ-lyon2.fr/~ricco/cours/excel/EXCEL%20-%20Cours%20-%20Programmation%20VBA.pdf, slide 44

```
SubMesValeursPaires()
'variable intermédiaire
Dim cellule As Range
'boucler sur la sélection
For Each cellule In Selection
'tester le contenu
If (cellule.ValueMod2 = 0) Then
'modifier la couleur de la police
cellule.Font.ColorIndex= 4
End If 
Next cellule 
End Sub
```

Dans une sélection, de nouveau les coordonnées sont relatives c.-à-d. le coin en haut à gauche d’une sélection correspond à la cellule (ligne n°1, colonne n°1) quelle que soit la position de la sélection dans la feuille; donc on aurait pu écrire:

```
SubMesValeursPairesBis()
'variables intermédiaires
Dim i As Long, j As Long
'boucler sur les lignes
For i = 1 To Selection.Rows.Count
'boucler sur les colonnes
For j = 1 To Selection.Columns.Count
'tester le contenu
If (Selection.Cells(i, j).Value Mod 2 = 0) Then
'modifier la couleur de la police
Selection.Cells(i, j).Font.ColorIndex= 4
End If
Next j 
Next i 
End Sub
```

Exemple: Identifier la première cellule contenant la valeur minimale dans une plage, mettre sa police en bleu.
http://eric.univ-lyon2.fr/~ricco/cours/excel/EXCEL%20-%20Cours%20-%20Programmation%20VBA.pdf, slide 46

Attention ! `Range` est un objet. Une affectation pour une variable objet doit être réalisée à l’aide de l’instruction `Set`

```
SubMonMinBleu()
'variables intermédiaires min va servir de cellule témoin
Dim cellule As Range, min As Range
'initialisation du témoin sur la 1ère cellule
Set min= Selection.Cells(1, 1)
'parcourir
For Each cellule In Selection
'comparer avec le contenu de la cellule témoin
If (cellule.Value< min.Value) Then
'màj de la cellule témoin
Setmin= cellule 
End If
Next cellule
'mettre la couleur pour la cellule minimale
min.Font.ColorIndex= 5
End Sub
```

Une sélection peut être multiple aussi c.-à-d. contenant plusieurs "zones"

le même mot clé Selection peut être exploité
* `Selection.Areas.Count`: Nombre de "zones" dans la sélection
* `Selection.Areas(k)`: Accès à la zone n°k (qui est de type `Range`). `Areas` est une collection de zones.

Exemple: Pour chaque zone, mettre en police bleue la cellule contenant la valeur minimale 
Selection.Areasest une collection. On peut utiliser un For Each. On aurait pu aussi passer par un accès indicé.

```
SubMonMinZoneBleu()
'var. intermédiaires
Dim zone As Range, min As Range
'pour chaque zone
For Each zone In Selection.Areas
'à l'intérieur de chaque zone'initialisation
Set min = zone.Cells(1, 1)
'parcours des cellules
For Each cellule In zone
'comparer
If (cellule.Value< min.Value) Then
'màjde la variable témoin
Set min = cellule
End If
Next cellule
'mettre la couleur pour la cellule minimale
min.Font.ColorIndex= 5
'passage à la zone suivante
Next zone
End Sub
```

Excel dispose de fonctions natives puissantes. 
Exemple afficher la moyenne pour une sélection

```
SubMaMoyenneSelection()
'var. intermédiaire
Dim moyenne As Double
'vérifier la sélection
If (Selection.Areas.Count> 1) Then
MsgBox("Attention, ce n'est pas une sélection simple")
Else
'faire calculer la moyenne de la sélection par Excel
moyenne = Application.WorksheetFunction.Average(Selection)
MsgBox("La moyenne est " & Str(moyenne))
End If
End Sub
```

###### Astuces VBA

https://www.excel-pratique.com/fr/astuces_vba

Exemple 1: calculer le nombre de jours dans un mois ou définir le dernier jour du mois


```
Sub nb_jours_mois()
    
    'Une date quelconque pour cet exemple
    date_test = CDate("6/2/2012")
    
    'Mois / année de la date
    mois = Month(date_test)
    annee = Year(date_test)
    
    'Calcul du premier jour du mois suivant
    date_mois_suivant = DateSerial(annee, mois + 1, 1)
    
    'Date du dernier jour
    dernier_jour_mois = date_mois_suivant - 1
    
    'Nombre de jour dans le mois (= dernier jour)
    nb_jours = Day(dernier_jour_mois)
    
End Sub
```

Pour l'utiliser en tant que fonction en ajoutant le code suivant dans un module :
```
Function NB_JOURS(date_test As Date)
    NB_JOURS = Day(DateSerial(Year(date_test), Month(date_test) + 1, 1) - 1)
End Function
```
Exemple d'utilisation de la fonction en VBA :
```
Sub exemple()
    test = NB_JOURS(Range("A1"))
    MsgBox test
End Sub
```

Exemple 2: dernière ligne d'un tableau

Il arrive fréquemment de devoir insérer des données à la suite d'un tableau sur une feuille Excel, et pour faire cela, il faut connaître le numéro de la première ligne disponible de ce tableau.

La dernière ligne non vide d'un tableau s'obtient à l'aide de :

```
Cells(Rows.Count, colonne).End(xlUp).Row
```

Pour déterminer quelle est la dernière cellule non vide d'une colonne (remplacer "colonne" par 1; pour la colonne A dans cet exemple) :
```
Sub exemple()

    derniereLigne = Cells(Rows.Count, 1).End(xlUp).Row
    
    MsgBox derniereLigne

End Sub
```

Si on dispose d'une lettre au lieu d'un numéro de colonne, utiliser `Range` au lieu de `Cells` :

```
Sub exemple()

    derniereLigne = Range("A" & Rows.Count).End(xlUp).Row + 1
    
    MsgBox derniereLigne

End Sub
```

Exemple 3: véfifier si une valeur est entièrement en majuscules

```
Sub test()

    ma_valeur = "BonJOUR"
    
    If ma_valeur = UCase(ma_valeur) Then 'Test si en majuscules
        MsgBox "Oui, ma_valeur est (entièrement) en majuscules."
    Else
        MsgBox "Non, ma_valeur n'est pas (entièrement) en majuscules." '<= Valeur renvoyée (car ma_valeur contient des minuscules)
    End If

End Sub
```

Exemple 4: tester si une chaîne de caractères est un palindrome

```
Function palindrome(valeur)
    palindrome = StrReverse(valeur) = valeur
End Function
```

Exemple 5: modifier la mise en forme de certains caractères

En utilisant `Characters` avec la syntaxe: `Range("A1").Characters(NO_DEPART, NB_DE_CARACTERES)`


```
Sub test()

    For ligne = 1 To 12
    
        'Contenu de la cellule
        contenu = Cells(ligne, 1)
        
        'Contenu divisé en un tableau de 3 parties
        tab_contenu = Split(contenu, " ")
        
        'Longueur de la partie 1
        longueur_partie_1 = Len(tab_contenu(0))
        
        'Longueur de la partie 2
        longueur_partie_2 = Len(tab_contenu(1))
        
        'Partie 1 en ITALIQUE
        Cells(ligne, 1).Characters(1, longueur_partie_1).Font.Italic = True
        
        'Partie 2 en GRAS
        Cells(ligne, 1).Characters(longueur_partie_1 + 2, longueur_partie_2).Font.Bold = True

    Next
End Sub
```

Exemple 6: remplacer des caractères

Avec la fonction `Replace` : 
```
Replace(texte, valeur_avant, valeur_après)
'ou
Replace(texte, valeur_avant, valeur_après, départ, nombre, casse)
```
Exemple pour effacer les tirets:
```
Sub remplacer()
    ma_chaine = "CH-34-763-92-FR-1"
    
    MsgBox Replace(ma_chaine, "-", " ") 'Renvoie : CH 34 763 92 FR 1
End Sub
```

Exemple 7: supprimer des espaces inutiles

La fonction `Trim` permet de retirer les espaces inutiles au début et à la fin d'une chaîne de caractères.

```
Sub exemple()
    ma_variable = Trim(Range("A3"))
    MsgBox ma_variable 'Renvoie "Excel-Pratique.com"
End Sub
```

Exemple 8: chercher une valeur à l'intérieur d'une chaine de caractères

La fonction `InStr` vérifie si une chaîne de caractères contient une valeur définie et renvoie la position de la première valeur trouvée (ou 0 si la valeur n'a pas été trouvée dans la chaîne).

```
InStr(départ, texte, valeur_à_rechercher)
'ou
InStr(départ, texte, valeur_à_rechercher, casse)
```

Lorsqu'il y a plusieurs positions à relever, il est possible de créer une boucle et de quitter celle-ci lorsque `InStr` renvoie 0 (= plus de résultat) :

```
Sub exemple()
    
    ma_chaine = "6397-GA12-D3-FR-GA15-XT-54PGA-GAO-4-TE-6GA9"
    
    positions = "" 'Pour enregistrer la liste des résultats
    separateur = "" 'Séparateur pour la liste des résultats (vide pour la première position)
    derniere_pos = 1 'Dernière position (pour le premier argument de InStr)
    
    Do
        pos = InStr(derniere_pos, ma_chaine, "GA")
        
        If pos Then 'Si pas égal à 0
            positions = positions & separateur & pos
            separateur = "-"
            derniere_pos = pos + 1
        End If
    
    Loop While pos > 0
    
    'Résultat
    MsgBox positions

End Sub
```

Exemple 9: rechercher la position d'une valeur dans une variable tableau (`Array`) 

```
Function array_pos(tableau, recherche)
    'https://www.excel-pratique.com/fr/astuces_vba/recherche-position-tableau-array
    array_pos = -1
    For ii = LBound(tableau) To UBound(tableau)
        If tableau(ii) = recherche Then 'Si valeur trouvée
            array_pos = ii
            Exit For
        End If
    Next
End Function
```
La fonction `array_pos` renverra ensuite la position de la première valeur trouvée dans le tableau (ou la valeur -1 si la valeur n'a pas été trouvée dans le tableau).

Voici un exemple simple qui va rechercher la présence de la valeur de la variable `valeur_a_rechercher` dans le tableau `mon_tableau` et afficher ensuite sa position dans une `MsgBox` :

```
Sub test()
    mon_tableau = Array(23, 67, 38, 17, 854, 9, 92)
    valeur_a_rechercher = 9
    MsgBox array_pos(mon_tableau, valeur_a_rechercher)
End Sub
```

Exemple 10: rechercher une valeur dans une variable tableau (`Array`)

```
Function in_array(tableau, recherche)
    'https://www.excel-pratique.com/fr/astuces_vba/recherche-tableau-array
    in_array = False
    For i = LBound(tableau) To UBound(tableau)
        If tableau(i) = recherche Then 'Si valeur trouvée
            in_array = True
            Exit For
        End If
    Next
End Function
```

La fonction `in_array` renverra ensuite `True` ou `False` en fonction du résultat.

Voici un exemple simple qui va rechercher la présence de la valeur de la variable `valeur_a_rechercher` dans le tableau `mon_tableau` et afficher Vrai ou Faux dans une `MsgBox` :

```
Sub test()
    mon_tableau = Array(23, 67, 38, 17, 854, 9, 92)
    valeur_a_rechercher = 17
    MsgBox in_array(mon_tableau, valeur_a_rechercher)

End Sub
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


