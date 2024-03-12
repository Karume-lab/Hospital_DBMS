CREATE DATABASE IF NOT EXISTS test;
use test;
BEGIN;

---------------------------------
-- ADDED FOR TESTING PURPOSES
---------------------------------
CREATE TABLE IF NOT EXISTS Patient(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

INSERT INTO Patient (first_name)
VALUES 
("John"),
("Mathew"),
("Mark"),
("Peter");

---------------------------------
-- END
---------------------------------






CREATE TABLE IF NOT EXISTS Insurance(
    id INT PRIMARY KEY AUTO_INCREMENT,
    provider VARCHAR(50) NOT NULL,
    insurance_type VARCHAR(50),
    insurance_number VARCHAR(50),
    is_active BOOLEAN DEFAULT true,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(id)

);
---------------------------------
-- CREATE OPERATIONS
---------------------------------

-- Inserting values for all columns
INSERT INTO Insurance (provider, insurance_type, insurance_number, is_active, patient_id)
VALUES ('Britam', 'Health Insurance', 'ABC123', true, 1);

-- Inserting values for specific columns
INSERT INTO Insurance (provider, insurance_type, patient_id)
VALUES ('Jubilee', 'Car Insurance', 2);

-- Inserting values with default for is_active column
INSERT INTO Insurance (provider, insurance_type, insurance_number, is_active, patient_id)
VALUES 
    ('NHIF', 'Inactive Health Insurance', 'SFSDFAD', false, 3),
    ('Britam', 'Inactive Insurance', 'XYZ45FSDF6', false, 4);
---------------------------------
-- READ OPERATIONS
---------------------------------

-- READ ALL ENTRIES
SELECT
    id,
    provider,
    insurance_type,
    insurance_number,
    IF(is_active, 'true', 'false') AS is_active,
    patient_id
FROM
    Insurance;

-- READ ACTIVE Insurances only
SELECT
    id,
    provider,
    insurance_type,
    insurance_type,
    IF(is_active, "true", "false") AS is_active,
    patient_id
FROM Insurance
WHERE is_active IS true;

-- READ INACTIVE Insurances only
SELECT
    id,
    provider,
    insurance_type,
    insurance_type,
    IF(is_active, "true", "false") AS is_active,
    patient_id
FROM Insurance
WHERE is_active IS false;

---------------------------------
-- UPDATE OPERATIONS
---------------------------------

-- Update the insurance_type for a specific insurance record
UPDATE Insurance
SET insurance_type = 'New Insurance Type'
WHERE id = 1;

-- Update the is_active column for all insurance records
UPDATE Insurance
SET is_active = false;

-- Update multiple columns for a specific insurance record
UPDATE Insurance
SET insurance_type = 'New Insurance Type', insurance_number = 'New Insurance Number', provider = "Britam"
WHERE id = 2;

-- Update the is_active column based on a condition
UPDATE Insurance
SET is_active = true
WHERE insurance_type = 'Inactive Insurance';

---------------------------------
-- DELETE OPERATIONS
---------------------------------
-- Delete a record based on the id
DELETE FROM Insurance
WHERE id = 1;




--ALSO TESTING PURPOSES

-- SELECT
--     id,
--     provider,
--     insurance_type,
--     insurance_number,
--     IF(is_active, 'true', 'false') AS is_active,
--     patient_id
-- FROM
--     Insurance;
COMMIT;
