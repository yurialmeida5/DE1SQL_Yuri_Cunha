USE db_bookshop;

-- TOP 10 MORE PROFITABLE WRITERS
CREATE VIEW vw_TOP10_Writers
AS
SELECT CONCAT(tblauthors.First_Name, " ", tblauthors.Last_Name) as "Authors_Name",
	   COUNT(tblSales.Sales_ID) as "Number_of_Sales",
       SUM(tblEdition.Price) as "Total_Value_USD",
       ROUND(SUM(tblEdition.Price) /COUNT(tblSales.Sales_ID),2) as "Av_Earn_Per_Book"
FROM tblAuthors
LEFT JOIN tblBooks on tblAuthors.AuthID = tblBooks.AuthID
LEFT JOIN tblEdition on tblBooks.BookID = tblEdition.BookID
LEFT JOIN tblSales on tblEdition.ISBN = tblSales.ISBN
GROUP BY Authors_Name 
HAVING Number_of_Sales > 0 
ORDER by Total_Value_USD DESC LIMIT 10; 

-- SALES BY GENRE
CREATE VIEW vw_SalesbyGenre AS
SELECT tblBooks.Genre,
	   COUNT(tblSales.Sales_ID) as "Number_of_Sales",
       SUM(tblEdition.Price) as "Total_Value_USD",
       ROUND(SUM(tblEdition.Price) /COUNT(tblSales.Sales_ID),2) as "Av_Earn_Per_Genre"
FROM tblBooks
LEFT JOIN tblEdition on tblBooks.BookID = tblEdition.BookID
LEFT JOIN tblSales on tblEdition.ISBN = tblSales.ISBN
GROUP BY  tblBooks.Genre
ORDER by Total_Value_USD DESC; 

-- WRITERS THAT DIDN'T SELL MORE THAN 100 COPIES YEAR AND THEIR BOOKS
CREATE VIEW vw_NonProductive_Writers AS
SELECT CONCAT(tblauthors.First_Name, " ", tblauthors.Last_Name) as "Authors_Name",
	   tblAuthors.Residence_Country,
       IFNULL(tblBooks.Title,'No Books Written') as 'Title',
       IFNULL(tblBooks.Genre,'No Books Written') as 'Genre',
       IFNULL(tblBooks.Staff_Comment,'No Books Written') as 'Staff_Comment'   
FROM tblAuthors
LEFT JOIN tblBooks on tblAuthors.AuthID = tblBooks.AuthID
LEFT JOIN tblEdition on tblBooks.BookID = tblEdition.BookID
LEFT JOIN tblSales on tblEdition.ISBN = tblSales.ISBN
GROUP BY Authors_Name 
HAVING COUNT(tblSales.Sales_ID) < 100;

-- Profitabily by Publishing_Houses
CREATE VIEW vw_Profitability_PH AS
SELECT Publishing_House, MarketingInvestment,
	   COUNT(tblSales.Sales_ID) as "Number_of_Sales",
       SUM(tblEdition.Price) as "Total_Value_USD",
       round((SUM(tblEdition.Price)/MarketingInvestment)*100,2) as "Marketing_Efficiency_Percentage"
FROM tblpublisher
INNER JOIN tblEdition on tblpublisher.PublisherID = tblEdition.PublisherID
INNER JOIN tblSales on tblEdition.ISBN = tblSales.ISBN
GROUP BY Publishing_House
ORDER BY Marketing_Efficiency_Percentage DESC;

-- CHECKOUTS by Gender
CREATE VIEW vw_CheckoutsbyGender AS
SELECT 
	   tblBooks.Genre,
       SUM(tblcheckouts.CheckOutNumbers) as "Total_Rents",
       sum(tblcheckouts.CheckOutNumbers*tblEdition.Price) as "Possibly_Market_Loss_USD"
FROM tblBooks
LEFT JOIN tblEdition on tblBooks.BookID = tblEdition.BookID
LEFT JOIN tblcheckouts on tblEdition.ISBN =  tblcheckouts.ISBN
GROUP BY  tblBooks.Genre
ORDER by  Total_Rents DESC; 






