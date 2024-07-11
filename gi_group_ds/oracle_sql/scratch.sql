/
select employee_id, first_name, last_name, salary from employees order by salary desc
    fetch first 8 rows with ties;

/
select salary, commission_pct, nvl(commission_pct, 0) from employees;

/
select first_name, commission_pct, nvl2(commission_pct, 'sal+com', 'sal') from employees;

/
select * from employees;

/
select last_name, job_id, salary, decode(job_id, 'IT_PROG', 1.10*salary,
    'ST_CLERK', 1.15 * salary, 'SA_REP', 1.2 * salary, salary) as revised
    from employees;

/
SELECT last_name, commission_pct, salary,
    COALESCE(commission_pct, salary, 10) comm
    FROM employees ORDER BY commission_pct;
    
/
select nvl('a',sysdate) from dual;
/
select coalesce('a',sysdate) from dual;

/
select lower('Oracle SQL Lessons'),
    upper('Oracle SQL Lessons'),
    initcap('Oracle SQL Lessons')
from dual;

/
select lengthb('U'),
    length('u') from dual;

/
select last_name, substr(last_name, 3, 4) from employees;

/
select last_name, instr(last_name, 'a'), instr(last_name, 'a', 1, 2) from employees;

/
select last_name, instr(last_name, 'a', -2, 1) from employees;

/
select last_name, substr(last_name, -1, 3) from employees;

/
select last_name, rpad(last_name, 8, '*') from employees;

/
select last_name, rpad(last_name, 10, '*') from employees;

/
select trim('   Oracle  SQL example  ') from dual;

/
select ltrim('  Oracle SQL example  ') from dual;

/
select rtrim('  Oracle SQL example  ') from dual;

/
select last_name, replace(last_name, 'a', '#') from employees;

/
select last_name, translate(last_name, 'abcdi', '@$!.') from employees;

/
select street_address, translate(street_address, '0123456789', '#') from locations;

/
select last_name, substr(last_name, -6), reverse(substr(reverse(last_name), 1, 6))
    from employees;

/
select round(2231.68, 0) from dual;

/
select round(2231.68) from dual;

/
select round(2261.67, -1) from dual;

/
select round(43.593, 0) from dual;

/
select round(43.255, 0) from dual;

/
select round(84.293, 1) from dual;

/
select trunc(2231.37, 1) from dual;

/
select trunc(-2231.67, -2) from dual;

/
select trunc(2231.67, -2) from dual;

/
select greatest(5, 10) from dual;

/
select least(5, 10, 3) from dual;

/
select sysdate + 1 from dual;

/
select last_name, hire_date, sysdate - hire_date from employees;

/
select add_months(sysdate, 6) from dual;

/
select last_name, sysdate, hire_date, months_between(sysdate, hire_date) from employees;

/
select hire_date, last_day(hire_date) from employees;

/
select last_name, hire_date from employees where last_day(hire_date) = hire_date;

/
select round(sysdate, 'dd') from dual;

/
select round(sysdate, 'mm') from dual;

/
select round(sysdate, 'yy') from dual;

/
select round(sysdate, 'month') from dual;

/
select round(sysdate + 15, 'month') from dual;

/
select round(sysdate, 'year') from dual;

/
select trunc(sysdate, 'month') from dual;

/
select trunc(sysdate, 'day') from dual;

/
select trunc(sysdate, 'year') from dual;

/
select round(sysdate + 120, 'year') from dual;

/
select trunc(sysdate + 20, 'year') from dual;

/
select to_char(sysdate, 'dd.mm.yyyy') from dual;

/
select to_char(sysdate + 1, 'dd.mm.yyyy') + 1 from dual;

/
select to_char(sysdate, 'ddd') as week from dual;

/
select to_char(sysdate, 'dd - mm - yy') from dual;

/
select first_name, last_name, salary, hire_date from employees where to_char(hire_date, 'dd.mm') = '24.03';

/
select '11.04.2020' + 1 from dual;

/
select to_date('11.04.2020', 'dd.mm.yy') + 1 from dual;

/
select last_name, hire_date from employees where hire_date < '01.01.2003';

/
select last_name, hire_date from employees where
    hire_date < to_date('01.01.2003', 'dd.mm.yyyy');
    
/
select to_date('05.05', 'dd.mm') from dual;

/
select to_date('05.2019', 'dd.yyyy') from dual;

/
select hire_date from employees where to_char(hire_date, 'mm') = '01';

/
select commission_pct, nvl(commission_pct, 0) from employees;

/
select commission_pct, nvl(commission_pct, '111') from employees;

/
SELECT COALESCE(last_name, first_name, 'Unknown') FROM employees;

/
SELECT COALESCE(to_char(commission_pct), email, 'No Contact Info') AS contact_method
FROM employees;

/
select nvl('a',sysdate) from dual;

/
select 
    department_name, 
    nvl(department_id, ) -- Error-dur
from departments;

/
select coalesce(1, null, 2, null, 3, 4, 5) from dual;
select coalesce(null, null, 2, null, 3, 4, 5) from dual;
select coalesce(null, null, null, null, 3, 4, null) from dual;

/
select 
    commission_pct, 
    nvl2(commission_pct,'var', 'yoxdur') 
from employees;

/
select 
    commission_pct, 
    nvl2(commission_pct, 1, 0) 
from employees;

/
select 
    length(last_name),
    length(first_name), 
    nullif(length(last_name),length(first_name)) 
from employees;

/
select nullif(1,2), nullif(2,1), nullif(1,1) from dual;

