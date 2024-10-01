
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

-- Retrieve the total number of orders placed ?

select count(order_id) as total_orders from orders;


