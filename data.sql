/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Agumon','2020-06-03',0,TRUE,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Gabumon','2018-11-15',2,TRUE,8);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Pikachu','2021-01-07',1,FALSE,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Devimon','2020-06-03',5,TRUE,11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Charmander','2020-02-08',0,FALSE,-11);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Plantmon','2021-11-15',2,TRUE,-5.7);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Squirtle','1993-04-02',3,FALSE,-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Angemon','2005-06-12',1,FALSE,-45);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Boarmon','2005-07-07',7,TRUE,20.4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Blossom','1998-10-13',3,TRUE,17);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg ) VALUES ('Ditto','2022-05-14',4,TRUE,22);



INSERT INTO owners (full_name,age ) VALUES ('Sam Smith',34);
INSERT INTO owners (full_name,age ) VALUES ('Jennifer Orwell',19);
INSERT INTO owners (full_name,age ) VALUES ('Bob',45);
INSERT INTO owners (full_name,age ) VALUES ('Melody Pond',77);
INSERT INTO owners (full_name,age ) VALUES ('Dean Winchester',14);
INSERT INTO owners (full_name,age ) VALUES ('Jodie Whittaker',38);


INSERT INTO species (name ) VALUES ('Pokemon');
INSERT INTO species (name ) VALUES ('Digimon');

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Agumon','2020-06-03',0,TRUE,10.23,2,1);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Gabumon','2018-11-15',2,TRUE,8,2,2);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Pikachu','2021-01-07',1,FALSE,15.04,1,2);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Devimon','2020-06-03',5,TRUE,11,2,3);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id) VALUES ('Charmander','2020-02-08',0,FALSE,-11,1,4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Plantmon','2021-11-15',2,TRUE,-5.7,2,3);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Squirtle','1993-04-02',3,FALSE,-12.13,1,4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Angemon','2005-06-12',1,FALSE,-45,2,5);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Boarmon','2005-07-07',7,TRUE,20.4,2,5);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Blossom','1998-10-13',3,TRUE,17,1,4);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg,species_id,owner_id ) VALUES ('Ditto','2022-05-14',4,TRUE,22,1);

