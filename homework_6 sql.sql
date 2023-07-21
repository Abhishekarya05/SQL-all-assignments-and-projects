* Home Work Solution 6 *

* Problem 1 *

create table Departments(
id int not null primary key,
name varchar(50) default null
);

create table students2(
id int not null primary key,
name varchar (50) default null,
department_id int default null
);


insert into departments (id, name)
values(1, "Electrical Engineering"),
(7, "Computer Engineering"),
(13, "Bussiness Administration");

insert into students2 (id, name,department_id)
values(23, 'Alice', 1),
(1, 'Bob', 7),
(5, "Jennifer", 13),
(2, "John", 14),
(4, 'Jasmine', 77),
(3, 'Steve', 74),
(6, 'Luis', 1),
(8, 'Jonathan', 7),
(7, 'Daiana', 33),
(11, 'Madelynn', 1);

select T1.student_id as id, T1.student_name as name
from 
	(select L.id as student_id, L.name as student_name, L.department_id, R.name as Dept_name
	from students2 as L
	left join departments as R
	on L.department_id = R.id) as T1
where T1.Dept_name is null;


/* Problem 2 */

create table employees(
id int not null primary key,
name varchar(50) default null
);

create table EmployeeUNI(
id int not null,
unique_id int not null,
primary key (id,unique_id)
);


insert into employees (id, name)
values(1, "Alice"),
(7, "Bob"),
(11, "Meir"),
(90, "Winston"),
(3, "Jonathan");

insert into EmployeeUNI (id, unique_id)
values(3, 1),
(11, 2),
(90, 3);

select T2.unique_id as unique_id, T2.name as name
from 
	(select L.id as employee_id, L.name as name, R.unique_id as unique_id 
	from employees as L
	left join EmployeeUNI as R
	on L.id = R.id) as T2
order by name;


/* Problem 3 */

create table Products(
product_id int not null primary key,
product_name varchar(50) default null,
product_category varchar (50) default null
);

create table orders2(
product_id int default null,
order_date date default null,
unit int default null,
foreign key (product_id) references Products (product_id)
);


insert into Products (product_id, product_name, product_category)
values(1, "Leetcode Solutions", "Book"),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

insert into orders2 (product_id, order_date, unit)
values(1,  "2020-02-05" , 60),
(1,  '2020-02-10' , 70),
(2,  '2020-01-18' , 30),
(2,  '2020-02-11' , 80),
(3,  '2020-02-17' , 2),
(3,  '2020-02-24' , 3),
(4,  '2020-03-01' , 20),
(4,  '2020-03-04' , 30),
(4,  '2020-03-04' , 60),
(5,  '2020-02-25' , 50),
(5,  '2020-02-27' , 50),
(5,  '2020-03-01' , 50);


select R.product_name , L.sum as unit
from(
(
	select product_id, sum(unit) as sum
	from orders2
	where month(order_date) = 2
	group by product_id
	having sum >= 100) as L
	left join products as R
	on L.product_id = R.product_id);


/* Problem 4 */

create table Countries(
country_id int not null primary key,
country_name varchar(50) default null
);

create table weather(
country_id int not null,
weather_state int default null,
day date not null,
primary key (country_id, day) 
);


insert into Countries (country_id, country_name)
values(2, "USA"),
(3, "Australia"),
(7,"Peru"),
(5,"China"),
(8,"Morocco"),
(9,"Spain");

insert into weather (country_id, weather_state, day)
values(2, 15,  '2019-11-01'),
(2, 12,  '2019-10-28'), 
(2, 12,  '2019-10-27'),
(3, -2,  '2019-11-10'), 
(3, 0,  '2019-11-11'),
(3, 3,  '2019-11-12'),
(5, 16,  '2019-11-07'),
(5, 18,  '2019-11-09'),
(5, 21,  '2019-11-23'),
(7, 25,  '2019-11-28'),
(7, 22,  '2019-12-01'),
(7, 20,  '2019-12-02'),
(8, 25,  '2019-11-05'),
(8, 27,  '2019-11-15'),
(8, 31,  '2019-11-25'),
(9, 7,  '2019-10-23'),
(9, 3,  '2019-12-23');


select country_name ,
case
when avg(weather_state) <= 15 then "Cold"
when avg(weather_state) >= 25 then "Hot"
else "Warm"
end as weather_type
from(
	select L.* , R.country_name
	from weather as L
	left join countries as R
	on L.country_id = R.country_id) as T1
where month(day) = 11
group by country_name;

