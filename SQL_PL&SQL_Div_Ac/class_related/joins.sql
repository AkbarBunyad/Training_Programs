4select department_id from departments
    join employees on departments.department_id=employees.department_id;
    
//17 Feb 24 join practice

// find the first name, last name, department name, city, and state province for each employee.
select first_name, last_name, department_name, city, state_province
from employees e left join departments d on d.department_id = e.department_id
left join locations l on d.location_id = l.location_id;

//find all those employees who work in department ID 80 or 40. Return first name, last name, department number and department name.
select e.first_name, e.last_name, d.department_id, d.department_name from employees e
left join departments d on d.department_id = e.department_id
and e.department_id in (80, 50);

//Write a query in SQL to display the first and last name and salary for those employees who earn less than the employee earn whose number is 182
select e1.first_name, e1.last_name, e1.salary from employees e1 inner join employees e2
on e1.salary < e2.salary and e2.employee_id = 182;

//Write a query in SQL to display job title, full name (first and last name ) of employee, and the difference between maximum salary for the job and salary of the employee
select j.job_title,e.first_name|| ' '|| e.last_name as full_name,
(j.max_salary - e.salary) as salary_diff  from employees e left join jobs j
on e.job_id = j.job_id;

//display the name of the department, average salary and number of employees working in that department who got commission
select d.department_name, avg(e.salary), count(*)
    from employees e
     inner join departments d
    on e.department_id = d.department_id
    group by d.department_name having count(e.commission_pct) >0;
    
//display job title and average salary of employees
select j.job_title, avg(e.salary)
    from employees e
    join jobs j
    on e.job_id = j.job_id
    group by j.job_title;

//display the employee ID, job name, number of days worked in for all those jobs in department 80
select jh.employee_id, j.job_title, (jh.end_date - jh.start_date) as active_days
    from jobs j join job_history jh using (job_id) where jh.department_id = 80;
    
//display the department name and number of employees in each of the department
select d.department_name, count(e.employee_id) as num_employees
    from departments d
    inner join employees e on d.department_id = e.department_id
    group by d.department_name;
    
//Selecting All Locations and Their Associated Countries (Including Locations Without Countries):
select l.location_id, l.city, c.country_name from locations l
    right join countries c on l.country_id = c.country_id;

//
select * from company_mast cross join orders;

//full join
select j.job_id, j.job_title, e.employee_id, e.first_name, e.last_name
from jobs j
full join employees e on j.job_id = e.job_id;

//
select d.department_id, d.department_name, e.employee_id, e.first_name, e.last_name
from departments d
full join employees e on d.department_id = e.department_id;

//
select * from employees natural join departments d where d.department_name = 'Payroll';

//
select s.name as salesman_name, s.salesman_id, o.customer_id, o.purch_amt from salesman s
full join orders o on o.salesman_id = s.salesman_id;

//
select * from orders natural join customer;

//
select c.customer_id, c.cust_name, o.ord_no from customer c
left join orders o on c.customer_id = o.customer_id;

//
select d.department_id, d.department_name, e.employee_id, e.first_name || ' ' || e.last_name as full_name
from departments d
right join employees e on d.department_id = e.department_id;

//
SELECT o.ord_no, o.ord_date, c.cust_name
FROM orders o
RIGHT JOIN customer c ON o.customer_id = c.customer_id
WHERE o.ord_date > '11-SEP-12';

//
SELECT e.employee_id, e.first_name, d.department_id, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.department_id
WHERE e.salary BETWEEN 5000 AND 9000;

//
SELECT o.ord_no, o.ord_date, c.cust_name
FROM orders o
INNER JOIN customer c ON o.customer_id = c.customer_id
WHERE c.city = 'New York';


//17 Feb 24 practice

select * from employees e join departments d
    on d.department_id = e.department_id and e.manager_id = d.manager_id;
    
select * from employees natural join departments;

select * from employees natural join locations;

select m.first_name, m.last_name, e.first_name, e.last_name from employees e join employees m on e.manager_id = m.employee_id;

select * from employees e
    left join departments d on d.department_id = e.department_id
        where d.department_name is null;
        
//20 Feb task

//joins
select e.first_name as "employee name", m.first_name as "manager"
    from employees e join employees m
        on e.manager_id = m.employee_id;

//2
select job_title, first_name || ' ' || last_name as "Full Name",
    max_salary - salary as "salary_difference" from employees natural join jobs;
    
//3
select d.department_name, avg(salary), count(e.commission_pct)
    from departments d join employees e using(department_id)
    group by department_name;
    
//4
select j.job_title, e.first_name || ' '||e.last_name as full_name, max_salary - salary
    from employees e join jobs j using (job_id) where e.department_id = 80;
    
