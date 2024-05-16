alter table sales add(new_orderdate date);
update sales set new_orderdate = to_date(orderdate, 'MM/DD/YYYY HH24:MI');
alter table sales drop column orderdate;
alter table sales rename column new_orderdate to orderdate;

//Inspecting data

select * from sales;

//Checking unique values
select distinct status from sales;
select distinct year_id from sales;
select distinct productline from sales;
select distinct country from sales;
select distinct dealsize from sales;
select distinct territory from sales;

//Grouping sales by productline
select productline, sum(sales) revenue from sales group by productline order by 2 desc;

//by year_id
select year_id, sum(sales) revenue from sales group by year_id order by 2 desc;

    //total sales for 2005 is relatively low, assumption can be made that they weren't able to operate in the entire year

select distinct month_id from sales where year_id = 2005;
select distinct month_id from sales where year_id = 2004;
select distinct month_id from sales where year_id = 2003;
    
    //sales were fully executed for 2004 and 2003, whereas partially for 2005

select dealsize, sum(sales) revenue from sales group by dealsize order by 2 desc;

//The best month for sales in a certain year, and how much?

select month_id, sum(sales) revenue, count(ordernumber) frequency from sales
    where year_id = 2004 group by month_id order by 2 desc;

//November turned out to be the most productive month, so with what product they achieved that number

select month_id, productline, sum(sales) revenue, count(ordernumber)
    from sales where year_id = 2004
    and month_id = 11 group by month_id, productline
        order by 3 desc;

//Who is the best customer, which can be best found out with RFM
//drop view rfm_analysis if exists
create view rfm_analysis as
with rfm as(
select
        customername,
        sum(sales) monetary_value,
        avg(sales) avg_monetary_value,
        count(ordernumber) frequency,
        max(orderdate) last_order_date,
        (select max(orderdate) from sales) max_order_date_all,
        ((select max(orderdate) from sales) - (MAX(orderdate))) recency
    from sales group by customername),

rfm_comput as(
select r.*,
            ntile(4) over(order by recency desc) r_recency,
            ntile(4) over(order by frequency) r_frequency,
            ntile(4) over(order by monetary_value) r_monetary from rfm r)

select rc.*, (r_recency + r_frequency + r_monetary) as rfm_score,
            (cast(r_recency as varchar(1))||cast(r_frequency as varchar(1))||cast(r_monetary as varchar(1))) as score_code from rfm_comput rc;

/
select customername, r_recency, r_frequency, r_monetary,
        case
                when score_code in ('111', '112', '121', '122', '123', '132', '211', '212', '114', '141') then 'lost_customer'
                when score_code in ('133', '134', '143', '244', '334', '343', '344', '144') then 'on the verge of losing'
                when score_code in ('311', '411', '331') then 'new_customer'
                when score_code in ('222', '223', '233', '322') then 'potential churner'
                when score_code in ('323', '333', '321', '422', '332', '432') then 'active'
                when score_code in ('433', '434', '443', '444') then 'loyal'
                else 'uncategorized yet' end as segment
                from rfm_analysis;
/
select distinct quantityordered from sales;