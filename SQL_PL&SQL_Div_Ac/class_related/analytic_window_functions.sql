select rownum, e.* from employees e order by e.first_name;

select * from employees where rownum = 5;

select rownum, a.* from (select e.* from employees e order by e.first_name) a;

select row_number() over(order by e.first_name), e.* from employees e;

select * from employees where (salary, department_id)
    in (select max(salary), department_id from employees group by department_id);

select * from (    
    select max(salary) over (partition by department_id) s,
        e.* from employees e) a where a.s = a.salary and a.department_id is not null;
        
select avg(salary) over(partition by department_id), e.* from employees e;
select avg(salary) from employees group by department_id;

select (select avg(salary) from employees where department_id = e.department_id), e.* from employees e;

select avg(salary) over(partition by extract(year from hire_date), department_id),
    extract(year from hire_date), e.department_id, e.* from employees e;
    
select * from employees where department_id = 60;

select extract(year from hire_date), sum(salary) over(partition by extract(year from hire_date) order by extract(year from hire_date)), e.* from employees e where department_id = 60;

select sum(salary) over(order by department_id), e.* from employees e;

select sum(salary)
    over(order by department_id rows between unbounded preceding and current row),
        e.* from employees e;
        
//22_feb_tasks

//assigning row number to each employee within each department, ordered by hire date
select row_number() over(partition by department_id order by hire_date)
    as row_num, e.*
    from employees e;
    
//calculate cumulative salary within each department ordered by employee_id
select sum(salary) over(partition by department_id order by employee_id)
    as cum_salary, e.* from employees e;
    
//determining rank of each employee's salary within department
select row_number() over(partition by department_id order by salary desc) 
    as salary_rank, e.* from employees e;
    
//assigning unique row number to each order within each customer ordered by order date
select row_number() over(partition by customer_id order by ord_date), o.* from orders o;

//difference in salary between each employee and employee with the highest salary within department
select max(salary) over(partition by department_id) - salary
    as salary_dif, e.* from employees e;
    
//average salary for each department excluding current employee's salary
select avg(salary) over(partition by department_id) - salary as avg_s_dif,
    e.* from employees e;
    
//
select row_number() over(partition by department_id order by department_id) as row_num,
    e.employee_id, d.department_name from employees e
    join departments d using(department_id);
    
//
select row_number() over(partition by salesman_id order by purch_amt) as row_num,
    o.* from orders o;
    
//
select department_id, employee_id, count(employee_id) 
    over(partition by department_id) as dep_emp_count,
    count(employee_id) over() as tot_emp_count from employees;
    
//
select ord_date,purch_amt, sum(purch_amt) over(order by ord_date) as running_total_sales,
    sum(purch_amt) over(partition by extract(month from ord_date)order by ord_date)
        as monthly_sale_tot
        from orders;

//22 Feb practice
select ord_date,purch_amt, sum(purch_amt) over(order by ord_date) as running_total_sales,
    sum(purch_amt) over(partition by extract(month from ord_date)order by ord_date)
        as monthly_sale_tot
        from orders;
        
select * from (
    select row_number() over(partition by department_id order by salary desc) as rn,
    e.* from employees e) where rn = 1;
    
select * from (
select max(salary) over(partition by department_id) as mx, e.* from employees e)
where salary = mx;

select * from (select dense_rank() over(partition by department_id order by salary desc) rn, e.* from employees e) where rn = 42;

select sum(salary) over(order by department_id), e.* from employees e;

select sum(salary) over(order by department_id range between unbounded preceding and current row),
    e.* from employees e;

select distinct nth_value(salary, 4) over() from employees;

select nth_value(salary, 1) over() from employees;
select salary from employees;

select nvl(lag(salary, 2) over(order by employee_id), 0), e.* from employees e;

select lead(salary) over(order by employee_id), e.* from employees e;

select * from(
select lead(hire_date) over(partition by department_id order by hire_date) ld, e.* from employees e)
where ld is null;

select first_value(salary) over(partition by department_id order by hire_date), e.* from employees e;

