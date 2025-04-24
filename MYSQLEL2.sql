SELECT * FROM bhawanadb8.ecommerce;
SELECT * FROM ecommerce WHERE location = 'New York';
SELECT customer_name, order_date, price FROM ecommerce ORDER BY order_date DESC;
SELECT location, COUNT(order_id) AS total_orders FROM ecommerce GROUP BY location ORDER BY total_orders DESC;-- Products table
CREATE TEMPORARY TABLE products AS SELECT DISTINCT product_name, price FROM ecommerce;
CREATE TEMPORARY TABLE customers AS SELECT DISTINCT customer_id, customer_name, location FROM ecommerce;
SELECT e.order_id, c.customer_name, p.product_name FROM ecommerce e INNER JOIN customers c ON e.customer_id = c.customer_id INNER JOIN products p ON e.product_name = p.product_name;
SELECT c.customer_name, e.order_id FROM customers c LEFT JOIN ecommerce e ON c.customer_id = e.customer_id;
SELECT e.order_id, p.product_name FROM ecommerce e RIGHT JOIN products p ON e.product_name = p.product_name;
SELECT customer_name, price FROM ecommerce WHERE price = (SELECT MAX(price) FROM ecommerce);
SELECT customer_name FROM ecommerce WHERE customer_id IN (SELECT customer_id FROM ecommerce GROUP BY customer_id HAVING COUNT(order_id) > 1);
SELECT SUM(price * quantity) AS total_revenue FROM ecommerce;
SELECT AVG(price * quantity) AS avg_order_value FROM ecommerce;
SELECT product_name, SUM(quantity) AS total_quantity FROM ecommerce GROUP BY product_name;
SELECT * FROM top_customers WHERE total_spent > 1000;
CREATE INDEX idx_customer_id ON ecommerce(customer_id);
CREATE INDEX idx_order_date ON ecommerce(order_date);
