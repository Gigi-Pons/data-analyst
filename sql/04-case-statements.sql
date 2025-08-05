-- 1. Use case statement to determine how much they'll recieve for bonus
-- if employee makes less than $50,000, they receive 5% in addition to their pay
-- if employee makes more than $50,000, they receive 8% in addition to their pay
SELECT info.first_name, info.last_name, sal.salary,
CASE 
	WHEN sal.salary > 50000 THEN salary * 1.07
    WHEN sal.salary < 50000 THEN salary * 1.05
END AS new_salary
FROM employee_information AS info 
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id;


-- You can have multiple case statements in one.  Here I took the one I was working with up there
-- and added a third statement because the employees in the Human Resources department will get a 10% bonus
SELECT info.first_name, info.last_name, sal.salary,
CASE 
	WHEN sal.salary > 50000 THEN salary * 1.07
    WHEN sal.salary < 50000 THEN salary * 1.05
END AS new_salary,
CASE 
	WHEN sal.dept_id = 4 THEN sal.salary * .10
END AS bonus
FROM employee_information AS info 
JOIN employee_salary AS sal ON info.employee_id = sal.employee_id;