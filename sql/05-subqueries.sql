-- 1. Finds all employees who work in department 4
-- The subquery checks the employee_salary table for employees who are in dept_id = 4
SELECT *
FROM employee_information
WHERE employee_id IN (SELECT employee_id
						FROM employee_salary
                        WHERE dept_id = 4);
                        
          
          
          
-- 2. This query calculates the overall average of average ages grouped by gender.
-- The subquery groups employees by gender and calculates the average age, max and min.
-- Then the outer query takes those gender-level average ages and calculates the overall average.
SELECT AVG(average_age_gender)
FROM 
(SELECT gender,
AVG(age) AS average_age_gender,
MAX(age) AS max_age,
MIN(age) AS min_age
FROM employee_information
GROUP BY gender) AS average;                   
                        
                        
                        
-- A JOIN pulls rows from multiple tables and displayes them side-by-side
-- a subquery runs first to return a value or list that your main query can use to filter or compare