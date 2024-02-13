create database p4;
use p4;

select * from customerss;
select * from order_items;
select * from orderss;
select * from product;

#Retrieve a list of all customers and their orders
SELECT
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    oi.product_id,
    p.name AS product_name,
    oi.quantity,
    oi.subtotal
FROM
    customerss c
JOIN orderss o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id;

#Find the customer who has placed the highest total amount order (subquery)
select c.customer_id,c.name as customer_name,
MAX(o.total_amount) as highest_total_amount
from
customerss c
join orderss o on c.customer_id = o.customer_id
group by
c.customer_id, c.name
order by
highest_total_amount desc
limit 1;
#Retrieve the product names and quantities of the top 5 best-selling products:
select p.name as product_name,
SUM(oi.quantity) as total_quantity_sold
from product p
join order_items oi on p.product_id = oi.product_id
group by
p.product_id, p.name
order by
total_quantity_sold desc
limit 5;

#Retrieve the names and email addresses of customers who have placed orders with a total amount greater than $500:
select c.name as customer_name, c.email
from customerss c
join orderss o on c.customer_id = o.customer_id
where
o.total_amount > 500;
#Update the price of the product with product_id 5 to $25.
update product
set price = 25
where product_id = 5;
#Display order details including products and quantities for a specific order (e.g., order_id = 32)
SELECT
    o.order_id,
    c.customer_id,
    c.name AS customer_name,
    p.product_id,
    p.name AS product_name,
    oi.quantity,
    oi.subtotal
FROM
    orderss o
JOIN customerss c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
WHERE
    o.order_id = 32;