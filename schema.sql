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

-- Get the animal IDs and vet IDs for each visit

-- Insert the following data for visits:
-- Agumon visited William Tatcher on May 24th, 2020.
SELECT id FROM animals WHERE name = 'Agumon';
SELECT id FROM vets WHERE name = 'William Tatcher';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (1, 1, '2020-05-24');
   
-- Agumon visited Stephanie Mendez on Jul 22th, 2020.
SELECT id FROM animals WHERE name = 'Agumon';
SELECT id FROM vets WHERE name = 'Stephanie Mendez'; 
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (1, 3, '2020-07-22');
-- Gabumon visited Jack Harkness on Feb 2nd, 2021.
SELECT id FROM animals WHERE name = 'Gabumon';
SELECT id FROM vets WHERE name = 'Jack Harkness'; 
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (2, 4, '2021-02-02');
-- Pikachu visited Maisy Smith on Jan 5th, 2020.
SELECT id FROM animals WHERE name = 'Pikachu';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (3, 2, '2020-01-05');
-- Pikachu visited Maisy Smith on Mar 8th, 2020.
SELECT id FROM animals WHERE name = 'Pikachu';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (3, 2, '2020-03-08');
-- Pikachu visited Maisy Smith on May 14th, 2020.
SELECT id FROM animals WHERE name = 'Pikachu';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (3, 2, '2020-05-14');
-- Devimon visited Stephanie Mendez on May 4th, 2021.
SELECT id FROM animals WHERE name = 'Devimon';
SELECT id FROM vets WHERE name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (4, 3, '2021-05-04');
-- Charmander visited Jack Harkness on Feb 24th, 2021.
SELECT id FROM animals WHERE name = 'Charmander';
SELECT id FROM vets WHERE name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (5, 4, '2021-02-24');
-- Plantmon visited Maisy Smith on Dec 21st, 2019.
SELECT id FROM animals WHERE name = 'Plantmon';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (6, 2, '2019-12-21');
-- Plantmon visited William Tatcher on Aug 10th, 2020.
SELECT id FROM animals WHERE name = 'Plantmon';
SELECT id FROM vets WHERE name = 'William Tatcher';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (6, 1, '2020-08-10');
-- Plantmon visited Maisy Smith on Apr 7th, 2021.
SELECT id FROM animals WHERE name = 'Plantmon';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (6, 2, '2021-07-04');
-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
SELECT id FROM animals WHERE name = 'Squirtle';
SELECT id FROM vets WHERE name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (7, 3, '2019-09-29');
-- Angemon visited Jack Harkness on Oct 3rd, 2020.
SELECT id FROM animals WHERE name = 'Angemon';
SELECT id FROM vets WHERE name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (8, 4, '2020-10-03');
-- Angemon visited Jack Harkness on Nov 4th, 2020.
SELECT id FROM animals WHERE name = 'Angemon';
SELECT id FROM vets WHERE name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (8, 4, '2020-11-04');
-- Boarmon visited Maisy Smith on Jan 24th, 2019.
SELECT id FROM animals WHERE name = 'Boarmon';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2019-01-24');
-- Boarmon visited Maisy Smith on May 15th, 2019.
SELECT id FROM animals WHERE name = 'Boarmon';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2019-05-15');
-- Boarmon visited Maisy Smith on Feb 27th, 2020.
SELECT id FROM animals WHERE name = 'Boarmon';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2020-02-27');
-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
SELECT id FROM animals WHERE name = 'Boarmon';
SELECT id FROM vets WHERE name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (9, 2, '2020-08-03');
-- Blossom visited Stephanie Mendez on May 24th, 2020.
SELECT id FROM animals WHERE name = 'Blossom';
SELECT id FROM vets WHERE name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (10, 3, '2020-05-24');
-- Blossom visited William Tatcher on Jan 11th, 2021.
SELECT id FROM animals WHERE name = 'Blossom';
SELECT id FROM vets WHERE name = 'William Tatcher';
INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES (10, 1, '2021-01-11');


-- Write queries to answer the following:
-- Who was the last animal seen by William Tatcher?
SELECT animals.name 
FROM animals 
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animal_id)
FROM visits
WHERE vet_id = (
	SELECT id FROM vets WHERE name = 'Stephanie Mendez'
);
-- List all vets and their specialties, including vets with no specialties.

SELECT vets.name, species.name
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON  specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name, visits.visit_date
FROM animals 
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';
-- What animal has the most visits to vets?

SELECT animal_id, COUNT(*) AS visit_count
FROM visits
GROUP BY animal_id
ORDER BY visit_count DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.visit_date
FROM visits
INNER JOIN animals ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date ASC
LIMIT 1;
-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name AS animal_name, vets.name, visits.visit_date
FROM visits
INNER JOIN animals ON visits.animal_id = animals.id
INNER JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;
-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS num_visits
FROM visits
INNER JOIN vets ON visits.vet_id = vets.id
INNER JOIN animals ON visits.animal_id = animals.id
LEFT JOIN specializations ON vets.id = specializations.vet_id 
AND animals.species_id = specializations.species_id
WHERE specializations.species_id IS NULL;
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) AS num_visits
FROM visits
INNER JOIN animals ON visits.animal_id = animals.id
INNER JOIN species ON animals.species_id = species.id
WHERE visits.vet_id IN (SELECT id FROM vets WHERE name = 'Maisy Smith')
GROUP BY species.name
ORDER BY num_visits DESC
LIMIT 1;

// Vet clinic database: database performance audit

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- [X] decrease the execution time
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4; 
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';