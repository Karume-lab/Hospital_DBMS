CREATE TABLE Patient(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    physician_id INT,
    insurance_id INT,
    FOREIGN KEY (physician_id) REFERENCES Physician(id) ON UPDATE CASCADE
);
INSERT INTO Patient (name, physician_id, insurance_id)
VALUES ('John Doe', 1, 1),
    ('Jane Smith', 2, 2),
    ('Michael Johnson', 3, 3),
    ('Emily Davis', 4, 4),
    ('David Wilson', 5, 5),
    ('Sophia Moore', 6, 6),
    ('Christopher Taylor', 7, 7),
    ('Olivia Anderson', 8, 8),
    ('Daniel Brown', 9, 9),
    ('Emma Garcia', 10, 10),
    ('Ethan Rodriguez', 11, 11),
    ('Ava Martinez', 12, 12),
    ('Matthew Robinson', 13, 13),
    ('Isabella Walker', 14, 14),
    ('Andrew Young', 15, 15),
    ('Mia Turner', 16, 16),
    ('William Harris', 17, 17),
    ('Amelia Lee', 18, 18),
    ('James White', 19, 19),
    ('Sophie Moore', 20, 20);