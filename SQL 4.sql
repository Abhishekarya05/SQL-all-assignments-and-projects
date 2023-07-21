create table views(
article_id int default null,
author_id int default null,
viewer_id int default null,
view_date date default null 
);

insert into views (article_id, author_id, viewer_id, view_date)
values(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');


select distinct author_id as id
from views
where viewer_id = author_id
order by id;


/* Problem 2 */


create table queries(
query_name varchar (50) default null,
result varchar (50) default null,
position int default null,
rating int default null 
);

insert into queries (query_name, result, position, rating)
values('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);


select query_name , round(avg(rating / position),2) as quality , round(avg(rating < 3)*100 ,2) as poor_query_percentage
from queries
group by query_name;


/* Problem 3 */


create table Submissions(
sub_id int default null,
parent_id int default null
);

insert into Submissions (sub_id, parent_id)
values(1,  Null),
(2,  Null),
(1,  Null), 
(12,  Null), 
(3, 1),
(5, 2),
(3, 1),
(4, 1),
(9, 1),
(10, 2),
(6, 7);


select L.post_id as post_id , coalesce(R.number_of_comments,0) as number_of_comments
from(
select distinct sub_id as post_id
from submissions
where parent_id is null) as L
left join (
select parent_id , count(distinct(sub_id)) as number_of_comments
from submissions
group by parent_id
having parent_id = any (select sub_id
						from submissions
						where parent_id is null)) as R
on L.post_id = R.parent_id
order by L.post_id;



/* Problem 4 */

create table Students(
student_id int primary key,
student_name varchar (50) default null
);

create table Subjects(
subject_name varchar (50) primary key
);

create table Examinations(
student_id int default null,
subject_name varchar (50) default null
);


insert into Students (student_id, student_name)
values(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

insert into Subjects(subject_name)
values('Math'),
('Physics'),
('Programming');
insert into Examinations (student_id , subject_name)
values(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');




select students.student_id , students.student_name , subjects.subject_name , count(examinations.student_id) as attended_exams
from students join subjects
left join examinations
on students.student_id = examinations.student_id and subjects.subject_name = examinations.subject_name
group by students.student_id , subjects.subject_name
order by students.student_id , subjects.subject_name;