/
select first_name, job_id,
    case job_id
        when 'SA_REP' then 'Reporter'
        when 'IT_PROG' then 'Programmer'
        when 'SA_MAN' then 'Manager'
        else 'Other'
    end as "Prof"
from employees;

/
select last_name, job_id,
        case job_id
            when 'SA_REP' then 'Reporter'
            when 'IT_PROG' then 'Programmer'
            when 'SA_MAN' then 'Manager'
            else 'Other'
        end AS "Prof"
from employees;
/
select last_name, department_id, job_id, case
    when department_id = 50 then job_id
    when job_id like 'SA%' then 'SA-XXXXX'
    when job_id like '%PROG' then 'Programmer'
    else 'Other'
    end as "Prof"
    from employees;
    
/
select last_name, job_id, decode(job_id, 'SA_REP', 'Reporter', 'IT_PROG', 'Programmer',
    'SA_MAN', 'Manager', 'Other') as "Prof - Decode" from employees;

/
select last_name, salary, case
    when salary < 2000 then 0.1
    when salary < 4000 then 0.25
    when salary < 6000 then 0.3
    when salary < 8000 then 0.45
    else 0.5 end as "Tax rate" from employees;
    
/
select
    department_id, 
    count(*),
    listagg(first_name, ', ') 
        within group(order by last_name asc)
from employees
group by department_id;

/
select
    avg(sum(salary))
from employees
group by department_id
;

/
select
    max(sum(salary)) -- sehvdir max 2 level
from employees
group by department_id
;

/
select
    sum(
        case 
            when first_name like 'A%' then 1
            else 0
        end) as A,
    sum(
        case 
            when first_name like 'S%' then 1
            else 0
        end) as S    
from employees;

/
select *
from employees
where first_name like 'A%' or first_name like 'S%';

//Practice _ 2

/1
select * from employees where mod(employee_id, 2) = 1;

/2
select street_address, instr(street_address, ' ', 1, 2) as position from locations;

/3
select department_name, length(replace(department_name, ' ', '')) from departments;

/4
select * from employees where length(first_name||last_name) > 12;

/5
select salary, round(salary / 27, 2) modified from employees;

/6
select distinct region_id from countries;

/7
select last_name, replace(lower(last_name), substr(last_name, length(last_name)),
    upper(substr(last_name, length(last_name)))) from employees;

/8
select street_address, reverse(initcap(reverse(street_address))) modified from locations;

/9
select street_address, replace(street_address, 'a', '+') from locations;

/10
select street_address, substr(street_address, 1, length(street_address) - 1)||'!' from locations;

//1 May - subquery

select employee_id, coalesce(phone_number, email, l.country_id) as contact_detail
    from employees e join departments d on d.department_id = e.department_id join locations l on l.location_id = d.location_id;
    
//8 May
//sql commands

//ddl - data definition - create drop alter truncate
//dml - data manipulation - insert update delete call lock
//tcl - transaction control - commit savepoint rollback
//dql - data query - 

//joins
/1
select employee_id,
    case when extract(month from hire_date) between 12 and 2 then 'Winter'
         when extract(month from hire_date) between 3 and 5 then 'Spring'
         when extract(month from hire_date) between 6 and 8 then 'Summer'
         when extract(month from hire_date) between 9 and 11 then 'Autumn'
         else 'Unknown'
         end as season
    from employees;

/2
select first_name, last_name, to_char(hire_date, 'DD/MM/YYYY') as modified
    from employees;

/3
select first_name, last_name, hire_date, case when mod(extract(year from hire_date), 2) = 1 then 'tek'
    else 'cut' end as identifier from employees;

/4
select * from employees where hire_date > to_date('19/12/07', 'DD.MM.YY');

/6
select * from employees where hire_date > to_date('15/01/05', 'DD.MM.YY') and 
    hire_date < to_date('20/12/08', 'DD.MM.YY');

/7
select * from employees where salary < 2 * extract(year from hire_date);

/8
select * from employees where department_id = 5* extract(day from hire_date);

/9
select to_char(salary, 'FM999G999G990') from employees;
/
select salary, substr(salary, 1, length(salary) - 3)||','||substr(salary, length(salary) - 2, length(salary)) as modified from employees;

/10
select * from job_history where extract(year from end_date) = extract(year from start_date);

//unnamed
/1
select distinct manager_id from employees where mod(extract(day from last_day(hire_date)), 2) = 0;

/2
select employee_id from employees e where salary > (select avg(salary) from employees where department_id = e.department_id)
    and salary > (select avg(salary) from employees where job_id = e.job_id);

/3
select employee_id from employees where salary > power(employee_id, 2);

/4
select first_name, last_name, hire_date, extract(year from hire_date) as "Year",
    to_char(hire_date, 'Month') "Month", extract(day from hire_date) "Day", to_char(hire_date, 'Day') as "Week Day" from employees;

/5
select first_name, last_name, case when instr(lower(first_name), lower(last_name)) > 0 then 'ortaq herf var'
        else 'ortaq herf yoxdur' end as identif from employees;


/10
select * from locations where mod(postal_code, 1) = 0;

select * from locations where regexp_like(postal_code, '[0-9]');

/
select postal_code, isnumeric(postal_code) = 1 from locations;

/
select * from locations where postal_code = trunc(postal_code);
/
select postal_code, length(postal_code) from locations l;

/
select (case when try_convert(postal_code, float) is not null then 'valid' else 'invalid') end as "id" from locations;
/
select * from locations;

