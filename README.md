# EinCode

Vous devriez avoir un dossier eincode contenant les fichiers suivants :
- eincode.war
- bdd.sql
- rapport.pdf
- javadoc.zip
- README.md (ce fichier)


## Démarche pour intégrer la base de données
1) Lancer mySQL
```sh
sudo service mysql start

```
2) Se connecter à mySQL
```sh
sudo mysql -r
```

3) Charger le scripts mysql
```sql
mysql> source ./bdd.sql
```


## Démarche pour tester le projet
1) Ouvrir Eclipse
2) Aller dans "File" > "Import" > "WAR"
3) Sélectionner le fichier "eincode.war", avec pour "Target runtime" la valeur "apache-tomcat-7.0.109"
4) Sélectionner le nouveau projet Eclipse, faire "Run As" > "Run on Server" pour lancer le serveur.
5) Choisir Tomcat v7.0 
4) Sélectionnez le nouveau projet Eclipse, allez dans le fichier app.eincode.main.java et faîtes "Run As" > "Java Application"