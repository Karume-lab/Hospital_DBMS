USE hosi;

CREATE TABLE IF NOT EXISTS Physicians (
    physician_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    contact_no VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Wards (
    ward_id INT PRIMARY KEY,
    ward_name VARCHAR(50),
    ward_type VARCHAR(50),
    ward_capacity INT
);


CREATE TABLE IF NOT EXISTS Incharge (
    incharge_id INT PRIMARY KEY,
    iscurrent BOOLEAN,
    date_removed DATE,
    physician_id INT,
    ward_id INT,
    FOREIGN KEY (physician_id) REFERENCES Physicians (physician_id),
    FOREIGN KEY (ward_id) REFERENCES Wards (ward_id)
);