-- Created 'pizza_sales_db' database
-- Created 'pizza_sales' table and imported data from csv file

CREATE DATABASE pizza_sales_db;

CREATE TABLE pizza_sales(
    pizza_id INT PRIMARY KEY,
    order_id INT,
    pizza_name_id VARCHAR(25),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price FLOAT,
    total_price FLOAT,
    pizza_size VARCHAR(5),
    pizza_category VARCHAR(25),
    pizza_ingredients VARCHAR(255),
    pizza_name VARCHAR(50)
);

copy pizza_sales(pizza_id, order_id, pizza_name_id, quantity, order_date, order_time, unit_price, total_price, pizza_size, pizza_category, pizza_ingredients, pizza_name)
FROM 'C:/Users/LENOVO/Desktop/pizza_sales.csv'
WITH (FORMAT CSV, HEADER TRUE);

SELECT * FROM pizza_sales;


-- Created 'pizzas' and 'orders' tables from main 'pizza_sales' table
-- Used sequence to generate unique numbers for each pizza type for making a primary key
-- 'orders' table does not have primary key but a foreign key that references to 'pizza_id' in 'pizzas' table
-- Created a column 'order_datetime' that merges two columns: 'order_date', 'order_time'

ALTER SEQUENCE pizza_id_seq RESTART 1;

CREATE TABLE pizzas AS
SELECT 
    nextval('pizza_id_seq') AS pizza_id,
    pizza_name_id,
    pizza_name,
    pizza_size,
    unit_price,
    pizza_category,
    pizza_ingredients
FROM (
    SELECT DISTINCT
        pizza_name_id,
        pizza_name,
        pizza_size,
        unit_price,
        pizza_category,
        pizza_ingredients
    FROM pizza_sales
) AS distinct_pizzas;

ALTER TABLE pizzas 
ADD PRIMARY KEY (pizza_id);

SELECT * FROM pizzas;

CREATE TABLE orders AS
SELECT 
	ps.order_id, 
	p.pizza_id, 
	(ps.order_date::text || ' ' || ps.order_time::text)::timestamp AS order_datetime,  
	ps.quantity, 
	ps.total_price
FROM pizza_sales ps 
inner join pizzas p
on ps.pizza_name_id=p.pizza_name_id

ALTER TABLE orders
ADD CONSTRAINT fk_orders_pizza_id
FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id);

SELECT * FROM orders;