# Solution 1 #
CREATE TABLE Patients (
  patient_id INT PRIMARY KEY,
  patient_name VARCHAR(255),
  conditions VARCHAR(255)
);


INSERT INTO Patients (patient_id, patient_name, conditions)
VALUES (1, 'Daniel', 'YFEV COUGH'),
       (2, 'Alice', ''),
       (3, 'Bob', 'DIAB100 MYOP'),
       (4, 'George', 'ACNE DIAB100'),
       (5, 'Alain', 'DIAB201');
       
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE 'DIAB1% %' OR conditions LIKE '% DIAB1%' ;

# SOLUTION 2 #


CREATE TABLE Sales (
  sale_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  sale_date DATE
);


INSERT INTO Sales (sale_id, product_name, sale_date)
VALUES
  (1, 'LCPHONE', '2000-01-16'),
  (2, 'LCPhone', '2000-01-17'),
  (3, 'LcPhOnE', '2000-02-18'),
  (4, 'LCKeyCHAiN', '2000-02-19'),
  (5, 'LCKeyChain', '2000-02-28'),
  (6, 'Matryoshka', '2000-03-31');


SELECT LOWER(TRIM(product_name)) AS product_name,
       DATE_FORMAT(sale_date, '%Y-%m') AS sale_date,
       COUNT(*) AS total
FROM Sales
GROUP BY LOWER(TRIM(product_name)), DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY product_name ASC, sale_date ASC;

# Solution 3 #


CREATE TABLE Visits (
  visit_id INT PRIMARY KEY,
  customer_id INT
);


INSERT INTO Visits (visit_id, customer_id)
VALUES (1, 23),
       (2, 9),
       (4, 30),
       (5, 54),
       (6, 96),
       (7, 54),
       (8, 54);


CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  visit_id INT,
  amount INT
);


INSERT INTO Transactions (transaction_id, visit_id, amount)
VALUES (2, 5, 310),
       (3, 5, 300),
       (9, 5, 200),
       (12, 1, 910),
       (13, 2, 970);


SELECT v.customer_id AS customer_id,
       COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;

# Solution 4 #


CREATE TABLE Users (
  account INT PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE Transactions1 (
  trans_id INT PRIMARY KEY,
  account INT,
  amount INT,
  transacted_on DATE
);

INSERT INTO Users (account, name)
VALUES (900001, 'Alice'),
       (900002, 'Bob'),
       (900003, 'Charlie');


INSERT INTO Transactions1 (trans_id, account, amount, transacted_on)
VALUES (1, 900001, 7000, '2020-08-01'),
       (2, 900001, 7000, '2020-09-01'),
       (3, 900001, -3000, '2020-09-02'),
       (4, 900002, 1000, '2020-09-12'),
       (5, 900003, 6000, '2020-08-07'),
       (6, 900003, 6000, '2020-09-07'),
       (7, 900003, -4000, '2020-09-11');


SELECT u.name AS name,
       SUM(t.amount) AS balance
FROM Users u
JOIN Transactions1 t ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000;