//5
select country_name, city, department_name from departments
    join locations using(location_id) join countries using(country_id);

//6
select department_name, first_name || ' '||last_name as full_name
    from departments join employees using(manager_id);
    
//7
select job_title, avg(salary) from employees join jobs using(job_id)
    group by job_title;
    
//8
select j.* from job_history j
    join employees e on e.employee_id = j.employee_id where e.salary > 12000;
    
//9
select country_name, city, count(department_id)
    from countries
    join locations using (country_id)
    join departments using (location_id)
    where department_id in (
    select department_id from employees group by department_id
    having count(department_id) >=2)
    group by country_name, city;

//10
select employee_id, first_name||' '||last_name, salary
    from employees join departments using(department_id)
    join locations using (location_id) where city = 'London';

//11
select d.department_name, count(e.employee_id) as num_of_emp, d.department_id
    from departments d left join employees e on d.department_id = e.department_id
        group by d.department_name, d.department_id;
        
//12
select first_name||' '||last_name as employee_name, employee_id, country_name
    from employees
    join departments using(department_id)
    join locations using(location_id)
    join countries using(country_id);

//13
select ord_no, purch_amt, cust_name, city from orders
    join customer using(customer_id) where purch_amt between 500 and 2000;

//14
select cust_name, c.city, s.name, commission from salesman s
    join customer c using(salesman_id) where commission>0.12;
    
//15
select cust_name, c.city as cust_cty, grade, s.name as "Salesman"
    from salesman s left join customer c on s.salesman_id = c.salesman_id
        order by c.salesman_id;
        
//subqueries
//1
select first_name, last_name from employees
    where salary > (select salary from employees where employee_id = 163);
    
//2
select first_name, last_name, salary, department_id, job_id from employees
    where job_id = (select job_id from employees where employee_id = 169);
    
//3
select first_name, last_name, salary, department_id from employees
    where salary in (select min(salary) from employees group by department_id);
    
//4
select department_id, first_name, last_name, job_id, department_name
    from employees join departments using(department_id)
        where department_name = 'Finance';
        
//5
select * from employees where department_id not in
    (select department_id from departments where manager_id
        between 100 and 200);

//6
select * from employees where salary = (
    select distinct salary from employees order by salary desc
        offset 1 row fetch next 1 row only);
        
//7
select first_name, last_name, hire_date from employees
    where department_id = (select department_id
        from employees where first_name = 'Clara')
        and first_name<>'Clara';
        
//8
select employee_id, first_name, last_name from employees
    where department_id in (select department_id from employees
        where first_name like '%T%');
        
//9
//Write a query to display the employee number, name (first name and last name), and salary for all employees who earn more than the average salary and who work in a department with any employee with a J in their name.
select employee_id, first_name, last_name, salary from employees
    where salary > (select avg(salary) from employees)
    and department_id in (select department_id from employees
    where first_name like '%J%');
    
//10
//Display the employee name (first name and last name), employee id, and job title for all employees whose department location is Toronto
select e.first_name, e.last_name, employee_id, j.job_title from employees e
    join jobs j using(job_id) where e.department_id in
    (select department_id from departments where location_id
    in (select location_id from locations where city = 'Toronto'));
    
//11
//Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN
select e.first_name,
        last_name,
        job_title
    from employees e
    join jobs using(job_id) where
    salary > (select salary from employees where job_id = 'MK_MAN');
    
//12
//Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any average salary of any department
select employee_id, first_name, last_name, job_title from employees e
    join jobs j using(job_id) where salary > any(select avg(salary) from employees
    group by department_id);

//13
select department_id, sum(salary) from employees
    where department_id in (select department_id from departments)
        group by department_id having count(department_id) >=1;
        
//14
select e1.first_name, e1.last_name from employees e1
    where salary > (select sum(salary) * 0.5 from employees e2
        where e1.department_id = e2.department_id);
        
//15
//Write a query to display the employee id, name (first name and last name), salary, department name and city for all the employees who gets the salary as the salary earn by the employee which is maximum within the joining person January 1st, 2002 and December 31st, 2003
select e.employee_id,
    e.first_name||' '||e.last_name,
    e.salary,
    d.department_name,
    l.city
    from employees e
    join departments d using(department_id)
    join locations l using(location_id)
    where e.salary = (select max(salary) from employees
                        where hire_date between '01-JAN-2002' and '31-DEC-2003');
                    
--------------------------
//20_Feb_class_practice
select m.first_name as "manager_name", m.last_name as "manager_surname", e.first_name, e.last_name from employees e
    join employees m on e.manager_id = m.employee_id;