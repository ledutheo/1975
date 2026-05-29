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
| `compound-interest.bas`        | Application bancaire    | Programme typique en entreprise et en école d'ingénieur |

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
