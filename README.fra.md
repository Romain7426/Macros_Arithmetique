# Arithmétique dans les macros C 

[GLOBISH: https://github.com/Romain7426/Macros_Arithmetique/blob/main/README.eng.md](https://github.com/Romain7426/Macros_Arithmetique/blob/main/README.eng.md)

Bonjour tout le monde! ☺ 

J'en suis venu à cette problématique pour deux choses: 
 - puissance du langage de macros 
 - aussi, pouvoir faire automatiquement une macro qui compte le nombre d'arguments (pas réussi) 
 - enfin, contourner la problématique du fait que les «constantes» en macros ne sont pas calculées, mais réécrites; ainsi «#define M 1+2» réécrira par «1+2» partout, sans jamais le calculer (contrairement aux enums, qui, eux, font le calcul: «enum { M = 1 + 2 };»). 


À ÉCRIRE 
 
Pour les soustractions, nécessite une deuxième lettre 'N': «PPPPPNN -> PPP». 
 
Pour les multiplications, à part donner brutalement la table, je ne vois pas comment faire: 

#define MULT_3_4 12

Ce qui impliquerait une table de 256x256 éléments, soit 64k. 


Et à vrai dire, ce serait pareil pour la soustraction, car il faudrait définir tous les cas de réécriture, soit 256x256 éléments, soit 64k. 
 

Sachant que cela ne fonctionne pas: 
<pre>
#define ARGS_COUNT() 0 
#define ARGS_COUNT(__a1__) 1 
#define ARGS_COUNT(__a1__,__a2__) 2 
#define ARGS_COUNT(__a1__,__a2__,__a3__) 3 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__) 4 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__,__a5__) 5 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__,__a5__,__a6__) 6 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__,__a5__,__a6__,__a7__) 7 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__,__a5__,__a6__,__a7__,__a8__) 8 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__,__a5__,__a6__,__a7__,__a8__,__a9__) 9 
#define ARGS_COUNT(__a1__,__a2__,__a3__,__a4__,__a5__,__a6__,__a7__,__a8__,__a9__,__a10__) 10 
fatal error: 'ARGS_COUNT' macro redefined [-Wmacro-redefined]
</pre> 


## Installation et compilation

La procédure: 

<pre>
$ echo "clang" > ./CC        # Ou votre compilateur préféré. 
$ sh ./configure.sh          # Génère d'abord les outils puis le Makefile. 
$ make 
$ make install 
</pre>
 
Personnalisation 
 - Choix du compilateur — par défaut, le compilateur utilisé est 'cc'; pour indiquer votre compilateur préféré, il faut en donner le chemin dans le fichier './CC'. 
 - Choix du répertoire d'installation — par défaut, le répertoire d'installation est './destroot'; pour indiquer votre lieu préféré, il faut éditer le Makefile généré, voire le fichier './Makefile-gen.mkf' (il est aussi possible de simplement créer un lien symbolique vers './destroot', ou de copier les fichiers dans './destroot' vers le lieu d'installation attendu). 
 - Aucune autre configuration possible. (Toutefois, vous pouvez toujours modifier le fichier './Makefile-gen.mkf' à votre convenance.) 
 
Architecture de la configuration 
 - La configuration n'est pas basée sur [GNU Autohell](https://en.wikipedia.org/wiki/Autohell). 
 - L'idée est de générer un [Makefile](https://fr.wikipedia.org/wiki/Make#Makefile) soit le plus standard possible, parfaitement prévisible et ennuyeux, afin de pouvoir être lu par n'importe quelle version exotique de [Make](https://fr.wikipedia.org/wiki/Make). Un tel [Makefile](https://fr.wikipedia.org/wiki/Make#Makefile) est beaucoup plus lisible, plus simple à déboguer, plus compréhensible, et évite à [Make](https://fr.wikipedia.org/wiki/Make) de prendre des initiatives (en inférant on ne sait pas quelle règle ésotérique). (En sus, en théorie, un tel [Makefile](https://fr.wikipedia.org/wiki/Make#Makefile) serait distribuable — dans les faits, cela est improbable dû aux spécificités de chaque compilateur, de chaque système, etc., spécificités que il faut donc détecter a priori.) 
 - Pour générer un tel [Makefile](https://fr.wikipedia.org/wiki/Make#Makefile) ennuyeux, nous utilisons le fichier './Makefile-gen.mkf' qui est un script écrit dans le langage [GNU Make](https://en.wikipedia.org/wiki/GNU_make) (le langage de [GNU Make](https://en.wikipedia.org/wiki/GNU_make) étant beaucoup plus sympathique que le [shell standard](https://fr.wikipedia.org/wiki/Bourne_shell)). 
 - Ce script './Makefile-gen.mkf' nécessite des outils extérieurs qui se trouvent dans le sous-répertoire './tools'. Avant d'exécuter le script './Makefile-gen.mkf', il faut générer ces outils. Cela est fait par le script [shell](https://fr.wikipedia.org/wiki/Bourne_shell) './tools-compile.sh'. (Notons que ces outils devraient compiler sans problème.) 
 - Et c'est tout. Tout cela est automatiquement réalisé par le script [shell](https://fr.wikipedia.org/wiki/Bourne_shell) './configure.sh'. 
 
Plaintes 
 - Si le script './configure.sh' se plaint que il ne trouve pas [GNU Make](https://en.wikipedia.org/wiki/GNU_make), éditez le fichier './configure.sh' pour lui indiquer où trouver [GNU Make](https://en.wikipedia.org/wiki/GNU_make). 
 - Tout le code source suppose que le [compilateur](https://fr.wikipedia.org/wiki/Compilateur) est compatible avec la norme [C99](https://fr.wikipedia.org/wiki/C_(langage)#Normalisation). 
 - Pour les autres plaintes, a priori, je ne sais pas. 
 
[Compilateurs](https://fr.wikipedia.org/wiki/Compilateur) testés: 
 - [clang](https://fr.wikipedia.org/wiki/Clang)
 - [gcc11](https://fr.wikipedia.org/wiki/GNU_Compiler_Collection)
 - [tcc](https://en.wikipedia.org/wiki/Tiny_C_Compiler)
 - Hélas [pcc](https://en.wikipedia.org/wiki/Portable_C_Compiler) se plaint lors de la compilation. 
 - D'autres? 

[Systèmes](https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27exploitation) testés: 
 - [OpenBSD](https://fr.wikipedia.org/wiki/OpenBSD) 
 - Les autres systèmes [BSD](https://fr.wikipedia.org/wiki/Berkeley_Software_Distribution) devraient fonctionner sans problème. 
 - Il devrait fonctionner sous [MacOSX](https://fr.wikipedia.org/wiki/MacOS). 
 - Les systèmes compatibles avec [Unix](https://fr.wikipedia.org/wiki/Unix) devraient fonctionner. 
 - Sur [Windows](https://fr.wikipedia.org/wiki/Microsoft_Windows), nous ne savons pas, nous n'avons pas essayé, mais le programme devrait pouvoir fonctionner à travers [Cygwin](https://fr.wikipedia.org/wiki/Cygwin), [MinGW](https://fr.wikipedia.org/wiki/MinGW), etc. 
 

La configuration nécessite 
Les outils devraient compiler sans problème. 
 
 
La configuration n'est pas basée sur [GNU Autohell](https://en.wikipedia.org/wiki/Autohell). Néanmoins nous utilisons [GNU Make](https://en.wikipedia.org/wiki/GNU_make). (qui est un langage plus sympathique que le [shell standard](https://fr.wikipedia.org/wiki/Bourne_shell)). Si le fichier './configure.sh' ne trouve pas [GNU Make](https://en.wikipedia.org/wiki/GNU_make), il faut éditer le fichier './configure.sh' pour lui indiquer. 

Par défaut, l'installation se fait dans le sous-répertoire './destroot'. Cela peut se changer en éditant le *Makefile*. 

Dans l'ensemble, le programme ne dépend pas de grand chose: un compilateur [C99](https://fr.wikipedia.org/wiki/C_(langage)#Normalisation), et éventuellement [GNU Make](https://en.wikipedia.org/wiki/GNU_make) ([GNU Make](https://en.wikipedia.org/wiki/GNU_make) est utilisé uniquement pour la configuration, pas pour la compilation, le 'Makefile' généré devant être compatible avec n'importe quelle version de [Make](https://en.wikipedia.org/wiki/Make_(software))). Faire compiler le programme ne devrait pas poser de problèmes majeurs (testé avec [clang](https://fr.wikipedia.org/wiki/Clang), [gcc11](https://fr.wikipedia.org/wiki/GNU_Compiler_Collection), et [tcc](https://en.wikipedia.org/wiki/Tiny_C_Compiler); hélas [pcc](https://en.wikipedia.org/wiki/Portable_C_Compiler) se plaint lors de la compilation). 


## Auteurs  
 
Auteurs: 
 - [Romain: https://github.com/Romain7426](https://github.com/Romain7426)


## [Propriété intellectuelle](https://fr.wikipedia.org/wiki/Propri%C3%A9t%C3%A9_intellectuelle) 
 
Nous ne portons aucun intérêt à la [propriété intellectuelle](https://fr.wikipedia.org/wiki/Propri%C3%A9t%C3%A9_intellectuelle) du présent programme. Vous pouvez faire ce que il vous plaît avec ce programe. 

Nous aurions bien laissé ce programme dans le [domaine public](https://fr.wikipedia.org/wiki/Domaine_public_(propri%C3%A9t%C3%A9_intellectuelle)), mais il semblerait que il existerait une possibilité pour s'approprier du matériel qui serait dans le domaine public, et d'en restreindre l'accès. Afin de prévenir ce cas dégénéré, ce programme a été publié sous une licence équivalente à la [licence ISC](https://fr.wikipedia.org/wiki/Licence_ISC), mais en plus relâchée (cf. le fichier [COPYING](https://github.com/Romain7426/Calculatrice_decimale/blob/main/COPYING) pour la consulter in extenso). En ce qui nous concerne, vous pouvez faire ce que vous voulez avec ce programme et son code, dans la mesure vous n'empêchez personne de l'utiliser, y compris nous-mêmes. 





Merci!! :smile: 

Et nous vous aimons tous. :kissing_heart: 

 

