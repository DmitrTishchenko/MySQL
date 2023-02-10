# Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц

## Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными (поля и наполнение см. в презентации)

DROP DATABASE IF EXISTS homework_1;
CREATE DATABASE homework_1;
USE homework_1;

-- мобильные телефоны
CREATE TABLE mobile_phones(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	product_name VARCHAR(45) NOT NULL, 
	manufacturer VARCHAR(45) NOT NULL,
    product_count VARCHAR(45) NOT NULL,
	price BIGINT UNSIGNED
);

-- наполнение
INSERT INTO mobile_phones (product_name, manufacturer, product_count,price)
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),	
('P20 Pro', 'Huawei', 5, 36000);

## -- задание 2: Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT product_name,manufacturer,price FROM mobile_phones
WHERE product_count <= '2';

## -- задание 3: Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones
WHERE manufacturer='Samsung';

## -- задание 4:(по желанию) С помощью регулярных выражений найти:
## --           Товары, в которых есть упоминание "Iphone"
SELECT * FROM mobile_phones 
WHERE product_name LIKE 'iPhone%';
## --           Товары, в которых есть упоминание"Samsung"
SELECT * FROM mobile_phones 
WHERE manufacturer LIKE 'Samsung%';
## --           Товары, в которых есть ЦИФРЫ
SELECT * FROM mobile_phones 
WHERE product_name REGEXP '[0-9]';
## --           Товары, в которых есть ЦИФРА "8"
SELECT * FROM mobile_phones 
WHERE product_name REGEXP '[8]';
## Спасибо за внимание
