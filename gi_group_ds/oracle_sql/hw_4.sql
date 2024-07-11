//Table creation

create table City(
    City_id number,
    City_name varchar2(30),
    City_code varchar2(15),
    Country_code varchar2(30)
);

/
create table Country(
    Country_id number,
    Country_name varchar2(30)
);

//1 - renaming city_id to c_id in the table City

alter table City rename column City_id to c_id;

//2 - adding constraint to c_id column

alter table City modify c_id constraint c_id_primary_key primary key;

//3 - adding null constraint to Country_code column

alter table City modify Country_code constraint cc_not_null not null;

//4 - adding new column namely create_date to the Country table

alter table Country add create_date date default sysdate;

//5 - adding primary key to country_id column in the Country table

alter table Country modify Country_id constraint country_id_prim_key primary key;

//6 - A

insert into City(c_id, City_name, City_code, Country_code) values (
    1001, 'Moghadisho', '100456', '123');

insert into Country(Country_id, Country_name) values (
    2, 'Somali');

//6 - B

insert into City(c_id, City_name, City_code, Country_code) values (
    1001, 'Los Angeles', '100478', '134');
    //as we have put primary key constraint onto c_id earlier, we are not allowed to have duplicate values within that column

insert into Country(Country_id, Country_name) values(
    Null, 'Norway');
    //Country_id column with primary key constraint deviates having null values, which is why it threw error while trying to execute the script above


