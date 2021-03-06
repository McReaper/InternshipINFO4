# Journal du 30 Juillet, 2 & 3 Août 2021

> Les vacances qui n'en sont pas trop ;)

 - J'ai probablement finis ma partie sur le papier PhaistOS.
 - J'ai aussi fourni une base de benchmarks à Nicolas.
 - J'ai modifié un peu PhaistOS pour la compile (nom module et templates).
 - J'ai fais une image avec son aide pour tester phaistos sur un vrai système et non-plus une VM.

---

# Journal du 28 & 29 Juillet 2021

Ces deux jours j'ai consacré mon temps à réviser les différents aspects essentiels de Latex, et j'ai pu commencer l'écriture du papier scientifique de PhaistOS (partie compilateur) en anglais.

Voici un extrait (introduction) :
> To make PhaistOS reach its goal, that is generate a linux module containing a custom I/O policy, it needs to go throught multiple steps. First, to interpret the content of the file describing the policy wrote by the final user, PhaistOS uses a parser associated with a lexer to transcribe the content into an AST, thus decomposing it into different nodes. This AST is then used by a visitor, that will go throught each nodes, and for each one, it will work with a template dedicated for this specific node. Each template describes what needs to be done for the node, and potentially what needs to be outputed in the final C code.

---

# Journal du 27 Juillet 2021

Aujourd'hui nous avons discuté avec Nicolas des différentes modifications que j'avais apporté aux templates du compilateur pour la génération de code ainsi qu'au Makefile que j'ai créé. Voici les tâches supplémentaires que je pourrai faire si j'ai le temps :
 - Enregistré le nom du module au moment du lancement du compilateur via un système d'argument en ocaml au lieu de gérer ça dans le Makefile.
 - Changer de méthode pour l'abstraction de la compléxité du langage noyau. Actuellement une précompilation CPP nous permet de faire des remplacements dans la politique écrite par l'utilisateur pour avoir du code C compatible avec le module sortant. Cette précompilation est possible car un template intègre au début de chaque fichier des `#define`. Mais cette méthode n'est pas la bonne car faire un appel CPP n'est pas nécessaire, on peut très bien gérer cette abstraction dans les templates concernés, et ainsi se débarasser de la dépendance non-nécessaire.

Nous avons aussi discuté du rapport (qui est à rendre le 16 août) et du papier (qui est a rendre le 6 août). La priorité passe donc sur le papier, qui m'aidera biensur à rédiger le rapport (*tout benef'*).

J'ai donc commencé à rédiger le papier tout en corrigeant certaines incohérence dans le code (il y a toujours du code à remanier, souvent dans la structure avec les scripts et les makefile, si on en veut, on en a ^^).

---

# Journal du 26 Juillet 2021

Le plan du rapport à été fixé, je l'ai envoyé pour validation à Nicolas et Vincent.

J'ai terminé l'implémentation de PhaistOS en tant que Module concernant la génération de code de code C à partir de templates, c'est ce qui m'a prit le plus de temps dans la journée (voir les commits sur gitlab). Enfaite la génération de code à partir de template était assez restreinte et la compilation de code Ocaml ne passait pas à cause d'une erreur non-verbeuse. J'ai donc perdu beaucoup de temps à trouver l'origine de l'erreur dans le compilateur, la corriger, et faire passer la compile des modules générés dans la VM. J'ai pu réécrire le `Makefile` ainsi que le `Readme` du dossier *Parser* du DSL dans l'enchainement.

J'ai un peu regardé les script d'Himadri concernant Phoronix, ainsi que le paper PhaistOS que Nicolas a préparé. Je mis pencherai plus demain. La priorité restant sur les benchmarks et le rapport.

---

# Journal de la semaine du 19 Juillet 2021

Le script d'installation de la VM Qemu fonctionne a merveille, et j'ai même réussi à installer PhaistOS en tant que module Linux (venant donc s'ajouter aux ordonnanceurs d'entrée/sortie du système). L'intégration de PhaistOS dans le noyau ne requiert donc aucune modifications du noyau Linux : *mission accomplished*. 

J'ai eu pas mal de pépins avec Qemu, notamment la mémoire RAM de la VM qui était fixée à 100Mo par défaut. Avant que je me rende compte du problème j'avais le `oom_killer` qui était appelé lors des installations dans la VM (je ne savais pas que OOM voulait dire Out Of Memory, pour moi OOm c'est *Out Of Mana*, déformation de joueur quotidien de MMORPG ^^). Ducoup après m'en être rendu compte j'ai regardé la RAM disponible sur les machines Grid5000 : `129Go`, j'avais donc de la marge, j'ai démarré avec 4Go de RAM au lieu de 100Mo.

J'ai aussi rencontré d'autres difficultés qui m'ont ralenties : Erreurs de compilations / Incompatibilité du code avec la version du noyau Linux utilisé / Script d'installation contenant des erreurs à l'install / Grid'5000 refusant de généré une image / etc.

Après avoir réussi à implémenter le code généré PhaistOS dans le noyau en tant que module j'ai discuté avec Nicolas de la génération du code. J'ai donc modifié les templates du parser qui s'occupait de la génération de code C pour avoir une génération uniforme en un seul appel qui génère directement le code C du module dans `Output-Modules`.

En début de semaine nous avons aussi discuté du rapport et parlé de la soutenance de stage. Le plan du rapport est encore en phase de dévellopement, je pense le finir vendredi ou dans le weekend. Je commencerai le rapport la semaine prochaine.

---

# Journal du 15 Juillet 2021

Les accès au débot Git qui contient les benchmarks sont OK. Je remercie Himadri pour son aide. Je regarderai les scripts plus tard.

Aujourd'hui j'ai pu lancer la première compilation de modules dans la VM grace à l'aide de Nicolas. J'avais des soucis avec Qemu et le système émulé, il m'a aidé à les régler. Le but est de maintenant automatisé toutes les modifications que nous avons faîtes via des scripts pour que le prochain venu puisse avoir sa propre image qemu fonctionnelle dès son arrivée. J'ai commencé ça en fin de soirée, je finirai demain, si jamais je bloque j'irai retourner voir Nicolas en début d'après-midi.

la compilation du module n'avait pas fonctionnée, j'espère que ce n'est rien de grave, je verrai plus en détails par la suite si j'ai le temps demain, j'aimerai ne pas y passer trop de temps si possible.

---

# Journal du 13 Juillet 2021

Aujourd'hui j'ai commencé à rediger le module Kernel PhaistOS ainsi que son Makefile, c'est en cours de développement ...

Après-demain (14 Juillet férié) j'effectuerai mes premiers tests sur l'image Grid5000 que j'entretiens.

J'ai aussi contacté une des membres du projet Ipanema pour lui demander si je pouvais avoir accès à ses scripts de benchmarks Phoronix pour la suite du mois de Juillet.

---

# Journal du 12 Juillet 2021

Discussion avec Nicolas quand à l'implémentation de PhaistOS sous forme de module & discussion du plan du rapport.

Aujourd'hui nous avons discuter de l'implémentation que devait avoir PhaistOS dans Linux, car j'ai découvert que certains scheduler, comme Kyber, sont en faite des modules, qui peuvent être chargé à la demande, à chaud dans le système, ça éviterait de recompiler tout le noyau, et ça rendrait la chose beaucoup plus maléable (une compilation PhaistOS puis une compilation Kernel, et on se retrouve avec une nouvelle politique d'E/S dans le système). Je vais devoir réécrire la partie du code C pour qu'elle puisse être contenu dans un seul fichier que le Kernel puisse le compiler et le charger. Pour cela je vais aussi devoir écrire un Makefile adapté et surement réécrire le code du dossier `Parser/` de PhaistOS pour qu'il puisse générer le bon code par la suite.

