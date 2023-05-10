CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
	name VARCHAR(120),
	date_of_birth DATE
);
CREATE INDEX name_idx ON patients(name);

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY,
	admmitted_at TIMESTAMP,
	patient_id INTEGER, 
	FOREIGN KEY (patient_id) REFERENCES patients(id),
	status VARCHAR(255)
);
CREATE INDEX patient_id_idx ON medical_histories(patient_id);

CREATE TABLE invoices (
	id SERIAL PRIMARY KEY,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INTEGER,
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);
CREATE INDEX medical_history_id_idx ON medical_histories(medical_history_id);

CREATE TABLE invoices_items (
	id SERIAL PRIMARY KEY,
	unit_price DECIMAL,
	quantity INTEGER,
	total_price DECIMAL,
	invoice_id INTEGER,
	treatment_id INTEGER,
	FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);
CREATE INDEX invoice_id_idx ON invoices_items(invoice_id);

CREATE TABLE treatments (
	id SERIAL PRIMARY KEY,
	type VARCHAR(255),
	name VARCHAR(255)
);
CREATE INDEX name_idx ON treatments(id);

ALTER TABLE invoices_items
ADD CONSTRAINT fk_invoice_id
FOREIGN KEY (treatment_id)
REFERENCES  treatments(id);

CREATE TABLE medical_treatment (
	treatment_id INTEGER,
	medical_histories_id INTEGER,
	PRIMARY KEY (treatment_id, medical_histories_id)
);
CREATE INDEX medical_treatment_idx ON medical_treatment(treatment_id);
