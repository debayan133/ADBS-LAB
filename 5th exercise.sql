-- EXPERIMENT 5
-- 1. Find the total number of instructors who teach a course in the Spring 2018 semester.
select count(distinct id) from teaches where semester ="spring" and year = 2018;
+--------------------+
| count(distinct id) |
+--------------------+
|                  6 |
+--------------------+
1 row in set (0.000 sec)

-- 2. Find the number of tuples in the teaches relation
Select count(*) from teaches;
+----------+
| count(*) |
+----------+
|       16 |
+----------+
1 row in set (0.000 sec)


-- 3. Find the average salary of instructors in each department
select dept_name , avg(salary) from instructor group by dept_name;
+-----------+-------------+
| dept_name | avg(salary) |
+-----------+-------------+
| biology   |  69000.0000 |
| comp.sci  |  77333.3333 |
| elec.eng  |  80000.0000 |
| finance   |  85000.0000 |
| history   |  61000.0000 |
| music     |  40000.0000 |
| physics   |  91000.0000 |
+-----------+-------------+
7 rows in set (0.000 sec)


-- 4. Find the names and average salaries of all departments whose average salary is greater than 42000
select dept_name , avg(salary) from instructor group by dept_name having avg(salary)> 42000;
+-----------+-------------+
| dept_name | avg(salary) |
+-----------+-------------+
| biology   |  69000.0000 |
| comp.sci  |  77333.3333 |
| elec.eng  |  80000.0000 |
| finance   |  85000.0000 |
| history   |  61000.0000 |
| physics   |  91000.0000 |
+-----------+-------------+
6 rows in set (0.000 sec)


-- 5. Name all instructors whose name is neither “Mozart” nor Einstein”.
select * from instructor where name not in ("mozarat","einstein");
+-------+------------+-----------+--------+
| id    | name       | dept_name | salary |
+-------+------------+-----------+--------+
| 10101 | srinivasan | comp.sci  |  65000 |
| 10211 | smith      | biology   |  66000 |
| 10212 | tom        | biology   |   NULL |
| 12121 | wu         | finance   |  90000 |
| 32343 | el said    | history   |  60000 |
| 33456 | gold       | physics   |  87000 |
| 45565 | katz       | comp.sci  |  75000 |
| 58583 | califeri   | history   |  62000 |
| 76543 | singh      | finance   |  80000 |
| 76766 | crick      | biology   |  72000 |
| 83821 | brandt     | comp.sci  |  92000 |
| 98345 | kim        | elec.eng  |  80000 |
+-------+------------+-----------+--------+
12 rows in set (0.000 sec)


-- 6. Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.
select * from instructor where salary> any (select salary from instructor where dept_name='biology');
+-------+----------+-----------+--------+
| id    | name     | dept_name | salary |
+-------+----------+-----------+--------+
| 12121 | wu       | finance   |  90000 |
| 22222 | einstein | physics   |  95000 |
| 33456 | gold     | physics   |  87000 |
| 45565 | katz     | comp.sci  |  75000 |
| 76543 | singh    | finance   |  80000 |
| 76766 | crick    | biology   |  72000 |
| 83821 | brandt   | comp.sci  |  92000 |
| 98345 | kim      | elec.eng  |  80000 |
+-------+----------+-----------+--------+
8 rows in set (0.000 sec)

-- 7. Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
select * from instructor where salary > all (select salary from instructor where dept_name='biology');

Empty set (0.000 sec)

-- 8. Find the average instructors’ salaries of those departments where the average salary is greater than 42,000.
select dept_name,avg(salary) from instructor group by dept_name having avg(salary)> 42000;
+-----------+-------------+
| dept_name | avg(salary) |
+-----------+-------------+
| biology   |  69000.0000 |
| comp.sci  |  77333.3333 |
| elec.eng  |  80000.0000 |
| finance   |  85000.0000 |
| history   |  61000.0000 |
| physics   |  91000.0000 |
+-----------+-------------+
6 rows in set (0.000 sec)
