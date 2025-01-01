DROP DATABASE if exists Student_Enrollment;
CREATE DATABASE Student_Enrollment;
USE Student_Enrollment;

CREATE TABLE Student(
    regno VARCHAR(10) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    major VARCHAR(50) NOT NULL,
    bdate DATE NOT NULL
);

CREATE TABLE Course(
    course INT PRIMARY KEY,
    cname VARCHAR(40) NOT NULL,
    dept VARCHAR(40) NOT NULL
);

CREATE TABLE Enroll(
    regno VARCHAR(10),
    course INT,
    sem INT NOT NULL,
    marks INT NOT NULL,
    FOREIGN KEY(regno) REFERENCES Student(regno),
    FOREIGN KEY(course) REFERENCES Course(course)
);

CREATE TABLE book_adoption(
    course INT,
    sem INT NOT NULL,
    book_ISBN INT NOT NULL,
    FOREIGN KEY(course) REFERENCES Course(course)
);

CREATE TABLE text(
    book_ISBN INT NOT NULL,
    book_title VARCHAR(30) NOT NULL,
    publisher VARCHAR(30) NOT NULL,
    author VARCHAR(20) NOT NULL
);
