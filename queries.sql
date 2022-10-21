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
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

START Transaction;
DELETE FROM animals * ;
SELECT * from animals;
ROLLBACK;

START Transaction;
DELETE FROM animals * WHERE date_of_birth > '2022-01-01';
SAVEPOINT pt1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT pt1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
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

/* Exercise Two */

SELECT animals.name , owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name ='Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name ='Pokemon';
SELECT animals.name , owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id;
SELECT owner_id from (SELECT animals.name,species.name FROM animals INNER JOIN species ON animals.species_id = species.id group by species.name order by count(*)) ;
SELECT animals.name , owners.full_name FROM species INNER JOIN (animals inner join owners on owners.full_name='Jennifer Orwell') ON animals.species_id = species.id WHERE species.name = 'Digimon';

SELECT animals.name , owners.full_name ,animals.escape_attempts FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name ='Dean Winchester' and animals.escape_attempts = 0;
SELECT full_name from owners where id = (SELECT owner_id from animals group by owner_id order by count(*) desc limit 1);



/* Excercise Three */

