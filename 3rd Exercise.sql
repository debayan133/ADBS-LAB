-- create database Ads2_8;
-- use Ads2_8;

-- EXPERIMENT 3
-- 1. TABLE INSTRUCTOR
create table instructor(id integer primary key, name text, dept_name text, salary integer);
insert into instructor values(10101,"srinivasan","comp.sci",65000),(12121,"wu","finance",90000),(15151,"mozarat","music",40000),
(22222,"einstein","physics",95000),(32343,"el said","history",60000),(33456,"gold","physics",87000),(45565,"katz","comp.sci",75000);
insert into instructor values(58583,"califeri","history",62000),(76543,"singh","finance",80000),(76766,"crick","biology",72000),
(83821,"brandt","comp.sci",92000),(98345,"kim","elec.eng",80000);

select* from instructor;
+-------+------------+-----------+--------+
| id    | name       | dept_name | salary |
+-------+------------+-----------+--------+
| 10101 | srinivasan | comp.sci  |  65000 |
| 10211 | smith      | biology   |  66000 |
| 10212 | tom        | biology   |   NULL |
| 12121 | wu         | finance   |  90000 |
| 15151 | mozarat    | music     |  40000 |
| 22222 | einstein   | physics   |  95000 |
| 32343 | el said    | history   |  60000 |
| 33456 | gold       | physics   |  87000 |
| 45565 | katz       | comp.sci  |  75000 |
| 58583 | califeri   | history   |  62000 |
| 76543 | singh      | finance   |  80000 |
| 76766 | crick      | biology   |  72000 |
| 83821 | brandt     | comp.sci  |  92000 |
| 98345 | kim        | elec.eng  |  80000 |
+-------+------------+-----------+--------+
14 rows in set (0.001 sec)


-- 2. TABLE TEACHES
create table teaches(id integer,course_id text not null, sec_id integer, semester text, year integer(4),
 foreign key(id) references instructor(id));
insert into teaches values(10101,"CS-101",1,"fall",2017),(10101,"CS-315",1,"spring",2018),(10101,"CS-347",1,"fall",2017),
(12121,"FIN-201",1,"spring",2018),(15151,"MU-199",1,"spring",2018),(22222,"PHY-101",1,"fall",2017),(10101,"CS-101",1,"spring",2018),
(32343,"HIS-351",1,"spring",2018),(45565,"CS-319",1,"spring",2018),(45565,"CS-319",1,"spring",2017),(76766,"BIO-101",1,"summer",2018),
(76766,"BIO-301",1,"summer",2017),(83821,"CS-190",1,"spring",2017),(83821,"CS-190",2,"spring",2017),(83821,"CS-319",2,"spring",2018),
(98345,"EE-181",1,"spring",2017);

select* from teaches;
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

-- 3. Insert following additional tuple in instructor ('10211', 'Smith', 'Biology', 66000)
insert into instructor values(10211,"smith","biology",66000);
Query OK, 1 row affected (0.001 sec)

-- 4. Delete this tuple from instructor ('10211', 'Smith', 'Biology', 66000)
delete from instructor where id =10211;
Query OK, 1 row affected (0.001 sec)

-- 5. Select tuples from instructor where dept_name = ‘History’
select* from instructor where dept_name="history";
+-------+----------+-----------+--------+
| id    | name     | dept_name | salary |
+-------+----------+-----------+--------+
| 32343 | el said  | history   |  60000 |
| 58583 | califeri | history   |  62000 |
+-------+----------+-----------+--------+
2 rows in set (0.000 sec)


-- 6. Find the Cartesian product instructor x teaches.
select * from instructor cross join teaches;

