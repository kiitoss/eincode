# EinCode

Vous devriez avoir un dossier eincode contenant les fichiers suivants :
- eincode-leger.war
- eincode-lourd.war
- bdd.sql
- rapport.pdf
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


## Démarche pour tester le client léger
1) Télécharger Tomcat 7 : https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.109/bin/

2) Dézipper l'archive obtenue
```sh
unzip ~/Downloads/apache-tomcat-7.0.109.zip
```

2) Copier le fichier .war dans le dossier de Tomcat
```sh
cp ./eincode/eincode-leger.war ~/apache-tomcat-7.0.109/webapps/
```

3) Se déplacer dans le dossier du serveur
```sh
cd ./apache-tomcat-7.0.109/bin
```

4) Mettre à jour les droits d'éxecution pour lancer et arrêter le serveur
```sh
chmod u+x startup.sh shutdown.sh catalina.sh
```

5) Lancer le serveur
```sh
sudo ./startup.sh
```

6) Se connecter au serveur local : http://localhost:8080/eincode-leger/

7) Fermer le serveur une fois les tests terminés
```sh
sudo ./shutdown.sh
```


## Démarche pour tester le client lourd (+ le client léger)
1) Ouvrir Eclipse
2) Aller dans "File" > "Import" > "WAR"
3) Sélectionner le fichier "eincode-lourd.war", avec pour "Target runtime" la valeur "apache-tomcat-7.0.109"
4) Sélectionner le nouveau projet Eclipse, faire "Run As" > "Run on Server" pour lancer le serveur.
5) Choisir Tomcat v7.0 
4) Sélectionnez le nouveau projet Eclipse, allez dans le fichier app.eincode.main.java et faîtes "Run As" > "Java Application"