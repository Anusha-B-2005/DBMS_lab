DROP DATABASE if exists Insurance;
CREATE DATABASE Insurance;
USE Insurance;

CREATE TABLE PERSON(
    driver_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE CAR(
    regno VARCHAR(10) PRIMARY KEY,
    model VARCHAR(10) NOT NULL,
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
