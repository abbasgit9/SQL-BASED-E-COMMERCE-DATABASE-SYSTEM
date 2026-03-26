CREATE DATABASE ecommerce_db;
USE ecommerce_db;


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(200),
    registration_date DATE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO customers (first_name, last_name, email, phone, address, registration_date) VALUES
('Souvik','Biswas','souvik@email.com','9876543210','Kolkata','2025-01-10'),
('Rahul','Sharma','rahul@email.com','9876543211','Delhi','2025-02-12'),
('Priya','Singh','priya@email.com','9876543212','Mumbai','2025-03-05'),
('Amit','Das','amit@email.com','9876543213','Kolkata','2025-01-25'),
('Neha','Patel','neha@email.com','9876543214','Ahmedabad','2025-02-14'),
('Arjun','Roy','arjun@email.com','9876543215','Kolkata','2025-03-10'),
('Sneha','Paul','sneha@email.com','9876543216','Chennai','2025-04-02'),
('Vikas','Gupta','vikas@email.com','9876543217','Delhi','2025-02-22'),
('Riya','Khan','riya@email.com','9876543218','Hyderabad','2025-03-18'),
('Ankit','Verma','ankit@email.com','9876543219','Bangalore','2025-04-05');

INSERT INTO products (product_name, category, price, stock) VALUES
('Laptop','Electronics',75000,15),
('Smartphone','Electronics',45000,30),
('Headphones','Electronics',3000,50),
('Smartwatch','Electronics',8000,25),
('Tablet','Electronics',35000,20),
('Keyboard','Accessories',1500,40),
('Mouse','Accessories',800,60),
('Monitor','Electronics',12000,18),
('Printer','Electronics',9000,12),
('External Hard Drive','Storage',5000,22);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1,'2025-05-01',75000),
(2,'2025-05-02',45000),
(3,'2025-05-03',3000),
(4,'2025-05-04',8000),
(5,'2025-05-05',35000),
(6,'2025-05-06',1500),
(7,'2025-05-07',800),
(8,'2025-05-08',12000),
(9,'2025-05-09',9000),
(10,'2025-05-10',5000);

INSERT INTO order_items (order_id, product_id, quantity, subtotal) VALUES
(1,1,1,75000),
(2,2,1,45000),
(3,3,1,3000),
(4,4,1,8000),
(5,5,1,35000),
(6,6,1,1500),
(7,7,1,800),
(8,8,1,12000),
(9,9,1,9000),
(10,10,1,5000);

INSERT INTO payments (order_id, payment_method, payment_status, payment_date) VALUES
(1,'Credit Card','Completed','2025-05-01'),
(2,'Debit Card','Completed','2025-05-02'),
(3,'UPI','Completed','2025-05-03'),
(4,'Net Banking','Completed','2025-05-04'),
(5,'Credit Card','Completed','2025-05-05'),
(6,'UPI','Completed','2025-05-06'),
(7,'Debit Card','Completed','2025-05-07'),
(8,'Credit Card','Completed','2025-05-08'),
(9,'UPI','Completed','2025-05-09'),
(10,'Net Banking','Completed','2025-05-10');


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;

## Advanced Query
## Customer Orders with Product Details
SELECT 
customers.first_name,
products.product_name,
orders.order_date,
order_items.quantity,
payments.payment_method
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
JOIN payments ON orders.order_id = payments.order_id;

## Total Orders by Each Customer
SELECT 
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders 
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;

## Total Sales Amount
SELECT 
    SUM(total_amount) AS total_sales
FROM orders;

## Product Stock Status
SELECT 
    product_id,
    product_name,
    stock
FROM products
WHERE stock < 20;


## Most Expensive Products
SELECT 
    product_name,
    price
FROM products
ORDER BY price DESC
LIMIT 3;

