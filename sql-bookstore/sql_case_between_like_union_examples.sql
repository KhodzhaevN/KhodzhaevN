DROP TABLE sales

CREATE TABLE sales (
    id INT PRIMARY KEY,
    model VARCHAR(50),
    price INT,
    quantity INT,
    date_of_sale DATE
);
INSERT INTO sales (id, model, price, quantity, date_of_sale) VALUES
	(1, 'iPhone 12', 799, 5, '2024-08-01'),
	(2, 'Galaxy S21', 699, 3, '2024-08-02'),
	(3, 'Pixel 6', 599, 2, '2024-08-03'),
	(4, 'iPhone 12', 799, 1, '2024-08-05'),
	(5, 'Galaxy S21', 699, 4, '2024-08-06'),
	(6, 'Pixel 6', 599, 3, '2024-08-07'),
	(7, 'iPhone 13', 899, 2, '2024-08-08'),
	(8, 'Galaxy S22', 799, 6, '2024-08-09'),
	(9, 'Pixel 7', 699, 5, '2024-08-10'),
	(10, 'iPhone 13', 899, 3, '2024-08-11');

--1. Использованиеоператора CASE
SELECT 
    id, 
    model, 
    price, 
    quantity,
    CASE 
        WHEN price > 800 THEN 'High'
        WHEN price BETWEEN 600 AND 800 THEN 'Medium'
        WHEN price < 600 THEN 'Low'
    END AS price_category
FROM sales;
 
--2. Использованиеоператора BETWEEN
SELECT *FROM sales
	WHERE date_of_sale BETWEEN '2024-08-01' AND '2024-08-07';
 
--3. Использованиеоператора LIKE
SELECT *FROM sales
	WHERE model LIKE 'iPhone%';
	
--Как альт.	
SELECT *FROM sales
	WHERE model ~ 'iPhone' ;
 
--4. Операциисмножествами (UNION, EXCEPT, INTERSECT)

--A Первый запрос: все продажи телефонов с ценой ниже 700
SELECT *
FROM sales
WHERE price < 700

UNION

-- Второй запрос: все продажи, где было продано более 3 единиц
SELECT *
FROM sales
WHERE quantity > 3;	
 


-- B Запрос на нахождение всех продаж телефонов серии "Galaxy S"
SELECT *
FROM sales
WHERE model LIKE 'Galaxy S%'

EXCEPT

-- Запрос на нахождение всех продаж, где продано больше 4 единиц
SELECT *
FROM sales
WHERE model LIKE 'Galaxy S%' AND quantity > 4;
 


-- C Первый запрос: все продажи, где продано более 3 единиц
SELECT *
FROM sales
WHERE quantity > 3

INTERSECT

-- Второй запрос: все продажи, где цена была ниже 800
SELECT *
FROM sales
WHERE price < 800;
	
 
 
