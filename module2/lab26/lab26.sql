USE employees;


-- procedure for average salary
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
SELECT avg(salary) FROM t_salaries;
END$$
DELIMITER ;

-- procedure for giving back the employees number after puting in its first and last name 
DELIMITER $$
CREATE PROCEDURE emp3_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no int)
BEGIN
               SELECT
                               e.emp_no
               INTO p_emp_no FROM
                               t_employees e
               WHERE
                               e.first_name = p_first_name
                                               AND e.last_name = p_last_name;
END$$
DELIMITER ;

-- first procedure
CALL avg_salary();

-- second procedure for randomly selected employee Basil Tramer

CALL emp3_info('Basil', 'Tramer', @p_emp_no);
SELECT @p_emp_no;

-- Function with emp_ino() to take first and last anme and give the salaary for the lest period
DELIMITER $$

CREATE FUNCTION Emp_info_nsal(
	p_first_name varchar(255), 
    p_last_name varchar(255)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL(10,2);
	CALL emp3_info(p_first_name, p_last_name, @p_emp_no);
    
    SELECT max(from_date) 
    INTO v_max_from_date
    FROM t_salaries
		WHERE t_salaries.emp_no = @p_emp_no;
    
	SELECT max(salary)
    INTO v_salary
    FROM t_salaries
		WHERE t_salaries.from_date = v_max_from_date AND t_salaries.emp_no = @p_emp_no;
	
    -- return the customer level
	RETURN (v_salary);
END$$
DELIMITER ;

SELECT Emp_info_nsal(first_name,last_name), first_name, last_name FROM t_employees
LIMIT 10;

DROP TRIGGER trig_hire_date;
DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT ON t_employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN   
	SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');   
END IF;
END $$
DELIMITER ;

INSERT t_employees VALUES ('999999', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01'); 
SELECT 
   * 
FROM 
   t_employees
ORDER BY emp_no DESC;

-- Drop the i-hire-date index 
CREATE INDEX i_hire_date ON t_employees (hire_date);

DROP INDEX i_hire_date ON t_employees;

-- Select everything from salaries whose salary si higher than 89000
SELECT * FROM t_salaries
WHERE salary > 89000;

CREATE INDEX salary_big ON t_salaries(salary);


SELECT t_employees.emp_no, first_name, last_name, 
CASE WHEN dept_no IS NULL THEN 'Manager'
WHEN dept_no IS NOT NULL THEN 'Not manager'
ELSE 'Something wrong'
END AS Position
FROM  t_employees 
LEFT JOIN t_dept_manager
ON t_employees.emp_no = t_dept_manager.emp_no
WHERE t_employees.emp_no > 109990;


SELECT t_dept_manager.emp_no, first_name, last_name, (max(salary) - min(salary)),
CASE WHEN (max(salary) - min(salary)) > 30000 THEN 'GOOD'
WHEN (max(salary) - min(salary)) < 30000 THEN 'BAD'
END AS 'Salary_raise'
FROM t_dept_manager
JOIN t_employees
ON t_dept_manager.emp_no = t_employees.emp_no
JOIN t_salaries
ON t_employees.emp_no = t_salaries.emp_no
GROUP BY t_salaries.emp_no;


SELECT t_employees.emp_no, first_name, last_name,
CASE WHEN t_dept_emp.to_date > sysdate() THEN "Is still employed"
WHEN t_dept_manager.to_date > sysdate() THEN "Is still employed"
ELSE"Not an wmployee anymore"
END AS Employed
FROM t_employees
JOIN t_dept_manager
ON t_employees.emp_no = t_dept_manager.emp_no
JOIN t_dept_emp
ON t_employees.emp_no = t_dept_emp.emp_no
LIMIT 100;