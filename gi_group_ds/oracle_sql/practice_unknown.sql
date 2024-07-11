create table customers2 (
    CustomerID number primary key not null,
    FirstName varchar2(255) not null,
    LastName varchar2(255) not null,
    Address varchar2(255),
    Phone varchar2(255) 
);
/
create table Branches2 (
    BranchID number primary key not null,
    Location varchar2(255) not null,
    Phone varchar2(255));
/
create table Orders2 (
    OrderID number primary key not null,
    CustomerID number not null,
    BranchID number not null,
    OrderDate date not null,
    foreign key(CustomerID) references customers2(CustomerID),
    foreign key(BranchID) references Branches2(BranchID)
);
/
insert into customers2(CustomerID, FirstName, LastName, Address, Phone)
    values(101, 'Nahed', 'Aliyev', 'Ali Mustafayev', '0555684135');

insert into customers2(CustomerID, FirstName, LastName, Address, Phone)
    values(102, 'Amrah', 'Rahmanov', 'Qara Qarayev', '0554574329');

insert into customers2(CustomerID, FirstName, LastName, Address, Phone)
    values(103, 'Akbar', 'Bunyadov', 'Oakland Street', '0554474324');

insert into customers2(CustomerID, FirstName, LastName, Address, Phone)
    values(104, 'Elvin', 'Sariyev', 'Avaz Suleymanov street', '44 - 34 - 23');

insert into customers2(CustomerID, FirstName, LastName, Address, Phone)
    values(105, 'Rasim', 'Qurbanov', 'Istiqlal Street', '55 - 23 - 21');

/
select * from customers2;

//practice 4
/1
select department_name from departments d where not exists(select 1 from employees e
        where e.department_id = d.department_id);

/2
select sum(case when upper(substr(country_name, 1, 2)) = country_id then 1
        else 0 end) as C1,
        sum(case when upper(substr(country_name, 1, 2)) <> country_id then 1
        else 0 end) as C2
        from countries;

/3
select country_name, region_name from countries natural join regions
    where country_name like 'M%';

/4
select department_id, avg(salary) from employees group by department_id order by avg(salary)
    fetch first 1 row only;
    
/5
select employee_id, e.job_id, max_salary - min_salary as dif from jobs j right outer join
    employees e on e.job_id = j.job_id order by dif fetch first 1 row with ties;
/7
select first_name, last_name, department_name from employees natural join departments where to_char(hire_date, 'month') = 'October' and
    to_char(hire_date, 'Day') = 'Monday';

/8
select * from employees where length(first_name) = 3;

/
select * from employees where first_name in 
    (select first_name from employees where length(first_name) = 3);

/9
select first_name, last_name, department_name from employees natural join departments
    where substr(first_name, 2, 1) = substr(last_name, 2, 1);

/10
select * from employees where salary > (
    select salary from employees where first_name like '%ee%');

/
select trunc(to_date('2004/23/05', 'YYYY/DD/MM'), 'year') from dual;

/
select * from employees where null = null;

/
select * from employees
 where 1=1 and ( null=null or 'a'='A' and 1=1);

/
select concat(first_name,last_name,salary) from employees;

/
select * from employees
union all
select * from job_history;

/
select salary from employees
intersect
select first_name from employees;

/
select 1 from employees
union
select 1 from employees;

/
select * from employees where salary>any(select salary from employees);

/
SELECT
    d.department_name,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY ROLLUP (d.department_name);

/
select count(*) from employees where salary < (select avg(salary) from employees);

/
with a as(
select department_id, d from employees group by department_id)

select first_name, last_name from employees e join a on e.department_id = a.department_id;
/
select count(*) from employees where salary >
    (select avg(salary) from employees where extract(year from hire_date) < 2000);

/
with a as(
    select employee_id, department_id, salary, salary / (select avg(salary) from employees e1
        where e1.department_id = e2.department_id) as salary_ratio from employees e2)

select * from a;

/
select department_name, count(*) from departments natural join employees group by department_name order by 2 desc fetch first 1 row with ties;

/
SELECT * from employees 
order by salary desc nulls first;