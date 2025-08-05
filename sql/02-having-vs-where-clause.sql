-- 1. WHERE Clause
-- Gets all employees in department 1 who earn more than $70,000
SELECT employee_id, dept_id, salary
FROM employee_salary
WHERE dept_id = 1 AND salary > 70000;



-- 2. HAVING Clause
-- Get departments where the average salary is more than $60,000
-- GROUP BY comes frist then HAVING filters the grouped results
SELECT dept_id, AVG(salary) AS average_salary
FROM employee_salary
GROUP BY dept_id
HAVING average_salary > 60000;


-- 3. GROUP BY Alone
-- Taking the average salary and grouping it by occupation
SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation;

-- 4. WHERE, GROUP BY, and HAVING
-- Find each type of occupation that includes the word 'engineer' and show the average salary 
-- that is above $80,000
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%engineer%'
GROUP BY occupation
HAVING AVG(salary) > 80000;