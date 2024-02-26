CREATE TABLE salesman
(
    salesman_id NUMBER(6),
    name VARCHAR2(50),
    city VARCHAR2(50),
    commission NUMBER(3,2),
    CONSTRAINT pk_salesman PRIMARY KEY (salesman_id)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);
INSERT INTO salesman (salesman_id, name, city, commission) VALUES (5007, 'Paul Adam', 'Rome', 0.13);


CREATE TABLE Orders
(
    ord_no NUMBER(8),
    purch_amt NUMBER(10,2),
    ord_date DATE,
    customer_id NUMBER(6),
    salesman_id NUMBER(6),
    CONSTRAINT pk_orders PRIMARY KEY (ord_no),
    CONSTRAINT fk_orders_salesman FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70001, 150.5, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70009, 270.65, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3001, 5005);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70002, 65.26, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70004, 110.5, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70007, 948.5, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70005, 2400.6, TO_DATE('2012-07-27', 'YYYY-MM-DD'), 3007, 5001);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70008, 5760, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70010, 1983.43, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3004, 5006);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70003, 2480.4, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70012, 250.45, TO_DATE('2012-06-27', 'YYYY-MM-DD'), 3008, 5002);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70011, 75.29, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3003, 5007);
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES (70013, 3045.6, TO_DATE('2012-04-25', 'YYYY-MM-DD'), 3002, 5001);


CREATE TABLE Customer
(
    customer_id NUMBER(6),
    cust_name VARCHAR2(50),
    city VARCHAR2(50),
    grade NUMBER(4),
    salesman_id NUMBER(6),
    CONSTRAINT pk_customer PRIMARY KEY (customer_id),
    CONSTRAINT fk_customer_salesman FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3001, 'Brad Guzan', 'London', 100, 5005);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3003, 'Jozy Altidor', 'Moncow', 200, 5007);


CREATE TABLE company_mast
(
    COM_ID NUMBER(6),
    COM_NAME VARCHAR2(50),
    CONSTRAINT pk_company_mast PRIMARY KEY (COM_ID)
);

INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (11, 'Samsung');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (12, 'iBall');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (13, 'Epsion');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (14, 'Zebronics');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (15, 'Asus');
INSERT INTO company_mast (COM_ID, COM_NAME) VALUES (16, 'Frontech');

CREATE TABLE item_mast
(
    PRO_ID NUMBER(6),
    PRO_NAME VARCHAR2(50),
    PRO_PRICE NUMBER(10, 2),
    PRO_COM NUMBER(6),
    CONSTRAINT pk_item_mast PRIMARY KEY (PRO_ID),
    CONSTRAINT fk_item_mast_company FOREIGN KEY (PRO_COM) REFERENCES company_mast(COM_ID)
);

INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (101, 'Mother Board', 3200.00, 15);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (102, 'Key Board', 450.00, 16);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (103, 'ZIP drive', 250.00, 14);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (104, 'Speaker', 550.00, 16);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (105, 'Monitor', 5000.00, 11);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (106, 'DVD drive', 900.00, 12);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (107, 'CD drive', 800.00, 12);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (108, 'Printer', 2600.00, 13);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (109, 'Refill cartridge', 350.00, 13);
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES (110, 'Mouse', 250.00, 12);

CREATE TABLE emp_details
(
    EMP_IDNO NUMBER(6),
    EMP_FNAME VARCHAR2(50),
    EMP_LNAME VARCHAR2(50),
    EMP_DEPT NUMBER(4),
    CONSTRAINT pk_emp_details PRIMARY KEY (EMP_IDNO)
);

INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (127323, 'Michale', 'Robbin', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (526689, 'Carlos', 'Snares', 63);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (843795, 'Enric', 'Dosio', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (328717, 'Jhon', 'Snares', 63);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (444527, 'Joseph', 'Dosni', 47);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (659831, 'Zanifer', 'Emily', 47);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (847674, 'Kuleswar', 'Sitaraman', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (748681, 'Henrey', 'Gabriel', 47);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (555935, 'Alex', 'Manuel', 57);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (539569, 'George', 'Mardy', 27);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (733843, 'Mario', 'Saule', 63);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (631548, 'Alan', 'Snappy', 27);
INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES (839139, 'Maria', 'Foster', 57);


CREATE TABLE emp_department
(
    DPT_CODE NUMBER(4),
    DPT_NAME VARCHAR2(50),
    DPT_ALLOTMENT NUMBER(10),
    CONSTRAINT pk_emp_department PRIMARY KEY (DPT_CODE)
);

INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (57, 'IT', 65000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (63, 'Finance', 15000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (47, 'HR', 240000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (27, 'RD', 55000);
INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (89, 'QC', 75000);

select * from salesman;