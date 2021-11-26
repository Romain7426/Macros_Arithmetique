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


Merci!! :smile: 

Et nous vous aimons tous. :kissing_heart: 

 

