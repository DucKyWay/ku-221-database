-- SELECT * FROM departments;

-- SELECT department_id id, department_name "Department Name", location_id FROM departments;

-- SELECT concat(first_name, ' ', last_name) FROM employees;

-- SELECT first_name, hire_date FROM employees WHERE hire_date < "1999-01-20";

-- SELECT first_name, salary FROM employees 
-- where salary BETWEEN 6100 and 6300;

-- SELECT job_id, job_title from jobs where job_id in ('IT_PROG', 'AD_VP', 'HR_REP');

-- SELECT job_id, job_title from jobs where job_id not in ('IT_PROG', 'AD_VP', 'HR_REP');

-- SELECT first_name, job_id, commission_pct from employees WHERE commission_pct is null;

-- SELECT first_name, salary, department_id, job_id FROM employees WHERE department_id=10 AND (salary<5000 or job_id="IT_PROG");

-- SELECT first_name, salary, department_id, job_id FROM employees WHERE job_id="IT_PROG" ORDER BY salary DESC;

-- SELECT first_name, salary, department_id, job_id FROM employees WHERE job_id="IT_PROG" ORDER BY salary ASC;

-- SELECT department_id, first_name, salary FROM employees WHERE department_id IN (20, 10, 30) ORDER BY department_id, salary DESC;

-- SELECT region_name, LOWER(region_name), UPPER(region_name) FROM regions;

-- SELECT region_name, LENGTH(region_name) from regions;

-- SELECT region_name, SUBSTR(region_name, 3, 2), SUBSTR(region_name, 3) from regions;

SELECT salary, 
salary+100*commission_pct, 
salary+NVL(commission_pct,0) 
FROM employees 
WHERE employee_id IN (105,106,145,146);

-- SELECT location_id from departments;

-- SELECT DISTINCT(location_id) from departments; -- แสดงครั้งเดียว(ไม่ซ้ำ)

-- SELECT count(DISTINCT(location_id)) FROM departments;

-- SELECT first_name, UPPER(SUBSTRING(first_name,2,4)) from employees;
