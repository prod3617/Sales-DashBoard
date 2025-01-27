Use sales;
Select count(*) from customers;
select * from customers limit 10;
select distinct customer_type from customers;
select * from date;
select count(*), year from date
group by year;

select * from markets;
select count(markets_name) from markets;

select * from products;
Select distinct product_type from products;

-- Total money spent by each customers.
select customer_code, sum(sales_amount) as Total_sales from transactions
group by customer_code
order by 2 desc;

-- Total sales done by each market
select t.market_code, m.markets_name, sum(t.sales_amount) as Total_sales from transactions t Inner Join markets m
on t.market_code = m.markets_code
group by market_code
order by 3 desc;

-- Total sales done by customer types.
select  c.customer_type, sum(t.sales_amount) as Total_sales from transactions t Inner join customers c
on t.customer_code = c.customer_code
group by c.customer_type
order by 2;

-- Total sales done by product types.
select  p.product_type, sum(t.sales_amount) as Total_sales from transactions t Inner join products p
on t.product_code = p.product_code
group by p.product_type
order by 2;

-- Total sales done by each product.
select product_code, sum(sales_amount) as Total_Sales from transactions
group by product_code
order by Total_Sales desc;

-- Total sales by year and month
with sale as(select year(order_date) as year, monthname(order_date) as month, month(order_date) as month_value, sum(sales_amount) as Total_sales from transactions
group by year(order_date), monthname(order_date), month(order_date))
select year, month, Total_sales from  sale
order by year, month_value;