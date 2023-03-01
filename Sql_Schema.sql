--create titles table
 CREATE TABLE titles (
	title_id varchar(5) PRIMARY KEY,
	title varchar(30)
);

-- create employees table
CREATE TABLE employees (
	emp_no varchar(10) PRIMARY KEY,
	emp_title_id varchar(5) references titles(title_id),
	birth_date date,
	first_name varchar(45),
	last_name varchar(45),
	sex varchar(1),
	hire_date date
);

-- create departments table
CREATE TABLE departments (
	dept_no varchar(5) PRIMARY KEY,
	dept_name varchar(30)
);

-- create department managers table
CREATE TABLE dept_manager (
	dept_no varchar(5) references departments(dept_no),
	emp_no varchar(10)
);

-- create department employees table
CREATE TABLE dept_emp (
	emp_no varchar(10) references employees(emp_no),
	dept_no varchar(5) references departments(dept_no)
);

-- create salaries table
CREATE TABLE salaries (
	emp_no varchar(10) references employees(emp_no),
	salary int
);


--load CSV's into the tables, in order of creation
COPY titles FROM 'C:\data\titles.csv'
with (format CSV, HEADER);

SELECT  * FROM titles;

COPY employees FROM 'C:\data\employees.csv'
with (format CSV, HEADER);

SELECT  * FROM employees;

COPY  departments FROM 'C:\data\departments.csv'
with (format CSV, HEADER);

SELECT  * FROM departments;

COPY  dept_manager FROM 'C:\data\dept_manager.csv'
with (format CSV, HEADER);

SELECT  * FROM dept_manager;

COPY dept_emp FROM 'C:\data\dept_emp.csv'
with (format CSV, HEADER);

SELECT  * FROM dept_emp;

COPY  salaries FROM 'C:\data\salaries.csv'
with (format CSV, HEADER);

SELECT * FROM salaries;
