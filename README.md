# online-grocery-dbms-sql

Online Grocery Database Management System (SQL Project)
📌 Project Overview

This project is a relational database system for an Online Grocery Delivery Platform designed using SQL.
It simulates real-world grocery operations such as customer management, product catalog, order processing, inventory tracking, and sales analysis.

The system is built using normalized relational design (up to 3NF) and supports business reporting using SQL queries.

🎯 Objective

The main objective of this project is to design and implement a scalable database system that:

Stores customer, product, and order data efficiently
Maintains inventory in real-time
Supports sales and revenue analysis
Ensures data integrity using normalization and constraints
🏗️ Database Design
📊 Entities in the System
Customers
Cities
Products
Categories
Orders
Order Items
Inventory
Sales
🔗 Relationships
One City → Many Customers
One Customer → Many Orders
One Order → Many Order Items
One Category → Many Products
One Product → One Inventory record
Order Items link Orders and Products (Many-to-Many resolved table)
🖼️ ER Diagram

🔄 Normalization

The database is normalized up to Third Normal Form (3NF):

UNF (Unnormalized Form)
Repeating product groups in a single order record
Redundant customer and product data
1NF
Atomic values only
Each product stored in separate row
2NF
Separation of Customer, Orders, and Products
Removal of partial dependencies
3NF
Removal of transitive dependencies
Separate tables for City, Category, Inventory
⚙️ Tech Stack
SQL (MySQL / PostgreSQL)
Relational Database Design
ER Modeling
Data Normalization
SQL Querying & Analytics
🧾 SQL Implementation

The database includes:

CREATE TABLE scripts
Primary Keys & Foreign Keys
NOT NULL & UNIQUE constraints
Referential integrity rules
📥 Sample Data Used

The system includes realistic sample data such as:

Cities
London
Birmingham
Leeds
Bristol
Categories
Fresh Produce
Dairy
Beverages
Meat & Poultry
Products
Apples
Milk 1L
Bananas
Carrots
Orange Juice
Cheddar Cheese
Customers
Sample customers with name, email, and city mapping
Orders
Multiple orders across different dates
Inventory
Stock quantities per product (e.g., 100–300 units range)
Sales
Transaction-level records with quantity and price
📊 SQL Business Queries
1. Total Sales by Category

Calculates revenue per category using:

SUM(quantity × price)
GROUP BY category
2. Top 10 Most Popular Products
Ranked using total quantity sold
Identifies highest-demand products
3. Customer Order History
Customer details
Number of orders placed
Filtered by time period
4. Inventory Report
Current stock levels per product
Helps in restocking decisions
5. Revenue by City
City-wise total revenue
Helps in regional business analysis
📈 Key Insights
Fresh Produce generates highest revenue
A small set of products contributes to majority of sales
Inventory levels vary significantly across categories
City-wise revenue differs, showing regional demand patterns
Customer behavior shows repeat purchasing activity
💡 Features
Fully normalized relational database (3NF)
Real-world grocery system simulation
Structured SQL schema design
Business intelligence queries
Inventory tracking system
Sales analytics support
🧠 Skills Demonstrated
SQL Database Design
ER Diagram Creation
Data Normalization (1NF → 3NF)
Complex SQL Queries (JOIN, GROUP BY, Aggregation)
Business Data Analysis
Relational Data Modelling
