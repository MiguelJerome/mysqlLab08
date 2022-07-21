-- 1.
SELECT o.*, e.first_name, e.last_name
FROM orders o
INNER JOIN employees e ON o.employee_id = e.id;

-- 2.
SELECT o.*
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
WHERE c.last_name = 'Lee';

-- 3.
SELECT o.ship_address, o.ship_city, o.ship_state_province, o.ship_country_region, o.ship_zip_postal_code
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN products p ON od.product_id = p.id
WHERE p.product_name = 'Northwind Traders Curry Sauce';

-- 4.
SELECT p.*
FROM products p
INNER JOIN order_details od ON od.product_id = p.id
WHERE od.order_id = 42;

-- 5.
SELECT DISTINCT p.product_name
FROM products p
INNER JOIN purchase_order_details pod ON p.id = pod.product_id
INNER JOIN purchase_orders po ON pod.purchase_order_id = po.id
INNER JOIN suppliers s ON po.supplier_id = s.id
WHERE s.company IN ('Supplier A', 'Supplier C');

-- 6.
SELECT o.shipping_fee AS MaxLivraison
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id
WHERE c.first_name = 'Francisco'
ORDER BY o.shipping_fee DESC
LIMIT 1;

-- 7.
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
INNER JOIN orders o ON o.customer_id = c.id
WHERE order_date BETWEEN '2006-02-01' AND '2006-02-28';

-- Alternative
SELECT DISTINCT c.first_name, c.last_name
FROM customers c
INNER JOIN orders o ON o.customer_id = c.id
WHERE order_date LIKE '2006-02-%';

-- 8.
SELECT DISTINCT p.*
FROM products p
INNER JOIN order_details od ON p.id = od.product_id 
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN employees e ON o.employee_id = e.id
WHERE e.first_name LIKE 'N%';

-- 9.
SELECT p.* 
FROM products p
LEFT JOIN order_details od ON p.id = od.product_id
WHERE od.id IS NULL;

-- 10.
SELECT e.first_name, e.last_name, c.first_name, c.last_name
FROM employees e
INNER JOIN customers c ON e.first_name = c.first_name;

SELECT e.first_name, e.last_name, c.first_name, c.last_name
FROM employees e, customers c
WHERE e.first_name = c.first_name;

-- 11.
SELECT o.*
FROM orders o
INNER JOIN order_details od ON o.id = od.order_id
ORDER BY quantity DESC
LIMIT 1;

-- 12.
SELECT e.* 
FROM employees e
LEFT JOIN orders o ON e.id = o.employee_id
WHERE o.id IS NULL;

-- 13.
SELECT e.*
FROM employees e
INNER JOIN orders o ON e.id = o.employee_id
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN products p ON od.product_id = p.id
WHERE p.product_name LIKE '%mix%';

-- 14.
SELECT DISTINCT p.product_name, p.product_code
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN products p ON od.product_id = p.id
WHERE c.first_name IN ('Michael', 'Karen', 'George', 'Elizabeth');