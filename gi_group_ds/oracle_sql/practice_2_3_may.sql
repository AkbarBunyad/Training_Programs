select emp.employee_id, emp.first_name, man.last_name, man.employee_id as manager_id from employees emp
    inner join employees man on emp.manager_id = man.employee_id;

/1
select l.city, c.country_name from locations l
    inner join countries c on c.country_id = l.country_id;

/2
select c.country_name, r.region_name from countries c
    join regions r using(region_id);

/3
select d.department_name, l.city from departments d
    join locations l using(location_id);

/4
select l.street_address, r.region_name, l.city from countries c
    right outer join locations l using(country_id) join regions r using(region_id);

/5
select d.department_name, e.first_name from departments d
   left outer join employees e on d.manager_id = e.employee_id;

/6
select e.first_name, e.last_name, j.job_title, l.street_address,
    d.department_name, m.first_name as manager_name, c.country_name,
    r.region_name from employees e 
    left join jobs j using(job_id) join departments d using(department_id)
    left join employees m on d.manager_id = m.employee_id
    left join locations l using(location_id) left join countries c
    using(country_id) left join regions r using(region_id);

/subquery
/1
select employee_id from employees where hire_date = 
    (select hire_date from employees where employee_id = 206);

/2
select department_name from departments where department_id in
    (select department_id from employees where salary > 10000);

/3
select street_address from locations where location_id in
    (select location_id from departments where department_name = 'Administration');

/4
select e.first_name, e.last_name, e.hire_date, min_salary.min_salary
from employees e join (select department_id, min(salary) as min_salary
    from employees group by department_id) min_salary on e.department_id  = min_salary.department_id;
/
select e.first_name, e.last_name, e.hire_date, e.salary from employees e where salary in (select min(salary) from employees group by department_id);
/5

select employee_id from employees where employee_id not in
    (select employee_id from employees where department_id = 50) and
    salary > (select avg(salary) from employees where department_id = 50);
