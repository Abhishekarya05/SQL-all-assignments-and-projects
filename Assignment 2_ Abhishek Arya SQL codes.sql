# SOLUTION 1 #
create table ActorDirector(
timestamp int not null primary key,
actor_id int default null,
director_id int default null);

insert into ActorDirector( actor_id, director_id , timestamp)
values(1,1,0),
(1,1,1),
(1,1,2),
(1,2,3),
(1,2,4),
(2,1,5),
(2,1,6);

select actor_id, director_id
from ActorDirector
GROUP by actor_id,director_id 
having COUNT(director_id)>2 AND COUNT(actor_id)>2;

# SOLUTION 2 #
create table Enrollment(
student varchar(50),
class varchar(50), CONSTRAINT PK_Enrollment Primary key(student, class));

insert into Enrollment( student, class)
values('A', 'Math'),
('B','English'),
('C','Math'),
('D','Biology'),
('E','Math'),
('F', 'Computer'),
('G','Math'),
('H','Math'),
('I','Math') ;

select class 
from Enrollment
group by class
having  COUNT(class) >= 5;

# Solution 3 #

create table Orders(
order_number int not null primary key, 
customer_number int default null);

insert into Orders(order_number, customer_number )
values (1, 1),
(2, 2 ),
(3 ,3 ),
(4 ,3 );

select customer_number
from Orders
group by customer_number
order by COUNT(*) DESC
limit 1 ;

# Solution 4 #
DROP table Sales;
create table Sales(
sale_id int ,
product_id int,
year int ,
quantity int,
price int, CONSTRAINT PK_Sales PRIMARY KEY (sale_id,year)
);

insert into Sales( sale_id, product_id, year, quantity, price)
values(1, 100 ,2008, 10, 5000),
(2 ,100 ,2009 ,12 , 5000),
(7 ,200 ,2011,15 , 9000) ;

Create Table Product(
product_id int not null PRIMARY KEY ,
product_name varchar(20)
);


insert into Product( product_id, product_name)
values( 100 , 'Nokia'),
(200, 'Apple'),
(300 , 'Samsung');

ALTER table Sales
ADD FOREIGN KEY (product_id)
REFERENCES Product(product_id);

SELECT product_name, year, price
FROM Sales INNER JOIN Product ON Sales.product_id = Product.product_id














                           