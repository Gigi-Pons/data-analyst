-- 1. Using CTE to encapsulate a grouped aggregation query where we select the average salary grouped by gender
-- The CTE is used in the select statement to only get the average gender group (female or male or both) with max salary above $70,000.
WITH Group_by_gender AS
(
SELECT gender, AVG(salary) AS average, MAX(salary) AS max
FROM employee_information AS info
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * 
FROM Group_by_gender
WHERE average > 70000;