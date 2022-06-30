--* Base de Données Relationnelles

--* La BDD relationnelle modélise les données en stockant des lignes et des colonnesdans des tables. La puissance de la BDD relationnelle réside dans sa capacité à retrouver efficacement les données dans ces tables - en particulier, où la requête implique plusieurs tables  et les relations entre ces tables

--* SQL - structured Query Language
--* donne des ordres à la BDD

--* CRUD - Create/Insert Read/Select Update Delete

--* Database - contient une ou plusieurs tables
--* Relation (ou table) - contient des tuples et des atttributs
--* Tuple (ou ligne)- un ensemble de champs qui représente généralement un "objet" comme une personne ou une piste de musique
--* Attrtibut (aussi colonne ou champs) - un des nombreux éléments de données correspondant à l'objet représenté par la ligne

-- http://2.bp.blogspot.com/-0KbHfcMTAZU/VmBfChfIGYI/AAAAAAAAFzY/QvaYTcRQ6FA/s1600/base%2Bde%2Bdonn%25C3%25A9e%2Brelationnelle.png

-- Pour utiliser la Command Line sur Windows
-- clic gauche sur l'icône de WAMPP -> MySQL -> Console MySQL

-- Afficher les BDD
show databases;
-- C'est un équivalenet de print "hello world"

-- Une BDD est une collection de tables

-- Créer une BDD
create database People DEFAULT CHARACTER SET utf8;

-- Utiliser une BDD
use People;

-- Afficher les tableaux dans une BDD
show tables;

-- On crée un tableau (dans phpMyAdmin) et ses colonnes
CREATE TABLE Users(
  name VARCHAR(128),
  email VARCHAR(128)
);

-- On peut afficher la structure d'un tableau dans la CLI
DESCRIBE Users;

-- Insérer un élement( créé une ligne) dans le tableau (dans phpMyAdmin)
INSERT INTO Users (name, email) VALUES ('Chuck', 'chuck@afci.fr');
INSERT INTO Users (name, email) VALUES ('Somesh', 'somesh@afci.fr');
INSERT INTO Users (name, email) VALUES ('Caitlin', 'cait@afci.fr');
INSERT INTO Users (name, email) VALUES ('Ted', 'ted@afci.fr');
INSERT INTO Users (name, email) VALUES ('Sally', 'sally@afci.fr');

-- On peut voir qu'on a créé 5 lignes dans notre tables (voir sur phpMyAdmin)

-- Effacer une ligne (dans la CLI)
DELETE FROM Users WHERE email='ted@afci.fr';

-- On peut voir que la ligne de l'user Ted a été effacée

-- Modifier une ligne (dans phpMyAdmin)
UPDATE Users SET name='Charles' WHERE email='chuck@afci.fr';
-- Si on oublie le WHERE (la clause) la modification sera sur toutes les lignes
-- On voit que le nom "Chuck" a été modifier par "Charles"

-- system cls pour clear l'écran

-- Récupérer les enregistrements (dnas la CLI)
-- Ou plusieurs plignes
SELECT * FROM Users;

-- Trirer par ordre alphabétique des emails
SELECT * FROM Users ORDER BY email;

-- On peut récupérer une ligne
SELECT * FROM Users WHERE email='chuck@afci.fr';

-- Avec la clause LIKE '%e%' on récupère tous les élements qui contiennent un "e"
SELECT * FROM Users WHERE name LIKE '%e%';

-- La clause LIMIT permet de limiter le nombre d'enregistrements qu'on récupère
SELECT * FROM Users ORDER BY email DESC LIMIT 2;

-- On peut aussi choisir aussi à partir de quelle ligne(+1) on souhaite récupérer les enregistrements et combien (2ème "arguement")
SELECT * FROM Users ORDER BY email LIMIT 1,2;
SELECT * FROM Users ORDER BY email LIMIT 2,4;

-- Compter le nombre de lignes
SELECT COUNT(*) FROM Users;

-- Pareil en utilisant une clause pour compter un certain nombre de choses
SELECT COUNT(*) FROM Users WHERE email="chuck@afci.fr";

-- C'était les bases du SQL