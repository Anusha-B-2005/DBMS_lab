Drop DATABASE if exists Order_Processing;
CREATE DATABASE Order_Processing;
Use Order_Processing;

CREATE TABLE Customer(
    cust INT PRIMARY KEY,
    cname VARCHAR(30),
    city VARCHAR(30)
);

CREATE TABLE Orderp(
    orderp INT PRIMARY KEY,
    odate DATE,
    cust INT NOT NULL,
    order_amout INT,
    FOREIGN KEY(cust) REFERENCES Customer(cust) ON DELETE CASCADE
);

CREATE TABLE item(
    item INT PRIMARY KEY,
    unitprice INT 
);

CREATE TABLE order_item(
    orderp INT,
    item INT,
    qty INT,
    FOREIGN KEY(orderp) REFERENCES Orderp(orderp) ON DELETE CASCADE,
    FOREIGN KEY(item) REFERENCES item(item) ON DELETE CASCADE
);

CREATE TABLE warehouse(
    warehouse INT PRIMARY KEY,
    city VARCHAR(30)
);

CREATE TABLE shipment(
    orderp INT,
    warehouse INT PRIMARY KEY,
    ship_date DATE,
    FOREIGN KEY(orderp) REFERENCES Orderp(orderp) ON DELETE CASCADE
);

insert into Customer values(0001, 'Arjun', 'Mysuru');
insert into Customer values(0002, 'Vikram', 'Mandya');
insert into Customer values(0003, 'Vijay', 'Madikere');
insert into Customer values(0004, 'Trishul', 'Hassan');
insert into Customer values(0005, 'Triveni', 'Haveri');
select * from Customer;

insert into Orderp VALUES
(001, '2020-11-11', 0001, 2000),
(002, '2019-12-12', 0002, 5000),
(003, '2020-08-08', 0003, 4000),
(004, '2019-09-09', 0004, 5000),
(005, '2012-12-12', 0005, 3000);
select * from Orderp;

insert into item values 
(0001, 200), (0002, 400), (0003, 500), (0004, 300), (0005, 100);
select * from item;

insert into order_item values 
(001, 0001, 2), (002, 0002, 3), (003, 0003, 4), (004, 0004, 5), (005, 0005, 6);
select * from order_item;

insert into warehouse values 
(0001, 'Mysuru'),
(0002, 'KrishnaRaja Nagar'),
(0003, 'KrishnaRaja Pet'),
(0004, 'Tumakuru'),
(0005, 'Bangaluru');
select * from warehouse;

insert into shipment values 
(001, 0003, '2020-12-12'),
(002, 0005, '2020-11-11'),
(003, 0001, '2020-10-10'),
(004, 0004, '2020-09-09'),
(005, 0002, '2020-08-08');
select * from shipment;