Nous avons aussi beaucoup discuter du stage et du contenu du rapport, le plan ressemble à quelque chose de concret, il faudra juste se concentrer sur la première partie et faire attention à rester clair, précis, et ne pas hésiter à bien expliquer les concepts, pour ne pas avoir à le refaire dans la suite du rapport. Je posterai sur le GitHub mon plan dans la semaine.

---

# Journal du 9 Juillet 2021

Hier j'ai pu discuter avec Nicolas des différentes tâches restantes à réaliser, en voici la liste :

 - Faire un plan du rapport.
 - Revoir l'install de PhaistOS côté Kernel (voir si possible sous forme de module).
 - Finir les benchmarks rapidement (finir le point précédent d'abord).
 - Participer à la publication scientifique de PhaistOS.
 - __Bonus :__ Changer la structure d'implémentation de PhaistOS, le fait que le côté utilisateur final passe par des scripts plutôt qu'un programme en OCaml n'est pas idéal.

J'ai donc aujourd'hui produit une ébauche de plan, installer les outils de benchmark phoronix (conseillé par l'équipe Ipanema) et FIO (utilisé par Nick) pour les benchmarks futurs, maintenant je dois (en attendant les retours de Nicolas sur le plan) revoir l'installation de PhaistOS dans le kernel, en essayant de le faire à travers les modules. (peut etre créer un module par politique).

---

# Journal du 8 Juillet 2021

Deuxième armistice avec qemu, j'avais un problème de corruption du système de fichiers dans la VM, il s'avèrait que je n'avais pas partitionné l'image (en même temps je pensais que le script de base était correct, mais pas du tout). Ducoup voici le script final :
```shell
IMG=qemu-image.img
DIR=mount-point.dir
qemu-img create $IMG 5g
losetup -fP $IMG
MNT=`losetup -a | grep $IMG | tail -n 1 | cut -d ":" -f 1`
parted $MNT -s mklabel msdos mkpart primary ext4 1MiB 100%
sleep 1
mkfs.ext4 $MNT\p1
mkdir $DIR
sudo mount -t ext4 $MNT\p1 $DIR
sudo debootstrap --arch amd64 buster $DIR 
chroot $DIR /bin/bash
```
Ce script permet de créer un fichier représentant un disque dur de 5Go, de le considérer tel quel avec `losetup`, je récupère le nom du fichier *loop* et je le partitionne avec la table de système de fichier *msdos*, comprenant 1 partition seulement, en **ext4**. Je monte ensuite la partition dans un dossier et j'installe debian 10 (version buster) dessus.

Merci à Nicolas pour m'avoir bien aidé à comprendre.

Je vais enfin pouvoir commencer mes benchmarks demain.

---

# Journal du 5 Juillet 2021

> En ce Lundi 5 Juillet, l'armistice avec qemu a été signée.

La VM démarre à travers le terminal (plus de restriction graphique), les installations se font très bien dans la VM (problème de réseaux fixés (c'est ce qui m'avait pris le plus de temps à fixer à cause de la VM qui fonctionnait mal sur les communications réseaux avec l'hôte)). J'ai même pu gérer les droits utilisateurs comme il le fallait pour qu'*erods* puissent avoir accès à la commande `loadkeys`.

La prochaine étape de demain est de finir les installations des utilitaires de benchmarks (il manque `parsec` de mémoire).

---

# Journal du 2 Juillet 2021

Aujourd'hui et les deux derniers jours je me suis penché sur l'installation et la mise en route d'une VM debian version 10 comme base pour les benchmarks de PhaistOS.

J'ai rencontrés des difficultés lors de l'installation, certaines dont je suis arrivé à bout, d'autre pas. Voici un récapitulatif :

| Ce qui fonctionne | Ce qui ne fonctionne pas |
| ----------------- | ------------------------ |
| - La VM se lance sous debian 10 avec le kernel modifié | - accès internet dans la VM ne passe pas (installation dans la virtualization impossible pour l'instant) |
| - L'utilisateur `erods` a été ajouté aux utilisateurs sudoers du système | - utilisateur erods n'a pas autant de droit que root, bizarre ... (erreur lors du `loadkeys fr` sur les droits) |
| - Le clavier virtuel peut être passé en *azerty* | - dû au bug internet il me manque les utilitaires de benchmarks suivants : sysbench et parsec... |
| - Certains utilitaires sont installés (nas, fio) |  |
| - L'image de sauvegarde fonctionne, sous ext4, avec 5Go d'espace "disque" |  |

Je dois donc continuer à travailler sur les dernières erreurs et ensuite je pourrai passer à la prochaine étape.

La prochaine étape consiste à ce que les modules phaistos soit compilés localement au code de phaistos et copiés directement dans le kernel grâce à un Makefile (discuter de ça avec Nicolas pour mieux comprendre l'idée, c'est pas encore très clair).

---

# Journal du 29 Juin 2021

Aujourd'hui j'ai fais des recherches sur Qemu et j'ai cherché à comprendre ce que faisait les scripts d'installation qu'avait laissé Nick. Avec Nicolas on est en venu à la conclusion que l'image d'1Go actuel n'est pas suffisant si on veut faire des mises à jours sur la Debian.

Ici en l'occurence la Debian était la version 8 (Jessie) installée avec le système de fichier ext2 ne nous convient pas forcément (trop vieille comme configuration système), peut être que Nick a fait c'est choix intentionellement, je regarderai.

Nicolas m'a expliqué bcp de choses sur Qemu.

Demain je génèrerai ma propre image Qemu, et j'essairai de reprendre le mode d'installation des modules d'Ipanema pour PhaistOS (modules à part, en local et liés par qemu dans le noyau chargé) => voir le Makefile d'Ipanema.

---

# Journal de la semaine du 28 Juin 2021

Après quelques étapes de débuggage j'ai arrêté la pour me concentrer sur les tests de performances de PhaistOS.

J'ai commencé à me familiariser avec l'environement Grid'5000 et l'image de la VM laissé par Nick. J'ai pu donc lancer PhaistOS avec cette image et lancé les deux trois scripts qu'il avait laissé pour voir de quoi il en retournait. il s'avère que Qemu (faisant tourner l'image) n'est pas très ergonomique (clavier anglais avec pavé numérique désynchronisé, et très petit terminal sans barre de défilement), mais j'imagine que c'est réglable, je regarderai. 

Concernant Grid'5000, la mise en place des images et des tests est plutôt simple, rien de compliqué une fois qu'on sait comment faire.

Voici la liste des logiciels de benchmarks que j'ai testé jusqu'à présent :
 - `sysbench` : un logiciel de benchmark multi-threadé pour les bases de données (test les entrées sorties sur fichier, dans une base de donnée, et même le CPU)
 - `FIO` : logiciel de benchmark créé par Linux pour tester les performances d'entrées sorties en fonction de l'ordonnanceur actif (c'est celui que Nick a repéré et qui va surement beaucoup m'aidé au début).
 - `nas` : *à découvrir*
 - `parsec` : *à découvrir*

---

# Journal de la semaine du 21 Juin 2021

J'ai réussi à fixer le bug qui résidait dans la grammaire. Les tests ne passaient pas car l'appel à l'addition suivante provoquait une erreur de typage :
```
NOW() + POLICY.fifo_expire[data_dir]
```
Enfaite après investigation, j'ai compris que le parser avait fait l'arbre de parse suivant :
```
                              ._____indexOp_.____________._____________.
                             /               \            \             \
                .__________member______.   LEFT_BRACK([)  id(data_dir)  RIGHT_BRACK(])
               /              |         \
    .______artihmeticOp____.  DOT(.)    id(fifo_expire)
   /                |       \
funcCall(NOW())   PLUS(+)  id(POLICY)
```
L'erreur portait donc sur la construction de l'arbre car une addition n'est pas une structure (et donc ne possède pas de membre).

Pour régler ce problème et obtenir l'arbre suivant, j'ai simplement fait passer la priorité de la règle `DOT` (celle du membre), **accompagnée de celle des crochets** en dessous de celles des opérations :
```
            .__artihmeticOp__.
           /          |       \
   funcCall(NOW())  PLUS(+) ._indexOp_______._____________.
                           /    |            \             \
                .____member_.  LEFT_BRACK([)  id(data_dir) RIGHT_BRACK(])
               /       |     \
         id(POLICY)   DOT(.)  id(fifo_expire)
```
Ainsi les opérations arithmétiques attendent l'évaluation des structures et des index avant de s'évaluer.

La difficulté ici résidait dans la detection et la compréhension du problème... Mon cerveau partait en vrille à cause de **la chaleur** et j'ai pris trop de temps pour régler une chose si "simple" de compléxité.

---

# Journal de la semaine du 18 Juin 2021

Cette semaine j'ai essayé de débuggué le code un maximum mais mes changements ont du créer un bug. J'ai repéré ce bug, mais je ne comprends pas pourquoi il intervient. Voici la situation actuelle :

 - Il fait chaud.
 - Les modifications dans la grammaires "produisent" un bug qui fait que l'assertion des types de l'addition `NOW() + POLICY.fifo_expire[data_dir]` se plante et renvoit une exception sur les types des opérateurs de gauche et droite (alors qu'ils sont tout les deux des entiers).
 - Je me suis dis que le language définit par la grammaire n'arrive pas à bien interprété l'enchainement de l'appel du membre `fifo_expire` puis de l'appel à l'index `[data_dir]` de ce membre.
 - Ce qui est étrange c'est que quand on enlève les règles de priorité dans la grammaire (et donc que les problèmes shift/reduce réapparaissent), le bug n'apparait plus. J'ai donc revisté mes changements mais je n'arrive pas à trouver là où ça pourrait être incohérent...
 - J'ai essayé d'utilisé **ocamldebug** mais ce debuggueur est juste horrible à utiliser. Il n'est même pas capable d'afficher le contenu d'un objet sans printer personnalisé... Je l'ai donc laissé de côté.
 - La comparaison de type (`typeAssert`) se fait avec l'opérateur `<>` qui signifie la différence structurel.
 - Le membre de gauche `NOW()` semble bien être parsé comme étant de type `int_std` cependant `POLICY.fifo_expire[data_dir]` ne semble pas l'être, où du moins sa structure doit différée... Même si de ce que j'en ai vu ce n'était pas le cas (c'est pour ça que je suis allé sur debuggeur).

 - J'ai aussi supprimé le statement "*use*" du DSL qui n'était utilisé nul part.
 - J'ai aussi supprimé la variable "`sfx`" de la génération des templates car la variable n'était utilisait qu'à un seul endroit dans chaque dossier (`forEach_at`), et sans nécessité car les appels à `forEach_at` se fait dans les *embedEvalTemplate* de la forme `[$ forEach ... $]`, qui méttaient toujours `sfx` à *false*.

 La semaine prochaine je regarderai comment commencer les benchmark et j'essairai de finir le debugging sur ma branche non-stable.

---

# Journal du 11 Juin 2021

Aujourd'hui la grammaire a été fixée, elle est désormais fonctionnelle (plus de conflits de type shift/reduce) ! J'ai continué de regardé si d'autres incohérences existaient et nous nous sommes rendu compte avec Nicolas que la syntax et la grammaire comportaient des éléments inutilisés à l'heure actuel, comme le `use` du DSL qui n'apparait dans aucun des exemples fournis.

Plus tard il faudra donc que je comprenne (peut être en demandant à Nick) pourquoi ce token existe, quel est/était son utilité (car d'après les commits c'est quelque chose qui est présent depuis le début), voir si on peut le retirer du langage. Puis voir si il n'y a pas d'autre token dans le même cas (peu probable d'apès Nicolas).

Deplus, le rôle de la variable `sfx` reste partiellement flou, même si j'approche de plus en plus de quelque chose de concret... Il faudra que je continue de regarder.

Nous avons aussi parler de l'aspect benchmarking du stage avec Nicolas, il faudra bien prévoir 1 mois de benchmark (durant juillet), précédé d'une semaine de mise en place des outils. Donc au final j'ai encore 1 semaine pour me pré-occupé du code avant de passer aux tests. L'idée étant de detecter à l'avance en attendant la prochaine étape les potentielles erreurs de programmation qui pourrait empecher un bon déroulement des benchmarks. 

L'idéal aurait été de s'assurer de la robustesse du code avant d'effectuer les tests de benchmark, mais le temps fait que c'est compliqué. 

---

# Journal du 10 Juin 2021

La chasse au debug touche bientôt à sa fin, mais je bloque sur conflit de type shift/reduce plutôt coriace.

__Explications :__

Conflit sur les expressions avec le crochet ouvrant, deux exemples de cas de conflits :
```
NOT expr [ expr ]
expr AND expr [ expr ]
```
__Pourquoi ?__

En faite la grammaire est ambiguë (surement au niveau d'`indexOp`) car une expression peut être composée d'expressions ... Du coup il ne sait pas à quelle expression s'applique les crochets (voir le fameux problème du "*dangling else*") ...

Une idée serait de réécrire la grammaire pour lui dire que les crochets sont toujours attachés à la dernière variable lue ... Mais même cela est faux car les phrases suivantes peuvent être correctes en C par exemple :
```
var.get_tab()[0]
var.member[0]
(var.member)[0]
var[0]
```
Cependant notre grammaire n'admet pas des choses simples comme `(var.member)[0]`, mais sait admettre `!var[0]` ... **Sic itur ad astra**.

Je verrai toutes ces choses avec Nicolas demain.

---

# Journal du 08 & 09 Juin 2021

Hier et aujourd'hui j'ai accentué mon effort sur la restructuration du code Ocaml du dossier `Static-Anlysis` en utilisant les *recursive modules*. Ce qui m'a permit d'utiliser le fichier qui posait problème une et une seule fois à travers un module. Après avoir restructuré le code, je suis parti à la chasse aux erreurs, et j'ai réussi à toute les éliminées. Cela ne signifie pas pour autant que le code est correct, car j'ai du corrigé des erreurs de sémantique dans le code, autrement dit le code écrit ne pouvait pas bien fonctionné en l'état actuel avant mon passage (certaines lignes ne pouvaient jamais être exécutées).

Cependant, menhir (bibliothèque utilisée pour la grammaire du langage du parser) m'indique qu'il existe des conflits de type [shift/reduce](https://www.gnu.org/software/bison/manual/html_node/Shift_002fReduce.html) dans la grammaire. 

J'ai bien peur que ces conflits de grammaire associés au code non-réellement testé pose problème par la suite dans PhaistOS. Même si ici il ne s'agit que d'un dossier d'analyse du code, cette grammaire est utilisée de manière générale comme étant celle du DLS. Donc régler les conflits dans cette dernière pourra sauver des potentiels problèmes par la suite.

La difficulté réside maintenant dans la résolution des erreurs de la grammaire, tout en s'assurant que le code associé reste valide pour des tests futurs (car oui le code phaistos parsé par la grammaire génère du code Ocaml).

---

# Journal du 02, 03, 04, 07 Juin 2021

 Les objectifs du jour précédent ont été modifiés par mon point de vue actuel concernant PhaistOS, car j'estimais qu'une sorte de mise à niveau du code était nécessaire. D'une part car beaucoup de warnings étaient générés à la compilation, d'autre part car le code de `visitorInternalDsl.ml` s'enchaine très vite et sans commentaire avec certaines fonctions de redéfinitions non-nécessaires qui "*cachent*" le réel code Ocaml présent dans les templates et nuit donc à la compréhension générale du fonctionnement du code. 
 
 Exemple d'une redéfiniton (ou *ghosting*) de fonction : 
 ```Ocaml
 (* -- snip -- *)
 let find f l = List.find_all f l 
 (* -- snip -- *)
 ``` 

J'ai développé un script disponible [ici](sed.sh) qui va voir dans les templates et enlève ce ghosting en modifiant les fichiers sur place.

## Ce qui n'a pas été fait

 - Le dossier des tests unitaires n'a pas été avancé, à cause de changement d'objectifs.
 - Pareillement, pas encore regardé l'aspect benchmarking de PhaistOS.

## Ce qui a été fait

### Analyse du code

Dans le code actuel d'`ast.ml`, la directive `#include visitorInternalDsl.ml` apparait à de nombreuse reprises, et permet au code d'utiliser le contenu du fichier à chaque fois que la directive est présente au début d'une méthode, sans cela, les fonctions comme `callEach` présentent dans `visitorInternalDsl.ml`, ne seraient pas disponibles pour les templates intégrés dans la classe `visitor` d'`ast.ml`. L'idée qui nous ait donc venu à l'esprit était de se débarasser de cette inclusion qui générait beaucoup d'erreurs (car les fonctions n'étaient pas toute utilisées à chaque `include`), de telle manière que toutes les fonctions se retrouvent dans une API externe que `ast.ml` puisse utiliser à son bon vouloir sans avoir à inclure le fichier plusieurs fois, et donc d'éviter toutes ces erreurs à la compilation.

Concernant le code à ameliorer, nous en sommes venu à conclure au bout d'un moment avec Nicolas que l'entièreté du code contient une dépendance cyclique assez prononcée, et difficile à faire disparaitre. En effet, dans le code actuel, les classes des noeuds de l'AST doivent connaitre la classe du visiteur, et le visiteur doit connaitre les différents types de noeuds. De plus, les fonctions présentes dans `visitorInternalDsl.ml` doivent connaitres les noeuds mais aussi le visiteur. On se retrouve donc dans ce schéma : 
```
fonctions <=> noeuds <=> visiteur <=> fonctions
```
La seule solution qui est donc possible d'exister pour se débarasser de cette dépendance cyclique s'appelle la récursivité, car ici il est impossible de faire sauter cette dépendance, principalement à cause de la fonction `import_at` d'`visitorInternalDsl.ml` :
```Ocaml
let import_at node named =
    Hashtbl.find (node#accept (self:>visitor)) named (* -- snip -- *)
```
Où `node` est un objet de classe `astNode` et `self` une instance de la classe `visitor`. Cette simple fonction utilise les deux classes, déjà entre elles récursivent...

### Difficultés rencontrées

Impossible de trouver une manière propre de changer ce qu'à fait Nick, OCaml ne me permet pas de faire ce que je veux pour l'instant ...

Explications : Ocaml refuse de faire une déclaration récursives d'expressions (de fonctions) puis de classes. 

 - J'ai donc essayé la déclaration de type de classe `type class v` avant la déclaration des classes en elle-même, pour que les fonctions puissent connaitre les classes même si elles n'existent pas encore. Mais lors des casts de type `self :> v`, Le compilateur refuse et me dit `Self type cannot escape its class`. Ce message d'erreur vient du fait que self peut être étendu dans des sous-classes, on ne peut donc pas fixer à l'avance son type (**Je ne savais pas, merci Ocaml de me le dire après des heures de bataille avec les erreurs de syntaxe du langage** 😩).
 - Du coup la seule option viable et qui me reste à essayer c'est la notion de modules récursifs, mais cela risque de changer tout le code, et pour la génération automatique de ce dernier ça peut être pénible de devoir revenir dessus. SI cette dernière solution ne porte pas ses fruits je ne sais pas trop quoi essayé d'autre, le langage ne propose pas grand chose pour se débarasser des dépendances cyclique de ce style.

## Pour la prochaine fois

Continuer et essayer les modules récursifs, si cela ne fonctionne pas je passerai à autre chose en essayant de cacher un maximum les warnings générés.

---

# Journal du 01 Juin 2021

## Ce qui n'a pas été fait

 - Créer un dossier de test pour les analyses

## Ce qui a été fait 

Aujourd'hui a surtout été le dernier jour concerant la compréhension générale du code. Une réécriture quasi-finale des readme a été faite et je vais donc pouvoir demander une validation de la part de Nicolas pour savoir s'il considère juste ce que j'ai écris.

La prochaine étape est de comprendre comment fonctionne les outils de benchmark pour tester les performances du système avec les politiques intégrées, ça me permettra de me replonger dans le fonctionnement du déploiment côté système. 

Il serait aussi bien de créer un dossier de tests pour voir si tout a bien été vérifié et qu'il n'y a pas de failles.

## Pour la prochaine fois

 - Créer un dossier de test.
 - Commencer à regarder pour les logiciels de benchmark.

---

# Journal du 31 Mai 2021

## Ce qui n'a pas été fait

RAS.

## Ce qui a été fait 

Dear Journal, aujourd'hui la compréhension du code arrive bientôt à sa fin. Voici ce qui a été fait

 - Approfondissement de la compréhension du dossier `Static-Analysis` :
   - Etude des fichiers et de **leur rôle**, j'ai eu quelque problèmes à comprendre la finalité voulue derrière le code (cela m'a prit beaucoup de temps). Mais avec l'aide de Nicolas j'ai pu saisir les principales intentions du code.
   - `visitorInternalDsl.ml` contient une liste de fonction qu'on peut aussi nommer API pour l'analyse exercer dans les templates. En effet l'analyse dites **statique** a lieu à froid, c'est à dire sans que le code s'exécute.
   - les templates comme `script.ml` utilisent donc l'API et procède à des vérifications grace à des "formules logiques" complexes qui permettent de vérifier des états plus poussés du code ... Au dela de la syntaxe, de la grammaire, et de la cohérence de type.
 - Réécriture de certains fichier README.md.

## Pour la prochaine fois

Assignations de nouvelles tâches :

 - Créer un dossier de test pour les analyses.
 - Finir de lire et écrire les readme.

---

# Journal du 28 Mai 2021

## Ce qui n'a pas été fait

RAS.

## Ce qui a été fait

 - Réponses aux questions de la veille :
   1. Une passe (aller-retour) est effectuée par appel à l'exécutable (pas de code indiquant le contraire dans parser.ml (un appel unique à `visitor#accept`)).
   2. Pré-processing + conventions font que le code généré est plus convenable à lire et permet d'avoir un code qui se rapproche de celui du kernel. Il est à noter que les conventions de code C pour le développement noyau sont disponibles [ici](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v5.13-rc3).
   3. Le nom de ces templates sont utilisés par PhaistOS pour différencier les passes dans l'AST exercées lors de la génération de code C. 
 - Nettoyage des fichiers générés, README.md et Makefile du dossier `Static-Analysis`.
    > Ce dossier à pour but d'exercer une analyse statique, c'est à dire à froid, avant que le code s'exécute, pour cela le visiteur parcours les noeuds du fichier .phaistos fourni et pour chaque noeud il fait des choses (pas encore très clair ... Je dois approfondir le code pour cela).

## Pour la prochaine fois

Continuer de comprendre comment fonctionne la partie du code du dossier `Static-Analysis`.

---

# Journal du 27 Mai 2021

## Ce qui n'a pas été fait

RAS.

## Ce qui a été fait

 - Concernant le dossier `Parser` qui s'occupe de la génération de code C à partir des fichiers `.phaistos` :
   - J'ai pu comprendre grace au script de génération que la commande `cpp -P` effectuait une étape de compilation pré-processeur qui permet au code généré de se modifier en fonction de certaines règles d'en-tête (`#define`). Ce point n'est donc pas crutial mais permet de savoir que phaistos va potentiellement fournir au Kernel des fichiers sources pré-compilés (à voir : *pourquoi ? Qu'est-ce que ça apporte de la faire maintenant et pas plus tard ? Peut être que c'est une règle de base d'implémentation de code source dans le noyau.* Je poserai la question demain à Nicolas).
   - J'ai aussi compris le rôle qu'a le fichier `smap.csv` généré lors du parsing du fichier `.phaistos`. Il permet enfaite de lister les information de l'AST sur chaque noeud par rapport au fichier entrant (`deadline.phaistos` par exemple) en donnant les lignes correspondantes. Et de faire le lien avec le fichier de sortie en donnant les lignes correspondantes.
      > Par exemple la ligne suivante du fichier smap.csv : 
      >> 192,varDeclaration,18,18,topLevel,12,12
      
      > Indique un noeud de l'arbre d'ID 192 de type "déclaration de variable" de la ligne 18 à 18 dans le fichier "deadline.phaistos", c'est une déclaration de haut-niveau (celui du DSL), qui se retrouve de la ligne 12 à 12 dans le fichier C de sortie.
   - J'ai documenté un README.md et réalisé un Makefile comme pour le dossier `TypeSystem`.
 - J'ai modifié légèrement le README.md du dossier `TypeSystem`.

## Pour la prochaine fois

 - Poser les questions suivantes :
   - `TypeSystem` : combien de passes dans l'AST sont réellements effectuées ?
   - `Parser` : *la question en italique ci-dessus.*
   - `TypeSystem` & `Parser` : Quels sont le réel rôle des templates "default" et "topLevel" ?

---

# Journal du 26 Mai 2021

*Voici des photos des locaux que j'avais prises vendredi dernier :*

| Bureau | Cour intérieure |
| ------ | --------------- |
| ![](bureau_imag.jpg) | ![](cour_interieure.jpg) |


## Ce qui n'a pas été fait

RAS.

## Ce qui a été fait

Aujourd'hui j'ai attaqué la partie du code qui effectue la génération de code C. Je me suis rendu compte que la même technique est utilisé un petit peu de partout mais le code du Visiteur était modifié pour pouvoir correspondre à une certaine finalité. 

Ici dans le dossier `Parser` on retrouve une structure de code similaire au dossier de la veille (càd `TypeSystem`), à l'exception que le visiteur traduit le code des fichier `.phaistos` en code source `.c` au lieu d'exercer une vérification.

J'ai commencé à écrire le README.md et un Makefile que je finirai demain.

Cependant des points restes à éclaircir sur certains aspects du code, surtout le fait que le code ainsi présent génère un fichier `.csv` dont je ne comprend pas l'intêret (on dirait une sorte de fiche qui liste des repères dans le code)... 

Il y a aussi la commande de compilation pré-processeur `cpp -P` qui faut que je creuse.

## Pour la prochaine fois

Continuer dans la lancée.

---

# Journal du 25 Mai 2021

## Ce qui n'a pas été fait

RAS.

## Ce qui a été fait

 - Ecriture du README des dossier `TypeSystem` et `Input-Scripts` du code source.
 - Concernant `TypeSystem`, j'ai fais du ménage dans le dossier (quelques fichiers et dossiers générables qui étaient présents) et créer un **Makefile** pour générer, compiler le code source, et tout ces genres de choses ! Le README.md résume bien tout ce qu'il est possible de faire dans ce dossier.
   > L'étape la plus dure concernant TypeSystem était de comprendre son rôle, voici une decription que j'ai pu fournir du code s'y trouvant (extrait du README.md) :
   >> " The goal here is to check wether the types used in the user policy are coherent or not. By going trought the AST in two passes (once going down and once going back up to check if types encountered are correct). "
   - J'y ai surtout retrouvé des fichiers ressemblant aux dossiers ATV et ASH (voir 11 Mai).
   - La particularité de TypeSystem est qu'il utilise le code du dossier ATV, ce qui le rend plutôt intéressant et complexe.

Je n'ai pas le temps de finir le journal pour aujourd'hui mais mes commits du 25 Mai sont représentatifs du travail effectué.

## Pour la prochaine fois

 - Continuer l'exploration/compréhension/documentation des dossiers restants.

---

# Journal du 20 & 21 Mai 2021

## Ce qui n'a pas été fait

 - Les clusters grenoblois n'étaient pas disponible aujourd'hui, j'ai donc continué à lire le code source de développement de Nick pour approfondir ma compréhesion du sujet.

## Ce qui a été fait

 - Ecriture de plusieurs README.md pour certains dossier de code source dont j'ai compris le rôle. 
   > Malheureusement, un fichier récurrent (qui revient dans plusieurs dossiers) me pose problème car je ne comprends pas son rôle : **io_externs.phaistos**. C'est un fichier qui est sensé être écrit dans le langage du DSL PhaistOS mais qui ne reprend pas les règles précédemment citées dans le papier écrit par Nicolas et Nick...
   >> Après quelques questions j'ai compris que ce fichier était automatiquement concaténé au début du fichier édité par "l'utilisateur" pour exprimer l'existance de fonctions présentes dans le kernel ou même de variables, ainsi que les contraintes attendues dans le contenu du fichier de l'utilisateur.
 - Visitie des locaux de l'IMAG avec Nicolas et Guillaume (visite incluant celle du DATA Center, très intéressant.)
 - Aide rapide pour Guillaume sur son problème d'utilisation avec Kameleon, un outil de recette pour créer des images système sur Grid'5000.
 - Compréhension du dossier TypeSystem, je ferai sa documentation dans son README.md Mardi.

## Pour la prochaine fois

 - Documentation du principe de fonctionement du dossier de développement TypeSystem.

---

# Journal du 19 Mai 2021

## Ce qui n'a pas été fait

 - Pas d'avancement sur le code source aujourd'hui.

## Ce qui a été fait

 - Appel avec Nicolas le matin pour débloquer nos problèmes avec Guillaume concernant l'installation du noyau :
   - Aide avec le fichier de config d'installation du noyau modifié.
   - Explication de certaines commandes et de l'interaction distante avec les machines en phase de redémarrage.
   - Prise de note de manière générale de comment configurer l'environement à lancer via Grid'5000...
 - Création d'une image PhaistOS à partir d'un système debian dans lequel on a remplacé le noyau du système avec la version modifiée.
 - Plusieurs manipulations des fichiers grub pour y trouver/modifier des informations.
 - Nous avons pu négocier un jour en **présentiel** au labo les vendredi dorénavant 😎. 

## Pour la prochaine fois

 - Retourner sur le code. Maintenant qu'on a l'image du système dans son coin : on peut retourner sur la compréhension et la documentation générale du code.

---

# Journal du 18 Mai 2021

"*Ma motivation n'a jamais été aussi grande !*" - Palpatine, *Star Wars*.
> ce qui n'est pas mon cas malheureusement : le travail en distanciel est vraiment compliqué et j'éprouve de réelles difficultés à me concentrer.

## Ce qui n'a pas été fait

 - Documentation des README.md des dossiers sources

## Ce qui a été fait

 - Montage d'une image debian dans laquelle j'ai cloné le noyau linux modifié de PhaistOS.
   - Après make et compilation du noyau j'ai remarqué que les images comportées le term `-dirty` à la fin de chacune d'elle. *Pourquoi ?*
   - Je n'ai pas réussi à reboot sur l'image après la commande `grub-reboot '1>0'` (écran noir). A voir pourquoi ce comportement...
   > Ducoup je n'ai pas pu sauvegarder l'image et donc les données modifiées sur l'image en cours d'utilisation, j'essairai de résoudre le problème demain.
 - J'ai envoyé un mail à la secrétaire Mme.Poulet pour essayer de négocier un jour de présentiel à l'IMAG. Et c'est **possible** désormais. Je négocierai donc avec M. Palix un jour entre Lundi ou Vendredi.

## Pour la prochaine fois

 - Documentation du code source.
 - Montage et sauvegarde d'une image PhaistOS.

---

# Journal du 17 Mai 2021

*Il est à noter que j'avais la réunion de perfectionnement de Polytech aujourd'hui à 14h, donc ma journée à été coupée en deux.*

## Ce qui n'a pas été fait

RAS.

## Ce qui a été fait

 - Premier commit sur la branche `victor` du dépôt GitLab *PhaistOS* concernant le dossier de développement ASH : finalisation du README et de la compréhension du rôle de chacun des fichier.
 - J'ai commencé à lire et comprendre le rôle des fichiers du dossier `Abstract-Template-Visitor`, je rédiregrai un README.md plus tard.
 - J'ai déployé avec Guillaume ma première image sur Grid'5000, puis j'ai fais des modifications et je l'ai sauvegardé. Prochaine étape : *déployer phaistOS*.

## Pour la prochaine fois

 - Déployer une image PhaistOS sur Grid'5000
 - Continur de rédiger les README.md des dossiers de développement

---

# Journal du 14 Mai 2021

🌉 *Pont* 🌁

---

# Journal du 13 Mai 2021

🛐 *Ascension* ⛪

---

# Journal du 12 Mai 2021

## Ce qui n'a pas été fait

 - Pas de Makefile car pas nécessaire pour Abstract-Syntax-Hierarchy (*à revoir*).
 - Pas encore push les modifications sur le repo distant, j'attend plus de clarification sur certaines choses.

## Ce qui a été fait

 - Lecture et assimilation du code OCaml dans le dossier Abstract-Syntax-Hierarchy : compréhension du rôle de chaque fichier source, y compris `queryableAst.ml` qui a pour rôle de généré du code Ocaml depuis des templates et l'AST parsé.
 - Rédaction du README.md sur la nouvelle branche `victor` (*pas encore de commit tant que le travail d'un dossier n'est pas terminé*) pour un début de documentation du dossier associé.
 - Supression de certains fichiers doublons et d'autres fichiers générés.
 - Lecture de différents commits de Nick à l'époque où le dépôt PhaistOS-DSL n'était qu'à ses débuts (ça m'a aidé à comprendre certaines parties du code).

## Pour la prochaine fois

 - Faire le README.md d'un maximum de dossier et effacer les fichiers générés en proposant un Makefile si nécessaire.

---

# Journal du 11 Mai 2021

## Ce qui n'a pas été fait

 - Création des fichiers Makefile et README.md.
 - Je n'ai pas encore bien compris quel est l'intêret d'avoir un système d'AST intérogeable (queryable) ... Je pense que c'est le même principe que celui du visiteur (visitor) , mais rien n'est sûr.

## Ce qui a été fait

 - Bilan récapitulatif de la compréhension des rôles de certains fichier du dossier `Abstract-SYntax-Hierarchy` (**ces informations iront très problablement dans le README.md**) :
   - `*.ast` : des fichiers qui décrivent la stucture d'un AST.
   - `qAstGrammar.mly` : décrit la grammaire des AST.
   - `qAstLexer.ml` : décrit les différents mots/lettres qu'on peut rencontrer dans la grammaire.
   - `qAstParser.ml` : Point d'entrée qui utilise le lexer et le parser et qui va générer du code source OCaml
   - `queryableAst.ml` : J'ai l'impression que c'est le code du visiteur (ou du moins un code partiel).
   - `visitorInternalDsl.ml` : déinit une série de fonction ocaml que `queryableAst.ml` utilise dans un format (non-ocaml) que je ne connais pas... Je poserai des questions demain.
   - `dune` : Makefile "à la" Ocaml utilisé pour build l'exécutable `qAstParser.exe`.
   - `dune-project` : liste les dépendances de dune.
   - `merlin-init.sh` : met en place **merlin** pour le dossier en cours pour pouvoir travailler sur le code source ocaml avec les IDE **emacs** ou **vim**.
   - *reste* : fichers générés par **dune** ou **qAstParser.exe**.

## Pour la prochaine fois

 - Création des fichiers Makefile et README.md.
 - Comprendre pourquoi queryableAst est différent d'un visiteur **+** comprendre la partie du code de `queryableAst.ml` qui n'est pas en OCaml pour connaître sa finalité.

---

# Journal du 10 Mai 2021

## Ce qui n'a pas été fait

 - Montage d'une image sur Grid'5000 (**je reporte ce travail** à plus tard quand j'aurai bien compris comment fonctionne PhaistOS).

## Ce qui a été fait

 - Reformulation de certaines phrases dans le journal.
 - Clonage du dépôt git PhaistOS et installation des dépendances pour faire tourner le code OCaml.
 - Découverte de Dune, un système de construction pour les projets OCaml. En l'utilisant, je peut créer les exécutables, des bibliothèques, ou des tests...
 - Compréhension du principe de fonctionnement de Lexer et de Menhir pour la génération automatique de Parser en Ocaml.
 - Compréhension de l'utilité de chacun des fichiers du Code organisé OCaml :
    - `.ast` contient l'arbre d'AST du langage
    - `.mll` contient les règles léxicales avec quelques actions sémanqtiques associées. Permet de créer un analyseur léxicale avec ocamllex : lexer.ml
    - `.mly` contient les règles de grammaires avec certaines actions sémantique écrite en OCaml. Permet de créer un parser (et son interface) avec menhir : `parser.ml` & `parser.mli`.
    - `.ml` qui sera un point d'entrée, utilisant le lexer et le parser.
 - Début d'une étude du contenu de chaque sous-dossier du dossier PhaistOS-DSL. **Ma mission** sera d'aider n'importe quel nouveau venu à se repérer facilement dans chacun des sous-dossier. Pour cela, il faudra incorporer un Makefile qui permettra de générer les fichiers qui seront supprimés pour gagner en visibilité, ainsi qu'un README.md, pour décrire le rôle de chaque fichier.

## Pour la prochaine fois

 - Comprendre quel est le rôle de `queryableAst` dans Abstract-Syntax-Hierarchy (*peut être que c'est simplement un exemple qui ne sert pas dans PhaistOS*).
 - Continuer l'étude et l'épuration du dossier Abstract-Syntax-Hierarchy, une fois celui-ci terminé (que j'aurai compris le rôle de chaque fichier source), le reste ira surement plus vite.

---

# Journal du 7 Mai 2021

## Ce qui n'a pas été fait

Je n'ai pas pris le temps de tester le montage d'image d'un système sur un des serveurs.

## Ce qui a été fait

Dans l'ensemble cette journée n'a pas été très productive **sauf sur la fin**. Etant bloqué sur la compréhension du code je n'ai pas beaucoup avancé dans ma progression du stage aujourd'hui. A cela s'ajoute **le manque de motivation** et **de concentration** lié au distanciel.

 - Prise de repères dans l'arborescence de fichier du dépôt git de Nick grace à l'aide de Nicolas qui m'a expliqué comment intéragissent les différents fichiers entre eux (compréhension du code OCaml), tout en m'expliquant leur rôle dans le DSL.
 - Compréhension de différents concept sur le parsing et la génération de Code de PhaistOS, il y a plusieurs niveaux de hierarchie (plusieurs grammaires). Le mieux serait de faire un schéma récapitulatif pour s'y retrouvé facilement (il y a la notion de création de parser (lexer + menhir) et de générateur de code C avec des templates (Ocaml), **à approfondir car ce n'est pas encore très clair dans mon esprit**). 

## Pour la prochaine fois

 - Faire un schéma récapitulatif du fonctionement du code Ocaml de PhaistOS
 - Monter une image PhaistOS sur un des serveur du Cluster grenoblois.

---

# Journal du 6 Mai 2021

## Ce qu'il reste à faire

Comprendre la structure et le fonctionement du DSL (partie OCaml).

## Ce qui a été fait

 - Analyse des réponses de Nick à mes questions posées la veille :
    - mq-deadline a été choisit comme scheduler de base et réadapté pour PhaistOS pour plusieurs raisons qu'il cite dans son mail.
    - PhaistOS ne prend pas en charge la compilation de nouveaux modules à chaud. En effet Nick n'a pas encore implémenté cette fonctionnalité. En revanche Ipanema le fait, il faudra donc que je regarde comment Ipanema implémente cette fonctionnalité sans recompiler tout le kernel pour pouvoir peut être l'implémenté par la suite dans PhaistOS.
    - La différence entre la version **auto** et **manuelle** de PhaistOS réside dans le fait que la version auto est générée (*je n'ai pas trop compris comment elle est générée par contre...*) et que la version manuelle est écrite par Nick, pour Nick. Ça lui permet de vérifier/debugger la sortie générée avec celle attendue
 - Envoit d'un mail de réponse à Nick avec de nouvelles questions auxquelles Nicolas m'a répondu pour alléger la charge de Nick qui ne travail officielement plus sur le projet.
 - Etude du code du DSL. J'ai eu du mal à comprendre l'arborescence de fichiers du dépôt. Il y a plusieurs notions à l'intérieur qui font des choses de manière différentes mais dans la même finalité (si j'en crois le README.md de la racine). Une tâche difficile à laquelle je vais avoir besoin d'un coup de main.
 - Début de prise en main des connexions SSH et des réservations des clusters.

## Pour la prochaine fois

 - **Monter une image de PhaistOS** sur un cluster grenoblois via Grid'5000 pour jouer avec le DSL et voir comment il fonctionne de l'extérieur pour mieux appréhender le code.
 - Prendre ses repères avec le code OCaml et poser des questions à Nicolas pour se débloquer.

---

# Journal du 5 Mai 2021

## Ce qu'il reste à faire

RAS.

## Ce qui a été fait

 - Acquisition des identifiants Grid'5000.
 - Prise de note lors de l'étude du code noyau Linux modifié pour PhaistOS par une lecture des différents commits (revue de code sans commentaires) de Nick Papoulias sur GitLab :
    - Compréhension de base du fonctionnement de la mutli-queue deadline de Linux grace au code source [ici](https://elixir.bootlin.com/linux/v5.12.1/source/block/mq-deadline.c) et à la doc [là](https://www.kernel.org/doc/html/latest/kbuild/index.html) mais aussi à wikipedia pour différentes notions qui m'ont posé des problèmes de compréhension du code :
        - L'algorithme de l'ascenseur (elevator dans le code).
        - Red Black Tree, un arbre binaire de recherche équilibré (kbtree dans le code).
    - Le point précédent est important car PhaistOS reprend ce dernier pour fonctionner (si jamais un bug est trouvé il faudra surement revenir sur ce code).
    - Compréhension de l'intêret des modifications du fichier **Kconfig.iosched** du kernel : ces modifications permettent d'intégrer facilement PhaistOS dans le noyau de Linux pour pouvoir l'ajouter et l'utiliser en tant qu'ordonanceur d'E/S en quelques lignes. Ce qui vient confirmer cette idée de "*plug-in*" citée la veille. *C'est bien fait Linux*.
    - Il existe deux versions de l'ordonanceur MQ de PhaistOS, une **manuelle**, et une **automatique**. Cependant, je n'y vois aucune différence... Je trouverai des réponses demain.
 - Interactions sociales réelles avec mon père qui est passé voir mon boulot.

## Pour la prochaine fois

 - Faire les premiers pas avec Grid'5000 en initialisant une connexion SSH avec un des serveurs Dahu de Grenoble tout en essayant de monter une image PhaistOS pour faire appréhender le sujet.
 - Continuer l'étude de PhaistOS, je n'ai pas tout compris sur l'origine **du dynamisme** que PhaistOS peut offrir (c'est à dire que je ne vois pas comment **ce code** C que j'ai lu peut charger différentes politiques à la volé), il faudra que je pose des questions à Nick pour mieux comprendre.
 - Commencer à lire le contenu du dépot PhaistOS-DSL et entamer la compréhension du code OCaml de PhaistOS (Le parser, la grammaire, etc.).

---

# Journal du 4 Mai 2021

## Ce qu'il reste à faire

1. Finir la lecture et la compréhension du contenu des fichiers de documentation
2. Obtenir un accès à Grid5000.

## Ce qui a été fait

Rendez-vous en visio-conférence et séance de questions/réponses par rapport à la lecture de la veille :

 - Mise au point de la compréhension générale du fonctionement de *Ipanema* (Guillaume) et **PhaistOS** avec quelques détails d'explication.
 - Compléments d'explication sur la génération et la sauvegarde d'images systèmes mises à jour (outil de sauvegarde `tgz-g5k`).
 - Réponses sur le fonctionement de PhaistOS :
    - Concernant le type de disque utilisé (SSD/HDD) : peu importe on peut pratiquer avec les deux mais dans le cadre du stage ce seront uniquement des disques SSD. 
    - Pour les outils de tests (benchmarking), j'utiliserai les outils cités dans le *report*, avec par exemple `FIO benchmark`, `Compilebench`, `FS-Mark`, etc. Que j'importerai moi-même sur l'image pour effectuer mes tests.
    - Concernant l'implémentation de PhaistOS dans linux, elle reste un peu sombre car non-réalisée par Nicolas mais on aime à croire qu'il s'agit d'une implémentation simple qui demande juste à Linux d'utilise PhaistOS en tant qu'ordonanceur d'E/S via un lien dans le noyau ou autre chose qui s'en rapproche (un peu comme un plug-in ducoup). Cette réponse vient de la question "Comment avez-vous implémenté cet ordonanceur sans cassé Linux ?".
    
Concernant les preuves générées avec la logique linéaire (**Linear Logic**) : Monsieur Palix m'a fait comprendre que cet aspect là de PhaistOS ne faisait pas l'objet de mon stage et qu'il n'était pas nécessaire de m'attarder la dessus (même si cet aspect occupe la moitié du sujet de recherche). Cependant après quelques recherches j'ai pu appréhender les bases du sujet, même si j'ai encore du mal à faire le lien avec le système de preuve.

Deplus, nous avons eu droits à quelques explications concernant la génération de noyau sur Linux via grub avec différents exemples sur la machine personnelle de Nicolas. 

Lecture de la doc PhaistOS ainsi que le code des exemples des différents schedulers déjà existants (repérages de points communs).

## Pour la prochaine fois

- Obtenir l'accès Grid5000.
- Préparer des questions sur les aspects pas clair de la doc/du code si nécessaire.

---

# Journal du 3 Mai 2021

## Ce qu'il reste à faire

RAS.

## Ce qui a été fait

Rendez-vous en visio-conférence avec Guillaume V. et Nicolas P. pour explications et présentation des outils que je serai amené à utiliser.

Voici une liste des différentes notions abordées :

- Stage de manière générale (déroulement en distanciel, présentiel **refusé** pour l'instant).
- Outil Slack/Mattermost + BBB pour la communication audio.
- Présentation & Inscription à la plateforme Grid'5000, pour une utilisation SSH d'une machine d'un cluster Grenoblois.
    - Explications nécessaires pour la communication SSH.
    - Présentation des contraintes d'utilisation (horaires principalement).
    - Brèves explications sur le fonctionement au niveau physique des serveurs.
    - Démonstration du montage d'une image PhaistOS avec le script `deploy` de Nicolas.
- Présentation de la localisation des ordonanceurs une fois le système PhaistOS lancé, dans `/sys/block/sda/queue`, précisement dans le fichier `scheduler`.
- Présentation de la compilation **Ocaml** nécessaire pour créer un ordonanceur sur un projet similaire (*Ipanema*).
- Inscription au Gitlab INRIA et accès aux dépots Veriamos.
- Lecture de la doc concernant PhaistOS sur les dépots associés.

## Pour la prochaine fois

 - Poser des questions sur la doc lu aujourd'hui.
