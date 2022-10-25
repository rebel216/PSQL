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
SELECT species.name, COUNT(*) FROM species JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT animals.name , owners.full_name FROM species INNER JOIN (animals inner join owners on owners.full_name='Jennifer Orwell') ON animals.species_id = species.id WHERE species.name = 'Digimon';

SELECT animals.name , owners.full_name ,animals.escape_attempts FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name ='Dean Winchester' and animals.escape_attempts = 0;
SELECT full_name from owners where id = (SELECT owner_id from animals group by owner_id order by count(*) desc limit 1);



/* Excercise Three */

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(*) FROM vets JOIN visits ON visits.vet_id = vets.id JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vet_id LEFT JOIN species ON species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON visits.animals_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id ORDER BY visits.date_of_visit DESC;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits JOIN animals ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vet_id LEFT JOIN specializations ON vets.id = specializations.vet_id WHERE vets.name != 'Stephanie Mendez' AND (animals.species_id != specializations.species_id OR specializations.species_id IS NULL);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name , COUNT(*) FROM visits JOIN vets ON vets.id = visits.vet_id JOIN animals ON animals.id = visits.animals_id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name;


-- Group Activites

-- Analyze animals_id
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;

-- Analyze vets_id
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;

-- Analyze email
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';