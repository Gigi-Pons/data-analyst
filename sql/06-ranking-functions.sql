-- 1. We are doing a window function just based off of the AVG(salary) column
SELECT first_name, gender, AVG(salary) OVER(PARTITION BY gender) AS average_salary
FROM employee_information AS info
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id;


-- 2. The ORDER BY creates a cumulative (rolling) result.  Like total up to this row
SELECT first_name, gender, salary, SUM(salary) OVER(PARTITION BY gender ORDER BY info.employee_id) AS rolling_total
FROM employee_information AS info
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id;



-- 3. Gives a unique number per row within a partition.
-- In this case is gender, and it is ordered by the highest to lowest salary
SELECT info.first_name, info.last_name, info.gender, sal.salary,
-- Row numbers will never have duplicates
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
-- if there are duplicates in the salary, then it just gives it the same rank and skips that number
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
-- DENSE_RANK, when it comes down to duplicates, it's going to give the next number numerically, not positionally
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_information AS info
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id;