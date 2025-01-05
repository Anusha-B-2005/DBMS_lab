DROP DATABASE if exists Insurance;
CREATE DATABASE Insurance;
USE Insurance;

CREATE TABLE PERSON(
    driver_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE CAR(
    regno VARCHAR(20) PRIMARY KEY,
    model VARCHAR(20) NOT NULL,
    year INT
);

CREATE TABLE ACCIDENT(
    report_number INT PRIMARY KEY,
    acc_date DATE NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE OWNS(
    driver_id VARCHAR(10) NOT NULL,
    regno VARCHAR(10) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES PERSON (driver_id) ON DELETE CASCADE
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(10),
    regno VARCHAR(10) NOT NULL,
    report_number INT NOT NULL,
    damage_amout INT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES PERSON (driver_id) ON DELETE CASCADE
);

INSERT INTO PERSON VALUES ('D101', 'Aravind', 'Jayanagar, Shivamogga');
INSERT INTO PERSON VALUES ('D201', 'Avinash', 'Kuvempnagar, Mysuru');
INSERT INTO PERSON VALUES ('D301', 'Akshatha', 'saraswathiPuram, Hassan');
INSERT INTO PERSON VALUES ('D401', 'Anuradha', 'Devaraj Aras Nagar, Davanagere');
INSERT INTO PERSON VALUES ('D501', 'Akil', 'VijayNagar, Mysuru');

INSERT INTO CAR VALUES ('KA-20-PQ-1234', 'Honda', 2012);
INSERT INTO CAR VALUES ('KA-22-PR-1256', 'Hyundai', 2021);
INSERT INTO CAR VALUES ('KA-25-PS-1278', 'Toyota', 2011);
INSERT INTO CAR VALUES ('KA-28-PT-1289', 'Kia', 2013);
INSERT INTO CAR VALUES ('KA-25-PU-1245', 'Renault', 2022);
