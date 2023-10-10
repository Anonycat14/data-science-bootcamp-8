
-- Common Where Clause --
SELECT * FROM customers
WHERE country = 'USA';

SELECT * FROM customers
WHERE country = 'USA' AND state = 'CA';

SELECT * FROM customers
WHERE country = 'USA' OR country = 'United Kingdom';

SELECT * FROM customers
WHERE country IN ('USA', 'United Kingdom');

SELECT * FROM customers
WHERE country NOT IN ('USA', 'United Kingdom');

SELECT * FROM customers
WHERE email LIKE '%@gmail.com';

SELECT * FROM customers
WHERE email NOT LIKE '%gmail.com';

SELECT * FROM customers
WHERE company IS NULL;

SELECT * FROM customers
WHERE company IS NOT NULL;

SELECT * FROM customers
WHERE customerid BETWEEN 10 AND 15;

            -- Filter Data ( AND OR NOT ) --

SELECT * FROM customers 
	WHERE country = 'Brazil' AND
		  State = 'SP';
SELECT * FROM Customers
	WHERE lower(Country) = 'brazil' OR
			  upper(Country) = 'CANADA';
SELECT * FROM Customers
WHERE NOT (Country = 'Brazil' OR
			Country = ' Canada');
 
SELECT * FROM customers 
	WHERE upper(country)= 'BRAZIL' OR
		  lower(Country)= 'usa';
/*Note- use UPPER OR LOWER FUNCTION WHEN WE NOT SURE 
			IN DATABASE COUNTRY WRITE WITH CAPITAL OR Sentence Case */


            -- - **FILTER DATA (IN BETWEEN IS NULL) -- 

SELECT * FROM customers
	WHERE Country = 'Brazil' 
	or Country = 'USA'
	or Country =  'United Kingdom';
         *[(IN perator)
SELECT * FROM customers
	WHERE Country in ('Brazil', 'USA', 'United Kingdom');

SELECT * from customers 
	where CustomerId >=5 AND CustomerId <=10;
				*[(BETWEEN AND) SHORTER]
SELECT * from customers 
 where CustomerId BETWEEN 5 AND 10;
			*(BETWEEN AND With DATA TIME column)
SELECT InvoiceDate FROM invoices
 WHERE InvoiceDate BETWEEN '2009-02-20' AND '2010-02-20 20:00:00'
					(NULL)
SELECT * FROM customers
	WHERE Company IS NULL;

SELECT * FROM customers
	WHERE Company IS NOT NULL;

                -- PATTERN MATCHING [LIKE WILDCARDs ( `%` and `_` ) --

SELECT 
	FirstName, LastName, Email, Country
 from customers
	WHERE Email like '%@gmail.com' and country ='USA';

SELECT 
	FirstName, LastName, Email, Country
from customers
	WHERE email not like '%@gmail.com';

SELECT 
	FirstName, LastName, Email, Country, Phone
 from customers
	WHERE Phone like '%99%';

                  -- join table with WHERE clause, two tables --

SELECT
	artists.artistid,
  artists.name AS artist_name,
  albums.title AS album_name
FROM artists, albums
WHERE artists.artistid = albums.artistid -- PK = FK
  AND artists.artistid IN (8, 100, 120);

                -- join table with WHERE clause, three tables --

SELECT art.artistid,
				art.name,
        alb.title,
        tracks.Name,
        tracks.composer
from artists as art , albums as alb, tracks
WHERE art.ArtistId = alb.artistid
and alb.AlbumId = tracks.AlbumId
 and art.artistid in (4, 60 , 70, 100);

                -- AGGREGATE FUNCTIONS --

SELECT 
    	SUM(milliseconds) AS	SUM_MILL, 
   	 	MIN(milliseconds)		  MIN_MILL,
    	MAX(milliseconds) 		MAX_MILL,
      COUNT(milliseconds)   COUNT_MILL,
  ROUND(AVG(milliseconds),2) 	AVE_MILL
FROM tracks
