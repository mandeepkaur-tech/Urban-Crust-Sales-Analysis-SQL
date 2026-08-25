CREATE DATABASE Project;
USE Project;

CREATE TABLE order_details (
order_details int,
order_id      int,
pizza_id      varchar(50),
quantity      int);

CREATE TABLE orders (
order_id      int,
date          date,
time          time);

CREATE TABLE pizza_types (
pizza_type_id      varchar(50),
name               varchar(100),
category           varchar(30),
ingredients        varchar(100));

CREATE TABLE pizzas (
pizza_id      varchar(50),
pizza_type_id      varchar(50),
size               char(5),
price              float);

/* SALES AND REVENUE INSIGHTS */

/* Total number of orders placed. */

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM order_details;

/* Total Pizzs Sold */

SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM order_details;

/* Total revenue generated from pizza sales. */

SELECT ROUND(SUM(order_details.quantity*pizzas.price)) AS Total_Revenue
FROM pizzas
JOIN order_details
ON pizzas.pizza_id=order_details.pizza_id;

/* Top 3 most ordered pizza types based on revenue. */

SELECT pizza_types.category, 
ROUND(SUM(order_details.quantity * pizzas.price)) AS Revenue 
FROM order_details 
JOIN pizzas ON pizzas.pizza_id= order_details.pizza_id 
JOIN pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category 
ORDER BY Revenue DESC LIMIT 3;

/* Top 5 Pizza Types by Revenue */

SELECT pizza_types.name,
ROUND(SUM(order_details.quantity*pizzas.price),2) AS Revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id=pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id=pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY Revenue DESC LIMIT 5;

/* Revenue Contribution (%) by Category */

SELECT pizza_types.category,ROUND(SUM(order_details.quantity * pizzas.price) * 100 /(
SELECT SUM(order_details.quantity * pizzas.price)
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id),2) AS Revenue_Percentage
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC;

/* Monthly Revenue */

SELECT MONTHNAME(orders.date) AS Month_Name,ROUND(SUM(order_details.quantity * pizzas.price), 2) AS Revenue
FROM orders
JOIN order_details
ON orders.order_id = order_details.order_id
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY MONTH(orders.date), MONTHNAME(orders.date)
ORDER BY MONTH(orders.date);

/* PRODUCT INSIGHTS */

/* Highest-priced pizza. */

SELECT pizza_types.name, pizzas.price
FROM pizzas
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

/* Most common pizza size ordered. */

SELECT size, COUNT(*) AS Order_Count
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY size
ORDER BY order_count DESC
LIMIT 1;

/* Top 5 most ordered pizza types along with their quantities. */

SELECT pizza_types.name, ROUND(SUM(order_details.quantity)) AS Total_Quantity
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC LIMIT 5;

/* CATEGORY INSIGHTS */

/* Category-wise Ordered Quantity */

SELECT pizza_types.category,SUM(order_details.quantity) AS Total_Quantity
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category;

/* Category-wise distribution of pizzas.*/

SELECT pizza_types.category, COUNT(*) AS Pizza_Count
FROM pizzas
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category;


/* Most Ordered Pizza Category */

SELECT pizza_types.category,SUM(order_details.quantity) AS Total_Quantity
FROM order_details
JOIN pizzas
ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_quantity DESC
LIMIT 1;

/* Average Price by Category */

SELECT pizza_types.category,
ROUND(AVG(pizzas.price)) AS Avg_Price
FROM pizzas
JOIN pizza_types
ON pizzas.pizza_type_id=pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY Avg_Price DESC;

/* TIME AND ORDER PATTERN INSIGHTS */

/* Distribution of orders by hour of the day. */

SELECT hour(time) AS Time_of_order,COUNT(*) AS Orders_by_Hour 
FROM orders
GROUP BY Time_of_order 
ORDER BY Time_of_order;

/* Average number of pizzas ordered per day. */

SELECT day(date) AS day, AVG(quantity) AS Avg_Pizza 
FROM orders 
JOIN order_details ON order_details.order_id = orders.order_id
GROUP BY day ;

/* Peak Hours of Store. */

SELECT hour(time) AS Time_of_order,
COUNT(*) AS orders 
FROM orders
GROUP BY Time_of_order 
ORDER BY orders DESC;

/* Orders by Day of Week */

SELECT DAYNAME(date) AS day_name,COUNT(DISTINCT order_id) AS Total_Orders
FROM orders
GROUP BY DAYNAME(date)
ORDER BY total_orders DESC;