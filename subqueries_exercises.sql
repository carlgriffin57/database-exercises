-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date IN(
SELECT hire_date from employees
WHERE emp_no = '101010');

-- 69 rows are returned.

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT *
FROM titles
WHERE emp_no IN(
SELECT emp_no
FROM employees 
WHERE first_name LIKE 'aamod' AND to_date > now());

-- 168 rows returned.

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT *
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM dept_emp 
WHERE to_date < now());

-- 91479 rows returned.

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM dept_manager
WHERE gender = 'F' AND to_date > now());

-- Isamu	Legleitner
-- Karsten	Sigstam
-- Leon	DasSarma
-- Hilary	Kambil

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT count(emp_no)
FROM salaries
WHERE salary > 
(SELECT
 AVG(salary)
FROM salaries
WHERE to_date NOT LIKE '9999%')
AND to_date LIKE '9999%';

-- 158675 returned

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of 
-- all salaries is this?
SELECT count(emp_no)
FROM salaries
WHERE salary > 
(SELECT
 MAX(salary) - STD(salary)
FROM salaries
WHERE to_date LIKE '9999%')
AND to_date LIKE '9999%';

-- 83 returned

-- BONUS 1. Find all the department names that currently have female managers.
SELECT departments.dept_name AS 'Department Name', 
       CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager USING(emp_no)    
JOIN departments USING(dept_no)
WHERE gender = 'F' AND to_date > NOW();

-- Finance	Isamu Legleitner
-- Human Resources	Karsten Sigstam
-- Development	Leon DasSarma
-- Research	Hilary Kambil