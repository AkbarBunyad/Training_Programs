//t - 2
select first_name, commission_pct, case
        when commission_pct * 100 >= 27 then 'komissiya 27 faizden coxdur'
        when commission_pct * 100 < 27 then 'komissiya 27 faizden azdir'
        when commission_pct is null then 'komissiya odemir'
        end as commission_status from employees order by hire_date desc;

//t - 3
with cte as(
select phone_number, substr(phone_number, 1, instr(phone_number, '.', 1) - 1) as first_part,
        substr(phone_number, instr(phone_number, '.', 1) + 1, instr(phone_number, '.', 1, 2) - instr(phone_number, '.', 1) - 1) as second_part from employees)

select cte.*, case when first_part > second_part then '1 - ci hisse boyukdur'
                    when first_part < second_part then '2 - ci hisse boyukdur'
                    else 'beraberdir' end as comparison from cte;

//t - 3, 2nd way (including cte as as table itself, both with the same approach
select first_part, second_part, case when first_part > second_part then '1 - ci hisse boyukdur'
                    when first_part < second_part then '2 - ci hisse boyukdur'
                    else 'beraberdir' end as comparison from 
                    (select phone_number, substr(phone_number, 1, instr(phone_number, '.', 1) - 1) as first_part,
                            substr(phone_number, instr(phone_number, '.', 1) + 1, instr(phone_number, '.', 1, 2) - instr(phone_number, '.', 1) - 1) as second_part from employees) cte;

//t - 4
select sum(sub.emp_salary) from (
select e.first_name emp_first_name, e.last_name emp_last_name, m.first_name manager_first_name, m.last_name manager_last_name, e.hire_date emp_hire_date, m.hire_date manager_hire_date,
    e.salary emp_salary, m.salary manager_salary
    from employees e
    join employees m on e.manager_id = m.employee_id) sub where sub.emp_hire_date < sub.manager_hire_date and sub.emp_salary > sub.manager_salary;

//t - 5
select avg(salary) from employees where department_id in 
    (select department_id from departments where location_id in 
    (select location_id from locations where country_id in (select country_id from countries order by length(country_name) desc fetch first 1 rows with ties)));

//t - 1
create table classes1(
    class_id number primary key,
    class_name varchar2(50)
    );

/
create table students1(
    student_id number primary key,
    full_name varchar2(100),
    age number,
    class_id number references classes1(class_id),
    start_date date,
    end_date date
    );

/
insert into classes1(class_id, class_name) values (1, 'Process Engineering A');
insert into classes1(class_id, class_name) values (2, 'Process Engineering B');
insert into classes1(class_id, class_name) values (3, 'Reactor Design');
insert into classes1(class_id, class_name) values (4, 'Process Design A');
insert into classes1(class_id, class_name) values (5, 'Math 3');
insert into classes1(class_id, class_name) values (6, 'Thermodynamics');

/
insert into students1(student_id, full_name, age, class_id, start_date, end_date)
values (11, 'Demetrious Johnson', 18, 1, to_date('2020-11-23', 'YYYY-MM-DD'), to_date('2020-12-21', 'YYYY-MM-DD'));

insert into students1(student_id, full_name, age, class_id, start_date, end_date)
values (12, 'Jon Johes', 19, 2, to_date('2019-10-24', 'YYYY-MM-DD'), to_date('2020-09-20', 'YYYY-MM-DD'));

insert into students1(student_id, full_name, age, class_id, start_date, end_date)
values (13, 'Jack Crayford', 20, 3, to_date('2020-01-23', 'YYYY-MM-DD'), to_date('2020-8-20', 'YYYY-MM-DD'));

insert into students1(student_id, full_name, age, class_id, start_date, end_date)
values (14, 'Diana Daniels', 22, 1, to_date('2020-06-13', 'YYYY-MM-DD'), to_date('2020-09-14', 'YYYY-MM-DD'));

insert into students1(student_id, full_name, age, class_id, start_date, end_date)
values (15, 'Elvin Afandi', 24, 1, to_date('2017-04-10', 'YYYY-MM-DD'), to_date('2019-01-01', 'YYYY-MM-DD'));

insert into students1(student_id, full_name, age, class_id, start_date, end_date)
values (16, 'Asena Rahimova', 17, 6, to_date('2018-01-23', 'YYYY-MM-DD'), to_date('2020-04-12', 'YYYY-MM-DD'));

/
select student_id, full_name, age, c.class_id, class_name start_date, end_date from students1 s join classes1 c  on c.class_id = s.class_id;


