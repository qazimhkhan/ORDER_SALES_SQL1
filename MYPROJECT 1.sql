use my1project;
select * from ret_sales;


-- Data exploration
-- how many sales we have
-- select count(*) as total_sale from ret_sales;

-- how many unique customers we have
-- select count(distinct customer_id) as total_sale from ret_sales; 

-- how many categories 
-- select distinct category from ret_sales;

-- data analysis & business key problem & answers

-- Q1-Write a SQL query to retrive all columns for sales made on '2022-11-05''

SELECT * FROM ret_sales
	WHERE sale_date = '2022-11-05';
    
    
--   Q2-Write a SQl query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 03 in the month of november 2022

SELECT * FROM ret_sales
		WHERE category = 'Clothing'
        AND sale_date BETWEEN '2022-11-01' AND '2022-11-30'
        AND quantity>3;
		
-- Q3-Write a SQL query to find the total sales for each category

SELECT DISTINCT category,
SUM(total_sale) as net_sales,
COUNT(*) as total_orders
FROM ret_sales
group by 1;

-- Q4-Write a SQL query to find the average age of customers who purchased the products from 'beauty' category?
	
SELECT category,
ROUND(AVG(age),2) FROM ret_sales
WHERE category='beauty'
group by 1;

-- Q5-Write a SQL query to find all transactions where total_sale is greater than 1000?

SELECT * FROM ret_sales
WHERE total_sale >1000;

-- Q6-Write a SQL query to find the total transactions (transactions_id) made by each gender in each category?

SELECT category,gender,
	COUNT(*) AS total_sales
    FROM ret_sales
    GROUP BY category,gender
    order by 1;
    
-- Q7-Write a SQL query to calculate the average sales for each month also find the best month of sales in each year?

SELECT 
	YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG (total_sale) as avg_sale
FROM ret_sales
GROUP BY 1,2
ORDER BY 1,3 DESC;

-- Q8-Write a SQL query to find the top 5 customers based on the highest top sales?

SELECT 
customer_id,
SUM(total_sale) AS total_sales 
 FROM ret_sales
 GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Q9-Write a SQL query to find the number of unique customers who purchased items from each category?

SELECT 
category,
COUNT(customer_id) as unique_customers
FROM ret_sales
GROUP BY 1 ;

-- Q10-Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Night >17)?


SELECT *,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) <12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		WHEN EXTRACT(HOUR FROM sale_time) >17 THEN 'Night'
END AS shift
FROM ret_sales
GROUP BY 1;









