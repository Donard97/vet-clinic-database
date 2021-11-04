/* Populate database with sample data. */

INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6, 'Plantmon', '2022-11-15', 2, TRUE, -5.7);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id=1;
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';

UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name  IN ('Pikachu','Gabumon');
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');

UPDATE owners SET full_name='Melody Pond' WHERE id=4;


INSERT INTO vets (id,name,age,date_of_graduation) VALUES (1, 'William Tatcher', 45, '2000-04-23');
INSERT INTO vets (id,name,age,date_of_graduation) VALUES (2, 'Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (id,name,age,date_of_graduation) VALUES (3, 'Stephanie Mendez', 64, '1981-06-08');
INSERT INTO vets (id,name,age,date_of_graduation) VALUES (4, 'Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id,species_id) VALUES (1,1),(3,2),(3,1),(4,2);

INSERT INTO visits (animals_id,vets_id,date) VALUES (1, 1, '2020-05-24'),(1, 3, '2020-07-22'),(2, 4, '2021-02-02'),(3, 2, '2020-01-05');
INSERT INTO visits (animals_id,vets_id,date) VALUES (3, 2, '2020-03-08'),(3, 2, '2020-05-14'),(4, 2, '2021-05-04'),(5, 4, '2021-02-24');
INSERT INTO visits (animals_id,vets_id,date) VALUES (6, 2, '2019-12-21'),(6, 1, '2020-08-10'),(6, 2, '2021-04-07'),(7, 3, '2019-09-29');
INSERT INTO visits (animals_id,vets_id,date) VALUES (8, 4, '2020-10-03'),(8, 4, '2020-11-04'),(9, 2, '2019-01-24'),(9, 2, '2019-05-15');
INSERT INTO visits (animals_id,vets_id,date) VALUES (9, 2, '2020-02-27'),(9, 2, '2020-08-03'),(10, 3, '2020-05-24'),(10, 1, '2021-01-11');