DROP DATABASE IF EXISTS normal_cars_db;

DROP USER IF EXISTS normal_user;

CREATE USER normal_user;

CREATE DATABASE normal_cars_db;

\c normal_cars_db;

ALTER DATABASE normal_cars_db OWNER TO normal_user;

-- DROP TABLE IF EXISTS denormalcar_models;

-- DROP TABLE IF EXISTS car_models;

\i scripts/denormal_data.sql;

CREATE TABLE IF NOT EXISTS makes
(
 id serial PRIMARY KEY NOT NULL,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL
);

CREATE TABLE IF NOT EXISTS models
(
 id serial PRIMARY KEY NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL
);



CREATE TABLE IF NOT EXISTS years
(
  id serial PRIMARY KEY NOT NULL,
  year integer NOT NULL
);

INSERT into makes (make_code, make_title)
  SELECT DISTINCT make_code, make_title FROM car_models;

INSERT into models (model_code, model_title)
  SELECT DISTINCT model_code, model_title FROM car_models;

INSERT into years (year)
  SELECT DISTINCT year FROM car_models;



-- CREATE TABLE IF NOT EXISTS normalized_list
-- (
--   id serial PRIMARY KEY NOT NULL,
--   make.id integer NOT NULL, model.id integer NOT NULL, year.id integer NOT NULL
-- );