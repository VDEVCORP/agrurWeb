# agrurWeb by VDED
**Situation professionnelle 1 : Mise en place d'une solution web**
AGRUR est une coopérative agricole française dans le secteur de la noix.
Afin de faciliter le suivi de ses commandes, de mieux gérer les producteurs avec qui elle travail, de rendre la coopérative plus attractive pour ses client et jouir d'une meilleur gouvernance de ses données, AGRUR souhaite que vous développiez un SI web.

## Installation
### Locale sous Windows:
1. Téléchargez et installez Wamp ( >= Version 3.0).
**_Conseil avant installation_**: Lire très attentivement le [WAMPSERVER 3 - (Tout sur)](http://forum.wampserver.com/read.php?1,137154) afin de pouvoir vous assurer du fonctionnement normal de Wamp.
2. Clonez la branche Master de ce projet dans le dossier de votre choix sur votre machine.
3. Créez un virtual-host :
Rendez vous dans l'interface localhost de Wamp puis cliquez sur le lien "Ajouter un Virtual Host" dans la section "outils". Renseigner le nom désiré *(exemple: monsite.dev)*, laissez vide le champs Virtual Host par IP, puis indiquez le chemin complet du dossier contenant le site. Enfin, cliquez sur "Démarrer la création du VirtualHost", cela peut prendre un certain temps.
Afin que celui-ci soit pris en compte, effectuez un clic-droit sur le petit icône caché Wamp en bas à droite de votre écran puis *> Outils > Redémarrage DNS*.
4. Créez la base de donnée MySQL à partir de PhpMyAdmin en lui donnant le nom de votre choix *(retenez-le)*. Importez y ensuite le fichier de structure et de contenu de la BBD AGRUR ```agrurproducer [date].sql``` qui se trouve à la racine du site. 
5. Rendez-vous enfin à la racine du projet et trouvez le fichier de configuration du site ```config.php```. Dans celui-ci vous devrez modifier les constantes :
    - ```DOMAIN_NAME``` : Nom du **VirtualHost** choisi que vous avez précédemment,
    - ```DB_HOST``` : Conservez "localhost"
    - ```DB_NAME``` : Nom de la base de donnée créée précédemment,
    - ```DB_USER``` : Si vous n'avez pas créé d'utilisateur spécial pour votre bdd, conservez "root",
    - ```DB_PASS``` : Mot de passe de votre BDD.

## Enjoy
A partir de là, allez sur votre navigateur internet préféré et tapez le **nom de VirtualHost** que vous avez choisie pour le site *(exemple: monsite.dev)* dans la barre d'URL; comme si vous souhaitiez vous rendre sur un site normal.
> :warning Si à ce moment une erreur se produit alors  que 
> vous avez respecté les 5 étapes d'installation précédentes,
> contactez Deascenh à l'addresse t.moulin76@gmail.com

Vous devriez arrivez sur la page de connexion à l'ERP d'AGRUR. Cet intranet dispose de trois *"espaces"* distincts: Client, Producteur et Administrateur.
Pour profiter d'une démonstration du système, un certain nombre d'accès ont déjà été créés :
| Rang              | Accès         | Mdp   |
| ----------------- | ------------- | ----- |
| Administrateur    | admin         | admin |
| Client            | cli1@a.fr     | cli1  |
| Client            | cli2@a.fr     | cli2  |
| Client            | cli3@a.fr     | cli3  |
| Client            | cli4@a.fr     | cli4  |
| Producteur        | prod1@a.fr    | prod1 |
| Producteur        | prod2@a.fr    | prod2 |
| Producteur        | prod3@a.fr    | prod3 |
| Producteur        | prod4@a.fr    | prod4 |

Si pendant votre parcour et/ou votre découverte de l'application il vous arrivait de tomber sur un bug ou une anomalie, merci le signaler à Deascenh à l'addresse t.moulin76@gmail.com