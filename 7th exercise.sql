-- EXPERIMENT 7
-- 1. Create a view of instructors without their salary called faculty
create view FACULTY as select id, name, dept_name from instructor;

-- 2. Create a view of department salary totals
create view dept_salary as select dept_name,sum(salary) from instructor group by dept_name;
-- drop view dept_salary;
select * from dept_salary;

+-----------+-------------+
| dept_name | sum(salary) |
+-----------+-------------+
| biology   |      138000 |
| comp.sci  |      232000 |
| elec.eng  |       80000 |
| finance   |      170000 |
| history   |      122000 |
| music     |       40000 |
| physics   |      182000 |
+-----------+-------------+
7 rows in set (0.000 sec)


-- 3. CREATE A ROLE OF STUDENT
create role student;

-- 4. Give select privileges on the view faculty to the role student.
grant select on Ads2_8.FACULTY to student;

-- 5. Create a new user and assign her the role of student. 
create user "student_user"@"localhost" identified by "root";
-- grant select on Ads2_8.* to  "student_user"@"localhost";
grant 'student' to "student_user"@"localhost";

-- 6. Login as this new user and find all instructors in the Biology department.
select name from instructor where dept_name ='biology';

-- 7. Revoke privileges of the new user
-- revoke select on Ads2_8.FACULTY from  "student_user"@"localhost";
+-------+
| name  |
+-------+
| smith |
| tom   |
| crick |
+-------+
3 rows in set (0.000 sec)


-- 8. Remove the role of student.
drop role student;

-- 9. Give select privileges on the view faculty to the new user.
grant select on Ads2_8.FACULTY to  "student_user"@"localhost";

-- 10. Login as this new user and find all instructors in the finance department.
select name from Ads2_8.FACULTY where dept_name ='finance';

-- 11. Login again as root user
mysql - u root -p

-- 12. Create table teaches2 with same columns as teaches.
create table teaches2 select * from teaches;
select * from teaches2;

+-------+-----------+--------+----------+------+
| id    | course_id | sec_id | semester | year |
+-------+-----------+--------+----------+------+
| 10101 | CS-101    |      1 | fall     | 2017 |
| 10101 | CS-315    |      1 | spring   | 2018 |
| 10101 | CS-347    |      1 | fall     | 2017 |
| 12121 | FIN-201   |      1 | spring   | 2018 |
| 15151 | MU-199    |      1 | spring   | 2018 |
| 22222 | PHY-101   |      1 | fall     | 2017 |
| 10101 | CS-101    |      1 | spring   | 2018 |
| 32343 | HIS-351   |      1 | spring   | 2018 |
| 45565 | CS-319    |      1 | spring   | 2018 |
| 45565 | CS-319    |      1 | spring   | 2017 |
| 76766 | BIO-101   |      1 | summer   | 2018 |
| 76766 | BIO-301   |      1 | summer   | 2017 |
| 83821 | CS-190    |      1 | spring   | 2017 |
| 83821 | CS-190    |      2 | spring   | 2017 |
| 83821 | CS-319    |      2 | spring   | 2018 |
| 98345 | EE-181    |      1 | spring   | 2017 |
+-------+-----------+--------+----------+------+
16 rows in set (0.000 sec)


-- 13. Create index ID column of teaches.
create index t_index on teaches2(id);
show index from teaches2;

+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Ignored |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
| teaches2 |          1 | t_index  |            1 | id          | A         |          16 |     NULL | NULL   | YES  | BTREE      |         |               | NO      |
+----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+
1 row in set (0.000 sec)


-- 14. Drop the index to free up the space.
alter table teaches2 drop index t_index ;