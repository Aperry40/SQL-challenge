-- Create tables in following order:
-- Titles
-- Employees
-- Departments
-- Dept_Manager
-- Dept_Emp
-- Salaries

CREATE TABLE titles
(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

SELECT * FROM titles;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

CREATE TABLE departments
(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

SELECT * FROM departments;

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
)

SELECT * FROM dept_manager;

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
)

SELECT * FROM dept_emp;

CREATE TABLE salaries
(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no


--List first name, last name, and hire date for employees who were hired in 1986.
--SELECT * FROM employees;
--Use BETWEEN function since the hire_date is DATE datatype
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--WHERE emp_title_id = 'm0001';

--SELECT employees.emp_no, first_name, last_name, dept_name
--FROM employees
--INNER JOIN dept_emp
--ON employees.emp_no = dept_emp.emp_no
--INNER JOIN departments
--ON departments.dept_no = dept_emp.dept_no
--WHERE departments.dept_no IN ('d007', 'd005');

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM employees;

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--SELECT * FROM employees;
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no IN ('d007');

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;

SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no IN ('d007', 'd005');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT * FROM employees;
SELECT last_name, COUNT(last_name) AS "Last NAME COUNT"
FROM employees
GROUP BY last_name
ORDER BY "Last NAME Count" Desc;