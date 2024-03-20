-- Active: 1709715050729@@127.0.0.1@3306
/*
 PATIENT:
 patient ID (Primary Key)
 name VARCHAR
 
 ADMIT:
 admit ID (Primary Key)
 patient ID (Foreign Key)
 physician ID (Foreign Key)
 ward ID (Foreign Key) OPTIONAL FIELD
 discharge date OPTIONAL FIELD
 admission date
 isActive
 
 INSURANCE:
 insurance ID (Primary Key)
 isActive
 type VARCHAR
 patient ID (Foreign Key)
 insurance number VARCHAR
 provider VARCHAR
 
 PHYSICIAN:
 physician ID (Primary Key)
 name
 specialty VARCHAR
 
 MEDICAL TEST:
 medical test ID (Primary Key)
 physician ID (Foreign Key)
 name
 date tested
 cost
 results
 name
 
 WARD:
 ward ID (Primary Key)
 physician ID
 name
 type VARCHAR
 capacity
 isAvailable
 
 TREATMENT DETAIL:
 treatment ID (Primary Key)
 patient ID (Foreign Key)
 physician ID (Foreign Key)
 results
 
 INCHARGE DETAILS:
 incharge ID (Primary Key)
 physician ID (Foreign Key)
 ward ID (Foreign Key)
 date removed
 isCurrent
 
 */
USE hospital;

DESCRIBE Ward;

SELECT
    *
FROM
    Admit;

SELECT
    *
FROM
    Ward;

SELECT
    *
FROM
    Patient;

SELECT
    pt.patientID AS patient_id,
    ps.physicianID as physician_id,
    pt.name AS patient_name,
    ps.name AS physician_name,
    mt.name AS medical_test_name
FROM
    Patient AS pt
    LEFT JOIN MedicalTest AS mt ON pt.patientID = mt.patientID
    LEFT JOIN Physician AS ps ON ps.physicianID = mt.physicianID
WHERE
    ps.physicianID > 5;

SELECT
    pa.name AS "Patient Name",
    ph.name AS "Admitted By",
    ad.admissionDate AS "Date Admitted",
    ad.dischargeDate AS "Date Discharged",
    mt.name AS "Medical Test Name",
    mt.dateTested AS "Date Tested",
    mt.results AS "Medical Test Results",
    mt.cost AS "Cost of the Medical Test"
FROM
    Patient AS pa
    RIGHT JOIN MedicalTest AS mt ON pa.patientID = mt.patientID
    RIGHT JOIN Admit AS ad ON pa.patientID = ad.patientID
    RIGHT JOIN Physician AS ph ON ad.physicianID = ph.PhysicianID
    RIGHT JOIN Insurance AS ins ON pa.patientID = ins.patientID
ORDER BY
    mt.cost DESC;

SELECT
    *
FROM
    Patient
    CROSS JOIN Admit
    CROSS JOIN Insurance;

SELECT
    *
FROM
    Patient
    JOIN Admit ON Patient.patientID = Admit.patientID
    JOIN Insurance ON Patient.patientID = Insurance.patientID;

SELECT
    *
FROM
    Patient
    RIGHT JOIN Admit ON Patient.patientID = Admit.patientID
    RIGHT JOIN Insurance ON Patient.patientID = Insurance.patientID;

SELECT
    *
FROM
    Patient
    LEFT JOIN Admit ON Patient.patientID = Admit.patientID
    LEFT JOIN Insurance ON Patient.patientID = Insurance.patientID;

SELECT
    *
FROM
    Patient
    INNER JOIN Admit ON Patient.patientID = Admit.patientID
    INNER JOIN Insurance ON Patient.patientID = Insurance.patientID;

SELECT
    *
FROM
    MedicalTest AS mt;

SELECT
    *
FROM
    Physician;

SELECT
    *
FROM
    InchargeDetails;

SELECT
    *
FROM
    Insurance;

SELECT
    *
FROM
    TreatmentDetail;

CREATE TABLE Test(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO
    Test (firstName)
VALUES
    ("Daniel"),
    ("John"),
    ("Jane"),
    ("Mary"),
    ("Karume");

SELECT
    *
FROM
    Test;

ALTER TABLE
    Test2 RENAME COLUMN id to test2ID;

CREATE TABLE IF NOT EXISTS Test2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(50)
);

ALTER TABLE
    Test2
ADD
    FOREIGN KEY (id) REFERENCES Test2(id);

INSERT INTO
    Test2 (lastName)
VALUES
    ("Daniel"),
    ("John"),
    ("Jane"),
    ("Mary"),
    ("Karume");

SELECT
    t.firstName,
    t2.lastName
FROM
    Test AS t
    LEFT JOIN Test2 AS t2 ON t.testID = t2.test2ID;

SELECT
    t.firstName,
    t2.lastName
FROM
    Test2 AS t2
    LEFT JOIN Test AS t ON t.testID = t2.test2ID;

SELECT
    t.firstName,
    t2.lastName
FROM
    Test AS t
    INNER JOIN Test2 AS t2 ON t.testID = t2.test2ID;

SELECT
    t.firstName,
    t2.lastName
FROM
    Test2 AS t2
    INNER JOIN Test AS t ON t.testID = t2.test2ID;

SELECT
    t.firstName,
    t2.lastName
FROM
    Test AS t
    RIGHT JOIN Test2 AS t2 ON t.testID = t2.test2ID;

SELECT
    t.firstName,
    t2.lastName
FROM
    Test2 AS t2
    RIGHT JOIN Test AS t ON t.testID = t2.test2ID;

SELECT
    *
FROM
    Test;

DELETE FROM
    Test;

DESCRIBE Test;

SHOW TABLES;




