-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT DISTINCT title
FROM titles;
-- Seven distinct titles.

-- 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees WHERE last_name LIKE 'e%e'
GROUP BY last_name;
-- 5 distinct last names starting and ending with 'e'.

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name
FROM employees WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Chleq
-- Lindqvist
-- Qiwen

-- 6. Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name, COUNT(last_name)
FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name;
-- Chleq	189
-- Lindqvist	190
-- Qiwen	168

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT  first_name, gender, COUNT(*) 
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;
-- Irena	M	144
-- Irena	F	97
-- Maya	M	146
-- Maya	F	90
-- Vidya	M	151
-- Vidya	F	81

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT count(*) AS total_count, LOWER((CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))))
AS username, first_name, last_name, birth_date
FROM employees
GROUP BY username, first_name, last_name, birth_date
HAVING total_count > 1;
-- 6 duplicate usernames.