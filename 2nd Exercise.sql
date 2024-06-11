-- EXPERIMENT 2

-- PROCEDURE !!!!
drop procedure query_db;
delimiter //
create procedure query_db (in o_date date , out val int)
begin 
	select sum(purch_amt) into val from orders where order_date >= o_date;
    
end //
delimiter ;

call query_db('2021-11-05', @val);
select @val;
+-------+
| @val  |
+-------+
| 11628 |
+-------+
1 row in set (0.000 sec)


-- CURSORS!!!
delimiter //
declare @c_id integer;
declare @name text(128);
declare @city text(128);
declare @commission decimal(2,2);

-- declare cursors
declare cursor_test  cursor for select * from salesman where commission > 0.13;

-- open cursor
open cursor_test;
-- loop through a cursor
fetch next from  cursor_test into @s_id, @name, @city, @commission;
while @@fetchstatus =0
	begin
    print concat('id: ', @s_id, '/ name: ', @name, '/ city: ',@city, '/ commission: ',@commission);
	fetch next from  cursor_test into @s_id, @name, @city, @commission;
	end;

-- close the cursor
close cursor_test;
deallocate cursor_test;

delimiter ;


-- TRIGGER!!!!
-- drop trigger cityval;
delimiter //
create trigger cityval before insert on customer
for each row  
begin 
	if new.city ="Uganda" then set new.city = "currently delivery unavilable";
    end if;
end //
delimiter ;
insert into customer values(3010,'Micky me','Uganda',260,5003);
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
|        3010 | Micky me      | currently delivery unavilable |   260 |        5003 |
|        3011 | Micky Mouse   | currently delivery unavilable |   290 |        5005 |
+-------------+---------------+-------------------------------+-------+-------------+
9 rows in set (0.001 sec)

