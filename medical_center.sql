DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center

CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100)
);

CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATA
);

CREATE TABLE Visits (
    visit_id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES Doctors(doctor_id),
    patient_id INT REFERENCES Patients(patient_id),
    date DATE,
    notes TEXT
);

CREATE TABLE Diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE VisitDiseases (
    visit_id INT REFERENCES Visits(visit_id),
    disease_id INT REFERENCES Diseases(disease_id),
    PRIMARY KEY (visit_id, disease_id)
);

INSERT INTO Doctors (name, specialty) VALUES
('Dr. Alice Johnson', 'Cardiology'),
('Dr. Bob Smith', 'Dermatology'),
('Dr. Charles Lee', 'Neurology'),
('Dr. Dana Walsh', 'Pediatrics');

INSERT INTO Patients (name, date_of_birth) VALUES
('John Doe', '1985-01-01'),
('Jane Boe', '1990-05-15'),
('Jim Bean', '1978-07-20'),
('Jill Hill', '2000-12-30');

INSERT INTO Visits (doctor_id, patient_id, date, notes) VALUES
(1, 2, '2023-12-01', 'Annual cardiac exam - all good'),
(2, 2, '2023-12-03', 'Routine skin check - follow up needed'),
(3, 3, '2023-12-05', Migraine consult - prescribed medication),
(4, 4, '2023-12-08', 'Regular pediatric checkup');

INSERT INTO Diseases (name) VALUES
('Hypertension'),
('Eczema'),
('Epilepsy'),
('Asthma');

INSERT INTO VisitDiseases (visit_id, disease_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);