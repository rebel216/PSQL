/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Agumon','2020-06-03',0,TRUE,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Gabumon','2018-11-15',2,TRUE,8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Pikachu','2021-01-07',1,FALSE,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Devimon','2020-06-03',5,TRUE,11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Charmander','2020-02-08',0,FALSE,11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Plantmon','2021-11-15',2,TRUE,5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Squirtle','1993-04-02',3,FALSE,12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Angemon','2005-06-12',1,FALSE,45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Boarmon','2005-07-07',7,TRUE,20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Blossom','1998-10-13',3,TRUE,17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Ditto','2022-05-14',4,TRUE,22);

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

