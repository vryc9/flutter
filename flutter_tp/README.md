# README.md

## Membres du groupe

- **Cardona Léane** : [leane-th](https://github.com/leane-th)
- **Devulder Romain** : [StrakkerII](https://github.com/StrakkerII)
- **Marty Quentin** : [Propleek](https://github.com/Propleek)
- **Volpato Enzo** : [vryc9](https://github.com/vryc9)

---

## Infos

- Nous avons retiré tous les .g.dart du projet. Il faudra donc build le projet pour les générer avant de le lancer.

- la clé d'api utilisée est située ligne 126 à 133 de flutter/flutter_tp/lib/api/services/off_api.dart. il y a nos 4 api-key.
  - la clé de Romain est utilisée pour l'appel aux personnages par id.
  - la clé de Enzo est utilisée pour l'appel aux listes de personnage, films, séries, comics et épisodes.
  - la clé de Léane est utilisée pour l'appel aux recherches de personnages, films, séries et comics.
  - la clé de Quentin est utilisée pour l'appel aux films, séries, comics, personne par id.

---

## Écrans

### Menu de navigation

- 5 boutons :
  - Accueil : icône de maison + texte "Accueil", renvoie sur la page d'accueil.
  - Comics : icône de livres + texte "Comics", renvoie sur la page de liste des comics.
  - Séries : icône de télévision + texte "Séries", renvoie sur la page de liste des séries.
  - Films : icône de pellicule de film + texte "Films", renvoie sur la page de liste des films.
  - Recherche : icône de loupe + texte "Recherche", renvoie sur la page de recherche.

---

### Accueil

- **Fonctionnalités implémentées**:
  - Header avec le titre "Bienvenue !" et un astronaute. Au scroll, le header disparait.
  - Liste de movies, series, issues et characters (limitation à 5).
  - Bouton "voir plus" pour chaque liste qui renvoie vers la liste complète (sauf characters : il n'y a pas de bouton voir plus pour character).
  - Chaque card de chaque liste comporte : image et nom.
  - Le clic sur une card renvoie vers le détail de la card cliquée.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : de chaque liste affiche un `CircularLoader`.
  - État *success* : de chaque liste affiche la liste si elle est remplie, sinon "aucun *type* trouvé."
  - État *error* : de chaque liste affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.
  
- **Style** : Identique.

---

### Liste de séries

- **Fonctionnalités implémentées**:
  - Liste de séries (limitation à 50).
  - Chaque card comporte : numéro indicateur de popularité, nom, publisher, nombre d'épisodes, année de sortie.
  - Le clic sur une card renvoie vers le détail de la card cliquée.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucune *type* trouvée."
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique.

---

### Détail d'une serie

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, nom de la série.
  - Entête avec : image, publisher, nombre d'épisodes, année de sortie.
  - Onglet *Histoire* : description de la série (HTML).
  - Onglet *Personnage* : liste des personnages de la série (icône + nom). Un appel API est fait pour chaque personnage pour pouvoir récupérer leur image. Le clic sur un personnage renvoie vers le détail du personnage cliqué.
  - Onglet *Episodes* : liste des épisodes (chaque card contient : image, numéro, nom, date de sortie).

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la série et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique, sauf le flou de l'image en arrière plan.

---

### Liste de comics

- **Fonctionnalités implémentées**:
  - Liste de comics (limitation à 50).
  - Chaque card comporte : numéro indicateur de popularité, volume, nom, numéro, mois + année de sortie.
  - Le clic sur une card renvoie vers le détail de la card cliquée.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucun *type* trouvé."
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique.

---

### Détail d'un comic

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, volume.
  - Entête avec : image, nom, numéro, mois + année de sortie.
  - Onglet *Histoire* : description du comic (HTML).
  - Onglet *Auteurs* : liste des auteurs du comic (icône + nom). Un appel API est fait pour chaque auteur pour pouvoir récupérer leur image.
  - Onglet *Personnages* : liste des personnages du comic (icône + nom). Un appel API est fait pour chaque personnage pour pouvoir récupérer leur image. Le clic sur un personnage renvoie vers le détail du personnage cliqué.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche le comic et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique, sauf le flou de l'image en arrière plan.

---

### Liste de movies

- **Fonctionnalités implémentées**:
  - Liste de movies (limitation à 50).
  - Chaque card comporte : numéro indicateur de popularité, nom, durée, année de sortie.
  - Le clic sur une card renvoie vers le détail de la card cliquée.
  - Intégration du menu de navigation.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche la liste si elle est remplie, sinon "aucun *type* trouvé."
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.
- **Style** : Identique.

---

### Détail d'un movie

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, nom.
  - Entête avec : image, durée, année de sortie.
  - Onglet *Synopsis* : description du movie (HTML).
  - Onglet *Personnages* : liste des personnages (icône + nom). Un appel API est fait pour chaque personnage pour pouvoir récupérer leur image. Le clic sur un personnage renvoie vers le détail du personnage cliqué.
  - Onglet *Infos* : tableau (classification, réalisateur, scénaristes, producteurs, studios, budget, recettes au box-office, recettes brutes totales). pour le réalisateur, nous n'avons pas trouvé le champs le contenant. Nous avons mis "distributor" à la place.

- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche le movie et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique, sauf le flou de l'image en arrière plan.

---

### Détail d'un character

- **Fonctionnalités implémentées**:
  - Header avec : bouton de retour, nom.
  - Onglet *Histoire* : description du character (HTML).
  - Onglet *Infos* : tableau (nom de super-héros, nom réel, alias, éditeur, créateurs, genre, date de naissance, décès)
    
- **Gestion des états**:
  - État *loading* : affiche un `CircularLoader`.
  - État *success* : affiche le character et son contenu.
  - État *error* : affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique, sauf l'ombre qui n'est pas tout à fait pareil et le flou de l'image en arrière plan.

 ---

### Recherche

- **Fonctionnalités implémentées**:
  - Header avec : titre "Recherche" et barre de recherche (la validation se fait avec la touche "entrée", pour réeffectuer une recherche il suffit d'ajouter, de modifier ou d'effacer au moins 1 caractère dans la recherche précédente puis de faire "entrée", cliquer sur la barre de recherche et faire entrée sans avoir ajouter, modifier ou effacer au moins un caractère ne relancera pas la recherche).
  - Un bloc contenant un texte indicateur et un petit astronaute est affiché quand il n'y a pas de recherche lancée.
  - Un bloc contenant un texte indicateur et un petit astronaute est affiché quand il une recherche est en cours, il reste affiché 5 secondes puis disparait.
  - Liste de serie, issue, movie et character. (limité à 100 par liste)
  - Chaque card comporte : image et nom
  - Le clic sur une card renvoie vers le détail de la card cliquée.
  - Intégration du menu de navigation.
    
- **Gestion des états**:
  - État *loading* : de chaque liste n'affiche rien car il y a le bloc avec l'astronaute qui indique déjà que la recherche est en cours.
  - État *success* : de chaque liste affiche la liste si elle est remplie sinon affiche "Aucun résultat trouvé pour les *type*."
  - État *error* : de chaque liste affiche le message d'erreur "La récupération de la liste de *type* a échoué. Veuillez réessayer après avoir vérifié votre connexion internet." et un bouton réessayer pour relancer la requête.

- **Style** : Identique.

- **Information supplémentaire** : l'appel de recherche de films a été implémenté mais ne renvoie jamais rien, il semblerai que l'API ne permette pas de rechercher de films.

---

### Gestion des attributs null ou empty

- **Textes**
  - Pour chaque élément de type String, nous appelons la méthode de gestion des null et empty que nous avons créé : getDefaultTextForEmptyValue(*attribut*, defaultValue: "*attribut* indisponible").
  - Pour les chiffres, c'est au cas par cas, nous affichons généralement 0 dans le cas ou le chiffre est null. Dans le cas d'argent, nous appelons la méthode formatMoney(*attribut*) qui formate le string avec /K/millions/milliards $ à la fin sinon Montant indisponible sera affiché.

- **Dates**
  - Nous avons créé un outil de gestion des dates. si nous avons besoin d'afficher seulement l'année nous utilisons formatDateYear(*date*), si nous avons besoin d'afficher le mois et l'année nous utilisons formatDateMonthYear(*date*),  si nous avons besoin d'afficher le jour, le mois et l'année nous utilisons formatDateDayMonthYear(*date*). Si le format de la date est incorrect, il sera affiché "Date invalide" à la place de la date. Si la date passée est null, il sera affiché "Date inconnue" à la place de la date.

- **Images**
  - Si l'image que l'on souhaite afficher n'est pas disponible, nous affichons Icons.broken_image à la place.

---