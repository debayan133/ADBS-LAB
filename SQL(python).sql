import mysql.connector
 
mydb = mysql.connector.connect(host="localhost", user="root", password="dev@12345", database="db", auth_plugin='mysql_native_password') 
mycursor = mydb.cursor()


mycursor.execute("SELECT * FROM instructor ORDER BY salary")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--output:
(15151, 'mozart', 'music', 40000)
(32343, 'el said', 'history', 60000)
(58583, 'califieri', 'history', 62000)
(10101, 'srinivasan', 'comp.sci', 65000)
(10211, 'smith', 'biology', 66000)
(76766, 'crick', 'biology', 72000)
(45565, 'katz', 'comp.sci', 75000)
(76543, 'singh', 'finance', 80000)
(98345, 'kim', 'elec.eng', 80000)
(33456, 'gold', 'physics', 87000)
(12121, 'wu', 'finance', 90000)
(83821, 'brandt', 'comp.sci', 92000)
(22222, 'einstein', 'physics', 95000)

mycursor.execute("SELECT * FROM TEACHES WHERE semester IN ('Fall', 'Spring') AND year IN (2017, 2018)")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
(10101, 'CS-101', 1, 'fall', 2017)
(10101, 'CS-315', 1, 'spring', 2018)
(10101, 'CS-347', 1, 'fall', 2017)
(12121, 'FIN-201', 1, 'spring', 2018)
(15151, 'MU-199', 1, 'spring', 2018)
(22222, 'PHY-101', 1, 'fall', 2017)
(32343, 'HIS-351', 1, 'spring', 2018)
(45565, 'CS-101', 1, 'spring', 2018)
(45565, 'CS-319', 1, 'spring', 2018)
(83821, 'CS-190', 1, 'spring', 2017)
(83821, 'CS-190', 2, 'spring', 2017)
(83821, 'CS-319', 2, 'spring', 2018)
(98345, 'EE-181', 1, 'spring', 2017)

mycursor.execute("SELECT * FROM TEACHES WHERE semester = 'Fall' AND year = 2017 \
                                        AND Course_id IN (SELECT Course_id FROM TEACHES WHERE semester = 'Spring' AND year = 2018)")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
(10101, 'CS-101', 1, 'fall', 2017)

mycursor.execute("SELECT * FROM TEACHES WHERE semester = 'Fall' AND year = 2017 \
                                      AND Course_id NOT IN (SELECT Course_id FROM TEACHES WHERE semester = 'Spring' AND year = 2018)")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
(10101, 'CS-347', 1, 'fall', 2017)
(22222, 'PHY-101', 1, 'fall', 2017)

mycursor.execute("""INSERT INTO instructor (ID, name, dept_name, salary) 
VALUES ('10287', 'steve', 'Chemistry', 69000), 
       ('10254', 'Tom', 'Biology', 0)""")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

mycursor.execute("SELECT * FROM instructor WHERE salary IS NULL")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)


mycursor.execute("SELECT AVG(salary) FROM instructor WHERE dept_name = 'Comp. Sci.'")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
(None,)

mycursor.execute("SELECT COUNT(DISTINCT ID) FROM TEACHES WHERE semester = 'Spring' AND year = 2018")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
(6,)

mycursor.execute("SELECT COUNT(*) FROM TEACHES")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUPUT:
(15,)

mycursor.execute("SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUPUT:

('comp.sci', Decimal('77333.3333'))
('biology', Decimal('69000.0000'))
('finance', Decimal('85000.0000'))
('music', Decimal('40000.0000'))
('physics', Decimal('91000.0000'))
('history', Decimal('61000.0000'))
('elec.eng', Decimal('80000.0000'))

mycursor.execute("SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name HAVING AVG(salary) > 42000")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('comp.sci', Decimal('77333.3333'))
('biology', Decimal('69000.0000'))
('finance', Decimal('85000.0000'))
('physics', Decimal('91000.0000'))
('history', Decimal('61000.0000'))
('elec.eng', Decimal('80000.0000'))

mycursor.execute("SELECT * FROM instructor WHERE name NOT IN ('Mozart', 'Einstein')")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
(10101, 'srinivasan', 'comp.sci', 65000)
(10211, 'smith', 'biology', 66000)
(12121, 'wu', 'finance', 90000)
(32343, 'el said', 'history', 60000)
(33456, 'gold', 'physics', 87000)
(45565, 'katz', 'comp.sci', 75000)
(58583, 'califieri', 'history', 62000)
(76543, 'singh', 'finance', 80000)
(76766, 'crick', 'biology', 72000)
(83821, 'brandt', 'comp.sci', 92000)
(98345, 'kim', 'elec.eng', 80000)


mycursor.execute("SELECT name FROM instructor WHERE salary > (SELECT MAX(salary) FROM instructor WHERE dept_name = 'Biology')")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('wu',)
('einstein',)
('gold',)
('katz',)
('singh',)
('brandt',)
('kim',)

mycursor.execute("SELECT name FROM instructor WHERE salary > ALL (SELECT salary FROM instructor WHERE dept_name = 'Biology')")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('wu',)
('einstein',)
('gold',)
('katz',)
('singh',)
('brandt',)
('kim',)

mycursor.execute("SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name HAVING AVG(salary) > 42000")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('comp.sci', Decimal('77333.3333'))
('biology', Decimal('69000.0000'))
('finance', Decimal('85000.0000'))
('physics', Decimal('91000.0000'))
('history', Decimal('61000.0000'))
('elec.eng', Decimal('80000.0000'))

mycursor.execute("SELECT dept_name FROM instructor GROUP BY dept_name HAVING SUM(salary) > (SELECT AVG(total_salary) FROM (SELECT SUM(salary) AS total_salary FROM instructor GROUP BY dept_name) AS subquery)")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('comp.sci',)
('biology',)
('finance',)
('physics',)


mycursor.execute("SELECT instructor.name, TEACHES.Course_id FROM instructor JOIN TEACHES ON instructor.ID = TEACHES.ID")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('srinivasan', 'CS-101')
('srinivasan', 'CS-315')
('srinivasan', 'CS-347')
('wu', 'FIN-201')
('mozart', 'MU-199')
('einstein', 'PHY-101')
('el said', 'HIS-351')
('katz', 'CS-101')
('katz', 'CS-319')
('crick', 'BIO-101')
('crick', 'BIO-301')
('brandt', 'CS-190')
('brandt', 'CS-190')
('brandt', 'CS-319')
('kim', 'EE-181')

mycursor.execute("SELECT instructor.name, IFNULL(TEACHES.Course_id, 'NULL') FROM instructor LEFT JOIN TEACHES ON instructor.ID = TEACHES.ID")
myresult = mycursor.fetchall()

for x in myresult:
  print(x)

--OUTPUT:
('srinivasan', 'CS-101')
('srinivasan', 'CS-315')
('srinivasan', 'CS-347')
('smith', 'NULL')
('wu', 'FIN-201')
('mozart', 'MU-199')
('einstein', 'PHY-101')
('el said', 'HIS-351')
('gold', 'NULL')
('katz', 'CS-101')
('katz', 'CS-319')
('califieri', 'NULL')
('singh', 'NULL')
('crick', 'BIO-101')
('crick', 'BIO-301')
('brandt', 'CS-190')
('brandt', 'CS-190')
('brandt', 'CS-319')
('kim', 'EE-181')

