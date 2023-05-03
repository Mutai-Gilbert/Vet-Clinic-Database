/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

--Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';

--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

--List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

--List the names and weights of all animals that are heavier than 10.5 kg.
SELECT name, escape_attempts FROM animals WHERE  weight_kg > 10.5;

--Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;


SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

// Inside a transaction update the animals table by setting the species column to unspecified. 
//Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

// Inside a transaction:
//Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
//Update the animals table by setting the species column to pokemon for all animals that dont have species already set.
//Commit the transaction.
//Verify that change was made and persists after commit.

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

SELECT * FROM animals;