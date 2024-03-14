USE hosi;

CREATE TABLE IF NOT EXISTS Physician (
  Physician_Id INT AUTO_INCREMENT,
  Name VARCHAR(100),
  Specialty VARCHAR(100),
  PRIMARY KEY (Physician_Id)
);

CREATE TABLE IF NOT EXISTS Patient (
  Patient_Id INT AUTO_INCREMENT,
  Name VARCHAR(100),
  PRIMARY KEY (Patient_Id)
);

CREATE TABLE IF NOT EXISTS Treatment_Detail (
  Treatment_Detail_Id INT AUTO_INCREMENT,
  Date DATE,
  Time TIME,
  Results TEXT,
  Physician_Id INT,
  Patient_Id INT,
  PRIMARY KEY (Treatment_Detail_Id),
  FOREIGN KEY (Physician_Id) REFERENCES Physician(Physician_Id),
  FOREIGN KEY (Patient_Id) REFERENCES Patient(Patient_Id)
);