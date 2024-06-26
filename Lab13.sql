SELECT Title, Genre, Price
FROM Book
WHERE Genre = 'проза' AND Price BETWEEN 500 AND 1000;

SELECT Surname, Name, Phone
FROM Customer
WHERE Phone IS NOT NULL;

SELECT *
FROM Book
WHERE Title LIKE '%а%'

SELECT Title AS 'Список книг с буквы Г'
FROM Book
WHERE Title LIKE 'Г%'

SELECT COUNT(AuthorId) AS 'Количество авторов', Country AS 'Страна'
FROM Author
GROUP BY Country
HAVING COUNT(AuthorId) > 1;

SELECT OrderId AS 'Номер заказа', SUM(Amount) AS 'Количество книг'
FROM OrderList
GROUP BY OrderId
HAVING SUM(Amount) > 5;

SELECT AuthorId AS 'Номер автора', Title, COUNT(*) AS 'Количество книг, написанных автором'
FROM Book
GROUP BY AuthorId, Title
HAVING COUNT(*) > 1;