//24_feb_tasks

//1 ranking within each department based on salary
select employee_id, salary, department_id,
    dense_rank() over(partition by department_id order by salary desc) as salary_rank from employees;
    
//her bir il uzre ne qeder mebleg xerclenib - 2
select department_id, extract(year from hire_date) as hire_year, salary, hire_date,
    sum(salary) over(partition by department_id order by hire_date) as updated_salary from employees;
    
//butun iller uzre - 3
select e.*, sum(salary) over(order by department_id rows between
    unbounded preceding and current row) as tot from employees e;
    
//her bir il ucun her ay ne qeder maas - 4
SELECT 
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    EXTRACT(MONTH FROM hire_date) AS hire_month,
    salary,
    SUM(salary) OVER (
        PARTITION BY EXTRACT(YEAR FROM hire_date), EXTRACT(MONTH FROM hire_date)
        ORDER BY EXTRACT(YEAR FROM hire_date), EXTRACT(MONTH FROM hire_date)
    ) AS tot_sal
FROM 
    employees
ORDER BY 
    hire_date;
    
//her bir ilin her ayinin ilk gunu - 5
select extract(year from hire_date) as hire_year, extract(month from hire_date) as hire_month,
    extract(day from hire_date) as hire_day,
    sum(salary) over(
    partition by extract(year from hire_date), extract(month from hire_date) order by hire_date)
    as updated_salary from employees where extract(day from hire_date) = 1;

//her bir ilin her ayinin son gunu - 6
select extract(year from hire_date) as hire_year, extract(month from hire_date) as hire_month,
    salary, sum(salary) over(
            partition by extract(year from hire_date), extract(month from hire_date) order by hire_date)
            as updated_salary from employees where hire_date = last_day(hire_date);
            
//7 - eyni vezife uzre muxtelif zamanlarda ise qebul olunan emekdaslar arasinda maas ferqini
select employee_id, job_id, hire_date, salary,
    lag(salary) over(partition by job_id order by hire_date) as prev_salary,
    salary - lag(salary) over(partition by job_id order by hire_date) as salary_difference from employees;
    
// 8
select hire_year, emp_cnt, lag(emp_cnt) over(order by hire_year) as prev_year_emp_cnt,
    nvl(emp_cnt - lag(emp_cnt) over(order by hire_year), 0) diff from (
    select extract(year from hire_date) as hire_year, count(*) as emp_cnt
        from employees group by extract(year from hire_date)) yearly_emp_cnt order by hire_year;
    
//9
select employee_id, salary, department_id, rank() over(partition by department_id
    order by salary desc) as salary_rank from employees;

//10
select ord_no, purch_amt, round(purch_amt / sum(purch_amt) over(), 4)*100 as perc,
    sum(purch_amt) over() from orders;

//11
select first_value(employee_id) over(partition by department_id
        order by salary desc) highest, e.* from employees e;
    
//12
select sum(pro_price) over(partition by pro_com order by pro_price
        rows between unbounded preceding and current row) sum_pr, it.* from item_mast it;
    
//13
select last_value(hire_date) over(partition by department_id order by hire_date) first_accepted_emp, e.* from employees
e;

//14
select * from (select row_number() over(partition by location_id order by department_id) rownumm, d.* from
departments d) where rownumm = 1;

//15
select dense_rank() over(partition by customer_id order by ord_no), o.* from orders o;

//16
select * from (
    select sum(salary) over (partition by job_title order by salary rows between unbounded preceding and current row) as cum_sal_jname, job_title, salary from employees
    join jobs using(job_id));

//17
select max(purch_amt) over(partition by extract(month from ord_date) order by ord_date) as c,
        extract(month from ord_date) monthh, o.* from orders o;

//18
select rank() over(partition by salesman_id order by purch_amt desc) rank_ord, o.* from orders o;

//19
select min(grade) over(partition by salesman_id), c.* from customer c;

//20
select * from (
    select e.*, max(salary) over(partition by department_id) maxx from employees e) where salary = maxx;
---------------------
