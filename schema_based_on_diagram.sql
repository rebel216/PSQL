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


CREATE TABLE invoices (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT
);


CREATE TABLE invoices_items(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT,
	treatment_id INT
);

ALTER TABLE
	medical_histories
ADD
	CONSTRAINT fk_patients FOREIGN KEY(patient_id) REFERENCES patients(id);

ALTER TABLE
	invoices
ADD
	CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id);

ALTER TABLE
	invoices_items
ADD
	CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id);

ALTER TABLE
	invoices_items
ADD
	CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id);

CREATE TABLE join_table_medical_histories_treatments (
	medical_histories_id INT REFERENCES medical_histories(id),
	treatments_id INT REFERENCES treatments(id)
);


CREATE INDEX patient_id ON medical_histories (patient_id);

CREATE INDEX medical_history_id ON invoices (medical_history_id);

CREATE INDEX invoice_id ON invoices_items (invoice_id);

CREATE INDEX treatment_id ON invoices_items (treatment_id);

CREATE INDEX join_table_medical_histories_treatments_id ON medical_history_treatment(medical_history_id);

CREATE INDEX medical_history_treatment_treatment_id ON medical_history_treatment(treatment_id);