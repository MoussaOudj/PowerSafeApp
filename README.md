# PowerSafeApp
Application iOS pour ce connecter au PoC PowerSafe

* l'Application permet de visualiser l'etat de l'alarme.
* Est equipé d'un gestionnaire de MDP 
* Contient une séquence de test


![Visu home](Visu%00.png)
![Visu password](Visu%01.png)

## Requête utilisé pour communiquer avec le serveur à l'aide du Pod **ALAMOFIRE**
- GET /getAlarm => Retourne true si l'alarme est activer false sinon
- GET /desactivateAlarm => parametre : password => desactive l'alarme avec le mot de passe passer en parametre
- GET /new => parametre : password => change le mots de passe en cours si l'alarme est activer
