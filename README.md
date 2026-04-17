# 📊 Global Superstore SQL Analysis Project

## 🚀 Project Overview

This project demonstrates advanced SQL skills by analyzing a real-world sales dataset to extract meaningful business insights. The dataset includes information about orders, customers, products, regions, and financial performance.

The objective of this project is to simulate real business scenarios and answer critical analytical questions using SQL.

---

## 🎯 Key Objectives

* Analyze overall sales and profit performance
* Identify top-performing products and categories
* Understand regional and country-wise trends
* Evaluate customer behavior (new vs repeat)
* Measure the impact of discounts on profitability
* Apply advanced SQL techniques for data analysis

---

## 🗂️ Dataset Information

* **Source:** Superstore-style dataset
* **File:** `order_file2.csv`
* **Total Records:** ~51,000+ rows

### 📌 Key Columns:

* Order Details: `order_id`, `order_date`, `ship_date`
* Customer Info: `customer_name`, `segment`
* Location: `country`, `region`, `market`
* Product Info: `product_id`, `category`, `sub_category`
* Financials: `sales`, `profit`, `discount`, `shipping_cost`
* Others: `quantity`, `order_priority`, `year`

---

## 🧱 Database Schema

```sql
CREATE TABLE orders (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    market VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),
    shipping_cost DECIMAL(10,2),
    order_priority VARCHAR(20),
    year INT
);
```

---

## ⚡ Data Import Technique

Efficient bulk loading was performed using:

```sql
LOAD DATA INFILE 'path_to_file'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

---

## 📊 Business Questions Solved

### 🔹 Sales & Revenue Analysis

* Total revenue generated
* Monthly sales trend
* Running (cumulative) sales

### 🔹 Product Performance

* Top 5 highest selling products
* Most sold product by quantity
* Top 3 products in each category

### 🔹 Regional Insights

* Most profitable region
* Country-wise sales ranking
* Most profitable sub-category per region

### 🔹 Customer Analysis

* Top customers by revenue
* New vs Repeat customer segmentation

### 🔹 Profitability Analysis

* Loss-making orders
* Category-wise performance
* Profit ratio (Profit / Sales)
* Impact of discount on profit

---

## 🧠 Advanced SQL Concepts Used

### ✅ Aggregations

* `SUM()`, `AVG()`, `COUNT()`

### ✅ Grouping

* `GROUP BY` for multi-level analysis

### ✅ Window Functions

* `RANK()`
* `ROW_NUMBER()`
* `SUM() OVER()` (Cumulative calculations)

### ✅ Subqueries

* Used for filtering ranked data (Top-N per group)

### ✅ Conditional Logic

* `CASE WHEN` for customer segmentation

---

## 📈 Sample Insights

* Certain regions consistently generate higher profits
* A small number of products contribute to a large portion of revenue
* Discounts negatively impact profitability beyond a threshold
* Repeat customers contribute significantly to total revenue

---

## 📌 Key Learnings

* Efficient data loading using `LOAD DATA INFILE`
* Handling real-world dataset challenges (data types, formats)
* Writing optimized SQL queries for large datasets
* Applying window functions for advanced analytics
* Structuring queries for business problem-solving

---

## 🔮 Future Enhancements

* Build interactive dashboards using Power BI / Tableau
* Automate pipeline using Python (Pandas + SQLAlchemy)
* Add indexing for performance optimization
* Perform predictive analysis (sales forecasting)

---

## 🛠️ Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Data Handling:** Excel (initial exploration)

---

## 👨‍💻 Author

**Arshad Sayyad**

