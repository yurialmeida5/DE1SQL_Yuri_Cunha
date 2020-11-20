DELIMITER $$

CREATE PROCEDURE sp_TOP10BooksbyGender(
	IN vGenre VARCHAR(50)
)
BEGIN

-- TOP10 Checkout Books by Gender
SELECT 
	   tblBooks.Title,
       tblBooks.Genre, 
       CONCAT(tblauthors.First_Name, " ", tblauthors.Last_Name) as "Authors_Name",
       SUM(tblcheckouts.CheckOutNumbers) as Total_Rents
FROM tblBooks 
INNER JOIN tblauthors on tblBooks.AuthID = tblAuthors.AuthID 
LEFT JOIN tblEdition on tblBooks.BookID = tblEdition.BookID
LEFT JOIN tblcheckouts on tblEdition.ISBN =  tblcheckouts.ISBN
WHERE tblBooks.Genre = vGenre
GROUP BY tblBooks.Title
ORDER by Total_Rents DESC;

END$$

DELIMITER ;

-------------------------------------------------------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE sp_CheckoutsbyPH(
	IN vPublishing_House VARCHAR(50)
)
BEGIN
	-- QtdCheckout Books by PH and Month 
SELECT 
	   tblpublisher.Publishing_House,
       tblcheckouts.CheckOutMonth,
       SUM(tblcheckouts.CheckOutNumbers) as Total_Rents,
       sum(tblcheckouts.CheckOutNumbers*tblEdition.Price) as "Possibly_Market_Loss_USD"
FROM  tblpublisher
INNER JOIN tblEdition on tblpublisher.PublisherID = tblEdition.PublisherID
INNER JOIN tblcheckouts on tblEdition.ISBN =  tblcheckouts.ISBN
WHERE tblpublisher.Publishing_House = vPublishing_House
GROUP BY tblpublisher.Publishing_House,tblcheckouts.CheckOutMonth
ORDER by tblcheckouts.CheckOutMonth ASC;

END$$

DELIMITER ;

-----------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE sp_BookswithDiscount(
	IN vMonth Integer
)
BEGIN

-- BOOKS WITH DISCOUNT ON THE MONTH - Author's Birthday Month
SELECT 
	   CONCAT(tblauthors.First_Name, " ", tblauthors.Last_Name) as "Authors_Name",
       tblBooks.Title,
       tblBooks.Genre, 
       tblEdition.BookFormat,
       tblEdition.PublicationDate,
       tblEdition.Price as 'Original_Price_USD',
       (0.85 *  tblEdition.Price) as 'Discount_Price_USD'
FROM tblauthors 
INNER JOIN tblBooks on tblAuthors.AuthID = tblBooks.AuthID  
INNER JOIN tblEdition on tblBooks.BookID = tblEdition.BookID
WHERE tblauthors.AuthID in (SELECT AuthID
FROM tblauthors
WHERE fun_ExtractMonth(tblauthors.Birthday) = vMonth)
ORDER by Authors_Name DESC;

END$$

DELIMITER ;





