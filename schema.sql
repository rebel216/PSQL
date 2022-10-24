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

-- Create a "join table" called specializations
CREATE TABLE specializations (
    species_id INT REFERENCES species(id),
    vet_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
    animals_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    date_of_visit DATE
);

/*added email table.*/
ALTER TABLE
    owners
ADD
    COLUMN email VARCHAR(120);

CREATE INDEX animals_id_asc ON visits(animals_id ASC);

CREATE INDEX vet_id_asc ON visits(vet_id ASC);

CREATE INDEX owners__email_asc ON owners(email ASC);

/* ALter table owners */
ALTER TABLE owners ADD COLUMN email VARCHAR(120);