create table weight_class(
    weight_class_id number primary key,
    weight_class_name varchar2(50) unique not null,
    max_weight number
);

/
create table fighter(
    fighter_id number primary key,
    first_name varchar2(50) not null,
    last_name varchar2(50) not null,
    nickname varchar2(50),
    weight_class_id references weight_class(weight_class_id),
    date_of_birth date,
    nationality varchar2(50)
);

/
create table event(
    event_id number primary key,
    event_name varchar2(100),
    location varchar2(100),
    event_date date
);

/
create table fight(
    fight_id number primary key,
    event_id number references event(event_id),
    fighter1_id number references fighter(fighter_id),
    fighter2_id number references fighter(fighter_id),
    winner_id number references fighter(fighter_id),
    fight_date date,
    method varchar2(50)
);

/
insert into weight_class(weight_class_id, weight_class_name, max_weight) values (1, 'Flyweight', 125);
insert into weight_class(weight_class_id, weight_class_name, max_weight) values (2, 'Bantamweight', 135);
insert into weight_class(weight_class_id, weight_class_name, max_weight) values (3, 'Lightweight', 155);
insert into weight_class(weight_class_id, weight_class_name, max_weight) values (4, 'Light Heavyweight', 205);
insert into weight_class(weight_class_id, weight_class_name, max_weight) values (5, 'Featherweight', 145);

/
INSERT INTO Fighter VALUES (1, 'Conor', 'McGregor', 'The Notorious', 3, DATE '1988-07-14', 'Ireland');
INSERT INTO Fighter VALUES (2, 'Khabib', 'Nurmagomedov', 'The Eagle', 3, DATE '1988-09-24', 'Russia');
INSERT INTO Fighter VALUES (3, 'Jon', 'Jones', 'Bones', 4, DATE '1987-07-19', 'United States');
INSERT INTO Fighter VALUES (4, 'Israel', 'Adesanya', 'The Last Stylebender', 2, DATE '1989-07-22', 'Nigeria');
INSERT INTO Fighter VALUES (5, 'Amanda', 'Nunes', 'The Lioness', 5, DATE '1988-05-30', 'Brazil');
INSERT INTO Fighter VALUES (6, 'Valentina', 'Shevchenko', 'Bullet', 1, DATE '1988-03-07', 'Kyrgyzstan');

/
insert into event values(1, 'UFC 229', 'Las Vegas', date '2018-10-06');
insert into event values(2, 'UFC 242', 'Las Vegas', to_date('2019-12-05', 'YYYY-MM-DD'));
insert into event values(3, 'UFC 248', 'Las Vegas', date '2020-02-08');
insert into event values(4, 'UFC 261', 'Abu Dabi', date '2021-08-27');
insert into event values(5, 'UFC 263', 'New York', date '2022-01-06');
insert into event values(6, 'UFC 281', 'Washington DC', date '2023-05-03');

/
insert into fight values(1, 1, 1, 2, 2, date '2018-10-06', 'Submission');
insert into fight values(2, 2, 3, 4, 4, date '2019-12-05', 'Referee Decision');
insert into fight values(3, 3, 3, 5, 3, date '2020-02-08', 'KO');
insert into fight values(4, 4, 2, 3, 2, date '2021-08-27', 'TKO');
insert into fight values(5, 5, 4, 6, 6, date '2022-01-06', 'Submission');
insert into fight values(6, 6, 3, 6, 3, date '2023-05-03', 'KO');

/
alter table fight modify fight_date constraint fd_not_null not null;
/
alter table fight rename column method to winning_method;
/
rollback;
/
select * from fight;
/
select department_name from departments d where exists (select 1 from employees e
where d.department_id = e.department_id);

/
select e.first_name emp_name, m.first_name manager_name from employees e
    join employees m on e.manager_id = m.employee_id;

/
select m.first_name, count(*) from employees e join employees m on e.manager_id = m.employee_id
group by m.first_name order by 2 desc;

/
select employee_id, department_id, hire_date, (select max(hire_date) from employees e1 where e1.department_id = e2.department_id) max_hire_date from employees e2;

/
select employee_id, department_id, hire_date, 
    max(hire_date) over(partition by department_id) as max_date from employees;
/
select employee_id, a.department_id, hire_date from employees e right join 
    (select department_id, max(hire_date) as max_date from employees e1 group by department_id) a
    on a.department_id = e.department_id and e.hire_date = a.max_date;
    
/
select department_id, max(hire_date) from employees group by department_id;
/
with a as(
select department_name, d.location_id from departments d where not exists (select 1 from employees e
where d.department_id = e.department_id))

select department_name, city from a join locations l on l.location_id = a.location_id;

/
SELECT department_name, city
FROM departments d 
JOIN locations l ON l.location_id = d.location_id
WHERE NOT EXISTS (
    SELECT 1 FROM employees e
    WHERE d.department_id = e.department_id
);    