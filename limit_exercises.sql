-- 1. Create a new SQL script named limit_exercises.sql.

-- 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

-- SELECT DISTINCT title FROM titles;
-- List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name 
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- Zykh
-- Zyda
-- Zwicker
-- Zweizig
-- Zumaque
-- Zultner
-- Zucker
-- Zuberek
-- Zschoche
-- Zongker

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
SELECT first_name, last_name, birth_date, hire_date 
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;
-- Alselm	Cappello	1962-12-25	1990-01-01
-- Utz	Mandell	1960-12-25	1990-01-03
-- Bouchung	Schreiter	1963-12-25	1990-01-04
-- Baocai	Kushner	1959-12-25	1990-01-05
-- Petter	Stroustrup	1959-12-25	1990-01-10

-- 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.

-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
SELECT first_name, last_name, birth_date, hire_date 
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 50;
-- Christophe	Baca	1957-12-25	1990-08-11
-- Moie	Birsak	1961-12-25	1990-08-11
-- Chikako	Ibel	1957-12-25	1990-08-12
-- Shounak	Jansen	1955-12-25	1990-08-13
-- Zhigen	Boissier	1961-12-25	1990-08-18
-- The limit is 5 and offset is the index on where the list begins on page 10.