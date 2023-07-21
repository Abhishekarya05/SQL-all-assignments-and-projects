-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    country VARCHAR(255)
);

-- Insert data into Customers table
INSERT INTO Customers (customer_id, name, country)
VALUES (1, 'Winston', 'USA'),
       (2, 'Jonathan', 'Peru'),
       (3, 'Moustafa', 'Egypt');

-- Create Product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    description VARCHAR(255),
    price INT
);

-- Insert data into Product table
INSERT INTO Product (product_id, description, price)
VALUES (10, 'LC Phone', 300),
       (20, 'LC T-Shirt', 10),
       (30, 'LC Book', 45),
       (40, 'LC Keychain', 2);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT
);

-- Insert data into Orders table
INSERT INTO Orders (order_id, customer_id, product_id, order_date, quantity)
VALUES (1, 1, 10, '2020-06-10', 1),
       (2, 1, 20, '2020-07-01', 1),
       (3, 1, 30, '2020-07-08', 2),
       (4, 2, 10, '2020-06-15', 2),
       (5, 2, 40, '2020-07-01', 10),
       (6, 3, 20, '2020-06-24', 2),
       (7, 3, 30, '2020-06-25', 2),
       (9, 3, 30, '2020-05-08', 3);

SELECT o.customer_id, name
FROM orders o
JOIN Product p
ON o.product_id = p.product_id
JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY 1, 2
HAVING SUM(CASE WHEN date_format(order_date, '%Y-%m')='2020-06'
THEN price*quantity END) >= 100
AND
SUM(CASE WHEN date_format(order_date, '%Y-%m')='2020-07'
THEN price*quantity END) >= 100;
