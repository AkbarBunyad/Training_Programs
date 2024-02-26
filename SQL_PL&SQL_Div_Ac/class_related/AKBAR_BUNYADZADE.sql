//practice
select * from employees where first_name like 'S%';
select * from employees where last_name like '%er';
select * from employees where commission_pct is NULL;
select * from employees where manager_id is not null;
select * from departments order by department_name asc;
select * from employees order by hire_date desc;

//tasks
select * from employees where last_name like 'M%s';
select * from employees where last_name like 'S%';
select * from employees where first_name like '%a';
select * from employees where last_name like '%ll%';
select * from employees
where first_name like 'M%' and length(first_name) = 5;
select * from employees where last_name like 'C%s';
select * from employees where job_id like '%MAN%';

//null task
select * from employees where commission_pct is null;
select * from employees where manager_id is null;
select * from employees where commission_pct is null;
select * from employees where email is null;
select * from employees where phone_number is not null;
select * from employees where hire_date is not null;

//order by
select * from employees order by hire_date desc;
select * from departments where department_id > 50 order by department_name asc;
select * from employees order by salary;
select * from employees order by salary desc;
select first_name, salary from employees order by salary desc;
select last_name, hire_date from employees order by hire_date desc;
select first_name, department_id from employees order by department_id;

select first_name, salary, salary*0.15 from employees where rownum<11;

//character funcs - tasks
select upper(first_name), lower(first_name), initcap(first_name) from employees;
select first_name || ' ' || last_name as full_name,
       length(first_name || ' ' || last_name) as name_length
from employees;
select email, replace(email, '@', '#') as modified_email from employees;
select first_name || ' ' || last_name from employees;
select concat(reverse(first_name),length(last_name))from employees;
select job_title, substr(job_title, 1, 3) as first_three_charac from jobs;
select first_name, instr(first_name, 'e') as position_of_e from employees;

//character funcs - practice
select upper(first_name), lower(last_name), initcap(job_id) from employees;
select concat(first_name, last_name) as full_name, instr(concat(first_name, last_name), 'a') from employees;
select trim(first_name), replace(last_name, 'a', 'e') from employees;
select upper(concat(first_name, last_name)) as new from employees;
select job_title, length(job_title) as title_length from jobs;
select concat(first_name, email) as new from employees;


//class
select lower(first_name) from employees;
select first_name || ' ' || last_name|| ' '||' '||salary from employees;
select trim(first_name) from employees;
select trim('     aaaa aaa ') from dual;
select replace('     aaaa aaa ', ' ', '') from dual;
select * from dual;
select substr('Azerbaycan', 2, 3) from dual;
select round(100.584,1) from dual;
select round(1969.5, -2) from dual;
select round(135.5, -1) from dual;
select round(1256, -4) from dual;
select trunc(100.40, 1), trunc(100.40, 1) from dual;
select round(100.45, 1), trunc(100.45, 1) from dual;
select round(100.456, 2), trunc(150.856, -2) from dual;
select round(100.456, 1), trunc(100.4565,1) from dual;
select mod(10,3) from dual;
select mod(10,2) from dual;
select mod(10,15) from dual; 10 - 15*floor(10/15)

//combinations
select * from employees where salary > 8000;
select * from employees where department_id = 50 and hire_date>'01-JAN-05';
select * from employees where job_id = 'SA_REP' or job_id = 'IT_PROG';
select * from employees where department_id<>80;
select * from employees where salary > 6000 and department_id in (60,100);
select * from employees where last_name like '%m';
select * from employees where job_id like 'SA%';
select * from employees where manager_id is null;
select * from employees order by salary;
select * from employees where department_id = 90 order by hire_date;
select * from employees where rownum<11 order by last_name;
select * from employees where salary between 3000 and 6000;
select * from employees where department_id in (10,20,50);
select * from employees order by commission_pct nulls last;
select * from employees where first_name like 'D____';
select * from employees where salary*1.1 > 7000;
select * from employees where last_name like '%son' and department_id in (30,50,80);
select * from employees where manager_id is null and commission_pct is not null;
select * from employees order by department_id, salary;
select * from employees where hire_date = last_day(hire_date);
select * from employees where last_name like '%a%' order by hire_date;
select * from employees where commission_pct is null order by salary;
select * from employees where manager_id is not null order by department_id;
select * from employees where rownum<11 order by salary desc;
select * from employees where first_name like 'J%' and salary>5000 and rownum<6;
select * from employees where commission_pct is not null
    or manager_id is not null
    order by hire_date;
select * from employees where salary between 3000 and 7000 and department_id = 50
    order by hire_date;
select * from employees where job_id like '%MAN' and
    last_name like '%e%' order by department_id;
select * from employees where rownum<4 and first_name like '%a%' and commission_pct is not null;
select * from employees where salary>6000 or first_name like 'M%' and job_id<>'SA_REP';
select * from employees where first_name like '%n%' and salary between 4000 and 8000
     and manager_id is not null;
select * from employees where department_id in (80,90) and salary>5000 and hire_date>'31-DEC-2000'
    order by hire_date;
select * from employees where rownum<6 and last_name like '%s%' and department_id in (10,30,50);
select * from employees where salary not between 3000 and 6000 or department_id = 70
    order by salary, hire_date;
select * from employees where job_id is null and last_name like '%son' order by hire_date;
select * from employees where department_id in (30,50,80) or first_name like 'A%' order by salary desc;
select * from employees where salary<5000 and (job_id = 'IT_PROG' or job_id = 'SA_MAN') order by department_id;

