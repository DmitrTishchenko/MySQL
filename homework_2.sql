DROP DATABASE IF EXISTS homework_2;
CREATE DATABASE homework_2;
USE homework_2;


-- задание 1: Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	order_data DATE  ,
	count_product  INT
);

-- наполнение данными 
INSERT INTO sales (order_data, count_product)
VALUES 
("2022-01-01",156),
("2022-01-02",180),
("2022-01-03",21),
("2022-01-04",124),
("2022-01-05",341);

-- задание 2: Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	id AS 'id заказа',
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
		WHEN count_product > 300 THEN 'Большой заказ'
		ELSE 'Не определено'
	END AS 'Тип заказа'	
FROM sales;

-- задание 3:Создайте таблицу “orders”, заполните ее значениями. Выберите все заказы.
-- В зависимости от поля order_status выведите столбец full_order_status: OPEN – «Order is in open state» ;
-- CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	employee_id VARCHAR(50),
	amount DECIMAL(5,2),
	order_status VARCHAR(50)
);

-- наполнение данными 
INSERT INTO orders (employee_id, amount, order_status)
VALUES 
('e03',15.00,'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.50,'CANCELLED');

SELECT 
	id AS 'номер id',
	employee_id AS 'рабочее id',
	amount AS 'сумма',
	IF (order_status = 'OPEN', '«Order is in open state»', 
		IF (order_status = 'CLOSED', '«Order is closed»', 
			IF (order_status = 'CANCELLED', '«Order is cancelled»', 'Не определено')  
			)
		) AS 'статус'	
FROM orders;
