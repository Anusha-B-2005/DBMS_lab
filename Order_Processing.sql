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
    cust INT,
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
