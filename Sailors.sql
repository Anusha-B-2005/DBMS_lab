DROP database  if exists Sailors;
CREATE database Sailors;
USE Sailors;

CREATE TABLE SAILORS(
    sid INT PRIMARY KEY ,
    sname VARCHAR(20) NOT NULL,
    rating INT,
    age INT,
    check(rating>=1 AND rating<=10)
);

CREATE TABLE BOAT(
    bid INT PRIMARY KEY,
    bname VARCHAR(10) NOT NULL,
    color VARCHAR(10) NOT NULL
);

CREATE TABLE RSERVERS(
    sid INT,
    bid INT,
    FOREIGN KEY(sid) REFERENCES SAILORS(sid) ON DELETE CASCADE,
    FOREIGN KEY(bid) REFERENCES BOAT(bid) ON DELETE CASCADE,
    date DATE
);

INSERT INTO SAILORS VALUES (001, 'Albert', 5, 23);
INSERT INTO SAILORS VALUES (002, 'Bhargav', 4, 25);
INSERT INTO SAILORS VALUES (003, 'Charan', 9, 36);
INSERT INTO SAILORS VALUES (004, 'Astorm', 8.5, 25);
INSERT INTO SAILORS VALUES (005, 'Hello storm', 10, 20);

SELECT * FROM SAILORS;

INSERT INTO BOAT VALUES (5001, 'Kayak', 'White');
INSERT INTO BOAT VALUES (5002, 'Jon', 'Grey');
INSERT INTO BOAT VALUES (103, 'Deck', 'White');
INSERT INTO BOAT VALUES (5004, 'Canoe', 'Green');
INSERT INTO BOAT VALUES (5005, 'Windsurf', 'Blue');

SELECT * FROM BOAT;

INSERT INTO RSERVERS VALUES (001, 103, '2024-12-12');
INSERT INTO RSERVERS VALUES (001, 5001, '2024-10-12');
INSERT INTO RSERVERS VALUES (001, 5002, '2024-02-12');
INSERT INTO RSERVERS VALUES (001, 5004, '2024-03-12');
INSERT INTO RSERVERS VALUES (001, 5005, '2024-04-12');
INSERT INTO RSERVERS VALUES (003, 103, '2024-12-12');
INSERT INTO RSERVERS VALUES (002, 5005, '2024-11-12');
INSERT INTO RSERVERS VALUES (004, 103, '2024-12-10');
INSERT INTO RSERVERS VALUES (004, 5004, '2024-11-11');

SELECT * FROM RSERVERS;

--Find the colours of boats reserved by Albert
SELECT color 
FROM SAILORS s, BOAT b, RSERVERS r 
WHERE s.sid=r.sid AND b.bid=r.bid AND s.sname='Albert';

--Find all sailor id's of sailors who have a rating of at least 8 or reserved boat 103
(SELECT s.sid FROM SAILORS s
WHERE s.rating<=8)
UNION 
(SELECT r.sid FROM RSERVERS r
WHERE r.bid=103);

--Find the names of sailors who have not reserved a boat whose name contains the string "storm". Order the names in ascending order.
SELECT s.sname FROM SAILORS s
WHERE s.sid NOT IN
(SELECT sa.sid FROM SAILORS sa, RSERVERS rs 
WHERE sa.sid=rs.sid AND sa.sname LIKE '%storm')
AND s.sname LIKE '%storm%';

--Find the names of sailors who have reserved all boats.
SELECT s.sname FROM SAILORS s WHERE NOT EXISTS
    (SELECT * FROM BOAT b WHERE NOT EXISTS 
        (SELECT * FROM RSERVERS r WHERE r.bid=b.bid AND s.sid=r.sid));
