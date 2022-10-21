/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    date_of_birth DATE,
    escape_attempts smallint,
    neutered boolean,
    weight_kg float(2),
    species_id integer ,
    FOREIGN KEY (species_id) REFERENCES species(id),
    owner_id integer ,
    FOREIGN KEY (owner_id) REFERENCES owners(id)
    );


ALTER TABLE animals ADD species VARCHAR (50) ;


CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR (50),
    age integer
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR (50)
);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    age integer,
    date_of_graduation DATE
);

