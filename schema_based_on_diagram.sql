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
