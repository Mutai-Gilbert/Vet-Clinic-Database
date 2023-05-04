/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(5,2),
  species VARCHAR(255)
);

-- Create a table named owners with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- full_name: string
-- age: integer

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INTEGER
);

-- Create a table named species with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- Modify animals table:
-- Make sure that id is set as autoincremented PRIMARY KEY
-- Remove column species
-- Add column species_id which is a foreign key referencing species table
-- Add column owner_id which is a foreign key referencing the owners table

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owner_id INTEGER REFERENCES owners(id);


