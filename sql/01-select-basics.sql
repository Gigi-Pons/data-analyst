-- List all employee information sorted by gender and then by age in descending order
SELECT * 
FROM employee_information
ORDER BY gender, age DESC;

-- Sort the result by birth date from oldest to youngest
SELECT * 
FROM employee_information 
ORDER BY birth_date ASC;

-- Get salary details for employees in department 3
SELECT * 
FROM employee_salary
WHERE dept_id = 3;

-- Only shows rows where the occupation is either 'Data Analyst' or 'IT Specialist'
SELECT * 
FROM employee_salary
WHERE occupation IN ('Data Analyst', 'IT Specialist');

-- Find employees born between 1985 and 1995
SELECT first_name, last_name, birth_date
FROM employee_information
WHERE birth_date BETWEEN '1985-01-01' AND '1995-01-01';





