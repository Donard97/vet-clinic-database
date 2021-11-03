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
  id INT PRIMARY KEY,
  full_name TEXT,
  age INT 
)

CREATE TABLE species(
  id INT PRIMARY KEY,
  name TEXT
)
