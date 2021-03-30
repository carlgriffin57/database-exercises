-- Use the employees database.

--  2. Using the example in the Associative Table Joins section as a guide, write a query that shows each 
-- department along with the name of the current manager for that department.

SELECT departments.dept_name AS "Department Name", 
CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM departments
JOIN dept_manager USING(dept_no)
JOIN employees USING(emp_no)
WHERE to_date LIKE '9999%'
ORDER BY dept_name;

-- Customer Service	Yuchang Weedman
-- Development	Leon DasSarma
-- Finance	Isamu Legleitner
-- Human Resources	Karsten Sigstam
-- Marketing	Vishwani Minakawa
-- Production	Oscar Ghazalie
-- Quality Management	Dung Pesch
-- Research	Hilary Kambil
-- Sales	Hauke Zhang

-- 3. Find the name of all departments currently managed by women.
SELECT departments.dept_name AS "Department Name", 
CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM departments
JOIN dept_manager USING(dept_no)
JOIN employees USING(emp_no)
WHERE to_date LIKE '9999%' AND gender LIKE 'F'
ORDER BY dept_name;

-- Development	Leon DasSarma
-- Finance	Isamu Legleitner
-- Human Resources	Karsten Sigstam
-- Research	Hilary Kambil

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT title AS Title, count(*) AS Count
FROM departments
JOIN dept_emp USING(dept_no)
JOIN employees USING(emp_no)
JOIN titles USING(emp_no)
WHERE dept_name LIKE 'customer service' AND dept_emp.to_date LIKE '9999%' AND titles.to_date LIKE '9999%'
GROUP BY title;

Assistant Engineer	68
Engineer	627
Manager	1
Senior Engineer	1790
Senior Staff	11268
Staff	3574
Technique Leader	241

-- 5. Find the current salary of all current managers.
SELECT departments.dept_name AS "Department Name", 
CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager", salaries.salary
FROM departments
JOIN dept_manager USING(dept_no)
JOIN employees USING(emp_no)
JOIN salaries USING(emp_no)
WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date > curdate()
ORDER BY dept_name;

-- Customer Service	Yuchang Weedman	58745
-- Development	Leon DasSarma	74510
-- Finance	Isamu Legleitner	83457
-- Human Resources	Karsten Sigstam	65400
-- Marketing	Vishwani Minakawa	106491
-- Production	Oscar Ghazalie	56654
-- Quality Management	Dung Pesch	72876
-- Research	Hilary Kambil	79393
-- Sales	Hauke Zhang	101987

-- 6. Find the number of current employees in each department.

SELECT dept_no AS dept_no, dept_name AS dept_name, count(*) AS num_employees
FROM departments
JOIN dept_emp USING(dept_no)
JOIN employees USING(emp_no)
JOIN titles USING(emp_no)
WHERE dept_emp.to_date LIKE '9999%' AND titles.to_date LIKE '9999%'
GROUP BY dept_name
ORDER BY dept_no;

-- d001	Marketing	14842
-- d002	Finance	12437
-- d003	Human Resources	12898
-- d004	Production	53304
-- d005	Development	61386
-- d006	Quality Management	14546
-- d007	Sales	37701
-- d008	Research	15441
-- d009	Customer Service	17569

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name, (AVG(salary)) AS average_salary
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN employees USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date LIKE '9999%'
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Sales	88842.1590

-- 8. Who is the highest paid employee in the Marketing department?

-- did not finish