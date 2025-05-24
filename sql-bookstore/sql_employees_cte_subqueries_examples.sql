CREATE TABLE jobs (j_id SERIAL  PRIMARY KEY, 
					name_job VARCHAR(45));

CREATE TABLE workers (	
w_id INT  PRIMARY KEY, 	
name_worker VARCHAR(45), 
dept_id INT REFERENCES departments, 
job_id INT REFERENCES jobs,
salary INT ); 

CREATE TABLE departments (
    d_id INT PRIMARY KEY,
    name_dept VARCHAR(50)
);

INSERT INTO jobs (name_job)	
VALUES  ('специалист'),('помощник'),('начальник');


INSERT INTO workers (w_id, name_worker, dept_id, job_id,salary)	
VALUES (100, 'AndreyEx', 1,1, 50000), 
		(200, 'Boris', 2,3, 55000),	
		(300, 'Anna', 2,2, 70000),	
		(400, 'Anton', 3,1, 95000),	
		(500, 'Dima', 2,2, 60000),
		(600, 'Трофим', 3,2, 60000),
		(501, 'Maxs', 4, 1,35000),
		(700, 'Helen', 4,3, 65000),
		(800, 'Igor', 5,1, 56000);
		
INSERT INTO departments (d_id, name_dept) VALUES
(1, 'Sales'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Accounting'),
(5, 'Administration');

--1. Вывести все отделы, где есть начальники (используем CTE)
WITH manager_depts AS (
    SELECT DISTINCT dept_id
    FROM workers
    WHERE job_id = 3  -- '3' represents начальник (manager)
)
SELECT d.name_dept
FROM departments d
JOIN manager_depts md ON d.d_id = md.dept_id;
 



--2. Вывести те должности, которых нет в отделе Accounting (используем вложенный запрос)

SELECT name_job
FROM jobs
WHERE j_id NOT IN (
    SELECT job_id
    FROM workers
    WHERE dept_id = (
        SELECT d_id FROM departments WHERE name_dept = 'Accounting'
    )
);



 
--3. Вывести все отделы без начальников (используем вложенные запросы)
SELECT name_dept
FROM departments
WHERE d_id NOT IN (
    SELECT DISTINCT dept_id
    FROM workers
    WHERE job_id = 3
);

 

--4. Вывести всех работников, у которых зарплата больше, чем у единственного специалиста отдела Sales (используем вложенные запросы)
SELECT w.name_worker, w.salary
FROM workers w
WHERE w.salary > (
    SELECT salary
    FROM workers
    WHERE dept_id = (SELECT d_id FROM departments WHERE name_dept = 'Sales')
    AND job_id = 1  -- '1' represents специалист (specialist)
);
 

--5. Вывести всех работников, у которых зарплата больше, чем у единственного специалиста отдела Sales (используем CTE)

WITH sales_specialist AS (
    SELECT salary
    FROM workers
    WHERE dept_id = (SELECT d_id FROM departments WHERE name_dept = 'Sales')
    AND job_id = 1  -- '1' represents специалист (specialist)
)
SELECT w.name_worker, w.salary
FROM workers w, sales_specialist ss
WHERE w.salary > ss.salary;
 
--6. Вывести всех работников, у которых зарплата больше, чем у единственного специалиста отдела Sales (без CTE и вложенных запросов)
SELECT w.name_worker, w.salary
FROM workers w
JOIN workers wsales ON wsales.dept_id = 1 AND wsales.job_id = 1 -- 1 = специалист, dept_id 1 = Sales
WHERE w.salary > wsales.salary;
 
 
