-- Use temp tables when you are doing a lot of data manipulation and complex procedures.
-- You can reuse this temp table over and over again but once you exit the session, it'll 
-- be erased because it lives in memory
CREATE TEMPORARY TABLE over_50k
SELECT * 
FROM employee_salary
WHERE salary > 80000;

SELECT * 
FROM over_50k;