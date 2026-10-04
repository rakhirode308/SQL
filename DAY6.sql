/* ------------------------------JOINS-------------------------------- */

use ds_batch23;
show tables;

create table employee1(id int, name varchar(50), deptid int, salary int);
insert into employee1 values(101, 'SARWAT', 2, 60000),
							(102, 'NEHA', 3, 80000),
                            (103, 'ARCHIT', 2, 50000),
                            (104, 'ANKUR', 5, 10000),
                            (105, 'TEJASHREE', 2, 90000),
                            (106, 'DISHA', 3, 40000),
                            (107, 'GEETANJALI', 5, 15000),
                            (108, 'ATHARV', 2, 70000);
                            
SELECT * FROM employee1;

CREATE TABLE dept(deptid int, dept_name varchar(50), hod varchar (30));
INSERT INTO dept VALUES (1, 'DS', 'ANKUR'),
						(2, 'DA', 'GAURAV'),
                        (3, 'HR', 'JINCY'),
                        (4, 'AC', 'SONAL'),
                        (5, 'IT', 'ADITYA');
                        
SELECT * FROM dept;


/* --- INNER JOIN ---*/

SELECT employee1.id, employee1.name, employee1.salary, dept.deptid, dept.hod
FROM employee1 inner join dept
on employee1.deptid = dept.deptid;

/* --- LEFT JOIN ---*/

SELECT employee1.id, employee1.name, employee1.salary, dept.deptid, dept.hod
FROM employee1 left join dept
on employee1.deptid = dept.deptid;

/* --- RIGHT JOIN ---*/

SELECT employee1.id, employee1.name, employee1.salary, dept.deptid, dept.hod
FROM employee1 right join dept
on employee1.deptid = dept.deptid;

/* --- OUTER JOIN ---*/

SELECT employee1.id, employee1.name, employee1.salary, dept.deptid, dept.hod
FROM employee1 left join dept
on employee1.deptid = dept.deptid
UNION
SELECT employee1.id, employee1.name, employee1.salary, dept.deptid, dept.hod
FROM employee1 RIGHT join dept
on employee1.deptid = dept.deptid;


/*------------------------------ DCL COMMAND -----------------------------*/

CREATE USER 'batch_23' identified by 'batch@23';

GRANT SELECT,CREATE,INSERT,DROP,ALTER
ON ds_batch23.*
TO 'batch_23';

REVOKE SELECT,CREATE,INSERT,DROP,ALTER
ON ds_batch23.*
from 'batch_23';

GRANT ALL PRIVILEGES
ON *.*
TO 'batch_23';

REVOKE ALL PRIVILEGES
ON *.*
FROM 'batch_23';
