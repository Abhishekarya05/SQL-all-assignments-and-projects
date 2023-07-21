# SOLUTION 1 #
CREATE TABLE Activity (
  player_id INT,
  device_id INT,
  event_date DATE,
  games_played INT,
  PRIMARY KEY (player_id, event_date)
);
INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-05-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5);
  
  SELECT player_id, MIN(event_date) AS first_login
FROM activity
GROUP BY player_id;

# SOLUTION 2 #

CREATE TABLE Activity2(
  player_id INT,
  device_id INT,
  event_date DATE,
  games_played INT,
  PRIMARY KEY (player_id, event_date)
);
INSERT INTO Activity2 (player_id, device_id, event_date, games_played)
VALUES
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-05-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5);
  
  SELECT player_id, device_id
FROM activity WHERE (player_id, event_date) IN (
 SELECT player_id, MIN(event_date)
 FROM activity
 GROUP BY player_id );
 
 # SOLUTION 3 #
 CREATE TABLE Employee (
  employee_id INT,
  team_id INT,
  PRIMARY KEY (employee_id)
);

INSERT INTO Employee (employee_id, team_id)
VALUES
  (1, 8),
  (2, 8),
  (3, 8),
  (4, 7),
  (5, 9),
  (6, 9);

Select e.employee_id,
(select count(team_id) from Employee where e.team_id = team_id) as team_size
from Employee e;

# SOLUTION 4 #

CREATE TABLE Person (
  id INT,
  email VARCHAR(255),
  PRIMARY KEY (id)
);

INSERT INTO Person (id, email)
VALUES
  (1, 'john@example.com'),
  (2, 'bob@example.com'),
  (3, 'john@example.com');
  
DELETE FROM Person WHERE id NOT IN
(SELECT * FROM(
SELECT MIN(id) FROM Person GROUP BY Email) as p);

SELECT * FROM person;



