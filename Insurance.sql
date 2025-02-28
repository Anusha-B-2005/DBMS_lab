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
    model VARCHAR(10) NOT NULL,
    year INT
);

CREATE TABLE ACCIDENT(
    report_number INT PRIMARY KEY,
    acc_date DATE NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE OWNS(
    driver_id VARCHAR(20) NOT NULL,
    regno VARCHAR(20) NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES PERSON (driver_id) ON DELETE CASCADE,
    FOREIGN KEY (regno) REFERENCES CAR (regno) ON DELETE CASCADE
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(10),
    regno VARCHAR(20) NOT NULL,
    report_number INT NOT NULL,
    damage_amout INT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES PERSON (driver_id) ON DELETE CASCADE
);

INSERT INTO PERSON VALUES ('D101', 'Aravind', 'Jayanagar, Shivamogga');
INSERT INTO PERSON VALUES ('D201', 'Avinash', 'Kuvempnagar, Mysuru');
INSERT INTO PERSON VALUES ('D301', 'Akshatha', 'saraswathiPuram, Hassan');
INSERT INTO PERSON VALUES ('D401', 'Anuradha', 'Devaraj Aras Nagar, Davanagere');
INSERT INTO PERSON VALUES ('D501', 'Akil', 'VijayNagar, Mysuru');
SELECT * FROM PERSON;

INSERT INTO CAR VALUES ('KA-20-PQ-1234', 'Honda', 2012);
INSERT INTO CAR VALUES ('KA-22-PR-1256', 'Hyundai', 2012);
INSERT INTO CAR VALUES ('KA-25-PS-1278', 'Toyota', 2012);
INSERT INTO CAR VALUES ('KA-28-PT-1289', 'Kia', 2012);
INSERT INTO CAR VALUES ('KA-25-PU-1245', 'Renault', 2012);
SELECT * FROM CAR;

INSERT INTO ACCIDENT VALUES (123564, '2020-11-15','Gandhi nagar, bengaluru');
INSERT INTO ACCIDENT VALUES (147852, '2021-08-12','KuvempuNagar, Mysuru');
INSERT INTO ACCIDENT VALUES (963258, '2022-01-21', 'Hosa nagar, Mandya');
INSERT INTO ACCIDENT VALUES (212121, '2020-12-15', 'VirajPet, Haveri');
INSERT INTO ACCIDENT VALUES (529856, '2012-12-12', 'Kokila nagar, Bidar');
SELECT * FROM ACCIDENT;

INSERT INTO OWNS VALUES 
('D101', 'KA-20-PQ-1234'),
('D201', 'KA-22-PR-1256'),
('D301', 'KA-25-PS-1278'),
('D401', 'KA-28-PT-1289'),
('D501', 'KA-25-PU-1245');
SELECT * FROM OWNS;

INSERT INTO PARTICIPATED VALUES
('D101', 'KA-20-PQ-1234', 123456, 200000),
('D201', 'KA-22-PR-1256', 147852, 205000),
('D301', 'KA-25-PS-1278', 963258, 330000),
('D401', 'KA-28-PT-1289', 212121, 100000),
('D501', 'KA-25-PU-1245', 529856, 150000);
SELECT * FROM PARTICIPATED;
