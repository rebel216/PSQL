/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name VARCHAR (50),
    date_of_birth DATE,
    escape_attempts smallint,
    neutered boolean,
    weight_kg float(2)
    );
