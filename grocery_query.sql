-- PART A — Database & Table Creation

-- Create Database

CREATE DATABASE storeDB;
USE storeDB;

-- City Table
CREATE TABLE City (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(city_id)
);

-- Category Table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    category_description VARCHAR(255)
);

-- Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Inventory Table
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT UNIQUE,
    quantity_in_stock INT NOT NULL,
    unit_of_measure VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- OrderItem Table
CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Sales Table
CREATE TABLE Sales (
    transaction_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity_sold INT,
    price DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- PART B - Insert Data
-- CITY
INSERT INTO City VALUES
(1,'London','Capital of England'),
(2,'Manchester','North West England'),
(3,'Birmingham','West Midlands'),
(4,'Leeds','Yorkshire'),
(5,'Bristol','South West England');

-- CATEGORY
INSERT INTO Category VALUES
(1,'Fresh Produce','Fruits and vegetables'),
(2,'Bakery','Bread and baked items'),
(3,'Dairy','Milk and cheese products'),
(4,'Meat & Poultry','Meat products'),
(5,'Beverages','Soft drinks and juices');

-- PRODUCT
INSERT INTO Product VALUES
(101,'British Apples','Fresh apples',2.50,1),
(102,'Bananas','Organic bananas',1.80,1),
(103,'Carrots','Fresh carrots',1.20,1),
(104,'Wholemeal Bread','Wholemeal loaf',1.90,2),
(105,'White Bread','White loaf',1.60,2),
(106,'Cheddar Cheese','Mature cheddar',3.80,3),
(107,'Milk 1L','Semi-skimmed milk',1.25,3),
(108,'Yogurt','Natural yogurt',2.00,3),
(109,'Chicken Breast','Skinless chicken',6.50,4),
(110,'Beef Mince','Lean beef mince',7.20,4),
(111,'Orange Juice','Fresh juice',2.30,5),
(112,'Apple Juice','Pressed apple juice',2.10,5),
(113,'Sparkling Water','Mineral water',1.00,5),
(114,'Croissant','Butter croissant',1.50,2),
(115,'Butter','Salted butter',2.75,3);

-- INVENTORY
INSERT INTO Inventory VALUES
(1,101,200,'kg'),(2,102,180,'kg'),(3,103,220,'kg'),
(4,104,140,'loaves'),(5,105,160,'loaves'),
(6,106,100,'packs'),(7,107,300,'litres'),
(8,108,120,'packs'),(9,109,90,'packs'),
(10,110,80,'packs'),(11,111,150,'bottles'),
(12,112,140,'bottles'),(13,113,200,'bottles'),
(14,114,130,'units'),(15,115,110,'packs');

-- CUSTOMER
INSERT INTO Customer VALUES
(1,'James Wilson','james@gmail.com','0711111111',1),
(2,'Emily Brown','emily@gmail.com','0722222222',2),
(3,'Oliver Smith','oliver@gmail.com','0733333333',3),
(4,'Sophia Taylor','sophia@gmail.com','0744444444',4),
(5,'Harry Johnson','harry@gmail.com','0755555555',5),
(6,'Amelia White','amelia@gmail.com','0766666666',1),
(7,'Jack Harris','jack@gmail.com','0777777777',2),
(8,'Isla Martin','isla@gmail.com','0788888888',3),
(9,'Noah Clark','noah@gmail.com','0799999999',4),
(10,'Mia Lewis','mia@gmail.com','0700000000',5);

-- ORDERS
INSERT INTO Orders VALUES
(201,1,'2025-01-12'),(202,2,'2025-02-05'),
(203,3,'2025-03-18'),(204,4,'2025-04-22'),
(205,5,'2025-05-15'),(206,6,'2025-06-10'),
(207,7,'2025-07-19'),(208,8,'2025-08-14'),
(209,9,'2025-09-09'),(210,10,'2025-10-03');

-- ORDER ITEM
INSERT INTO OrderItem VALUES
(1,201,101,3),(2,201,107,2),
(3,202,104,2),(4,202,111,1),
(5,203,109,1),(6,203,106,2),
(7,204,102,4),(8,204,113,3),
(9,205,110,1),(10,205,105,2),
(11,206,115,1),(12,206,108,2),
(13,207,114,3),(14,208,103,5),
(15,209,112,2);

-- SALES
INSERT INTO Sales VALUES
(501,201,1,101,3,2.50,'2025-01-12'),
(502,201,1,107,2,1.25,'2025-01-12'),
(503,202,2,104,2,1.90,'2025-02-05'),
(504,202,2,111,1,2.30,'2025-02-05'),
(505,203,3,109,1,6.50,'2025-03-18'),
(506,203,3,106,2,3.80,'2025-03-18'),
(507,204,4,102,4,1.80,'2025-04-22'),
(508,204,4,113,3,1.00,'2025-04-22'),
(509,205,5,110,1,7.20,'2025-05-15'),
(510,205,5,105,2,1.60,'2025-05-15'),
(511,206,6,115,1,2.75,'2025-06-10'),
(512,206,6,108,2,2.00,'2025-06-10'),
(513,207,7,114,3,1.50,'2025-07-19'),
(514,208,8,103,5,1.20,'2025-08-14'),
(515,209,9,112,2,2.10,'2025-09-09'),
(516,210,10,101,2,2.50,'2025-10-03'),
(517,210,10,107,1,1.25,'2025-10-03'),
(518,209,9,109,1,6.50,'2025-09-09'),
(519,208,8,106,1,3.80,'2025-08-14'),
(520,207,7,111,2,2.30,'2025-07-19');



-- PART C — Required SQL Queries

-- Total Sales for Each Product Category
SELECT c.category_name,
       SUM(s.quantity_sold * s.price) AS total_sales
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
JOIN Category c ON p.category_id = c.category_id
WHERE s.transaction_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY c.category_name;


-- Top 10 Most Popular Products
SELECT p.product_name,
       c.category_name,
       SUM(s.quantity_sold) AS total_quantity_sold
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
JOIN Category c ON p.category_id = c.category_id
WHERE s.transaction_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY p.product_name, c.category_name
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Customer Order History
SELECT cu.customer_name,
       cu.email,
       cu.phone_number,
       COUNT(o.order_id) AS total_orders
FROM Customer cu
JOIN Orders o ON cu.customer_id = o.customer_id
WHERE o.order_date >= CURRENT_DATE - INTERVAL 1 MONTH
GROUP BY cu.customer_name, cu.email, cu.phone_number;

-- Current Inventory Levels
SELECT p.product_name,
       c.category_name,
       i.quantity_in_stock
FROM Inventory i
JOIN Product p ON i.product_id = p.product_id
JOIN Category c ON p.category_id = c.category_id;

-- Revenue by City
SELECT ci.city_name,
       SUM(s.quantity_sold * s.price) AS total_revenue
FROM Sales s
JOIN Customer cu ON s.customer_id = cu.customer_id
JOIN City ci ON cu.city_id = ci.city_id
WHERE s.transaction_date >= CURRENT_DATE - INTERVAL 1 YEAR
GROUP BY ci.city_name;
