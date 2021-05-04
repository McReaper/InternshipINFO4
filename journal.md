# Journal du 3 Mai 2021

## Ce qu'il reste à faire

N/A.

## Ce qui a été fait

Rendez-vous en visio-conférence avec Guillaume V. et Nicolas P. pour explication et présentation des outils que je serai amené à utiliser.

Voici une liste des différentes notions abordées :

- Stage de manière générale (déroulement en distanciel, présentiel **refusé** pour l'instant).
- Outil Slack/Mattermost + BBB pour la communication audio.
- Présentation & Inscription à la plateforme Grid5000, pour une utilisation SSH d'une machine d'un cluster Grenoblois.
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
2. Obtenir un accès à Grid5000 (toujours en attente).

## Ce qui a été fait

Rendez-vous en visio-conférence et séance de questions/réponses par rapport à la lecture de la veille :

 - Mise au point de la compréhension générale du fonctionement de *Ipanema* (Guillaume) et **PhaistOS** avec quelques détails d'explication.
 - Compléments d'explication sur la génération et la sauvegarde d'images systèmes mises à jour (outil de sauvegarde `tgz-g5k`).
 - Réponses sur le fonctionement de PhaistOS :
    - Concernant le type de disque utilisé (SSD/SATA) : peu importe on peut pratiquer avec les deux mais dans le cadre du stage ce seront uniquement des disques SSD. 
    - Pour les outils de tests (benchmarking), j'utiliserai les outils cités dans le *report*, avec par exemple `FIO benchmark`, `Compilebench`, `FS-Mark`, etc. Que j'importerai moi-même sur l'image pour effectuer mes tests.
    - Concernant l'implémentation de PhaistOS dans linux, elle reste un peu sombre car non-réalisée par Nicolas mais on aime à croire qu'il s'agit d'une implémentation simple qui demande juste à Linux d'utilise PhaistOS en tant qu'ordonanceur d'E/S via un lien dans le noyau ou autre chose qui s'en rapproche. (un peu comme un plug-in ducoup). C'est réponse vient de la question "Comment avez-vous implémenté cet ordonanceur sans cassé Linux ?".
    
Concernant les preuves générées avec la logique linéaire (**Linear Logic**) : Monsieur Palix m'a fait comprendre que cet aspect là de PhaistOS ne faisait pas l'objet de mon stage et qu'il n'était pas nécessaire de m'attarder la dessus (même si cet aspect occupe la moitié du sujet de recherche). Cependant après quelques recherches j'ai pu appréhender les bases du sujet, même si j'ai encore du mal à faire le lien avec le système de preuve.

Deplus, nous avons eu droits à quelques explications concernant la génération de noyau sur Linux via grub avec différents exemples sur la machine personnelle de Nicolas. 

Lecture de la doc PhaistOS ainsi que le code des exemples des différents schedulers déjà existants (repérages de points communs).

## Pour la prochaine fois

- Espérer obtenir l'accès Grid5000.
- Préparer des questions sur les aspects pas clair de la doc si nécessaire (On peut difficilement faire plus sans avoir accès à la partie technique).