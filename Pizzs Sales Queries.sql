
CREATE DATABASE pizzahut;

USE pizzahut;

CREATE TABLE orders (
order_id INT NOT NULL,
order_date DATE NOT NULL,
order_time TIME NOT NULL,
primary key(order_id));

drop table orders;

select * from orders;

select * from pizza_types;

-- Q1) Retrieve the total number of orders placed ?

select count(order_id) as total_orders from orders;

--Q2) Identify the highest-priced pizza.

 select TOP 1 pizza_types.name,pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc;

--Q3) Calculate the total revenue generated from pizza sales ?
select
sum(order_details.quantity * pizzas.price) as total_sales
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id;

--Q4) Identify the most common pizza size ordered ?
SELECT top 1 pizzas.size, count(order_details.order_details_id)as order_count
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by order_count desc;


--Q5) Determine the distribution of orders by hour of the day.?

SELECT DATEPART(HOUR, time) AS hour_part,count(order_id) as order_count
FROM orders
group by DATEPARt(HOUR,time);

--Q6) Join relevant tables to find the category-wise distribution of pizzas.?

SELECT category,count(name)from pizza_types
group by category;

--Q7) Group the orders by date and calculate the average number of pizzas ordered per day.?
select round(avg(quantity),0) from 
(select orders.date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.date) as order_quantity ;

--Q8)Determine the top 3 most ordered pizza types based on revenue.

select top 3  pizza_types.name,
sum(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc;

--Q9) Join the necessary tables to find the total quantity of each pizza category ordered.?

select  pizza_types.category,
sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by quantity desc;




