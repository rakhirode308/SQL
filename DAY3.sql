use ds_batch23;
select * from student1;

 insert into student1 values (105, 'Archit', 24, 9289786799),
                             (106, 'Sarwat', 25, 9689786799),
                             (107, 'Disha', 22, 9089786899),
                             (108, 'Teja', 22, 9089786790),
                             (109, 'Miral', 21, 9089786796),
                             (110, 'Suma', 23, 9079786779),
                             (111, 'Rashid', 21, 8089786799);
                             
 select * from student1;
 
 
 /*
 DELETE COMMAND
 SYNTAX:
 DELETE FROM TABLE_NAME
 WHERE CONDITIONS
 */
 
 set sql_safe_updates = 0;
 
 delete from student1
 where id = 104;
 select * from student1;
 
 delete from student1
 where age > 24;
 select * from student1;
 
 /*
 MYSQL CONSTRAINTS
 SYNTAX:
 CREATE TABLE TABLE_NAME(
                          COLUMN1 DATATYPE CONSTRAINT,
                          COLUMN1 DATATYPE CONSTRAINT,
                          COLUMN1 DATATYPE CONSTRAINT,
                          ---------------------------,
                          );
                          
CONSTRAINTS:
 NOT NULL - NULL VALUES ARE  NOT ALLOWED
 UNIQUE - DUPLICATE VALUES ARE NOT ALLOWED
 DEFAULT - ALLOWS TO SPECIFY DEFAULT VALUE FOR A COLUMN
 PRIMARY KEY - UNIQUELY IDENTIFIES EACH ROW IN A TABLE
               (COMBINATION OF NOT NULLL & UNIQUE)
FOREIGN KEY - MAINTAINING THE LINK BETWEEN THE TABLES
CHECK - TO APPLY CONDITIONS
*/

create table employeee( empid int primary key,
                       first_name varchar(50) not null,
                       last_name varchar(50),
                       city varchar(50) default "PUNE",
                       age int check(age>21),
                       mobile_no bigint not null unique
                       );
                       
insert into employeee(empid,first_name,last_name,city,age,mobile_no)                     /* DUPLICATE VALUE NOT ALLOWED */
       values(101,"sarwat","ali","mumbai",25,9988776655);
select * from employeee;


insert into employeee(first_name,last_name,city,age,mobile_no)                     /* NULL VALUE NOT ALLOWED */
       values("sarwat","ali","mumbai",25,9988776655);
       
select * from employeee;

insert into employeee(empid,first_name,last_name,age,mobile_no)                     /* DEFAULT VALUE */
       values(102,"sarwat","ali",25,9988776654);
       select * from employeee;
       
insert into employeee(empid,first_name,last_name,age,mobile_no)                     /* VIOLATION OF CONDITION */
       values(103,"sarwat","ali",20,9988776656);
       select * from employeee;
       
insert into employeee(empid,first_name,last_name,age)                              /* NULL VALUE NOT ALLOWED */
       values(104,"sarwat","ali",22);
       select * from employeee;
       
insert into employeee(empid,first_name,last_name,age,mobile_no)                       /* DUPLICATE VALUE NOT ALLOWED */
       values(104,"sarwat","ali",22,9988776655);
       select * from employeee;
       
/*----------------------------------------FOREIGN KEY----------------------------------------*/

create table department(deptid int primary key,                    /*PARENT TABLE */
                        dept_name varchar(50));
                        
INSERT INTO department values(1,"DATA SCIENCE"),
                             (2,"HR"),
                             (3,"DA"),
                             (4,"IT"),
                             (5,"ME");
SELECT * FROM department;							

CREATE TABLE emp(empid int primary key,
                       empname varchar(50),
                       deptid int,
                       foreign key (deptid) references department(deptid));                        /*CHILD TABLE*/
                       
INSERT INTO emp VALUES(101,'HEER',2),
                       (102,'MEER',3),
                       (103,'DEER',4),
                       (104,'DOSS',5),
                       (105,'PEER',2);
SELECT * FROM emp;