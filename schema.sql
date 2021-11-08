/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

ALTER TABLE animals 
  Add species TEXT;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INT 
)

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name TEXT
)

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT,
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT,
  ADD CONSTRAINT fk_owners
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);

CREATE TABLE vets(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  date_of_graduation date
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  date DATE,
  CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id_index ON visits(animals_id);
CREATE INDEX vets_id_index ON visits(vets_id, animals_id, date);
CREATE INDEX email_index ON owners(email ASC);
