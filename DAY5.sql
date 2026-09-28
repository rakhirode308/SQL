use ds_batch23;
select * from  employees;

/* ---------------------------------------------------------- AGGREGATE FUNCTIONS ----------------------------------------------------------------------------*/

select count(*) from employees;

select count(*) as no_of_employees from employees;

select count(*) as no_of_employees from employees
where city = 'Pune';

select sum(salary) as total_salary from employees;

select sum(salary) as total_salary from employees
where city = 'Pune';

select avg(age) as average_age from employees;

select avg(age) as average_age from employees
where city = 'Pune';

select max(age) as maximum_age from employees;

select max(age) as maximum_age from employees
where city = 'Pune';

select min(age) as minimum_age from employees;

select min(age) as minimum_age from employees
where city = 'Pune';


/* ------------------------------------------------------ GROUP BY ---------------------------------------------------------------------------------*/

/* NO OF EMPLOYEES FROM EACH CITY */

select city, count(*) from employees
group by city;

select city, count(*) as total_employees from employees
group by city;

select city, count(*) as total_employees from employees
group by city
order by total_employees asc;

select city, count(*) as total_employees from employees
group by city
order by 2 asc;

/* AVERAGE AGE BASED ON DIFFERENT CITIES IN DESCENDIND ORDER */

select city, avg(age) as average_age from employees
group by city
order by 2 desc
limit 1;

/* --------------------------------------------------------------- HAVING CLAUSE ------------------------------------------------------------------------*/

/* FIND CITIES HAVING AVERAGE AGE GREATER THAN 23 */
/* FIND CITY HAVING HIGHEST AVERAGE AGE */
/* FIND CITY HAVING HIGHEST AVERAGE AGE EXCLUDING MUMBAI */

select city,avg(age) as average_age from employees
group by city
having average_age >23;

select city,avg(age) as average_age from employees
group by city
order by 2 desc
limit 1;

select city,avg(age) as average_age from employees
where city != 'mumbai'
group by city
order by 2 desc
limit 1;

/* ------------------------------------------------------------- TCL COPMMAND --------------------------------------------------------------------------------- */

set autocommit = off;

create table student (name varchar(30), age int, city varchar(50));
insert into student values ('sarwat',40,'Pune');
select * from student;

start transaction;

insert into student values ('archit',24,'Pune');
select * from student;
savepoint a;

insert into student values ('geetanjali',21,'Pune');
select * from student;
savepoint b;

insert into student values ('disha',21,'Pune');
select * from student;
savepoint c;

insert into student values ('atharv',21,'Pune');
select * from student;
savepoint d;

rollback to b;
select * from student;

rollback to c;

rollback to a;
select * from student;

commit;

/* ------------------------------------------------------------------  JOINS ----------------------------------------------------------------------------------- */

