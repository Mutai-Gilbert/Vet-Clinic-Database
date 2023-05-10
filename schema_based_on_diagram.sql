CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
	name VARCHAR(120),
	date_of_birth DATE
);

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY,
	admmitted_at TIMESTAMP,
	patient_id INTEGER, 
	FOREIGN KEY (patient_id) REFERENCES patients(id),
	status VARCHAR(255)
);