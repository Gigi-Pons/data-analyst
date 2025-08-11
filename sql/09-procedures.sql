-- 1. Stored procedures using delimiters
-- I changed the statement delimiter to $$ so that MYSQL
-- knows where the procedure definition ends. 
-- This procedure contains two separate select queries
DELIMITER $$
CREATE PROCEDURE salaries_over_50_2()
BEGIN 
	SELECT * 
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT * 
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;

CALL salaries_over_50_2();

-- 2. Stored Procedure using parameter
-- This procedure accepts a parameter named employee_id which is passed as 
-- an argument at the time of calling the procedure.  The parameter is used 
-- in the where clause to look at a specific employee to look up their salary
DELIMITER $$
CREATE PROCEDURE look_up_salary_2(id INT)
BEGIN 
	SELECT salary 
    FROM employee_salary
    -- it is good practice for the parameter name to be different than the column name
    WHERE employee_id = id;
END $$
DELIMITER ;

CALL look_up_salary_2(1);