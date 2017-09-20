
//moives


CREATE TABLE movies (
    id INTERGER PRIMARY KEY,
    name DEFAULT TEXT NULL,
    year INTERGER DEFAULT NULL,
    rank REAL DEFAULT NULL
);

CREATE TABLE actors (
    id INTERGER PRIMARY KEY,
    first_name TEXT DEFAULT NULL,
    last_name TEXT DEFAULT NULL,
    gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
    actor_id INTERGER,
    movie_id INTERGER,
    role_name TEXT DEFAULT NULL
);


SELECT name
    from movies
    where year = 1985;

SELECT COUNT(*)
    from movies
    where year = 1982;

SELECT *
    from actors
    where last_name LIKE "%stack%";

SELECT
    first_name,
    COUNT(*) AS firstNameCount
    from actors
    GROUP BY first_name
    ORDER BY firstNameCount DESC
    LIMIT 30;

SELECT
    id,
    (first_name || ' ' || last_name) AS fullname,
    COUNT(*) AS nameCount
    from actors
    GROUP BY fullname
    ORDER BY nameCount DESC
    LIMIT 10;

SELECT
    first_name,
    last_name,
    COUNT (*) AS roleCount
FROM actors
LEFT JOIN roles ON roles.actor_id = actors.id
GROUP BY (first_name || " " || last_name)
ORDER BY roleCount DESC
LIMIT 100;

SELECT
  genre,
  COUNT (*) AS genreCount
FROM movies_genres
LEFT JOIN movies ON movies.id = movies_genres.movie_id
GROUP BY movies_genres.genre
ORDER BY genreCount
LIMIT 25;
