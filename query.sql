--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salary.salary
FROM employee
JOIN salary
ON employee.emp_no = salary.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employee
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT department.dept_no, department.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM department
JOIN dept_manager
ON department.dept_no = dept_manager.dept_no
JOIN employee
ON dept_manager.emp_no = employee.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT department.dept_no, department.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM department
JOIN dept_manager
ON department.dept_no = dept_manager.dept_no
JOIN employee
ON dept_manager.emp_no = employee.emp_no;

--5. List first name, last name, and sex for employee whose first name is "Hercules" and last names begin with "B."
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

--6. List all employee in the Sales department, including their employee number, last name, first name, and department name.
SELECT department.dept_name, employee.last_name, employee.first_name
FROM dept_emp
JOIN employee
ON dept_emp.emp_no = employee.emp_no
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

--7. List all employee in the Sales and Development department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN employee
ON dept_emp.emp_no = employee.emp_no
JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales' 
OR department.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employee share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employee
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;