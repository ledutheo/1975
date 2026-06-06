# 1975 — Programmes en BASIC

> *Pour rendre fière la mère informaticienne des années 1975.*

Ce dépôt contient des programmes écrits dans le style et l'esprit du **BASIC** tel qu'il était pratiqué entre 1972 et 1978.

## Pourquoi ce dépôt ?

En 1975, le langage dominant pour l'enseignement, la recherche et les premiers ordinateurs personnels n'était **pas le C**.

Le C existait déjà (1972-1973 chez Bell Labs), mais il était encore confidentiel et réservé aux systèmes Unix naissants.

Pour la très grande majorité des informaticiens, des étudiants, des scientifiques et des passionnés de l'époque, le langage était **BASIC** :

- Dartmouth BASIC (1964, puis versions successives)
- Microsoft BASIC (Altair 8800 en 1975)
- HP BASIC, DEC BASIC, etc.

C'était le langage avec lequel on apprenait à programmer. C'était aussi celui avec lequel on écrivait de vrais programmes scientifiques, de gestion, et des jeux.

Ce dépôt est un hommage respectueux à cette époque.

## Les programmes

| Fichier                        | Type                    | Ambiance 1975                          |
|--------------------------------|-------------------------|----------------------------------------|
| `lunar-lander.bas`             | Jeu / Simulation        | Le grand classique des magazines et des universités |
| `star-trek.bas`                | Jeu (Space Combat)      | Super Star Trek - le jeu mythique des années 70 |
| `hammurabi.bas`                | Jeu de gestion          | Hammurabi - l'un des tout premiers jeux informatiques (1968-1975) |
| `banque-1975.cob`              | Traitement bancaire     | Programme COBOL typique des banques françaises dans les années 70 |
| `releve-mensuel.cob`           | Relevé de compte        | Édition mensuelle du releve client — batch COBOL des années 70    |
| `compound-interest.bas`        | Application bancaire    | Programme typique en entreprise et en école d'ingénieur |
| `amortissement.bas`            | Bancaire / Crédit (sérieux) | **Tableau d'amortissement complet** - l'outil des services prêts |
| `calendrier-1975.bas`          | Utilitaire / Bureau (stylé) | Calendrier perpétuel + jour de la semaine (Zeller) |
| `registre-1975.bas`            | Gestion personnelle (très sérieux) | Registre de compte / chéquier - le quotidien de tout le monde |

### Lunar Lander

Le *Lunar Lander* est probablement le programme BASIC le plus célèbre des années 1970. Des dizaines de variantes circulaient dans les magazines (*Byte*, *Creative Computing*, *People's Computer Company*), les universités et les clubs d'informatique.

C'est un excellent exemple de ce qu'on savait faire avec les moyens de l'époque : physique simplifiée, interaction en temps réel (ou tour par tour), et une vraie sensation de pilotage.

### Compound Interest

Ce type de programme était extrêmement courant dans les années 70 :
- Banques
- Compagnies d'assurance
- Écoles de commerce et d'ingénieur
- Calculs de prêts immobiliers

Le BASIC était l'outil de productivité de beaucoup d'analystes et d'ingénieurs avant l'arrivée massive des tableurs (VisiCalc arrivera seulement en 1979).

### Programme COBOL Bancaire (1975)

`banque-1975.cob` est écrit dans le style des programmes COBOL que les informaticiennes et informaticiens produisaient dans les banques françaises au milieu des années 1970.

À cette époque :
- La très grande majorité des applications bancaires critiques étaient écrites en **COBOL**.
- Les traitements se faisaient presque exclusivement en **batch** la nuit.
- On lisait des fichiers de mouvements (dépôts, retraits, virements), on mettait à jour les "fichiers des comptes" et on produisait des états sur papier (listings).

C'est exactement le genre de programme que ta mère a très probablement écrit ou maintenu.

#### Comment compiler et exécuter ce programme aujourd'hui

Sur Manjaro / Arch :

```bash
sudo pacman -S gnucobol
```

Puis :

```bash
cd ~/1975/programs

# Compiler
cobc -x banque-1975.cob -o banque-1975

# Exécuter
./banque-1975
```

Le programme va lire un petit fichier de mouvements exemple et générer un état des soldes (`ETAT-SOLDES.TXT`), exactement comme les vieux programmes bancaires le faisaient.

### Relevé mensuel de compte (releve-mensuel.cob)

Programme COBOL complémentaire : édition du **relevé mensuel** d'un compte client à partir du même fichier `MOUVEMENTS.TXT`.

```bash
cd ~/1975/programs
cobc -x releve-mensuel.cob -o releve-mensuel
./releve-mensuel
cat RELEVE-MENSUEL.TXT
```

C'est le document que la banque envoyait chaque mois par courrier — imprimé sur listing, plié, mis sous enveloppe.

### Hammurabi

**Hammurabi** (aussi appelé "The Sumer Game") est l'un des jeux informatiques les plus anciens et les plus influents de l'histoire.

- Créé à l'origine en **1968** par Doug Dyment en FOCAL.
- Très vite porté en BASIC et massivement diffusé dans les universités américaines entre 1970 et 1976.
- C'est un jeu de **gestion économique** : tu diriges la cité de Sumer, tu dois nourrir ton peuple, gérer les récoltes, les rats, les immigrations et les épidémies.

Beaucoup de personnes qui ont appris à programmer dans les années 70 ont commencé par taper ou modifier Hammurabi. C'est un vrai morceau d'histoire du jeu vidéo et de l'informatique personnelle.

## Comment exécuter ces programmes aujourd'hui ?

En 2026, plusieurs solutions existent :

### Option recommandée : Bywater BASIC (bwbasic)

```bash
# Arch / Manjaro
sudo pacman -S bwbasic

# Puis
bwbasic programs/lunar-lander.bas
```

### Autres interpréteurs

- `cbmbasic` (très fidèle aux Commodore)
- `gambas` (plus moderne mais peut exécuter du vieux code)
- Émulateurs (VICE pour Commodore, AppleWin, etc.)

## Philosophie de ce dépôt

- Code écrit avec des numéros de ligne (c'était obligatoire à l'époque)
- Utilisation intensive de `REM` pour documenter
- Variables en une ou deux lettres (limitation historique)
- Structure simple mais lisible pour quelqu'un de 1975
- Pas de "tricherie" avec des fonctionnalités modernes

## Pour la mère informaticienne

Si elle a programmé en 1975, elle reconnaîtra immédiatement le style.

Elle sourira probablement en voyant ces lignes :

```basic
10 REM ************************************************************
20 REM *  LUNAR LANDER SIMULATION - VERSION 1975
```

Parce que oui… c'est exactement comme ça qu'on écrivait à l'époque.

---

**Hommage aux pionnières et pionniers du BASIC.**

*1975 n'était pas le Moyen-Âge de l'informatique. C'était déjà un monde.*

---

## Le jeu : Super Star Trek (1975)

`star-trek.bas` est une implémentation dans l'esprit des versions les plus jouées entre 1973 et 1978.

C'est un jeu de stratégie spatial en mode texte où tu commandes l'**USS Enterprise**. Ton but : détruire tous les vaisseaux Klingons avant de manquer d'énergie ou de temps.

## Nouveaux programmes ajoutés (développement du dépôt)

### Amortissement (amortissement.bas)

Outil **très sérieux** des services crédits des banques des années 70.

Le programme demande le montant du prêt, le taux et la durée, calcule la mensualité, puis imprime le **tableau d'amortissement complet** :

- Numéro d'échéance
- Partie intérêts / partie capital
- Solde restant dû

C'était le document que le banquier sortait pour expliquer au client exactement combien il allait payer en intérêts sur 15 ou 20 ans. Imprimé sur listing, plié, remis en main propre.

### Calendrier Perpétuel (calendrier-1975.bas)

Programme **stylé et utile** que tout le monde voulait avoir.

- Calcul du jour de la semaine pour n'importe quelle date (algorithme de Zeller, très connu à l'époque)
- Impression d'un beau calendrier mensuel format listing (DIM LUN MAR ... SAM)

