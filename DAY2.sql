use ds_batch23;
show tables;
desc student;

/* 
ALTER COMMAND
ALTER TABLE TABLE_NAME
--------------------;

ADDING A COLUMN
DROPING A COLUMN
CHANGING THE NAME OF THE COLUMN
CHANGING THE DATA TYPE OF A COLUMN
CHANGING THE NAME OF THE TABLE
*/

alter table student                                         /* ADDING A COLUMN */
add dob date;
desc student;

alter table student                                         /* DROPING A COLUMN */
drop column dob;
desc student;

alter table student                                        /* CHANGING THE NAME OF THE COLUMN */
rename column name to first_name;
desc student;

alter table student                                        /* CHANGING THE NAME OF THE COLUMN */
rename column city to mobile_no;
desc student;

alter table student                                       /* CHANGING THE DATA TYPE OF A COLUMN */
modify mobile_no bigint;
desc student;

alter table student                                      /* CHANGING THE NAME OF THE TABLE */
rename to student1;
desc student1;

/* 
DML COMMANDS :
INSERT
UPDATE
DELETE
*/

insert into student1 (id, first_name, age, mobile_no)
			  values (101, 'Gitanjali', 23, 9089786798);
              
select * from student1;

insert into student1 
			  values (102, 'Atharv', 22, 9089786799);
              
select * from student1;

insert into student1 (id, first_name, age, mobile_no)                              /* WRONG INPUT */
			  values (101, 'Gitanjali', 23);
              
insert into student1 (id, first_name, age, mobile_no)                              /* WRONG INPUT */
			  values (103,9987789876 , 23,'Gitanjali');
              
              
insert into student1 (id, first_name, age)                              
			  values (103, 'Gitanjali', 23);
select * from student1;

insert into student1 (id,  mobile_no,  age, first_name)                              
			  values (104, 9987789876 , 23, 'Gitanjali');
 select * from student1;  
 
 
 insert into student1 values (105, 'Archit', 24, 9289786799),
                             (106, 'Sarwat', 25, 9689786799),
                             (107, 'Disha', 22, 9089786899),
                             (108, 'Teja', 22, 9089786790),
                             (109, 'Miral', 21, 9089786796),
                             (110, 'Suma', 23, 9079786779),
                             (111, 'Rashid', 21, 8089786799);
                             
 select * from student1;
 
 /* TRUNCATE COMMAND */
 
 truncate table student1;
 select * from student1;
 
 insert into student1 values (101, 'Gitanjali', 23, 9089786798),
                             (102, 'Atharv', 22, 9089786799),
                             (103, 'Santosh', 25, 9987789876 ),
                             (104, 'Ethans', 100, 9987789876 ),
							 (105, 'Archit', 24, 9289786799),
                             (106, 'Sarwat', 25, 9689786799),
                             (107, 'Disha', 22, 9089786899),
                             (108, 'Teja', 22, 9089786790),
                             (109, 'Miral', 21, 9089786796),
                             (110, 'Suma', 23, 9079786779),
                             (111, 'Rashid', 21, 8089786799);
                             
 select * from student1;
 
 set sql_safe_updates = 0;
 
 /* 
 UPDATE COMMAND
SYNTAX :
UPDATE TABLE_NAME
SET COLUMN1 = NEW_VALUE, COLUMN2 = NEW_VALUE,............
WHERE CONDITIONS;
*/

update student1
set age = 21
where first_name = 'Gitanjali';
select * from student1;

update student1
set mobile_no = 9699521136
where id = 101 and first_name = 'Gitanjali';
select * from student1;

update student1
set first_name = 'Nilesh', age = 50
where age = 100;
select * from student1;

update student1
set first_name = 'Neha', age = 25
where id = 102 and age = 22;
select * from student1;
