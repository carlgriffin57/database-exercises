use employees;
show tables;

-- Explore the employees table. What different data types are present on this table?
-- The different data types are INT, DATE, VARCHAR and ENUM

-- Which table(s) do you think contain a numeric type column?
-- Tables that contain a numeric type column are dept_emp, dept_manager, employees, salaries and titles

-- Which table(s) do you think contain a string type column?
-- The tables that contain a string type column are departments, dept_emp, dept_manager, epmloyees and titles.

-- Which table(s) do you think contain a date type column?
-- The tables that contain a date type column are dept_emp, dept_manager, employees, salaries and titles.

-- What is the relationship between the employees and the departments tables?
-- There is no relationship between the two tables.

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;