/*--------------------------------------RANKING FUNCTION FOR DIFFERENT CLAUSE-------------------------------------*/

/*------------------ROW NUMBER--------------------*/

use ds_batch23;

SELECT * , row_number() over() as  row_num from employees;

SELECT row_number() over() as  row_num, empid, name, age, salary from employees;

SELECT row_number() over(order by empid desc) as  row_num, empid, name, age, salary from employees;

SELECT row_number() over(order by salary desc) as  row_num, empid, name, age, salary from employees;

SELECT row_number() over(order by salary desc) as  row_num,* from employees;

SELECT row_number() over(partition by city order by salary desc) as  row_num, empid, name, age, city, salary from employees;

/*-------------------------RANK NUMBER-------------------------*/

SELECT * , rank() over() as rank_num from employees;

SELECT * , rank() over(partition by city) as rank_num from employees;

SELECT * , rank() over(partition by city order by salary) as rank_num from employees;

SELECT * , rank() over(partition by city order by salary desc) as rank_num from employees;

insert into employees values(113,'Ethans',12,'Male','Pune',3300000);

/*--------------------------------DENSE RANK------------------------------*/

SELECT * , dense_rank() over(partition by city order by salary desc) as rank_num from employees;


/*----------------------------------------------------------------ANALYTIC FUNCTIONS----------------------------------------------------------------------*/

/*------------------------ LAG --------------------------*/

SELECT * , LAG(salary) over() from employees;

SELECT * , LAG(salary) over(order by salary) as one_lower from employees;

SELECT * , LAG(salary) over(partition by city order by salary) as one_lower from employees;

SELECT * , LAG(salary) over(order by salary desc) as one_higher from employees;

/*------------------------- LEAD ----------------------*/

SELECT * , LEAD(salary) over() from employees;

SELECT * , LEAD(salary) over(order by salary) as one_higher from employees;

SELECT * , LEAD(salary) over(partition by city order by salary) as one_higher from employees;

SELECT * , LEAD(salary) over(order by salary desc) as one_lower from employees;


/*----------------------------- FIRST VALUE ---------------------------*/

SELECT *, first_value(salary) over(order by salary) as lowest_salary from employees;

SELECT *, first_value(salary) over(order by salary desc) as highest_salary from employees;


/*-------------------------------------- COMMAN TABLE EXPRESSION ----------------------------------*/

/* CTE USING JOINS */

WITH cte_first AS (
select employee1.id, employee1.name, employee1.salary, dept.deptid, dept.hod
from employee1 left join dept
on employee1.deptid = dept.deptid
)
SELECT * FROM cte_first;


/* CTE USING SUB-QUERY */

WITH cte_second AS (
SELECT name,age,city,salary from employees
WHERE salary > (SELECT AVG(salary) FROM employees)
)
SELECT * FROM cte_second;                          # mean or subsequent query


SELECT * FROM cte_second;                         # creates temporary table so that can use select statement twice


/* CTE USING Window-Functions */

WITH cte_third AS (
SELECT *, first_value(salary) over(order by salary desc) as highest_salary from employees
)
SELECT * FROM cte_third; 


/*------------------------------CASE STATEMENTS---------------------------*/
          # for continous numerical values

SELECT empid, name, salary,
CASE
	WHEN salary > 4000000 THEN 'HIGH SALARY'
    WHEN salary < 2500000 THEN 'LOW SALARY'
    ELSE 'MEDIUM SALARY'
END as salary_status
From employees;


/*------------------------------CASE EXPRESSION---------------------------*/
          # for Discrete values    

SELECT *,
CASE city
		WHEN 'Pune' THEN 'old office'
        WHEN 'Mumbai' THEN 'new office'
        ELSE 'Upcoming'
END as 'city_status'
From employees;


/* -------------------------------STRING FUNCTIONS------------------------------ */

SELECT upper(name) from employees;

SELECT lower(name) from employees;

SELECT name, length(name) from employees;

SELECT name, substring(name,1,3) from employees;

SELECT empid,name, concat(empid, name) from employees;

SELECT replace(name,'Tejashri','Teju') as short_name, name from employees;

SELECT trim(name) from employees;
