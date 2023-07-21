# SOLUTION 1 #
CREATE TABLE Users (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);


INSERT INTO Users (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');


CREATE TABLE Rides (
  id INT PRIMARY KEY,
  user_id INT,
  distance INT
);


INSERT INTO Rides (id, user_id, distance) VALUES
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);


SELECT u.name AS name, IFNULL(SUM(r.distance), 0) AS travelled_distance
FROM Users u
LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;

# SOLUTION 2 #
CREATE TABLE Sessions (
  session_id INT PRIMARY KEY,
  duration INT
);
INSERT INTO Sessions (session_id, duration)
VALUES (1, 30),
       (2, 199),
       (3, 299),
       (4, 580),
       (5, 1000);

(SELECT '[0-5>' AS bin,
 SUM(CASE WHEN duration/60 < 5 THEN 1 ELSE 0 END) AS total FROM Sessions)
 UNION
(SELECT '[5-10>' AS bin,
 SUM(CASE WHEN ((duration/60 >= 5) AND (duration/60 < 10)) THEN 1 ELSE 0 END) AS total FROM Sessions)
 UNION
(SELECT '[10-15>' AS bin,
 SUM(CASE WHEN ((duration/60 >= 10) AND (duration/60 < 15)) THEN 1 ELSE 0 END) AS total FROM Sessions)
 UNION
(SELECT '15 or more' AS bin,
 SUM(CASE WHEN duration/60 >= 15 THEN 1 ELSE 0 END) AS total FROM Sessions);




# SOLUTION 3 #
CREATE TABLE Activities (
  sell_date DATE,
  product VARCHAR(255)
);


INSERT INTO Activities (sell_date, product)
VALUES ('2020-05-30', 'Headphone'),
       ('2020-06-01', 'Pencil'),
       ('2020-06-02', 'Mask'),
       ('2020-05-30', 'Basketball'),
       ('2020-06-01', 'Bible'),
       ('2020-06-02', 'Mask'),
       ('2020-05-30', 'T-Shirt');


SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(DISTINCT product ORDER BY product ASC) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date ASC;



