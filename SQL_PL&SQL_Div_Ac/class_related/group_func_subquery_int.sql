//1 Feb 2024
select count(*) from employees;

select count(*), department_id, job_id, first_name from employees group by department_id, job_id, first_name having count(*) > 1 and salary > 2500;

select count(*) from employees having count(*) > 10;

select trunc(avg(salary),-2), min(salary) from employees;
select max(avg(salary)) from employees group by salary;

select avg(salary), min(salary) from employees;

select employee_id, job_id from job_history
intersect
select employee_id, job_id from employees;

select employee_id from employees
union
select employee_id from job_history;

select * from employees where employee_id = 176;
select * from job_history where employee_id = 176;

//set tasks, 3 Feb 24

//UNION - Find all unique department IDs from both EMPLOYEES and JOB_HISTORY tables.
select department_id from employees
union
select department_id from job_history;

//List all job IDs from both current employees and job history, including duplicates.
select job_id from employees
union all
select job_id from job_history;

//Find common department IDs between current employees and past job history.
select department_id from employees
intersect
select department_id from job_history;

//Identify departments with current employees that didn't appear in job history.
select department_id from employees
minus
select department_id from job_history;

//Combine city names from locations with department names, ignoring duplicates.
select city from locations
union 
select department_name from departments;

//Get all employee last names and job titles, not caring about duplicates.
select last_name from employees
union all
select job_title from jobs;

//Compare and find job IDs that are both in current job titles and job histories.
select job_id from jobs
intersect
select job_id from job_history;

//List all locations (cities) where the company does not have departments
select location_id from locations
minus
select location_id from departments;

//Gather a distinct list of employee and manager IDs.
select employee_id from employees
union
select manager_id from departments where manager_id is not null;

//Find job titles that have never been held by any employee.
select job_id from jobs
minus
select job_id from employees;

//error exploration
//union
select first_name from employees
union
select last_name from employees;

//
select department_id from departments
union
select department_id from employees where department_id = 50;

//
select department_name from departments where department_id = 50
union
select job_title from jobs;

//
select hire_date from employees
union
select start_date from job_history;

//
select country_id from locations
union
select country_id from countries;

//union all
select first_name from employees
union all
select last_name from employees where hire_date > '01_JAN_2000';

//
select department_id from departments where department_id = 20
union all
select department_id from employees;

//
select department_name from departments
union all
select job_title from jobs;

//
select hire_date from employees
union all
select start_date from job_history where start_date > '01-JAN-2005';

//
select country_id from locations
union all
select country_id from countries where region_id = 1;

//intersect
select first_name from employees
intersect
select last_name from employees;

//
select department_id from departments
intersect
select department_id from employees;

//
select department_name from departments where department_id = 50
intersect
select job_title from jobs;

//
select country_id from locations
intersect
select country_id from countries;

//minus(except) errors
select first_name from employees
minus
select last_name from employees;

//
select department_id from departments
minus
select department_id from employees;

//
select department_name from departments
minus
select job_title from jobs;

//
select hire_date from employees
minus
select start_date from job_history where start_date > '01-JAN-2005';

//
select country_id from locations
minus
select country_id from countries where region_id = 1;

//mixed errors
select first_name from employees
union
select department_name from departments
intersect
select job_title from jobs
minus
select country_id from countries;

//
select first_name from employees
union all
select department_name from departments
intersect
select job_title from jobs
minus
select country_id from countries;

//
select first_name from employees
intersect
select department_name from departments
union
select job_title from jobs
minus
select first_name from employees;

//
select first_name from employees
union all
select department_name from departments
intersect
select job_title from jobs
minus
select first_name from employees where hire_date > '01-JAN-2000';

//tasks_group_functions
select avg(salary) from employees;

//
select job_id, sum(salary) as total_by_group from employees group by job_id;

//
select max(salary), min(salary) from employees where department_id = 100 group by department_id;

//
select department_id, count(*) as count
from employees
group by department_id;

//
select count(distinct job_id) as unique_count from employees;

//
select avg(commission_pct) from employees;

//grouping_rows
select department_id, count(*) from employees group by department_id;

//
select department_id, avg(salary) from employees group by department_id;

//
select department_id, avg(salary) from employees group by department_id
having avg(salary) > 7500;

//
select job_id, sum(salary) from employees group by job_id;

//nesting group functions
select department_id, avg(salary) as axc from employees group by department_id
order by axc desc
fetch first 1 row only;

//
select job_id, sum(salary) as tot from employees 
group by job_id order by tot asc
fetch first 1 row only;

//
select department_id, count(*) as cnt from employees
group by department_id order by cnt desc
fetch first 1 row only;

//
select department_id, avg(salary) as axc from employees
group by department_id
having avg(salary) > (select avg(salary) from employees);

//3 Feb_class

select count(*) as t, department_id from employees group by first_name;

