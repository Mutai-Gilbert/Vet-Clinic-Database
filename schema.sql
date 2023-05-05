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


-- Create a table named vets with the following columns:
-- id: integer (set it as autoincremented PRIMARY KEY)
-- name: string
-- age: integer
-- date_of_graduation: date
-- There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple 
-- species, and a species can have multiple vets specialized in it. 
-- Create a "join table" called specializations to handle this relationship.




-- There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. 
-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.

CREATE TABLE visits (
	id SERIAL PRIMARY KEY,
	vet_id INTEGER,
	animal_id INTEGER,
	visit_date DATE,
	FOREIGN KEY (vet_id) REFERENCES vets(id),
	FOREIGN KEY (animal_id) REFERENCES animals(id)
);

-- Insert the following data for vets:
-- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
-- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
-- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
-- Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
	     ('Stephanie Mendez', 64, '1981-05-04'),
	     ('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties:
-- Vet William Tatcher is specialized in Pokemon.
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- Vet Jack Harkness is specialized in Digimon.       

SELECT id FROM vets WHERE name = 'William Tatcher';
INSERT INTO specializations (vet_id, species_id)
VALUES (1,1);

SELECT id FROM vets WHERE name = 'Stephanie Mendez';
INSERT INTO specializations (vet_id, species_id)
VALUES (3,1);
INSERT INTO specializations (vet_id, species_id)
VALUES (3,2);
SELECT id FROM vets WHERE name = 'Jack Harkness';
INSERT INTO specializations (vet_id, species_id)
VALUES (4,2);