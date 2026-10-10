USE ds_batch23;
SELECT * FROM employees;


/*------------------------------------- SUB QUERIES ----------------------------------*/

/*-------------------SELECT QUERY---------------------*/
set SQL_SAFE_UPDATES = 0;

SELECT name,age,city,salary from employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT AVG(salary) FROM employees;


/*--------------------INSERT STATEMENT--------------------*/

CREATE TABLE top_employees
as
(select empid,name,salary from employees 
where empid in (select empid from employees where salary > 5500000));

select * from top_employees;

/*--------------UPDATE QUERY-----------*/

CREATE TABLE employees_d
as                                             # duplicate table
select * from employees;

select * from employees_d;

UPDATE employees
SET salary = salary * 0.5
where salary in (select salary from employees_d where salary > 5500000);

select * from employees;


/*---------------DELETE STATEMENT--------------*/

DELETE FROM employees
where salary in (select salary from employees_d where salary > 5000000);

select * from employees;

/*--------------------WINDOWS FUNCTION---------------------*/





/*
FUNCTIONS() OVER(CLAUSE)
FUNCTIONS()
           AGGREGATE FUNCTIONS(SUM,AVG,COUNT,MIN,MAX)
           RANKING FUNCTIONS(ROW NUMBER,RANK,DENSE RANK)
           ANALYTICAL FUNCTIONS(LEAD,LAG,FIRST_VALUE)
CLAUSE()
        PARTITION BY 
        ORDER BY
*/

/*-------------AGGREGATE FUNCTIONS FOR DIFFERENT CLAUSES--------------*/

SELECT sum(salary) as total_salary from employees;

SELECT sum(salary) over() as total_salary from employees;

SELECT empid, name,city,salary, sum(salary) over() as total_salary from employees;

SELECT empid, name,city,salary, sum(salary) over(partition by city) as total_salary from employees;

SELECT empid, name,city,salary, sum(salary) over(partition by city order by salary) as total_salary from employees;

SELECT empid, name,city,salary, sum(salary) over(order by salary) as total_salary from employees;




