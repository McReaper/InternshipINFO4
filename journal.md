# Journal du 3 Mai 2021

## Ce qu'il reste à faire

N/A.

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

# Journal du 5 Mai 2021

## Ce qu'il reste à faire

N/A.

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

# Journal du 7 Mai 2021

## Ce qui n'a pas été fait

N/A.

## Ce qui a été fait

 - Reformulation de certaines phrases dans le journal.
 - 

## Pour la prochaine fois

TODO

---