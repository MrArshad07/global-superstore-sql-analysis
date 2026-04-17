create database retail_sales;

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

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_file2.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select*from orders;

ALTER TABLE orders
modify order_date DATE;

select*from orders limit 10;      


 /* Questions File:

Q1: Total Sales kitni hui?
Q2: Top 5 highest selling products
Q3: Kis region me sabse zyada profit hai?
Q4: Monthly sales trend dikhao
Q5: Loss wale orders (negative profit)
Q6: Top customers by revenue
Q7: Category-wise performance
Q8: Discount ka profit par impact
Q9: Sabse zyada quantity kis product ki bikti hai?
Q10: Country-wise sales ranking 
Q11: Top 3 products in each category
Q12: Running total of sales (Cumulative Sales)
Q13: Repeat vs New Customers
Q14: Profit ratio (Profit / Sales)
Q15: Most profitable sub-category in each region */


-- Q1: Total Sales kitni hui?
select sum(sales) as total_sale
from orders;

-- Q2: Top 5 highest selling products
select product_id,sum(sales) as higest_sale
from orders
group by product_id
order by higest_sale desc
limit 5;

-- Q3: Kis region me sabse zyada profit hai?
SELECT region, SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_profit DESC
LIMIT 1;

-- Q4: Monthly sales trend dikhao
select DATE_FORMAT(order_date, '%Y-%M') as month_name,
sum(sales) as total_sales
from orders
group by month_name
order by total_sales desc;

-- Q5: Loss wale orders (negative profit)
select order_id, profit
from orders
where profit < 0.0;

-- Q6: Top 5 customers by revenue
select customer_name ,sum(sales) as total_revenue
from orders
group by customer_name
order by total_revenue desc
limit 5;

-- Q7: Category-wise performance
select category,
		sum(sales) as total_sales,
        sum(profit) as total_profit
from orders 
group by category
order by total_sales desc, total_profit desc;

-- Q8: Discount ka profit par impact
select discount,
		avg(profit) as avg_profit
from orders
group by discount
order by discount desc;


-- Q9: Sabse zyada quantity kis product ki bikti hai?
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 1;


-- Q10: Country-wise sales ranking 
SELECT 
    country,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM orders
GROUP BY country;       


-- Q11: Top 3 products in each category  
SELECT *
FROM (
    SELECT 
        category,
        product_id,
        SUM(sales) AS total_sales,
        RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS rnk
    FROM orders
    GROUP BY category, product_id
) t
WHERE rnk <= 3;

-- Q12: Running total of sales (Cumulative Sales)
SELECT 
    order_date,
    SUM(sales) AS daily_sales,
    SUM(SUM(sales)) OVER (ORDER BY order_date) AS cumulative_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Q13: Repeat vs New Customers
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT customer_name, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_name
) t
GROUP BY customer_type;


-- Q14: Profit ratio (Profit / Sales)
SELECT 
    SUM(profit) / SUM(sales) AS profit_ratio
FROM orders;


-- Q15: Most profitable sub-category in each region
SELECT *
FROM (
    SELECT 
        region,
        sub_category,
        SUM(profit) AS total_profit,
        RANK() OVER (PARTITION BY region ORDER BY SUM(profit) DESC) AS rnk
    FROM orders
    GROUP BY region, sub_category
) t
WHERE rnk = 1;