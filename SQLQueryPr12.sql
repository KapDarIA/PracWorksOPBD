--Task1--
SELECT *
FROM Book;

--Task2--
SELECT 
CONCAT(Name, ' ', Surname) AS FullName
FROM Author;

--Task3--
SELECT DISTINCT Country
FROM Author
ORDER BY Country;

--Task4--
SELECT 
	BookId, 
	Title, 
	Price*0.95 AS Price
FROM Book
ORDER BY Price DESC,Title ASC;

--Task5--
SELECT 
	AuthorId, 
	Title, 
	COUNT(*) AS BookCount
FROM Book
GROUP BY AuthorId,Title;

--Task6--
SELECT 
	COUNT(*) AS BookCount,
	MIN(Price) AS MinPrice,
	MAX(Price) AS MaxPrice,
	AVG(Price) AS AvgPrice
FROM Book;

--Task7--
SELECT
	Genre, 
	MIN(Price) AS MinPrice,
	MAX(Price) AS MaxPrice,
	COUNT(*) AS ProseCount
FROM Book
GROUP BY Genre;