+-------+------------+-----------+--------+-------+-----------+--------+----------+------+
| id    | name       | dept_name | salary | id    | course_id | sec_id | semester | year |
+-------+------------+-----------+--------+-------+-----------+--------+----------+------+
| 10101 | srinivasan | comp.sci  |  65000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 10211 | smith      | biology   |  66000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 10212 | tom        | biology   |   NULL | 10101 | CS-101    |      1 | fall     | 2017 |
| 12121 | wu         | finance   |  90000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 15151 | mozarat    | music     |  40000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 22222 | einstein   | physics   |  95000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 32343 | el said    | history   |  60000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 33456 | gold       | physics   |  87000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 58583 | califeri   | history   |  62000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 76543 | singh      | finance   |  80000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 76766 | crick      | biology   |  72000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 10101 | CS-101    |      1 | fall     | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 10101 | CS-315    |      1 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 10101 | CS-315    |      1 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 10211 | smith      | biology   |  66000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 10212 | tom        | biology   |   NULL | 10101 | CS-347    |      1 | fall     | 2017 |
| 12121 | wu         | finance   |  90000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 15151 | mozarat    | music     |  40000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 22222 | einstein   | physics   |  95000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 32343 | el said    | history   |  60000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 33456 | gold       | physics   |  87000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 58583 | califeri   | history   |  62000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 76543 | singh      | finance   |  80000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 76766 | crick      | biology   |  72000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 10101 | CS-347    |      1 | fall     | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 12121 | FIN-201   |      1 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 12121 | FIN-201   |      1 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 15151 | MU-199    |      1 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 15151 | MU-199    |      1 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 10211 | smith      | biology   |  66000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 10212 | tom        | biology   |   NULL | 22222 | PHY-101   |      1 | fall     | 2017 |
| 12121 | wu         | finance   |  90000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 15151 | mozarat    | music     |  40000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 22222 | einstein   | physics   |  95000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 32343 | el said    | history   |  60000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 33456 | gold       | physics   |  87000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 58583 | califeri   | history   |  62000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 76543 | singh      | finance   |  80000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 76766 | crick      | biology   |  72000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 22222 | PHY-101   |      1 | fall     | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 10101 | CS-101    |      1 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 10101 | CS-101    |      1 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 32343 | HIS-351   |      1 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 32343 | HIS-351   |      1 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 45565 | CS-319    |      1 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 45565 | CS-319    |      1 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 10211 | smith      | biology   |  66000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 10212 | tom        | biology   |   NULL | 45565 | CS-319    |      1 | spring   | 2017 |
| 12121 | wu         | finance   |  90000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 15151 | mozarat    | music     |  40000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 22222 | einstein   | physics   |  95000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 32343 | el said    | history   |  60000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 33456 | gold       | physics   |  87000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 58583 | califeri   | history   |  62000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 76543 | singh      | finance   |  80000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 76766 | crick      | biology   |  72000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 45565 | CS-319    |      1 | spring   | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 10211 | smith      | biology   |  66000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 10212 | tom        | biology   |   NULL | 76766 | BIO-101   |      1 | summer   | 2018 |
| 12121 | wu         | finance   |  90000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 15151 | mozarat    | music     |  40000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 22222 | einstein   | physics   |  95000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 32343 | el said    | history   |  60000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 33456 | gold       | physics   |  87000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 58583 | califeri   | history   |  62000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 76543 | singh      | finance   |  80000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 76766 | crick      | biology   |  72000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 76766 | BIO-101   |      1 | summer   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 10211 | smith      | biology   |  66000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 10212 | tom        | biology   |   NULL | 76766 | BIO-301   |      1 | summer   | 2017 |
| 12121 | wu         | finance   |  90000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 15151 | mozarat    | music     |  40000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 22222 | einstein   | physics   |  95000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 32343 | el said    | history   |  60000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 33456 | gold       | physics   |  87000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 58583 | califeri   | history   |  62000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 76543 | singh      | finance   |  80000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 76766 | crick      | biology   |  72000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 76766 | BIO-301   |      1 | summer   | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 10211 | smith      | biology   |  66000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 10212 | tom        | biology   |   NULL | 83821 | CS-190    |      1 | spring   | 2017 |
| 12121 | wu         | finance   |  90000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 15151 | mozarat    | music     |  40000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 22222 | einstein   | physics   |  95000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 32343 | el said    | history   |  60000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 33456 | gold       | physics   |  87000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 58583 | califeri   | history   |  62000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 76543 | singh      | finance   |  80000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 76766 | crick      | biology   |  72000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 83821 | CS-190    |      1 | spring   | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 10211 | smith      | biology   |  66000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 10212 | tom        | biology   |   NULL | 83821 | CS-190    |      2 | spring   | 2017 |
| 12121 | wu         | finance   |  90000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 15151 | mozarat    | music     |  40000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 22222 | einstein   | physics   |  95000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 32343 | el said    | history   |  60000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 33456 | gold       | physics   |  87000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 58583 | califeri   | history   |  62000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 76543 | singh      | finance   |  80000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 76766 | crick      | biology   |  72000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 83821 | CS-190    |      2 | spring   | 2017 |
| 10101 | srinivasan | comp.sci  |  65000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 10211 | smith      | biology   |  66000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 10212 | tom        | biology   |   NULL | 83821 | CS-319    |      2 | spring   | 2018 |
| 12121 | wu         | finance   |  90000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 15151 | mozarat    | music     |  40000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 22222 | einstein   | physics   |  95000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 32343 | el said    | history   |  60000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 33456 | gold       | physics   |  87000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 45565 | katz       | comp.sci  |  75000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 58583 | califeri   | history   |  62000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 76543 | singh      | finance   |  80000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 76766 | crick      | biology   |  72000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 83821 | brandt     | comp.sci  |  92000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 98345 | kim        | elec.eng  |  80000 | 83821 | CS-319    |      2 | spring   | 2018 |
| 10101 | srinivasan | comp.sci  |  65000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 10211 | smith      | biology   |  66000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 10212 | tom        | biology   |   NULL | 98345 | EE-181    |      1 | spring   | 2017 |
| 12121 | wu         | finance   |  90000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 15151 | mozarat    | music     |  40000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 22222 | einstein   | physics   |  95000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 32343 | el said    | history   |  60000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 33456 | gold       | physics   |  87000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 45565 | katz       | comp.sci  |  75000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 58583 | califeri   | history   |  62000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 76543 | singh      | finance   |  80000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 76766 | crick      | biology   |  72000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 83821 | brandt     | comp.sci  |  92000 | 98345 | EE-181    |      1 | spring   | 2017 |
| 98345 | kim        | elec.eng  |  80000 | 98345 | EE-181    |      1 | spring   | 2017 |
+-------+------------+-----------+--------+-------+-----------+--------+----------+------+
224 rows in set (0.001 sec)


-- 7. Find the names of all instructors who have taught some course and the course_id
select distinct name,teaches.course_id from instructor join teaches on instructor.id = teaches.id;
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
13 rows in set (0.001 sec)


-- 8. Find the names of all instructors whose name includes the substring “dar”.
select name from instructor where name like "%at%"; 
+---------+
| name    |
+---------+
| mozarat |
| katz    |
+---------+
2 rows in set (0.000 sec)


-- 9. Find the names of all instructors with salary between 90,000 and 100,000 (that is, ≥ 90,000 and ≤ 100,000)
select name from instructor where salary between 90000 and 100000;
+----------+
| name     |
+----------+
| wu       |
| einstein |
| brandt   |
+----------+
3 rows in set (0.000 sec)

