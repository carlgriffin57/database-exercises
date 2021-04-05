-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
SELECT emp_no, max(dept_no), max(from_date), IF(max(to_date) > now(), TRUE, FALSE) AS is_current_employee
FROM dept_emp
GROUP BY emp_no;


-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that 
-- returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT first_name, last_name,
CASE last_name
	WHEN last_name BETWEEN 'A%' AND 'Iz%' THEN 'A-H'
	WHEN last_name BETWEEN 'I%' AND 'Rz%' THEN 'I-Q'
	WHEN last_name BETWEEN 'R%' AND 'Zz%' THEN 'R-Z'
	ELSE 'Other'
	END AS alpha_group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?
SELECT count(*) AS decade_count,
CASE birth_date
	WHEN birth_date LIKE '195%' THEN 'number_of_employees_born_in_the_50s'
	WHEN birth_date LIKE '196%' THEN 'number_of_employees_born_in_the_60s'
	END AS decade_of_birth
FROM employees
GROUP BY decade_of_birth
ORDER BY decade_count;