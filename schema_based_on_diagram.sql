CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name TEXT,
  date_of_birth date
)

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  CONSTRAINT fk_medical_history
  FOREIGN KEY (medical_history_id) 
  REFERENCES medical_histories(id)
)

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  CONSTRAINT fk_invoice 
  FOREIGN KEY (invoice_id) 
  REFERENCES invoices(id),
  CONSTRAINT fk_treatment 
  FOREIGN KEY (treatment_id) 
  REFERENCES treatments(id)
)

CREATE TABLE medical_history (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(255),
  CONSTRAINT fk_patient
  FOREIGN KEY(patient_id)
  REFERENCES patients(id)
)

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255),
)

CREATE TABLE treatments_history (
  treatment_id INT,
  medical_history_id INT,
  CONSTRAINT fk_tr FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE,
  CONSTRAINT fk_mh FOREIGN KEY(medical_history_id) REFERENCES medical_history(id) ON DELETE CASCADE
);

CREATE INDEX patient_id_index ON medical_histories(patient_id);
CREATE INDEX medical_id_index ON invoices(medical_history_id);
CREATE INDEX invoice_id_index ON invoice_items(invoice_id);
CREATE INDEX treat_id_index ON invoice_items(treatment_id);
CREATE INDEX treatment_id_index ON treatments_history(treatment_id)
CREATE INDEX medical_history_index ON treatments_history(medical_history_id)
