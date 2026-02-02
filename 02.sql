-- SELECT job_id, SUM(salary) from employees GROUP BY job_id

-- SELECT department_id, avg(salary) from employees GROUP BY department_id HAVING avg(salary > 9000);

-- SELECT department_id, department_name, first_name FROM `departments` NATURAL JOIN employees;
-- SELECT department_id, department_name, first_name FROM departments JOIN employees USING (department_id);
-- SELECT department_id, department_name, first_name FROM departments JOIN employees USING (department_id, manager_id);

-- SELECT e.employee_id, e.first_name, m.employee_id FROM employees e JOIN employees m ON e.manager_id = m.employee_id

-- SELECT employee_id, first_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);