//Sort employees by commission in ascending order, with NULLs at the end, and further sort by department ID.

select * from employees order by commission_pct nulls last, department_id;

//Select employees in departments 10, 20, or 30, who have a non-NULL manager, ordered by their salary.
select * from employees where department_id in (10,20,30) and manager_id is not null order by salary;


//27 Jan 2024
select round(156.584, 2) from dual;
select abs(-100) from dual;
select sign(90.23) from dual;
select sign(-90.23) from dual;
select ceil(-100.009) from dual;
select sysdate from dual;
select add_months(sysdate,-2) from dual;
select last_day(sysdate),
    sysdate + 15 from dual;

select sysdate+30, sysdate, round(months_between(sysdate+30,sysdate))
    "between" from dual;
    
select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(daywextracting weekday in oracle sql
from sysdate) from dual;

select to_char(sysdate, 'DD') as weekday from dual;
select * from employees where extract(year from hire_date) =2003;
    
select to_char(100.20) as a, 100.20 as a from dual;
select to_char(sysdate, 'YYYY/MM') from dual;
select to_char(sysdate, 'MON') from dual;
select to_char(sysdate, 'MON', 'NLS_DATE_LANGUAGE = TURKISH') from dual;
select to_number('a', '999') from dual;

select to_date('2003/09/09', 'yyyy/dd/mm') from dual;
select to_date('2003/07/09', 'MMDDYY') from dual;
select to_number('1210.73', '9999.99') from dual;

set serveroutput on;
DECLARE
    TYPE domain_list_t IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    domains domain_list_t;
    v_domain VARCHAR2(100);
    v_email VARCHAR2(100);
    CURSOR emp_cursor IS SELECT employee_id, email FROM employees;
BEGIN
    -- List of domains
    domains(1) := '@gmail.com';
    domains(2) := '@yahoo.net';
    domains(3) := '@mail.ru';
    domains(4) := '@box.az';

    FOR emp_rec IN emp_cursor LOOP
        v_domain := domains(DBMS_RANDOM.VALUE(1, domains.COUNT));
        

        v_email := emp_rec.email || v_domain;

        dbms_output.put_line(v_email);
        UPDATE employees
        SET email = v_email
        WHERE employee_id = emp_rec.employee_id;
    END LOOP;

    -- Commit the changes
    COMMIT;
END;
/

//29 Jan 2024 task
//Character functions
//Write a query to display all employee names in uppercase, lowercase, and title case.
select upper(first_name) from employees;
select lower(first_name) from employees;
select initcap(first_name) from employees;
//Calculate the length of each employee's full name.
select first_name ||' '|| last_name as full_name, length(first_name ||''|| last_name) as length from employees;
//Create a query to replace all occurrences of '@' in employee emails with '#'.
select replace(email, '@', '#') from employees;
//Concatenate the employee's first name and last name with a space in between.
select concat(concat(first_name, ' '), last_name) full_name from employees;
//Create a new string for each employee by reversing their first name and appending the length of their last name.
select reverse(first_name) reversed, last_name, length(last_name) from employees;
//Find the first three characters of each employee's job title.
select substr(job_title, 1, 3) from jobs;
//Identify the position of the first occurrence of the letter 'e' in each employee's first name.
select first_name, instr(first_name, 'e') from employees;

//Number Functions
//Round all employee salaries to the nearest hundred.
select salary, round(salary, -2) as rounded from employees;
//Find the modulus of the employee ID and their salary.
select mod(employee_id, salary) from employees;
//For each employee, calculate the salary after a 10% increase and then round this new salary.
select 1.1*salary as increased, round(salary*1.1) from employees;
//Determine the absolute value of the difference between the length of the first name and the length of the last name for each employee.
select first_name, last_name, abs(length(first_name)-length(last_name)) from employees;

//Date Functions
//Calculate the number of months each employee has worked in the company.
select first_name, round(months_between(sysdate, hire_date)) from employees;
//Identify employees who were hired in the last 6 months.
select employee_id, first_name from employees where months_between(sysdate, hire_date)<=6;
//Calculate the next performance review date, assuming it's one year after their hire date.
select hire_date, add_months(hire_date, 12) as next_perf_rev_date from employees;
//display the day of the week for each employee’s hire date.
select employee_id, hire_date, to_char(hire_date, 'Day') as day_of_week from employees;
//Calculate the number of years of each employee  has worked as of the current date.
select employee_id, round(months_between(sysdate, hire_date)/12) from employees;

//Conversion Functions
//Formatted Salary Display: Display all employee salaries in a format like '$x,xxx.xx'.
select employee_id, first_name, to_char(salary, '$9,999.99') as formatted from employees;
//Convert the hire date of all employees to a string in the format 'DD-MON-YYYY'.
select employee_id, first_name, to_char(hire_date, 'DD-MON-YYYY') as formatted from employees;

//Miscellaneous Functions
//Null Commission Handling: List employees and show 'No Commission' where the commission is null.
select employee_id, first_name, nvl(to_char(commission_pct), 'No Commission') as new_status from employees;
//Salary Classification: Classify each employee's salary as 'Low', 'Medium', or 'High' based on predefined salary ranges.
select employee_id, first_name, salary,
case when salary < 7500 then 'Low'
when salary between 7500 and 11000 then 'Medium'
when salary >11000 then 'High'
end as salary_classification from employees;

//Dual
//Use the DUAL table to calculate the square root of a specific number.
select sqrt(878) from dual;
//Write a query using the DUAL table to combine a string and a number in a single output.
select 'what model is CERN_' || 777 as combined from dual;