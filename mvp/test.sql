USE hospital;


SHOW tables;

SELECT firstName, lastName FROM Patient;

SELECT firstName, lastName FROM Patient WHERE patientID > 5;
SELECT firstName, lastName FROM Patient WHERE patientID BETWEEN 1 AND 5;

SELECT firstName, lastName FROM Patient WHERE firstName LIKE "J%" OR lastName LIKE "_avis";

SELECT pa.firstName, pa.lastName, wa.name  FROM Admit As ad INNER JOIN Patient as pa on ad.PatientID = pa.PatientID INNER JOIN Ward as wa on ad.wardID = wa.wardID; 
