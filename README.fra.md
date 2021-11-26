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
$ echo "clang" > ./CC 
$ sh ./configure.sh 
$ make 
$ make install 
</pre>

Les outils devraient compiler sans problème. 
 
La configuration n'est pas basée sur [GNU Autohell](https://en.wikipedia.org/wiki/Autohell), néanmoins nécessite [GNU Make](https://en.wikipedia.org/wiki/GNU_make) (qui est un langage plus sympathique que le [shell standard](https://fr.wikipedia.org/wiki/Bourne_shell)). Si le fichier './configure.sh' ne trouve pas [GNU Make](https://en.wikipedia.org/wiki/GNU_make), il faut éditer le fichier './configure.sh' pour lui indiquer. 

Par défaut, l'installation se fait dans le sous-répertoire './destroot'. Cela peut se changer en éditant le *Makefile*. 

Dans l'ensemble, le programme ne dépend pas de grand chose: un compilateur [C99](https://fr.wikipedia.org/wiki/C_(langage)#Normalisation), et éventuellement [GNU Make](https://en.wikipedia.org/wiki/GNU_make) ([GNU Make](https://en.wikipedia.org/wiki/GNU_make) est utilisé uniquement pour la configuration, pas pour la compilation, le 'Makefile' généré devant être compatible avec n'importe quelle version de [Make](https://en.wikipedia.org/wiki/Make_(software))). Faire compiler le programme ne devrait pas poser de problèmes majeurs (testé avec [clang](https://fr.wikipedia.org/wiki/Clang), [gcc11](https://fr.wikipedia.org/wiki/GNU_Compiler_Collection), et [tcc](https://en.wikipedia.org/wiki/Tiny_C_Compiler); hélas [pcc](https://en.wikipedia.org/wiki/Portable_C_Compiler) se plaint lors de la compilation). 



Merci!! :smile: 

Et nous vous aimons tous. :kissing_heart: 

 

