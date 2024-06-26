--Task1--

UPDATE Book
SET Price = ROUND(Price, -1);
SELECT *
FROM Book

--Task2--

SELECT YEAR(OrderDatetime) 'Год', MONTH(OrderDatetime) 'Месяц', COUNT(*) AS 'Количество Заказов'
FROM [Order]
GROUP BY YEAR(OrderDatetime), MONTH(OrderDatetime)
ORDER BY 'Год' DESC, 'Месяц' DESC;

--Task3--

UPDATE Book
SET Price *= 0.9
WHERE BookId NOT IN
(
    SELECT DISTINCT BookId
    FROM OrderList, [Order]
    WHERE YEAR(OrderDatetime) = YEAR(GETDATE())
);
SELECT *
FROM Book

--Task4--

SELECT CustomerId AS 'Код заказчика'
, CONCAT_WS(' ',UPPER(Surname), UPPER(LEFT(Name, 1))) AS 'Фамилия и первая буква имени'
FROM Customer;

--Task5--

UPDATE Customer 
SET Login =  REPLACE(TRIM(Login), ' ', '_')
SELECT *
FROM Customer

--Task6--

SELECT CustomerId AS 'Номер заказчика', Surname AS 'Фамилия', Name AS 'Имя'
, COALESCE(Phone, '-') AS 'Телефон', COALESCE(Address, NULL) AS 'Адрес'
FROM Customer;

SELECT CustomerId AS 'Номер заказчика', Surname AS 'Фамилия', Name AS 'Имя'
, NULLIF(Phone, '-') AS 'Телефон', COALESCE(Address, NULL) AS 'Адрес'
FROM Customer;

--Task7--

SELECT AuthorId AS 'Код автора', STRING_AGG(Title, ', ') WITHIN GROUP (ORDER BY Title) AS 'Названия книг'
FROM Book
GROUP BY AuthorId
ORDER BY 'Названия книг';

--Task8--

SELECT OrderList.OrderId AS 'Номер заказа', CONCAT_WS(' ', Author.Name, Author.Surname) AS 'Автор'
, Book.Title AS 'Название'
FROM OrderList
JOIN Book ON OrderList.BookId = Book.BookId 
JOIN Author ON Book.AuthorId = Author.AuthorId;

--Task9--

SELECT ROW_NUMBER() OVER (ORDER BY Title) AS 'Порядковый номер', Title AS 'Название'
FROM Book
ORDER BY Title;

--Task10--

SELECT ROW_NUMBER() OVER (PARTITION BY category ORDER BY name) AS 'Своя нумерация для каждого жанра', Genre AS 'Категория', Title AS 'Название'
FROM Book
ORDER BY Genre, Title;