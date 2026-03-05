/*
🟢 Basic Level (SELECT / WHERE / ORDER BY)

Show all employees with salary greater than 10,000.
Display first name, last name, and hire date of employees hired after 1998.
List all employees working in department 50.
Show all employees ordered by salary from highest to lowest.
Display distinct job IDs from the employees table.

🟡 Intermediate Level (JOIN / GROUP BY / AGGREGATE)
Show employee name and department name (join employees + departments).
Display department name and number of employees in each department.
Find the average salary in each department.
Show the department with the highest average salary.
List employees along with their job title.
Display employee name, city, and country name.
Show total salary paid per job_id.
Find employees who earn more than the average salary of the company.
Show departments that have no employees.
List managers and the number of employees they manage.

🔵 Advanced Level (Subquery / Self Join / HAVING / Complex Logic)

Show employees who earn the highest salary in their department.
Find the second highest salary in the company.
Display employees who have changed jobs (use job_history).
Show employees who work in the same department as ‘Steven King’.
List departments located in the United States.
Show employees whose salary is outside the min/max salary defined in jobs table.
Find employees hired before their manager.
    SELECT e.first_name, e.hire_date, m.first_name, m.hire_date FROM employees 
	AS e JOIN employees AS m ON e.manager_id = m.employee_id 
	WHERE e.hire_date < m.hire_date;

Display the top 3 highest paid employees in each department.
Show regions and total number of employees in each region (use countries → locations → departments → employees).
Show employees who never appear in job_history.
*/