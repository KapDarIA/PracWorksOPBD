SELECT        Author.Surname, Author.Name, Book.BookId, Book.Title, Book.Price
FROM            Author INNER JOIN
                         Book ON Author.AuthorId = Book.AuthorId;

SELECT        OrderList.OrderId AS 'Номер заказа', OrderList.BookId AS 'Код книги', Book.Title AS 'Название', Author.Surname AS 'Фамилия', Author.Name AS 'Имя', Book.Price AS 'Цена', OrderList.Amount AS 'Количество', Book.Price * OrderList.Amount AS 'Стоимость'
FROM            Author INNER JOIN
                         Book ON Author.AuthorId = Book.AuthorId INNER JOIN
                         OrderList ON Book.BookId = OrderList.BookId;

SELECT        [Order].OrderId, [Order].OrderDatetime, SUM(Price * Amount) AS 'Стоимость'
FROM            [Order] INNER JOIN
                         OrderList ON [Order].OrderId = OrderList.OrderId INNER JOIN
                         Book ON OrderList.BookId = Book.BookId
GROUP BY [Order].OrderDatetime, [Order].OrderId
ORDER BY [Order].OrderDatetime;


SELECT Customer.CustomerId, Login, COUNT([Order].OrderId) AS 'Количество Заказов'
FROM Customer LEFT JOIN [Order] ON Customer.CustomerId = [Order].CustomerId
GROUP BY Customer.CustomerId, Customer.[Login];


SELECT *
FROM [Order]
WHERE [Order].OrderId NOT IN
(
	SELECT OrderId
	FROM OrderList
);

SELECT *
FROM Customer
WHERE CustomerId IN
(
	SELECT CustomerId
	FROM [Order]
	GROUP BY CustomerId
);

SELECT Name AS 'Имя', Surname AS 'Фамилия', 'Автор' AS Кто_по_масти
FROM Author
UNION
SELECT Surname, Name, 'Заказчик' AS Кто_по_масти
FROM Customer
ORDER BY Name, Surname;