SELECT        Author.Surname, Author.Name, Book.BookId, Book.Title, Book.Price
FROM            Author INNER JOIN
                         Book ON Author.AuthorId = Book.AuthorId;

SELECT        OrderList.OrderId AS '����� ������', OrderList.BookId AS '��� �����', Book.Title AS '��������', Author.Surname AS '�������', Author.Name AS '���', Book.Price AS '����', OrderList.Amount AS '����������', Book.Price * OrderList.Amount AS '���������'
FROM            Author INNER JOIN
                         Book ON Author.AuthorId = Book.AuthorId INNER JOIN
                         OrderList ON Book.BookId = OrderList.BookId;

SELECT        [Order].OrderId, [Order].OrderDatetime, SUM(Price * Amount) AS '���������'
FROM            [Order] INNER JOIN
                         OrderList ON [Order].OrderId = OrderList.OrderId INNER JOIN
                         Book ON OrderList.BookId = Book.BookId
GROUP BY [Order].OrderDatetime, [Order].OrderId
ORDER BY [Order].OrderDatetime;


SELECT Customer.CustomerId, Login, COUNT([Order].OrderId) AS '���������� �������'
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

SELECT Name AS '���', Surname AS '�������', '�����' AS ���_��_�����
FROM Author
UNION
SELECT Surname, Name, '��������' AS ���_��_�����
FROM Customer
ORDER BY Name, Surname;