select count(*) as t, department_id as f from employees group by department_id having count(*)>1 order by f;

select rownum from dual;
select rownum from employees;

select rownum,employees.* from employees order by salary where rownum<=10;

select rownum, e.* from employees e order by e.first_name;

select rownum, e.* from employees e order by e.first_name;

select rownum, e.* from employees e where rownum >= 5;

SELECT ROWNUM, e.* 
FROM (SELECT * FROM employees) e
WHERE ROWNUM = 5;

select e.* from employees e fetch next 5 rows only;

select e.* from employees e order by salary desc offset 9 rows
    fetch next 5 rows only;

select * from employees order by salary fetch next 5 rows with ties;

//6 Feb 24 task
// Find the top 10 employees with the highest salaries.
select first_name, last_name, salary from employees order by salary desc fetch next 10 rows only;

//Retrieve the first 5 employees from the EMPLOYEES table based on ascending employee ID.
select * from employees order by employee_id fetch next 5 rows only;

//List the next 3 employees after the first 10, sorted by last name in the EMPLOYEES table.
select * from employees order by last_name offset 10 rows
    fetch next 3 rows only;
    
//Display the top 5 highest paid employees from the EMPLOYEES table.
select * from employees order by salary desc fetch next 5 rows only;

//Find the 7 newest employees by hire date in the EMPLOYEES table.
select * from employees order by hire_date desc fetch next 7 rows only;

//Show 6 employees from the EMPLOYEES table with odd employee IDs, ordered by employee ID.
select * from employees where mod(employee_id, 2) = 1 order by employee_id fetch next 6 rows only;

//combinations
//Filtering with ROWNUM: Write a query to get the first 10 employees based on alphabetical order of last names.
select * from (select * from employees order by last_name) where rownum<11;

//Using ROWNUM with ORDER BY: Find the top 10 highest-paid employees using ROWNUM after sorting them by salary.
select * from (select * from employees order by salary desc) where rownum<11;

//Combining WHERE, LIKE, and ROWNUM: Retrieve the first 5 employees whose names start with 'J' and have a salary greater than 5000.
select * from (select * from employees where first_name like 'J%' and salary > 5000) where rownum<6;

//Combining ROWNUM, LIKE, and NULL Handling: Retrieve the first 3 employees whose first name contains 'a' and who do not have a commission.
select * from (select * from employees where first_name ||' '|| last_name like '%a%' and commission_pct is null) where rownum<4;

//Advanced Filtering with ROWNUM, LIKE, and IN: Retrieve the top 5 employees whose last name contains 's' and are in departments 10, 30, or 50.
select * from (
    select * from employees where last_name like '%s%' and department_id in (30, 50, 80))
    where rownum<6;

select * from (
    select * from employees where department_id in (10, 30, 50) and last_name like '%s%' and rownum<=5);
    
//6 Feb class  

select * from employees where department_id = 
    (select department_id from departments where department_name = 'Finance');
    
non-correlated
    scalar
    non-scalar
    table
    multiple row
    multiple column
correlated

select * from employees where salary > 
    (select avg(salary) from employees);

select max(salary), department_id
    from employees
        group by department_id;

select * from employees
    where (salary, department_id) in (select max(salary), department_id from employees
    group by department_id);
    
select distinct(department_id) from employees;
select * from departments;

select * from departments where nvl(department_id,0) not in (select nvl(department_id,0) from employees);

select * from departments where
department_id not in
(select department_id from employees where department_id is not null);

select * from employees
where department_id not in (50, null);

select e.*, 
    round((select avg(salary)
        from employees)) as avg_comp,
    e.salary/round((select avg(salary)
        from employees)) * 100
    from employees e;

select a.*, round(a.salary/a.avg_comp * 100) as avg_pct
    from(  
select e.*, 
    round((select avg(salary)
        from employees)) as avg_comp
    from employees e) a;
    
select * from salesman;

//8 Feb practice_Subqueries

select employee_id, first_name, last_name from employees
    where salary = (select max(salary)from employees);

select employee_id, first_name, last_name, department_id from employees
    where department_id in (
    select department_id from departments
    where location_id in (
    select location_id from locations where city = 'Seattle'
    ));

//8 Feb_class

non-correlated:
select * from employees where salary > (select avg(salary) from employees);

select * from employees where (salary, department_id) in(
    select max(salary), department_id from employees group by department_id);

select * from employees where (commission_pct, job_id) not in   
(select max(commission_pct), job_id from employees group by job_id
    having max(commission_pct) is not null);
    
SELECT e.*, ROUND((SELECT AVG(salary) FROM employees)) AS avg_salary
FROM employees e;

select e.*, round((select avg(salary) from employees)) as avg_salary, round(e.salary / round((select avg(salary) from employees))*100)||'%' as avg_perc from employees e;


