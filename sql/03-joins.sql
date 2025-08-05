-- 1. Show each employee's full name, occupation, and salary
SELECT first_name, last_name, occupation, salary
FROM employee_information AS info
JOIN employee_salary AS sal
ON info.employee_id = sal.employee_id;

-- 2. List all employees along with their department names
-- This combines all 3 tables to show employee names with department info
SELECT first_name, last_name, department_name
FROM employee_information AS info
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id
JOIN departments AS dep ON sal.dept_id = dep.department_id;

-- Left join: Take everything from the left table.  Even if they don't belong to anything on the right,
-- still show the row and just leave it blank if nothing matches from the right table.alter

-- Right join: You'll always get all rows from the right table, and matched rows (or NULL) from the left.