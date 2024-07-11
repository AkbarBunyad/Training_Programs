/1
select * from employees e left outer join departments d 
    on d.department_id = e.department_id where first_name like '%a%' or d.department_name
    like '%a%';

/2
select * from departments natural join locations
    natural join countries where country_name like 'I%';
    
/3
select d.department_name, l.city from departments d
    left join employees e on d.department_id = e.department_id
    left join locations l on l.location_id = d.location_id where e.employee_id is null;
    
/4
select first_name, last_name, job_title, salary - min_salary
    from employees e left join jobs j on e.job_id = j.job_id;

/5
select first_name, last_name, job_title from employees e join jobs j on j.job_id = e.job_id 
        where employee_id in (select employee_id from job_history);
    
/6
select street_address, region_name, city from locations l
    join countries c on c.country_id = l.country_id
    join regions r on r.region_id = c.region_id;

/7
select d.department_name, l.city, c.country_name from departments d left join employees e
    on d.department_id = e.department_id
    left join locations l on d.location_id = l.location_id
    left join countries c on l.country_id = c.country_id where e.employee_id is null;

/8
select first_name, department_id, hire_date,
    (select max(hire_date) from employees e2 where e1.department_id = e2.department_id) from employees e1;

/9
//as there are two employees named Alexander, the subquery part returns more than one row,
// which is why I used average to get the mean salary amongst the Alexander+s

select avg(salary) from employees where salary > (select avg(salary)
    from employees where first_name = 'Alexander');

/10
select employee_id from employees where hire_date > 
    (select hire_date from employees where employee_id = 113);

/11
select first_name, last_name, department_name from employees e
    join departments d on d.department_id = e.department_id
        where salary < (select avg(salary) from employees where department_id = 90)
            and salary > (select avg(salary) from employees where department_id = 110);

/12
select distinct m.first_name, m.last_name from employees e join employees m
    on m.employee_id = e.manager_id where substr(e.phone_number, -1) = 8;