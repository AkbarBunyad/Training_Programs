/1
select d.*, substr(department_name, 2, length(department_name) / 2 - 1) 
    || substr(department_name, 1, 1)|| substr(department_name, length(department_name))
    || substr(department_name, length(department_name)/2 + 1, length(department_name)/2 - 1) as transformed_name 
from departments d
where mod(length(department_name), 2) = 0;

/2
select e.*, last_day(hire_date) as last_day, last_day(hire_date) - hire_date as dif from employees e;

/3
select d.*, department_name, lpad('$', department_id, '$') AS decorated_name
from departments d;

/4
select * from employees where length(last_name) <=7;

/5
select first_name, substr(first_name, -3) as modified from employees;

/6
//employees sutununda address columnu yoxdur

select street_address, instr(street_address, 'a', 3, 2) as position_vect from locations;

/7
select rpad(first_name|| ' ' ||last_name, 50, '$') as modified from employees;

/8
select e.*, mod(salary, 1000) + 1000 redefined from employees e;

/9
select first_name, last_name, round(salary / 23, 2) as per_day_salary from employees;

/10
select first_name, last_name, trunc(add_months(hire_date, 1), 'month') first_salary_date from employees;

/11
select first_name, last_name, hire_date - 20 first_practice_day from employees;

/12
select first_name, last_name,
    employee_id||substr(last_name, -1)||substr(phone_number, 1, 3)||'#' as email_set
        from employees where department_id = 90;
        
/13
select * from jobs where max_salary <> 2*min_salary;

/14
select region_id, count(*) country_count from regions natural join countries group by region_id;

/15
select department_id,
    sum(case
            when commission_pct is null then 1
                else 0
            end) as null_count,
    sum(case
            when commission_pct is not null then 1
                else 0 end) as not_null_count
        from employees
        group by department_id;

/16
select sum(case
                when mod(employee_id, 2) = 0 then salary else 0 end) as even_salary_sum,
        sum(case
                when mod(employee_id, 2) = 1 then salary else 0 end) as odd_salary_sum
        from employees;
    
/17
select department_id, max(salary), min(salary), max(salary) - min(salary)
    max_min_difference from employees group by department_id;
    
/18
select department_id, max(hire_date) latest_hire_date, min(hire_date) first_hire_date,
        months_between(max(hire_date), min(hire_date)) diff_hire_date_by_months
    from employees group by department_id;

/19
    /1st
with dep_salaries as
    (select department_id, sum(salary) as total_salary from employees group by department_id)

select department_id, total_salary from dep_salaries 
    where total_salary = (select max(total_salary) from dep_salaries);

    /2nd
select department_id, sum(salary) from employees group by department_id order by sum(salary) desc fetch first 1 row only;

/20
select sum(case when extract(year from hire_date) = 2001 then 1 else 0 end) as "2001",
       sum(case when extract(year from hire_date) = 2002 then 1 else 0 end) as "2002",
       sum(case when extract(year from hire_date) = 2003 then 1 else 0 end) as "2003",
       sum(case when extract(year from hire_date) = 2004 then 1 else 0 end) as "2004",
       count(*) "2001 - 2004" from employees where extract(year from hire_date) between 2001 and 2004;
