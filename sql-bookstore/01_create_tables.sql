CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT,
    supplier_id INT
);

INSERT INTO products (product_id, product_name, category, price, stock, supplier_id)
VALUES
(1, 'Laptop', 'Electronics', 799.99, 10, 101),
(2, 'Smartphone', 'Electronics', 599.99, 15, 102),
(3, 'Refrigerator', 'Appliances', 899.99, 5,  NULL),
(4, 'Microwave', 'Appliances', 199.99, 8,  NULL),
(5, 'Headphones', 'Accessories', 99.99, 25, 103),
(6, 'TV', 'Electronics', NULL, 0, 104),
(7, 'Blender', 'Appliances', 49.99, 12, 105);


--Найти все продукты, которые стоят меньше 500 и находятся в категории "Appliances"
SELECT * FROM products
WHERE price < 500 AND category = 'Appliances';

--Найти продукты, которые либо стоят больше 600, либо имеют количество на складе больше 20
SELECT * FROM products
WHERE price > 600 OR stock > 20;

--Найти продукты, которые не находятся в категории "Electronics"
SELECT * FROM products
WHERE NOT category = 'Electronics';

--Найти все продукты, которые стоят больше 100 и количество на складе больше 10
SELECT * FROM products
WHERE price > 100 AND stock > 10;

--Найти продукты, которые находятся либо в категории "Accessories", либо имеют более 10 штук на складе
SELECT * FROM products
WHERE category = 'Accessories' OR stock > 10;

--Найти продукты, у которых неизвестен поставщик (supplier_id is NULL)
SELECT * FROM products
WHERE supplier_id IS NULL;

--Найти продукты, у которых указан поставщик (supplier_id is NOT NULL)
SELECT * FROM products
WHERE supplier_id IS NOT NULL;
