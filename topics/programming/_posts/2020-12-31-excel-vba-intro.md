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
```
```
```
```
```
```
```
```


