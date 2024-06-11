create database Ads_8;
use Ads_8;

create table salesman(salesman_id integer primary key, name text not null, city text , commision decimal(2,2));
alter table salesman rename column commision to commission;

insert into salesman values(5001,'James hoog','New york',0.15),(5002,'nail knite','Paris',0.13),(5005,'Pit Alex','London',0.11),(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Ken','',0.12),(5007,'Paul Adam','Rome',0.13);

select * from salesman;
+-------------+------------+----------+------------+
| salesman_id | name       | city     | commission |
+-------------+------------+----------+------------+
|        5001 | James hoog | New york |       0.15 |
|        5002 | nail knite | Paris    |       0.13 |
|        5003 | Lauson Ken |          |       0.12 |
|        5005 | Pit Alex   | London   |       0.11 |
|        5006 | Mc Lyon    | Paris    |       0.14 |
|        5007 | Paul Adam  | Rome     |       0.13 |
+-------------+------------+----------+------------+
6 rows in set (0.010 sec)


 
create table customer(customer_id integer primary key, customer_name text not null, city text , grade integer, salesman_id integer,
foreign key(salesman_id) references salesman(salesman_id));

insert into customer values(3002,'Nick Rink','New York',100,5001),(3005,'Graham Bell','California',200,5002),(3001,'Brad Pitt','London',null,null),(3004,'Fabio Carl','London',300,5006),
(3007,'James Bond','Minnesota',200,5001),(3008,'Joey Mann','London',200,5007),(3009,'Geff Matt','Berlin',100,null);

select * from customer;
+-------------+---------------+-------------------------------+-------+-------------+
| customer_id | customer_name | city                          | grade | salesman_id |
+-------------+---------------+-------------------------------+-------+-------------+
|        3001 | Brad Pitt     | London                        |  NULL |        NULL |
|        3002 | Nick Rink     | New York                      |   100 |        5001 |
|        3004 | Fabio Carl    | London                        |   300 |        5006 |
|        3005 | Graham Bell   | California                    |   200 |        5002 |
|        3007 | James Bond    | Minnesota                     |   200 |        5001 |
|        3008 | Joey Mann     | London                        |   200 |        5007 |
|        3009 | Geff Matt     | Berlin                        |   100 |        NULL |
|        3011 | Micky Mouse   | currently delivery unavilable |   290 |        5005 |
+-------------+---------------+-------------------------------+-------+-------------+
8 rows in set (0.017 sec)



create table orders (order_no integer primary key,purch_amt decimal(6,2) not null, order_date date not null, customer_id integer,salesman_id integer,
foreign key(customer_id) references customer(customer_id), foreign key(salesman_id) references salesman(salesman_id));

insert into orders values(7001,150.5,'2021-10-05',3005,5002),(7009,279.65,'2021-10-05',3001,null),(7002,65.26,'2021-11-01',3002,5001),(7004,110.5,'2021-11-03',3009,null),(7007,986.6,'2021-11-05',3005,5002),
    (7005,2400.8,'2021-11-10',3007,5001),(7008,5760,'2021-11-29',3002,5001),(7012,2480.7,'2021-12-12',3009,null);
update orders set salesman_id = 5007 where order_no = 7012;

select* from orders;
+----------+-----------+------------+-------------+-------------+
| order_no | purch_amt | order_date | customer_id | salesman_id |
+----------+-----------+------------+-------------+-------------+
|     7001 |    150.50 | 2021-10-05 |        3005 |        5002 |
|     7002 |     65.26 | 2021-11-01 |        3002 |        5001 |
|     7004 |    110.50 | 2021-11-03 |        3009 |        NULL |
|     7005 |   2400.80 | 2021-11-10 |        3007 |        5001 |
|     7007 |    986.60 | 2021-11-05 |        3005 |        5002 |
|     7008 |   5760.00 | 2021-11-29 |        3002 |        5001 |
|     7009 |    279.65 | 2021-10-05 |        3001 |        NULL |
|     7012 |   2480.70 | 2021-12-12 |        3009 |        5007 |
+----------+-----------+------------+-------------+-------------+
8 rows in set (0.001 sec)


-- query 1: Display name and commission of all the salesmen.
select name, commission from salesman;
+------------+------------+
| name       | commission |
+------------+------------+
| James hoog |       0.15 |
| nail knite |       0.13 |
| Lauson Ken |       0.12 |
| Pit Alex   |       0.11 |
| Mc Lyon    |       0.14 |
| Paul Adam  |       0.13 |
+------------+------------+
6 rows in set (0.000 sec)


-- query 2: Retrieve salesman id of all salesmen from orders table without any repeats.
select distinct salesman_id from orders;
+-------------+
| salesman_id |
+-------------+
|        NULL |
|        5001 |
|        5002 |
|        5007 |
+-------------+


-- query 3: Display names and city of salesman, who belongs to the city of Paris.
select name, city from salesman where city ='Paris';
+------------+-------+
| name       | city  |
+------------+-------+
| nail knite | Paris |
| Mc Lyon    | Paris |
+------------+-------+
2 rows in set (0.000 sec)


-- query 4: Display all the information for those customers with a grade of 200.
select * from customer where grade=200;
+-------------+---------------+------------+-------+-------------+
| customer_id | customer_name | city       | grade | salesman_id |
+-------------+---------------+------------+-------+-------------+
|        3005 | Graham Bell   | California |   200 |        5002 |
|        3007 | James Bond    | Minnesota  |   200 |        5001 |
|        3008 | Joey Mann     | London     |   200 |        5007 |
+-------------+---------------+------------+-------+-------------+
3 rows in set (0.000 sec)


-- query 5: Display the order number, order date and the purchase amount for order(s) which will be delivered by the salesman with ID 5001.
select order_no,order_date,purch_amt from orders where salesman_id=5001;
+----------+------------+-----------+
| order_no | order_date | purch_amt |
+----------+------------+-----------+
|     7002 | 2021-11-01 |     65.26 |
|     7005 | 2021-11-10 |   2400.80 |
|     7008 | 2021-11-29 |   5760.00 |
+----------+------------+-----------+
3 rows in set (0.000 sec)


-- query 6: Display all the customers, who are either belongs to the city New York or not had a grade above 100.
select * from customer where city= 'New York' or not grade > 100;
+-------------+---------------+----------+-------+-------------+
| customer_id | customer_name | city     | grade | salesman_id |
+-------------+---------------+----------+-------+-------------+
|        3002 | Nick Rink     | New York |   100 |        5001 |
|        3009 | Geff Matt     | Berlin   |   100 |        NULL |
+-------------+---------------+----------+-------+-------------+
2 rows in set (0.000 sec)


-- query 7: Find those salesmen with all information who gets the commission within a range of 0.12 and 0.14.
select * from salesman where commission >=0.12 and commission <=0.14;
-- can also use between clause
+-------------+------------+-------+------------+
| salesman_id | name       | city  | commission |
+-------------+------------+-------+------------+
|        5002 | nail knite | Paris |       0.13 |
|        5003 | Lauson Ken |       |       0.12 |
|        5006 | Mc Lyon    | Paris |       0.14 |
|        5007 | Paul Adam  | Rome  |       0.13 |
+-------------+------------+-------+------------+
4 rows in set (0.001 sec)


-- query 8: Find all those customers with all information whose names are ending with the letter 'n'.
select * from customer where customer_name like '%n';
+-------------+---------------+--------+-------+-------------+
| customer_id | customer_name | city   | grade | salesman_id |
+-------------+---------------+--------+-------+-------------+
|        3008 | Joey Mann     | London |   200 |        5007 |
+-------------+---------------+--------+-------+-------------+
1 row in set (0.000 sec)


-- query 9: Find those salesmen with all information whose name containing the 1st character is 'N' and the 4th character is 'l' and rests may be any character.
select * from salesman where name like 'n_i%';
+-------------+------------+-------+------------+
| salesman_id | name       | city  | commission |
+-------------+------------+-------+------------+
|        5002 | nail knite | Paris |       0.13 |
+-------------+------------+-------+------------+
1 row in set (0.000 sec)


-- query 10: Find that customer with all information who does not get any grade except NULL.
select * from customer where grade is null;
+-------------+---------------+--------+-------+-------------+
| customer_id | customer_name | city   | grade | salesman_id |
+-------------+---------------+--------+-------+-------------+
|        3001 | Brad Pitt     | London |  NULL |        NULL |
+-------------+---------------+--------+-------+-------------+
1 row in set (0.000 sec)


-- query 11: Find the total purchase amount of all orders.
select sum(purch_amt) from orders;
+----------------+
| sum(purch_amt) |
+----------------+
|       12234.01 |
+----------------+
1 row in set (0.000 sec)


-- query 12: Find the number of salesman currently listing for all of their customers.
select count( distinct salesman_id) from orders;
+------------------------------+
| count( distinct salesman_id) |
+------------------------------+
|                            3 |
+------------------------------+
1 row in set (0.008 sec)


-- query 13:  Find the highest grade for each of the cities of the customers.
select city, max(grade) from customer group by city;
+-------------------------------+------------+
| city                          | max(grade) |
+-------------------------------+------------+
| Berlin                        |        100 |
| California                    |        200 |
| currently delivery unavilable |        290 |
| London                        |        300 |
| Minnesota                     |        200 |
| New York                      |        100 |
+-------------------------------+------------+
6 rows in set (0.000 sec)


-- query 14: Find the highest grade for each of the cities of the customers.
select customer_id, max(purch_amt) from orders group by customer_id;
+-------------+----------------+
| customer_id | max(purch_amt) |
+-------------+----------------+
|        3001 |         279.65 |
|        3002 |        5760.00 |
|        3005 |         986.60 |
|        3007 |        2400.80 |
|        3009 |        2480.70 |
+-------------+----------------+
5 rows in set (0.001 sec)


-- query 15: Find the highest purchase amount ordered by the each  customer on a particular date with their ID, order date and highest purchase amount.
select customer_id, order_date, max(purch_amt) from orders group by customer_id, order_date;
+-------------+------------+----------------+
| customer_id | order_date | max(purch_amt) |
+-------------+------------+----------------+
|        3001 | 2021-10-05 |         279.65 |
|        3002 | 2021-11-01 |          65.26 |
|        3002 | 2021-11-29 |        5760.00 |
|        3005 | 2021-10-05 |         150.50 |
|        3005 | 2021-11-05 |         986.60 |
|        3007 | 2021-11-10 |        2400.80 |
|        3009 | 2021-11-03 |         110.50 |
|        3009 | 2021-12-12 |        2480.70 |
+-------------+------------+----------------+
8 rows in set (0.001 sec)



-- query 16: Find the highest purchase amount on a date '2021-11-01' for each salesman with their ID
select salesman_id, purch_amt from orders where order_date ='2021-11-01' group by salesman_id;
+-------------+-----------+
| salesman_id | purch_amt |
+-------------+-----------+
|        5001 |     65.26 |
+-------------+-----------+
1 row in set (0.000 sec)


-- query 17: Find the highest purchase amount with their customer ID  and order date, for only those customers who have the
--   highest purchase amount in a day is more than 2000.
select customer_id, order_date ,purch_amt from orders group by customer_id, order_date having max(purch_amt)>2000;
+-------------+------------+-----------+
| customer_id | order_date | purch_amt |
+-------------+------------+-----------+
|        3002 | 2021-11-29 |   5760.00 |
|        3007 | 2021-11-10 |   2400.80 |
|        3009 | 2021-12-12 |   2480.70 |
+-------------+------------+-----------+
3 rows in set (0.000 sec)


-- query 18:  Write a SQL statement that counts all orders for a date 2021-11-10.
select count(*) from orders where order_date ='2021-11-10'; 
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.000 sec)



