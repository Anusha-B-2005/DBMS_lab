DROP DATABASE if exists Company;
CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee(
    ssn VARCHAR(20) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(100) ,
    sex VARCHAR(10) NOT NULL,
    salary INT NOT NULL,
    superSSN VARCHAR(20) NOT NULL,
    DNo VARCHAR(10)
);

CREATE TABLE Department(
    DNo VARCHAR(10) PRIMARY KEY,
    DName VARCHAR(20) NOT NULL,
    mgrSsn VARCHAR(20) NOT NULL,
    mgrStartDate DATE,
    FOREIGN KEY(mgrSsn) REFERENCES Employee(ssn)
);

CREATE TABLE Dlocation(
    DNo VARCHAR(10) NOT NULL,
    Dloc VARCHAR(30),
    FOREIGN KEY(DNo) REFERENCES Department(DNo) 
);

CREATE TABLE Project(
    PNo VARCHAR(20) PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    Plocation VARCHAR(100) NOT NULL,
    DNo VARCHAR(10) NOT NULL,
    FOREIGN KEY(DNo) REFERENCES Department(DNo) 
);

CREATE TABLE Works_on(
    ssn VARCHAR(20) NOT NULL,
    PNo VARCHAR(20) NOT NULL,
    Hours INT DEFAULT 0,
    FOREIGN KEY(ssn) REFERENCES Employee(ssn),
    FOREIGN KEy(PNo) REFERENCES Project(PNo)
);

INSERT INTO Employee VALUES ('50EMP0001', 'Aravind', 'Address 1', 'Male', 65000, '50EMP0001', 'D01');
INSERT INTO Employee VALUES ('50EMP0002', 'Akshatha', 'Address 2', 'Female', 85000, '50EMP002', 'D02');
INSERT INTO Employee VALUES ('50EMP0003', 'Aniruddh', 'Address 3', 'Male', 95000, '50EMP0001', 'D03');
INSERT INTO Employee VALUES ('50EMP0004', 'Aravind Aru', 'Address 4', 'Male', 45000, '50EMP0002', 'D04');
INSERT INTO Employee VALUES ('50EMP0005', 'Anjali', 'Address 5', 'Feale', 55000, '50EMP0005', 'D05');

SELECT * FROM Employee;

INSERT INTO Department VALUES ('D01', 'Finance department', '50EMP0001', '2020-02-02');
INSERT INTO Department VALUES ('D02', 'Human Resources', '50EMP0003', '2019-05-02');
INSERT INTO Department VALUES ('D03', 'Data Entry', '50EMP0005', '2022-12-15');
INSERT INTO Department VALUES ('D04', 'Accounts', '50EMP0004', '2020-12-02');
INSERT INTO Department VALUES ('D05', 'Quality Assessment', '50EMP0002', '2018-12-12');

SELECT * FROM Department;

INSERT INTO Dlocation VALUES ('D01', 'Industrial Area, Davanagere');
INSERT INTO Dlocation VALUES ('D02', 'KuvempuNagar, Mysuru');
INSERT INTO Dlocation VALUES ('D02', 'SaraswathiPuram, Hassan');
INSERT INTO Dlocation VALUES ('D02', 'VidyaranyaPuam, Haveri');
INSERT INTO Dlocation VALUES ('D02', 'Nelamagala, Bangaluru');

SELECT * FROM Dlocation;

INSERT INTO Project VALUES ('P0001', 'Project1', 'Industrial Area, Davanagere', 'D01');
INSERT INTO Project VALUES ('P0002', 'Project2', 'KuvempuNagar, Mysuru', 'D02');
INSERT INTO Project VALUES ('P0003', 'Project3', 'SaraswathiPuram, Hassan', 'D03');
INSERT INTO Project VALUES ('P0004', 'Project4', 'VidyaranyaPuam, Haveri', 'D04');
INSERT INTO Project VALUES ('P0005', 'Project5', 'Nelamagala, Bangaluru', 'D05');

SELECT * FROM Project;

INSERT INTO Works_on VALUES ('50EMP0001', 'P0003', 4);
INSERT INTO Works_on VALUES ('50EMP0004', 'P0002', 7);
INSERT INTO Works_on VALUES ('50EMP0003', 'P0004', 6);
INSERT INTO Works_on VALUES ('50EMP0005', 'P0005', 6);
INSERT INTO Works_on VALUES ('50EMP0002', 'P0001', 5);

SELECT * FROM Works_on;
