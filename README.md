# README.md

## Membres du groupe

- **Cardona Léane** : [leane-th](https://github.com/leane-th)
- **Devulder Romain** : [StrakkerII](https://github.com/StrakkerII)
- **Marty Quentin** : [Propleek](https://github.com/Propleek)
- **Volpato Enzo** : [vryc9](https://github.com/vryc9)

---

## Écrans

### Accueil

- **Fonctionnalités implémentées**:
  - Header avec le titre "Bienvenue !" et un astronaute.
  - Liste de movies, series, issues et characters (limitation à 5).
  - Bouton "voir plus" pour chaque liste qui renvoie vers la liste complète (sauf characters).
  - Chaque card comporte : image et nom.
  - Clic sur une card renvoie vers le détail de l'élément.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucun [type] trouvé."
  - État *error* : de chaque liste affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.
- **Style** : Identique pour tous les états.

---

### Liste de series

- **Fonctionnalités implémentées**:
  - Liste de series (limitation à 50).
  - Chaque card comporte : numéro indicateur de popularité, nom, publisher, nombre d'épisodes, année de sortie.
  - Clic sur une card renvoie vers le détail de l'élément.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucune série trouvée."
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.

- **Style** : Identique.

---

### Détail d'une serie

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, nom de la série.
  - Entête avec : image, publisher, nombre d'épisodes, année de sortie.
  - Onglet *Histoire* : description de la série (HTML).
  - Onglet *Personnage* : liste des personnages de la série (icône + nom).
  - Onglet *Episodes* : liste des épisodes (chaque card contient : image, numéro, nom, date de sortie).

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la série et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.
- **Style** : Identique.

---

### Liste de comics

- **Fonctionnalités implémentées**:
  - Liste de comics (limitation à 50).
  - Chaque card comporte : numéro indicateur de popularité, volume, nom, numéro, mois + année de sortie.
  - Clic sur une card renvoie vers le détail de l'élément.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucun comic trouvé."
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.

- **Style** : Identique.

---

### Détail d'un comic

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, volume.
  - Entête avec : image, nom, numéro, mois + année de sortie.
  - Onglet *Histoire* : description du comic (HTML).
  - Onglet *Auteurs* : liste des auteurs du comic (icône + nom).
  - Onglet *Personnages* : liste des personnages du comic (icône + nom).

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche le comic et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.

- **Style** : Identique.

---

### Liste de movies

- **Fonctionnalités implémentées**:
  - Liste de movies (limitation à 50).
  - Chaque card comporte : numéro indicateur de popularité, nom, durée, année de sortie.
  - Clic sur une card renvoie vers le détail de l'élément.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucun film trouvé."
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.
- **Style** : Identique.

---

### Détail d'un movie

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, nom.
  - Entête avec : image, durée, année de sortie.
  - Onglet *Synopsis* : description du movie (HTML).
  - Onglet *Personnages* : liste des personnages (icône + nom).
  - Onglet *Infos* : tableau (classification, réalisateur, scénaristes, producteurs, studios, budget, recettes au box-office, recettes brutes totales).

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche le movie et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.

- **Style** : Identique.

---

### Détail d'un character

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, nom.
  - Onglet *Histoire* : description du character (HTML).
  - Onglet *Infos* : tableau (nom de super-héros, nom réel, alias, éditeur, créateurs, genre, date de naissance, décès)
    
- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche le character et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.

- **Style** : Identique, sauf qu'il y a une ligne blanche sous les titres d'onglets que nous n'avons pas réussi à retirer.

 ---

### Recherche

- **Fonctionnalités implémentées**:
  - Header avec : titre "Recherche"
  - Barre de recherche (la validation se fait avec la touche "entrée", pour réeffectuer une recher il suffit d'ajouter ou d'effacer au moins 1 caractère dans la recherche précédente, juste cliquer sur la barre de recherche et faire entrée ne relancera pas la recherche)
  - Un bloc contenant un texte indicateur et un petit astronaute est affiché quand il n'y a pas de recherche
  - Un bloc contenant un texte indicateur et un petit astronaute est affiché quand il une recherche est en cours, il reste affiché 5 secondes puis disparait.
  - Liste de serie, issue, movie et character. (limité à 100)
  - Chaque card comporte : image et nom
  - Clic sur une card renvoie vers le détail de l'élément
  - Itégration du menu de navigation
    
- **Gestion des états**:
  - État *loading* : de chaque liste n'affiche rien card il y a le bloc avec l'astronaute qui indique déjà que la recherche est en cours.
  - État *success* : de chaque liste affiche la liste si elle est remplie sinon affiche "aucun *liste type trouvé."
  - État *error* : de chaque liste affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer." et un bouton pour relancer la requête.

- **Style** : Identique.

 ---