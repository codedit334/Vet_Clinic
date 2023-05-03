/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
  ('Agumon', '2020-02-03', 0, TRUE, 10.23),
  ('Gabumon', '2018-11-15', 2, TRUE, 8),
  ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
  ('Devimon', '2017-05-12', 5, TRUE, 11);


-- Project 2

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) 
VALUES ('Charmander', '2020-02-08', -11, false, 0, ''),
       ('Plantmon', '2021-11-15', -5.7, true, 2, ''),
       ('Squirtle', '1993-04-02', -12.13, false, 3, ''),
       ('Angemon', '2005-06-12', -45, true, 1, ''),
       ('Boarmon', '2005-06-07', 20.4, true, 7, ''),
       ('Blossom', '1998-10-13', 17, true, 3, ''),
       ('Ditto', '2022-05-14', 22, true, 4, '');


-- Project 3

INSERT INTO owners (full_nam, age)
VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);


INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon');


UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Digimon') -- Or you can hardcode the species_id here which I wouldn't recommend --
   WHERE name like '%mon';

UPDATE animals
   SET species_id = (SELECT id from species WHERE name = 'Pokemon')
   WHERE species_id IS NULL;

UPDATE animals
 SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
   WHERE name = 'Agumon';
-- With more animals  you may say for example--

UPDATE animals
 SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
  WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
 SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
  WHERE name = 'Devimon' OR name = 'Plantmon';

  UPDATE animals
 SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
  WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
 SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
  WHERE name = 'Angemon' OR name = 'Boarmon';