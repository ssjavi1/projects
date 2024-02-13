create database p5;
use p5;
select * from orde;
select * from customer;

# Retrieve the full names and email addresses of customers along with the details of their orders (if any). Include customers who have not placed any orders.
select
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.ProductName,
    o.Quantity,
    o.Price
from customer c
left join
    orde o on c.CustomerID = o.CustomerID
order by
    c.CustomerID, o.OrderID;
# Retrieve the orders with a quantity greater than the average quantity of all orders.
select * from orde where
Quantity > (select avg(Quantity)
from orde
);
# Calculate the total sales amount for each customer
select
c.CustomerID,
c.FirstName,
c.LastName,
c.Email,
sum(o.Quantity * o.Price) as TotalSalesAmount
from
customer c
left join
orde o on c.CustomerID = o.CustomerID
group by
c.CustomerID, c.FirstName, c.LastName, c.Email
order by
c.CustomerID;
# Update the phone number for the customer with CustomerID = 2 to '555-987-6543'.
update customer
set PhoneNumber = '555-987-6543'
where CustomerID = 2;
# Retrieve the top 5 customers who have spent the most on orders.
select
c.CustomerID,
c.FirstName,
c.LastName,
c.Email,
sum(o.Quantity * o.Price) as TotalAmountSpent
from customer c
left join
orde o on c.CustomerID = o.CustomerID
group by
c.CustomerID, c.FirstName, c.LastName, c.Email
order by  TotalAmountSpent desc
limit 5;