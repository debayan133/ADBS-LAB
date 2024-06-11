-- EXPERIMENT 6

-- 1. Find all departments where the total salary is greater than the average of the total salary at all departments
select dept_name,sum(salary), avg(salary) from instructor group by dept_name having sum(salary) > avg(salary);
-- select avg(salary) from instructor;
--  where salary >= (select avg(salary) from instructor group by dept_name)
+-----------+-------------+-------------+
| dept_name | sum(salary) | avg(salary) |
+-----------+-------------+-------------+
| biology   |      138000 |  69000.0000 |
| comp.sci  |      232000 |  77333.3333 |
| finance   |      170000 |  85000.0000 |
| history   |      122000 |  61000.0000 |
| physics   |      182000 |  91000.0000 |
+-----------+-------------+-------------+
5 rows in set (0.000 sec)

-- 2. List the names of instructors along with the course ID of the courses that they taught.
select distinct name,course_id from instructor inner join teaches on instructor.id=teaches.id ;
+------------+-----------+
| name       | course_id |
+------------+-----------+
| srinivasan | CS-101    |
| srinivasan | CS-315    |
| srinivasan | CS-347    |
| wu         | FIN-201   |
| mozarat    | MU-199    |
| einstein   | PHY-101   |
| el said    | HIS-351   |
| katz       | CS-319    |
| crick      | BIO-101   |
| crick      | BIO-301   |
| brandt     | CS-190    |
| brandt     | CS-319    |
| kim        | EE-181    |
+------------+-----------+
13 rows in set (0.000 sec)


-- 3. List the names of instructors along with the course ID of the courses that they taught. In case, an instructor teaches no courses keep the course ID as null.
select distinct name,course_id from instructor left join teaches on instructor.id=teaches.id ;

+------------+-----------+
| name       | course_id |
+------------+-----------+
| srinivasan | CS-101    |
| srinivasan | CS-315    |
| srinivasan | CS-347    |
| smith      | NULL      |
| tom        | NULL      |
| wu         | FIN-201   |
| mozarat    | MU-199    |
| einstein   | PHY-101   |
| el said    | HIS-351   |
| gold       | NULL      |
| katz       | CS-319    |
| califeri   | NULL      |
| singh      | NULL      |
| crick      | BIO-101   |
| crick      | BIO-301   |
| brandt     | CS-190    |
| brandt     | CS-319    |
| kim        | EE-181    |
+------------+-----------+
18 rows in set (0.000 sec)


-- 4. Create a view of instructors without their salary called faculty
create view FACULTY as select id, name, dept_name from instructor;
select * from FACULTY;

+-------+------------+-----------+
| id    | name       | dept_name |
+-------+------------+-----------+
| 10101 | srinivasan | comp.sci  |
| 10211 | smith      | biology   |
| 10212 | tom        | biology   |
| 12121 | wu         | finance   |
| 15151 | mozarat    | music     |
| 22222 | einstein   | physics   |
| 32343 | el said    | history   |
| 33456 | gold       | physics   |
| 45565 | katz       | comp.sci  |
| 58583 | califeri   | history   |
| 76543 | singh      | finance   |
| 76766 | crick      | biology   |
| 83821 | brandt     | comp.sci  |
| 98345 | kim        | elec.eng  |
+-------+------------+-----------+
14 rows in set (0.000 sec)


-- 5. Give select privileges on the view faculty to the new user.
create user "new"@"localhost" identified by 'password';
grant select on Ads2_8.FACULTY TO "new"@"localhost";

