/*-- Create database from the diagram --*/

CREATE DATABASE medical_clinic;

CREATE TABLE patients (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(255),
	date_of_birth date
);

CREATE TABLE treatments (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	type VARCHAR(255),
	name VARCHAR(255)
);

CREATE TABLE medical_histories (
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(255),
	FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE RESTRICT ON UPDATE CASCADE
);