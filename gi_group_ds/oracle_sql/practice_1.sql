//1
select * from jobs;

//2
select * from jobs fetch first 2 rows only;

//3
select department_id, manager_id from departments;

//4
select first_name, last_name, employee_id,
    manager_id, manager_id - employee_id from employees;

select employee_id from employees;

//5
select first_name || ' ' || last_name as full_name from employees;

//6
select * from departments;

//7
select employee_id, first_name, last_name, email from employees;

//8
select employee_id, salary * 2.4 from employees;

//9
select distinct salary from employees;

//10
select employee_id, first_name from employees where salary > 12000;

//11


//12
select department_name from departments where department_name like '%ce%';

//13
select * from locations where street_address like '% %';

//14
select * from employees where salary between 5000 and 10000;
/
select * from employees where salary >=5000 and salary <=10000;

//15
select * from employees order by department_id desc,
    employee_id;
    
//16
select first_name, last_name, 12*salary as modified from employees
    order by modified desc;

//17
select * from employees where (extract(year from hire_date) > 2004 and 
    salary > 5000) or salary > 10000;

//22 April Class

select department_name, lpad(department_name, 13, '*') from departments;