Les secrétaires, les services du personnel, les notaires et les mères de famille qui géraient les échéances l'utilisaient tous les jours.

### Registre de Compte (registre-1975.bas)

L'outil **le plus sérieux et le plus personnel**.

C'est l'équivalent numérique du "carnet de chèques" ou du "registre de banque" papier que tout le monde tenait à la main en 1975 :

- Saisie de mouvements (date + libellé + montant + ou -)
- Affichage du registre complet
- Solde instantané
- Relevé du mois (total entrées / sorties)
- "Nouveau registre" quand on change de carnet

C'est probablement le programme que ta mère aurait le plus utilisé au quotidien pour suivre les finances du foyer.



Commandes principales :
- 1 = Short Range Scan
- 2 = Long Range Scan
- 3 = Phaser
- 4 = Photon Torpedoes
- 5 = Warp (changer de quadrant)
- 6 = Dock at Starbase (réapprovisionnement)
- 7 = Status Report
- 8 = Quit

---

## Jouer sous émulateur sur Linux (recommandé)

Pour une expérience vraiment authentique, le mieux est d'utiliser un émulateur de machine de l'époque.

### Meilleure option facile : Commodore 64 + VICE (sur Linux)

Le Commodore 64 (1982) utilisait une version de BASIC très proche de celle des années 1975. C'est l'une des façons les plus agréables de faire tourner ces programmes aujourd'hui.

#### Installation sur Manjaro / Arch Linux

```bash
sudo pacman -S vice
```

#### Lancer le jeu (méthode simple et propre)

1. Installe VICE
2. Convertis le fichier BASIC en programme Commodore avec `petcat` (inclus avec VICE) :

```bash
cd ~/1975/programs

# Convertir Star Trek
petcat -w2 -o star-trek.prg -- star-trek.bas

# (Optionnel) convertir les autres jeux aussi
petcat -w2 -o lunar-lander.prg -- lunar-lander.bas
```

3. Lance l'émulateur :

```bash
x64 -autostart star-trek.prg
```

Ou sans autostart :

```bash
x64
```

Puis dans l'émulateur :
- Appuie sur **F4** ou va dans `File > Smart attach...` et sélectionne le `.prg`
- Tape `RUN` et appuie sur Entrée

#### Astuce pour charger rapidement

Dans VICE, tu peux aussi faire un "paste" du code directement, mais la méthode `.prg` est plus propre et authentique.

---

### Autres émulateurs sympas

- **Apple II** : `linapple` ou `applewin` (via Wine)
- **TRS-80** : `trs80gp` (excellent)
- **MAME** : pour plein de machines différentes

Mais **VICE + Commodore 64** reste de loin la solution la plus simple et plaisante sur Linux en 2026.

---

### Test rapide sans émulateur (Bywater BASIC)

Si tu veux juste tester le jeu rapidement :

```bash
sudo pacman -S bwbasic
bwbasic programs/star-trek.bas
```

C'est moins "réel" qu'un vrai émulateur, mais ça fonctionne très bien pour tester la logique.
