
DROP TABLE IF EXISTS "movies";
CREATE TABLE movies
(
    movie_id INT PRIMARY KEY,
    title TEXT,
    genre TEXT,
    runtime INT,
    year_of_release INT,
    renting_price numeric
);


COPY movies
	FROM PROGRAM 'curl "https://assets.datacamp.com/production/repositories/4068/datasets/3eebf2a145b76fee37357bcd55ac54577c03c805/movies_181127_2.csv"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "actors";
CREATE TABLE actors
(
    actor_id integer PRIMARY KEY,
    name character varying,
    year_of_birth integer,
    nationality character varying,
    gender character varying
);


COPY actors
	FROM PROGRAM 'curl "https://assets.datacamp.com/production/repositories/4068/datasets/c67f20fa317e8229eed7586cda8bfce5fc177444/actors_181127_2.csv"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "actsin";
CREATE TABLE actsin
(
    actsin_id integer PRIMARY KEY,
    movie_id integer,
    actor_id integer
);


COPY actsin
	FROM PROGRAM 'curl "https://assets.datacamp.com/production/repositories/4068/datasets/6efc08575effcc9327c82fea18aaf22dfd61cc27/actsin_181127_2.csv"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "customers";
CREATE TABLE customers
(
	customer_id integer PRIMARY KEY,
    name character varying,
    country character varying,
    gender character varying,
    date_of_birth date,
    date_account_start date
);


COPY customers
	FROM PROGRAM 'curl "https://assets.datacamp.com/production/repositories/4068/datasets/4b1767d8e638ab26e62d98517fef297d72260992/customers_181127_2.csv"' (DELIMITER ',', FORMAT CSV, HEADER);


DROP TABLE IF EXISTS "renting";
CREATE TABLE renting
(
    renting_id integer PRIMARY KEY,
    customer_id integer NOT NULL,
    movie_id integer NOT NULL,
    rating integer,
    date_renting date
);


COPY renting
	FROM PROGRAM 'curl "https://assets.datacamp.com/production/repositories/4068/datasets/d36ed7719976092a9b3387c8a2ac077914c9e1d2/renting_181127_2.csv"' (DELIMITER ',', FORMAT CSV, HEADER);

