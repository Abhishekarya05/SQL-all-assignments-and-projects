# SOLUTION 1 #
create table customer(
id int not null primary key,
name varchar(50) default null,
referee_id int default null
);

insert into customer (id , name , referee_id)
values (1, "Will", null ),
(2,	"Jane", null),
(3, "Alex", 2),
(4 , "Bill", null),
(5, "Zack", 1),
(6, "Mark", 2);

select name
from customer
where referee_id is null or referee_id != 2;
# SOLUTION 2# 
create table World(
name varchar(50) not null primary key,
continent varchar(50) default null,
area int default null,
population int default null,
gdp bigint default null
);

insert into World (name , continent, area, population, gdp)
values ('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);


select name , population , area
from World
where area >= 3000000 or population >= 25000000;
# Solution 3 #
create table cinema(
id int not null,
movie varchar(50) default null,
description varchar(50) default null,
rating float default null
);

insert into cinema (id , movie , description , rating) 
values (1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

select * 
from cinema
where description <> 'boring' and (id % 2) <> 0
order by id desc;