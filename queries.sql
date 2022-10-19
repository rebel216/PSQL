/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT * from animals WHERE neutered = TRUE AND escape_attempts <=3;
SELECT name , escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name !='Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


UPDATE animals SET species = 'unspecified';
UPDATE animals SET species = '';

START Transaction;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species LIKE '';
COMMIT;

START Transaction;
DELETE FROM animals * ;
SELECT * from animals;
ROLLBACK;

START Transaction;
SAVEPOINT pt1;
DELETE FROM animals * WHERE date_of_birth > '2022-01-01';
ROLLBACK TO SAVEPOINT pt1;
UPDATE animals SET weight_kg = weight_kg * -1;
UPDATE animals SET weight_kg = weight_kg * -1;
COMMIT;

SELECT count(*) AS number_of_animals FROM animals;
SELECT count(*) AS number_of_animals FROM animals WHERE escape_attempts >0;

SELECT AVG(weight_kg) FROM animals;

DO $$
DECLARE
var1 integer := (SELECT count(escape_attempts) AS escape_attempts FROM animals WHERE neutered = FALSE);
var2 integer := (SELECT count(escape_attempts) AS escape_attempts FROM animals WHERE neutered = TRUE);
BEGIN
IF var2 > var1 THEN
RAISE NOTICE 'neutered attempted escape most';
else
RAISE NOTICE 'non-neutered attempted escape most';
END IF;
END $$; 

DO $$
DECLARE
maxpoke float := (SELECT MAX(weight_kg) AS weight_kg FROM animals WHERE species = 'pokemon');
minpoke float := (SELECT MIN(weight_kg) AS weight_kg FROM animals WHERE species = 'pokemon');
maxdigimon float := (SELECT MAX(weight_kg) AS weight_kg FROM animals WHERE species = 'digimon');
mindigimon float := (SELECT MIN(weight_kg) AS weight_kg FROM animals WHERE species = 'digimon');
BEGIN
RAISE NOTICE 'maxpoke: %', maxpoke;
RAISE NOTICE 'minpoke: %', minpoke;
RAISE NOTICE 'maxdigimon: %', maxdigimon;
RAISE NOTICE 'mindigimon: %', mindigimon;
END $$; 

SELECT AVG(escape_attempts) AS escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-01-01';
