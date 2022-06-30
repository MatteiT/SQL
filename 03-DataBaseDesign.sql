--* PowerPoint
-- https://docs.google.com/viewer?url=https%3A%2F%2Fwww.wa4e.com%2Flectures%2FSQL-02-MySQL-Design.ppt

-- On va créer notre BDD de musiques
CREATE DATABASE Music DEFAULT CHARACTER SET utf8;

USE Music;  (Command line only)

-- On créé ensuite nos tableaux
CREATE TABLE Artist (
  artist_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY(artist_id)
) ENGINE = InnoDB;
-- On définit notre clef primaire pour la table Artist

CREATE TABLE Album (
  album_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  artist_id INTEGER,

  PRIMARY KEY(album_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY (artist_id)
    REFERENCES Artist (artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- La CASCADE permet de garder sa BDD propre en supprimant et/ou modifiant la ligne de la clef étrangère en fonction de la ligne de la clef primaire

CREATE TABLE Genre (
  genre_id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  PRIMARY KEY(genre_id)
) ENGINE = InnoDB;

CREATE TABLE Track (
  track_id INTEGER NOT NULL AUTO_INCREMENT,
  title VARCHAR(255),
  len INTEGER,
  rating INTEGER,
  count INTEGER,
  album_id INTEGER,
  genre_id INTEGER,

  PRIMARY KEY(track_id),
  INDEX USING BTREE (title),

  CONSTRAINT FOREIGN KEY (album_id) REFERENCES Album (album_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (genre_id) REFERENCES Genre (genre_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

--! Il faut créer les tables dans l'ordre car avec CONSTRAINT on vérifie que la clef primaire à laquelle on fait référence existe bien

-- On insère des artistes
INSERT INTO Artist (name) VALUES ('Led Zepplin');
INSERT INTO Artist (name) VALUES ('AC/DC');

-- On insère les genres
INSERT INTO Genre (name) VALUES ('Rock');
INSERT INTO Genre (name) VALUES ('Metal');

-- On insère des albums
INSERT INTO Album (title, artist_id) VALUES ('Who Made Who', 2);
INSERT INTO Album (title, artist_id) VALUES ('IV', 1);
--? Grâce à CONSTRAINT on ne peut pas utiliser un artist_id qui serait invalide

-- On insère les pistes
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Black Dog', 5, 297, 0, 2, 1);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Stairway', 5, 482, 0, 2, 1);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('About to Rock', 5, 313, 0, 1, 2);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Who Made Who', 5, 207, 0, 1, 2);

-- Maintenant, nous avons une BDD bien compacte et optimisée pour retrouver les enregistrements
SELECT Album.title, Artist.name FROM Album JOIN Artist ON Album.artist_id = Artist.artist_id;

SELECT Album.title, Album.artist_id, Artist.artist_id,Artist.name FROM Album JOIN Artist ON Album.artist_id = Artist.artist_id;
--? Normalement, on ne cherche pas à afficher les clefs  car ce sont seuelemnt les connecteurs entre les tableaux

SELECT Track.title, Track.genre_id, Genre.genre_id, Genre.name FROM Track JOIN Genre;
--! Utiliser une jointure sans la clause ON donne toutes les combinaisons possibles entre les lignes

SELECT Track.title, Genre.name FROM Track JOIN Genre ON Track.genre_id = Genre.genre_id;

-- ça peut être complexe
SELECT Track.title, Artist.name, Album.title, Genre.name FROM Track JOIN Genre JOIN Album JOIN Artist ON Track.genre_id = Genre.genre_id AND Track.album_id = Album.album_id AND Album.artist_id = Artist.artist_id;

--? La suppression en CASCADE permet de nettoyer les références qui seront "cassées" suite à une suppression/modification
DELETE FROM Genre WHERE name = 'Metal';

INSERT INTO Genre (name) VALUES ('Metal');

--! L'id du genre metal a été incrémenté et vaut donc 3. Il faut le prendre en considération lorsque l'on veut réinsérer des pistes
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('About to Rock', 5, 313, 0, 1, 3);
INSERT INTO Track (title, rating, len, count, album_id, genre_id)
    VALUES ('Who Made Who', 5, 207, 0, 1, 3);

-- On vide la BDD music en supprimant ses tables (pour l'exo plus tard)
DROP TABLE Track;
DROP TABLE Album;
DROP TABLE Genre;
DROP TABLE Artist;