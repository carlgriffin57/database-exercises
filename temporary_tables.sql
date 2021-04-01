-- 1. Using the example from the lesson, re-create the employees_with_departments table.
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no);

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the 
--    lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

-- b. Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

-- c. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP first_name;
ALTER TABLE employees_with_departments DROP last_name;

-- d. What is another way you could have ended up with this same table?

-- 2. Create a temporary table based on the payment table from the sakila database.
CREATE TEMPORARY TABLE payment AS
SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update
FROM sakila.payment;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing 
-- the number of cents of the payment. For example, 1.99 should become 199.
ALTER TABLE payment
MODIFY COLUMN amount DECIMAL(7,2);

UPDATE payment SET amount = amount * 100;

ALTER TABLE payment
modify COLUMN amount INT(7);

-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the 
-- Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

did not finish