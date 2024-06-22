-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e
	join salaries s on e.emp_no = s.emp_no
ORDER BY
	e.emp_no;
--Results "300,024 employees in total"

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	e.first_name,
	e.last_name,	
	e.hire_date
FROM
	employees e
WHERE
	DATE_PART('year',hire_date) = 1986
Order by
	hire_date;
--Results "36,150 employees hired on 1986"

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT 
	d.dept_no,
	d.dept_name, 
    e.emp_no, 
	e.last_name, 
	e.first_name
FROM 
	departments d
JOIN 
	dept_manager dm ON d.dept_no = dm.dept_no
JOIN 
	employees e ON dm.emp_no = e.emp_no
Order by
	dept_no;
--Results "24 managers"

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	d.dept_name, 
	de.dept_no
FROM 
	employees e
JOIN 
	dept_emp de ON e.emp_no = de.emp_no
JOIN 
	departments d ON de.dept_no = d.dept_no;
--Results "331,603 department number for each employee, some employees work in more than one department
--that is why the number is mayor than the total employees"

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose 
-- last name begins with the letter B.
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	and e.last_name like 'B%'
ORDER BY
	e.last_name;
--Results "20 employees share the same name"

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	e.emp_no,
    e.last_name,
    e.first_name
FROM 
	employees e
INNER JOIN 
	dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
	departments d ON d.dept_no = de.dept_no
WHERE 
	d.dept_name = 'Sales';
--Results "52,245 employees on the Sales department"

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
SELECT 
	e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
	employees e
INNER JOIN 
	dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
	departments d ON d.dept_no = de.dept_no
WHERE 
	d.dept_name IN ('Sales', 'Development');
--Results "137,952 employees in Sales and Development department"

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, 
-- how many employees share each last name).
SELECT 
	e.last_name,
    count(last_name)
FROM 
	employees e
GROUP BY 
	e.last_name
ORDER BY 
	count(last_name) DESC;
--Results "1,638 different last names, share between all the employees, where the most common is Baba and
--less common Foolsday"

