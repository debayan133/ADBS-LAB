import mysql.connector

conn = mysql.connector.connect(user='root',
                               host='localhost',
                               passwd='root',
                               database='adbs',
                               auth_plugin='mysql_native_password')

cur = conn.cursor()

# -- 1. Order the tuples in the instructors relation as per their salary.
stmt ="select * from instructor order by salary asc;"
cur.execute(stmt)

(10212, 'tom', 'biology', None)
(15151, 'mozarat', 'music', 40000)
(32343, 'el said', 'history', 60000)
(58583, 'califeri', 'history', 62000)
(10101, 'srinivasan', 'comp.sci', 65000)
(10211, 'smith', 'biology', 66000)
(76766, 'crick', 'biology', 72000)
(45565, 'katz', 'comp.sci', 75000)
(98345, 'kim', 'elec.eng', 80000)
(76543, 'singh', 'finance', 80000)
(33456, 'gold', 'physics', 87000)
(12121, 'wu', 'finance', 90000)
(83821, 'brandt', 'comp.sci', 92000)
(22222, 'einstein', 'physics', 95000)

# -- 2. Find courses that ran in Fall 2017 or in Spring 2018
stmt="select distinct course_id from teaches where (semester = 'fall' and year =2017) or (semester = 'spring' and year =2018);"

('CS-101',)
('CS-315',)
('CS-347',)
('FIN-201',)
('MU-199',)
('PHY-101',)
('HIS-351',)
('CS-319',)


# -- 3. Find courses that ran in Fall 2017 and in Spring 2018
stmt="select course_id from teaches where  semester = ('fall' and year =2017) and (semester = 'spring' and year =2018);"

('CS-315',)
('FIN-201',)
('MU-199',)
('CS-101',)
('HIS-351',)
('CS-319',)
('CS-319',)


# -- 4. Find courses that ran in Fall 2017 but not in Spring 2018
stmt="select course_id from teaches where (semester = 'fall' and year =2017) AND NOT (semester = 'spring' and year =2018);"

('CS-101',)
('CS-347',)
('PHY-101',)

# -- 5. Insert following additional tuples in instructor :('10211', 'Smith', 'Biology', 66000), ('10212', 'Tom', 'Biology', NULL )
stmt="insert into instructor values(10211,'smith','biology',66000),(10212,'tom','biology',null);"

# -- 6. Find all instructors whose salary is null.
stmt ="select * from instructor where salary is null;"

(10212, 'tom', 'biology', None)

# -- 7. Find the average salary of instructors in the Computer Science department.
stmt="select avg(salary) as avg_salary from instructor where dept_name='Comp.Sci';"

# (Decimal('77333.3333'),)

# -- 8 Find the total number of instructors who teach a course in the Spring 2018 semester.
stmt="select count(distinct id) from teaches where semester ='spring' and year = 2018;"
(6,)

# -- 9. Find the number of tuples in the teaches relation
stmt="Select count(*) from teaches;"
(16,)

# --10. Find the average salary of instructors in each department
stmt="select dept_name , avg(salary) from instructor group by dept_name;"

# ('biology', Decimal('69000.0000'))
# ('comp.sci', Decimal('77333.3333'))
# ('elec.eng', Decimal('80000.0000'))
# ('finance', Decimal('85000.0000'))
# ('history', Decimal('61000.0000'))
# ('music', Decimal('40000.0000'))
# ('physics', Decimal('91000.0000'))


# -- 11. Find the names and average salaries of all departments whose average salary is greater than 42000
stmt="select dept_name , avg(salary) from instructor group by dept_name having avg(salary)> 42000;"

# ('biology', Decimal('69000.0000'))
# ('comp.sci', Decimal('77333.3333'))
# ('elec.eng', Decimal('80000.0000'))
# ('finance', Decimal('85000.0000'))
# ('history', Decimal('61000.0000'))
# ('physics', Decimal('91000.0000'))

