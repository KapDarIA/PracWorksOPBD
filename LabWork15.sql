--Task1--

UPDATE Book
SET Price = ROUND(Price, -1);
SELECT *
FROM Book

--Task2--

SELECT YEAR(OrderDatetime) '���', MONTH(OrderDatetime) '�����', COUNT(*) AS '���������� �������'
FROM [Order]
GROUP BY YEAR(OrderDatetime), MONTH(OrderDatetime)
ORDER BY '���' DESC, '�����' DESC;

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

SELECT CustomerId AS '��� ���������'
, CONCAT_WS(' ',UPPER(Surname), UPPER(LEFT(Name, 1))) AS '������� � ������ ����� �����'
FROM Customer;

--Task5--

UPDATE Customer 
SET Login =  REPLACE(TRIM(Login), ' ', '_')
SELECT *
FROM Customer

--Task6--

SELECT CustomerId AS '����� ���������', Surname AS '�������', Name AS '���'
, COALESCE(Phone, '-') AS '�������', COALESCE(Address, NULL) AS '�����'
FROM Customer;

SELECT CustomerId AS '����� ���������', Surname AS '�������', Name AS '���'
, NULLIF(Phone, '-') AS '�������', COALESCE(Address, NULL) AS '�����'
FROM Customer;

--Task7--

SELECT AuthorId AS '��� ������', STRING_AGG(Title, ', ') WITHIN GROUP (ORDER BY Title) AS '�������� ����'
FROM Book
GROUP BY AuthorId
ORDER BY '�������� ����';

--Task8--

SELECT OrderList.OrderId AS '����� ������', CONCAT_WS(' ', Author.Name, Author.Surname) AS '�����'
, Book.Title AS '��������'
FROM OrderList
JOIN Book ON OrderList.BookId = Book.BookId 
JOIN Author ON Book.AuthorId = Author.AuthorId;

--Task9--

SELECT ROW_NUMBER() OVER (ORDER BY Title) AS '���������� �����', Title AS '��������'
FROM Book
ORDER BY Title;

--Task10--

SELECT ROW_NUMBER() OVER (PARTITION BY category ORDER BY name) AS '���� ��������� ��� ������� �����', Genre AS '���������', Title AS '��������'
FROM Book
ORDER BY Genre, Title;