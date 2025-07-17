-- 1) What days and times do we tend to be busiest?

	CREATE VIEW vw_BusyDaysAtSales AS
	SELECT 
		EXTRACT(DAY FROM order_datetime) AS order_day,
		COUNT(*) AS total_orders
	FROM orders
	GROUP BY EXTRACT(DAY FROM order_datetime)
	ORDER BY total_orders DESC;

	CREATE VIEW vw_BusyHoursAtSales AS
	SELECT 
		MAKE_TIME(order_hour, 0, 0) AS order_time, 
		total_orders 
	FROM(
		SELECT 
			EXTRACT(HOUR FROM order_datetime)::INT AS order_hour,
			COUNT(*) AS total_orders
		FROM orders
		GROUP BY EXTRACT(HOUR FROM order_datetime)
		ORDER BY total_orders DESC
	) AS temptbl;


-- 2) How many pizzas are we making during peak periods?

	CREATE VIEW vw_PizzasDuringPeakDays AS
	SELECT 
		EXTRACT(DAY FROM order_datetime) AS order_day,
		SUM(quantity) AS total_pizzas
	FROM orders
	GROUP BY EXTRACT(DAY FROM order_datetime)
	ORDER BY total_pizzas DESC;

	CREATE VIEW vw_PizzasDuringPeakHours AS
	SELECT 
		EXTRACT(HOUR FROM order_datetime) AS order_hour,
		SUM(quantity) AS total_pizzas
	FROM orders
	GROUP BY EXTRACT(HOUR FROM order_datetime)
	ORDER BY total_pizzas DESC;
	
-- 3) What are our best and worst-selling pizzas?

	CREATE VIEW vw_BestSellingPizza AS
	SELECT 
		o.pizza_id, 
		p.pizza_name_id,
		SUM(o.quantity) AS total_sold
	FROM orders o
	INNER JOIN pizzas p
	ON o.pizza_id=p.pizza_id
	GROUP BY o.pizza_id, p.pizza_name_id
	ORDER BY total_sold DESC
	LIMIT 1;

	CREATE VIEW vw_WorstSellingPizza AS
	SELECT 
		o.pizza_id, 
		p.pizza_name_id,
		SUM(o.quantity) AS total_sold
	FROM orders o
	INNER JOIN pizzas p
	ON o.pizza_id=p.pizza_id
	GROUP BY o.pizza_id, p.pizza_name_id
	ORDER BY total_sold ASC
	LIMIT 1;

-- 4) What's our average order value?

	CREATE VIEW vw_AverageOrderValue AS
	SELECT 
		ROUND(AVG(total_price)::numeric, 2) AS average_order_value
	FROM orders;

-- 5) Which pizza types bring in the most revenue?

	CREATE VIEW vw_HighestRevenuePizza AS
	SELECT 
    	p.pizza_name_id,
    	ROUND(SUM(o.total_price)::numeric, 2) AS revenue
	FROM orders o
	JOIN pizzas p ON o.pizza_id = p.pizza_id
	GROUP BY p.pizza_name_id
	ORDER BY revenue DESC;

-- 6) Is there a seasonal or weekday pattern in pizza sales?

	CREATE VIEW vw_WeekdayPatterns AS
	SELECT 
		EXTRACT(DOW FROM order_datetime) AS weekday,
		SUM(quantity) AS quntity_sold
	FROM orders
	GROUP BY EXTRACT(DOW FROM order_datetime)