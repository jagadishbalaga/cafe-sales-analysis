-- Load the CSV into a table
use cafe_sales
select * from cafe_sales_practice

-- Find nulls per column
select count(*) as unitprice_null
from cafe_sales_practice
where UnitPrice is null

-- Remove exact duplicates 
WITH duplicates AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY
                   OrderID,
                   OrderDate,
                   CustomerName,
                   Item,
                   Category,
                   Quantity,
                   UnitPrice,
                   TotalPrice,
                   PaymentMethod,
                   City,
                   Rating
               ORDER BY OrderID
           ) AS rn
    FROM cafe_sales_practice
)
SELECT *
FROM duplicates
WHERE rn > 1;

-- Standardize Category casing UPPER/LOWER/INITCAP TRIM the Item column.
select category, Item
from cafe_sales_practice

-- set upper case
update cafe_sales_practice
set Category = UPPER(category);

-- set lower case
UPDATE cafe_sales_practice
SET Item = TRIM(Item);

--
UPDATE cafe_sales_practice
SET
    Category = UPPER(TRIM(Category)),
    Item = TRIM(Item);

select * from cafe_sales_practice

SELECT Category, Item
FROM cafe_sales_practice

-- Recalculate TotalPrice = Quantity * UnitPrice where it's null but the other two exist.
SELECT *
FROM cafe_sales_practice
WHERE TotalPrice IS NULL
  AND Quantity IS NOT NULL
  AND UnitPrice IS NOT NULL;

UPDATE cafe_sales_practice
SET TotalPrice = Quantity * UnitPrice
WHERE TotalPrice IS NULL
  AND Quantity IS NOT NULL
  AND UnitPrice IS NOT NULL;

SELECT *
FROM cafe_sales_practice
WHERE TotalPrice IS NULL;

-- Write aggregate queries: revenue by category, top 5 customers, revenue by city, average rating by item.
-- Revenue by Category
select 
    category,
    sum(totalprice) as revenue
from cafe_sales_practice
group by Category
order by revenue desc;

-- Top 5 Customers
select top 5
    customername,
    sum(totalprice) as total_revenue
from cafe_sales_practice
group by CustomerName
order by total_revenue

-- Revenue by City
SELECT
    City,
    SUM(TotalPrice) AS Revenue
FROM cafe_sales_practice
GROUP BY City
ORDER BY Revenue DESC;

-- Average Rating by Item
SELECT
    Item,
    AVG(Rating) AS Average_Rating
FROM cafe_sales_practice
GROUP BY Item
ORDER BY Average_Rating DESC;

-- Revenue by City
SELECT
    City,
    SUM(TotalPrice) AS Revenue
FROM cafe_sales_practice
WHERE TotalPrice IS NOT NULL
  AND City IS NOT NULL
GROUP BY City
ORDER BY Revenue DESC;

-- Revenue by State
SELECT
    City,
    SUM(TotalPrice) AS Total_Revenue
FROM cafe_sales_practice
GROUP BY City
ORDER BY Total_Revenue DESC;

select * from cafe_sales_practice

SELECT
    PaymentMethod,
    SUM(TotalPrice) AS Total_Revenue
FROM cafe_sales_practice
GROUP BY PaymentMethod
ORDER BY Total_Revenue DESC;

SELECT
    Item,
    SUM(TotalPrice) AS Total_Revenue
FROM cafe_sales_practice
GROUP BY Item
ORDER BY Total_Revenue DESC;