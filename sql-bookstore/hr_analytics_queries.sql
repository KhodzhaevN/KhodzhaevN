2. Найти среднюю зарплату всех, кто родился после 01.01.1990
SELECT AVG(salary) AS average_salary
FROM workers
WHERE birthday > '1990-01-01';
 
3. Найти средний возраст (по полным годам) всех по отделам с указанием наименований отделов
SELECT 
    d.name_dept,
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, w.birthday))) AS average_age
FROM 
    workers w
JOIN 
    departments d ON w.dept_id = d.d_id
GROUP BY 
    d.name_dept;
 
4. Найти суммарную годовую зарплату по каждому отделу и итого по компании
SELECT 
    d.name_dept,
    SUM(w.salary * 12) AS annual_salary
FROM 
    workers w
JOIN 
    departments d ON w.dept_id = d.d_id
GROUP BY 
    d.name_dept
UNION ALL
SELECT 
    'Total',
    SUM(w.salary * 12) AS annual_salary
FROM 
    workers w;
 
5. Найти количество сотрудников во всех возможных комбинациях отдел - должность
SELECT 
    d.name_dept,
    j.name_job,
    COUNT(*) AS employee_count
FROM 
    workers w
JOIN 
    departments d ON w.dept_id = d.d_id
JOIN 
    jobs j ON w.job_id = j.j_id
GROUP BY 
    d.name_dept, j.name_job
ORDER BY 
    d.name_dept, j.name_job;
 
6. Для каждой должности соберите имена сотрудников как массив
SELECT 
    j.name_job,
    ARRAY_AGG(w.name_worker) AS employee_names
FROM 
    workers w
JOIN 
    jobs j ON w.job_id = j.j_id
GROUP BY 
    j.name_job;
 
7. Создайте итоги по отделу и должности по средней зарплате (ROLLUP используем)
SELECT 
    d.name_dept,
    j.name_job,
    AVG(w.salary) AS average_salary
FROM 
    workers w
JOIN 
    departments d ON w.dept_id = d.d_id
JOIN 
    jobs j ON w.job_id = j.j_id
GROUP BY 
    ROLLUP(d.name_dept, j.name_job)
ORDER BY 
    d.name_dept, j.name_job;
 
8. Найдите в одном запросе отдел, где моложе всего сотрудники в среднем, и посчитайте для него среднюю заработную плату
WITH avg_age_per_dept AS (
    SELECT 
        d.name_dept,
        AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, w.birthday))) AS average_age,
        AVG(w.salary) AS average_salary
    FROM 
        workers w
    JOIN 
        departments d ON w.dept_id = d.d_id
    GROUP BY 
        d.name_dept
)
SELECT 
    name_dept,
    average_age,
    average_salary
FROM 
    avg_age_per_dept
ORDER BY 
    average_age
LIMIT 1;

 

2. Средняя зарплата всех, кто родился после 01.01.1990: Используем функцию AVG для расчета средней зарплаты и фильтруем по дате рождения.
3. Средний возраст по отделам: Используем EXTRACT и AGE для расчета возраста и AVG для среднего значения.
4. Суммарная годовая зарплата по отделам и итого по компании: Используем SUM и UNION ALL для добавления итоговой строки.
5. Количество сотрудников по комбинациям отдел-должность: Группируем по отделам и должностям и считаем количество сотрудников.
6.Имена сотрудников как массив по должностям: Используем ARRAY_AGG для сбора имен в массив.
7. Итоги по отделу и должности по средней зарплате: Используем ROLLUP для создания итоговых строк.
8. Отдел с самым молодым средним возрастом и средняя зарплата: Используем WITH для создания временной таблицы и сортируем по среднему возрасту, ограничивая результат одной строкой.

