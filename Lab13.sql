SELECT Title, Genre, Price
FROM Book
WHERE Genre = '�����' AND Price BETWEEN 500 AND 1000;

SELECT Surname, Name, Phone
FROM Customer
WHERE Phone IS NOT NULL;

SELECT *
FROM Book
WHERE Title LIKE '%�%'

SELECT Title AS '������ ���� � ����� �'
FROM Book
WHERE Title LIKE '�%'

SELECT COUNT(AuthorId) AS '���������� �������', Country AS '������'
FROM Author
GROUP BY Country
HAVING COUNT(AuthorId) > 1;

SELECT OrderId AS '����� ������', SUM(Amount) AS '���������� ����'
FROM OrderList
GROUP BY OrderId
HAVING SUM(Amount) > 5;

SELECT AuthorId AS '����� ������', Title, COUNT(*) AS '���������� ����, ���������� �������'
FROM Book
GROUP BY AuthorId, Title
HAVING COUNT(*) > 1;