# -- 12. Name all instructors whose name is neither “Mozart” nor Einstein”.
stmt="select * from instructor where name not in ('mozarat','einstein');"

(10101, 'srinivasan', 'comp.sci', 65000)
(10211, 'smith', 'biology', 66000)
(10212, 'tom', 'biology', None)
(12121, 'wu', 'finance', 90000)
(32343, 'el said', 'history', 60000)
(33456, 'gold', 'physics', 87000)
(45565, 'katz', 'comp.sci', 75000)
(58583, 'califeri', 'history', 62000)
(76543, 'singh', 'finance', 80000)
(76766, 'crick', 'biology', 72000)
(83821, 'brandt', 'comp.sci', 92000)
(98345, 'kim', 'elec.eng', 80000)


# -- 13. Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.
stmt="select * from instructor where salary> any (select salary from instructor where dept_name='biology');"

(12121, 'wu', 'finance', 90000)
(22222, 'einstein', 'physics', 95000)
(33456, 'gold', 'physics', 87000)
(45565, 'katz', 'comp.sci', 75000)
(76543, 'singh', 'finance', 80000)
(76766, 'crick', 'biology', 72000)
(83821, 'brandt', 'comp.sci', 92000)
(98345, 'kim', 'elec.eng', 80000)

# -- 14. Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
stmt="select * from instructor where salary > all (select salary from instructor where dept_name='biology');"


# -- 15. Find the average instructors’ salaries of those departments where the average salary is greater than 42,000.
stmt="select dept_name,avg(salary) from instructor group by dept_name having avg(salary)> 42000;"

# ('biology', Decimal('69000.0000'))
# ('comp.sci', Decimal('77333.3333'))
# ('elec.eng', Decimal('80000.0000'))
# ('finance', Decimal('85000.0000'))
# ('history', Decimal('61000.0000'))
# ('physics', Decimal('91000.0000'))


# -- 16. Find all departments where the total salary is greater than the average of the total salary at all departments
stmt="select dept_name,sum(salary), avg(salary) from instructor group by dept_name having sum(salary) > avg(salary);"

# ('biology', Decimal('138000'), Decimal('69000.0000'))
# ('comp.sci', Decimal('232000'), Decimal('77333.3333'))
# ('finance', Decimal('170000'), Decimal('85000.0000'))
# ('history', Decimal('122000'), Decimal('61000.0000'))
# ('physics', Decimal('182000'), Decimal('91000.0000'))


# -- 17. List the names of instructors along with the course ID of the courses that they taught.
stmt="select distinct name,course_id from instructor inner join teaches on instructor.id=teaches.id ;"

('srinivasan', 'CS-101')
('srinivasan', 'CS-315')
('srinivasan', 'CS-347')
('wu', 'FIN-201')
('mozarat', 'MU-199')
('einstein', 'PHY-101')
('el said', 'HIS-351')
('katz', 'CS-319')
('crick', 'BIO-101')
('crick', 'BIO-301')
('brandt', 'CS-190')
('brandt', 'CS-319')
('kim', 'EE-181')


# -- 18. List the names of instructors along with the course ID of the courses that they taught. In case, an instructor teaches no courses keep the course ID as null.
stmt="select distinct name,course_id from instructor left join teaches on instructor.id=teaches.id ;"
cur.execute(stmt)

('srinivasan', 'CS-101')
('srinivasan', 'CS-315')
('srinivasan', 'CS-347')
('smith', None)
('tom', None)
('wu', 'FIN-201')
('mozarat', 'MU-199')
('einstein', 'PHY-101')
('el said', 'HIS-351')
('gold', None)
('katz', 'CS-319')
('califeri', None)
('singh', None)
('crick', 'BIO-101')
('crick', 'BIO-301')
('brandt', 'CS-190')
('brandt', 'CS-319')
('kim', 'EE-181')

rows = cur.fetchall()
for row in rows:
    print(row)
conn.close()