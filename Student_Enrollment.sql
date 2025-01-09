DROP DATABASE if exists Student_Enrollment;
CREATE DATABASE Student_Enrollment;
USE Student_Enrollment;

CREATE TABLE Student(
    regno VARCHAR(10) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    bdate DATE NOT NULL
);

CREATE TABLE Course(
    course INT PRIMARY KEY,
    cname VARCHAR(40) NOT NULL,
    dept VARCHAR(40) NOT NULL
);

CREATE TABLE Enroll(
    regno VARCHAR(10),
    course INT NOT NULL,
    sem INT NOT NULL,
    marks INT NOT NULL,
    FOREIGN KEY(regno) REFERENCES Student(regno) ON DELETE CASCADE,
    FOREIGN KEY(course) REFERENCES Course(course) ON DELETE CASCADE
);

CREATE TABLE book_adoption(
    course INT,
    sem INT NOT NULL,
    book_ISBN INT NOT NULL,
    FOREIGN KEY(course) REFERENCES Course(course) ON DELETE CASCADE
);

CREATE TABLE text(
    book_ISBN INT NOT NULL,
    book_title VARCHAR(30) NOT NULL,
    publisher VARCHAR(30) NOT NULL,
    author VARCHAR(20) NOT NULL
);

insert into Student values ('59STD001', 'Amrutha', '1998-12-20');
insert into Student values ('59STD019', 'Aniruddh', '1998-02-22');
insert into Student values ('59STD020', 'Avinash', '1999-01-02');
insert into Student values ('59STD100', 'Akshatha', '1998-11-11');
insert into Student values ('59STD034', 'Amulya', '1998-05-20');
select * from student;

insert into Course values (001, 'Data Science', 'Computer Science');
insert into Course values (002, 'Artificial Intelligence', 'Computer Science');
insert into Course values (003, 'Sensors', 'Electronics and communication');
insert into Course values (004, 'Operating System', 'Information Science');
insert into Course values (005, 'Computer Networks', 'Computer Science');
select * from Course;

insert into Enroll values ('59STD019', 001, 3, 100);
insert into Enroll values ('59STD020', 002, 3, 90);
insert into Enroll values ('59STD100', 003, 5, 99);
insert into Enroll values ('59STD034', 004, 6, 80);
insert into Enroll values ('59STD001', 005, 3, 95);
select * from Enroll;

insert into book_adoption values(001, 3, 10054);
insert into book_adoption values(002, 5, 10152);
insert into book_adoption values(003, 4, 10520);
insert into book_adoption values(004, 3, 10200);
insert into book_adoption values(005, 3, 10023);
select * from book_adoption;

insert into text values (10054, 'Introduction to DS', 'PQR', 'ABC');
insert into text values (10152, 'Introduction to Ai', 'PQR', 'ABC');
insert into text values (10520, 'Introduction to Sensors', 'PQR', 'ABC');
insert into text values (10200, 'Introduction to OS', 'PQR', 'ABC');
insert into text values (10023, 'Introduction to CN', 'PQR', 'ABC');
select * from text;
