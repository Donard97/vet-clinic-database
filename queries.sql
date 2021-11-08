/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered IS TRUE AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT name FROM animals WHERE neutered IS TRUE;
SELECT name FROM animals WHERE name NOT IN ('Gabumon');
SELECT name FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT dateOfBirth;
UPDATE animals SET weight_kg=-1*weight_kg;
ROLLBACK TO dateOfBirth;
UPDATE animals SET weight_kg=-1*weight_kg WHERE weight_kg<0;
COMMIT; 


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, count(neutered) as result FROM animals GROUP BY neutered ORDER BY result DESC LIMIT 1;
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE full_name='Melody Pond';
SELECT animals.name AS animal_name, species.name AS species_type FROM animals JOIN species ON animals.species_id=species.id WHERE species.name='Pokemon';
SELECT full_name, animals.name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;
SELECT count(animals) FROM animals JOIN species ON animals.species_id=species.id;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Jennifer Orwell';
SELECT animals.name, animals.escape_attempts FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name , COUNT(animals.name) AS total_animals FROM owners JOIN animals ON animals.owner_id=owners.id GROUP BY owners.full_name ORDER BY total_animals DESC LIMIT 1;

SELECT v.date as visit_date, a.name, vt.name from visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt 
ON v.vets_id=vt.id 
WHERE vt.name='William Tatcher' 
ORDER BY visit_date 
DESC LIMIT 1;

SELECT COUNT(a.name) from visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt 
ON v.vets_id=vt.id 
WHERE vt.name='Stephanie Mendez';

SELECT species.name 
AS species_type, vt.name 
AS vet_name from specializations s 
JOIN species 
ON s.species_id=species.id FULL 
JOIN vets vt 
ON s.vets_id=vt.id;

SELECT v.date as visit_date, a.name 
AS animal_name, vt.name as vet_name from visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt
ON v.vets_id=vt.id 
WHERE vt.name='Stephanie Mendez' 
AND v.date 
BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(a.name) 
AS count_visits FROM visits v 
JOIN animals a ON v.animals_id=a.id 
JOIN vets vt ON v.vets_id=vt.id 
GROUP BY a.name 
HAVING COUNT(a.name) = (
    SELECT MAX(myf.count_visits) 
    FROM ( select a.name, COUNT(a.name) 
    AS count_visits from visits v 
    JOIN animals a ON v.animals_id=a.id 
    JOIN vets vt ON v.vets_id=vt.id 
    GROUP BY a.name) 
    AS myf
);

SELECT v.date as visit_day, a.name 
AS animal_name, vt.name AS vet_name 
FROM visits v JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt 
ON v.vets_id=vt.id 
WHERE vt.name='Maisy Smith' 
ORDER BY v.date 
LIMIT 1;


SELECT v.date as visit_day, a.name 
AS animal_name, vt.name 
AS vet_name 
FROM visits v 
JOIN animals a 
ON v.animals_id=a.id 
JOIN vets vt
ON v.vets_id=vt.id 
ORDER BY v.date 
DESC LIMIT 1;


SELECT vets.name, s.species_id 
FROM vets 
LEFT JOIN specializations s 
ON s.vets_id=vets.id 
WHERE species_id IS NULL;


SELECT species.name, COUNT(species.name) 
AS count_species 
FROM vets 
LEFT JOIN specializations s 
ON s.vets_id=vets.id 
JOIN animals 
ON animals.species_id=s.species_id 
JOIN species 
ON species.id=s.species_id 
WHERE vets.name='Maisy Smith' 
GROUP BY species.name 
ORDER BY count_species 
DESC LIMIT 1;

SELECT COUNT(*) 
FROM visits where animals_id = 4;

SELECT * FROM visits 
WHERE vets_id = 2;

SELECT * FROM owners 
WHERE email = 'owner_18327@mail.com';