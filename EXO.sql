CREATE Database Music2 DEFAULT CHARACTER SET utf8;

USE Music2; 

CREATE TABLE Artist(
artist_id INTEGER NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
PRIMARY KEY (artist_id)
) ENGINE = InnoDB,

CREATE TABLE album (
    album_id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(128),
    artist_id INTEGER,
    PRIMARY KEY (album_id),
    INDEX USING BTREE (title),
    CONSTRAINT FOREIGN KEY(artist_id)
    REFERENCES Artist (artist_id)
    ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE genre(
    genre_id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (genre_id)) 

CREATE TABLE track(
track_id INTEGER NOT NULL AUTO_INCREMENT,
title VARCHAR(128),
album_id INTEGER,
genre_id INTEGER,

CONSTRAINT FOREIGN KEY(album_id) 
REFERENCES album (album_id)
ON DELETE CASCADE ON UPDATE CASCADE,



CONSTRAINT FOREIGN KEY(genre_id)
REFERENCES genre (genre_id)
ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO artist (name) VALUES ('Daft Punk');
INSERT INTO artist (name) VALUES ('The Prodigy');
INSERT INTO artist (name) VALUES ('The Chemical Brothers');

INSERT INTO Genre (name) VALUES ('Acid House');
INSERT INTO Genre (name) VALUES ('Electro-Punk');

INSERT INTO album (title, artist_id) VALUES ('HomeWork', 1);
INSERT INTO album (title, artist_id) VALUES ('DISCOVERY', 1);
INSERT INTO album (title, artist_id) VALUES ('The Fat Of the Land', 2);
INSERT INTO album (title, artist_id) VALUES ('Experience', 2);
INSERT INTO album (title, artist_id) VALUES ('Dig Your Own Hole', 3);


INSERT INTO track (title, album_id, genre_id) VALUES ('Da FUNK', 1, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Around The World',  1, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Harder Better Faster Stronger', 2, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Crescendolls', 2, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Veridis Quo', 2, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Revolution 909', 1, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Rollin & Scratchin', 1, 1, 2);

INSERT INTO track (title,  album_id, genre_id) VALUES ('Smack My Bitch UP',  3, 2);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Fire Starter',  3, 2);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Breathe',  3, 2);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Mindfields',  3, 2);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Narayan', 3, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Out of Space',  4, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('FIRE',  4, 2);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Wind it UP', 4, 2);

INSERT INTO track (title,  album_id, genre_id) VALUES ('Dig your own hole',  5, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Elektrobank',  5, 1);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Setting The Sun',  5, 2);
INSERT INTO track (title,  album_id, genre_id) VALUES ('Lost in the K Hole',  5, 2);

SELECT Artist.name, Genre.name, Count(Track.genre_id) 
FROM Track JOIN Genre JOIN Album JOIN Artist
ON Track.genre_id = Genre.genre_id
AND Track.album_id = Album.album_id
AND Album.artist_id = Artist.artist_id
GROUP BY Artist.name, Genre.name;


