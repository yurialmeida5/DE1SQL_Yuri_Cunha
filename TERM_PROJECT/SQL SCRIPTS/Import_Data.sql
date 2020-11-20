
-- IMPORTANT BEFORE RUNNING THE FOLLOWING PROCCEDURE MAKE SURE THAT THE VARIABLE secure_file_priv = "" 
-- I honestly tried to create a stored procedure here to load each specific table based on a variable, 
-- However, Load Data is not allowed in stored proccedures (Error 1314)

-- Check if the schema already exists;
 DROP SCHEMA IF EXISTS db_bookshop;
 CREATE SCHEMA db_bookshop; 

-- Create tblAuthors 
DROP TABLE IF EXISTS db_bookshop.tblAuthors;
CREATE TABLE  db_bookshop.tblAuthors
(AuthID VARCHAR(15) NOT NULL,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Birthday VARCHAR(50),
Residence_Country VARCHAR(50),
PRIMARY KEY(AuthID));

-- Import Data to tblAuthors Table
LOAD DATA INFILE 'D:/CEU/DE1SQL_Yuri_Cunha/TERM_PROJECT/DATA/tblAuthors.csv'
INTO TABLE db_bookshop.tblAuthors
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(AuthID, First_Name, Last_Name, Birthday, Residence_Country);

-- Create BookInfo 
DROP TABLE IF EXISTS db_bookshop.tblBooks;
CREATE TABLE  db_bookshop.tblBooks
(BookID VARCHAR(15) NOT NULL,
Title VARCHAR(255),
AuthID VARCHAR(15),
Genre VARCHAR(50),
Volume_Number VARCHAR(10),
Staff_Comment VARCHAR(1000),
PRIMARY KEY(BookID));

-- Import Data to tblBookInfo Table
LOAD DATA INFILE 'D:/CEU/DE1SQL_Yuri_Cunha/TERM_PROJECT/DATA/tblBooks.csv'
INTO TABLE db_bookshop.tblBooks
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(BookID, Title, AuthID, Genre, Volume_Number, Staff_Comment);

-- Create tblCheckouts 
DROP TABLE IF EXISTS db_bookshop.tblCheckouts;
CREATE TABLE  db_bookshop.tblCheckouts
(Checkout_ID INTEGER NOT NULL,
ISBN VARCHAR(20),
CheckOutMonth integer,
CheckOutNumbers integer,
PRIMARY KEY(Checkout_Id));

-- Import Data to tblCheckouts Table
LOAD DATA INFILE 'D:/CEU/DE1SQL_Yuri_Cunha/TERM_PROJECT/DATA/tblCheckouts.csv'
INTO TABLE db_bookshop.tblCheckouts
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Checkout_ID, ISBN, CheckOutMonth, CheckOutNumbers);

-- Create tblEdition
DROP TABLE IF EXISTS db_bookshop.tblEdition;
CREATE TABLE  db_bookshop.tblEdition
(ISBN VARCHAR(20) NOT NULL,
BookID VARCHAR(10),
BookFormat varchar(50),
PublisherID varchar(10),
PublicationDate varchar(15),
Pages integer,
PrintRunSize integer,
Price integer,
PRIMARY KEY(ISBN));

-- Import Data to tblEdition Table
LOAD DATA INFILE 'D:/CEU/DE1SQL_Yuri_Cunha/TERM_PROJECT/DATA/tblEdition.csv'
INTO TABLE db_bookshop.tblEdition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ISBN, BookID, BookFormat, PublisherID, PublicationDate, Pages, PrintRunSize, Price);

-- Create tblPublisher
DROP TABLE IF EXISTS db_bookshop.tblPublisher;
CREATE TABLE  db_bookshop.tblPublisher
(PublisherID VARCHAR(20) NOT NULL,
Publishing_House VARCHAR(50),
City varchar(50),
State varchar(50),
Country varchar(50),
EstablishYear integer,
MarketingInvestment integer,
PRIMARY KEY(PublisherID));

-- Import Data to tblPublisher Table
LOAD DATA INFILE 'D:/CEU/DE1SQL_Yuri_Cunha/TERM_PROJECT/DATA/tblPublisher.csv'
INTO TABLE db_bookshop.tblPublisher
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PublisherID,Publishing_House,City,State,Country,EstablishYear,MarketingInvestment);

-- Create tblSales
DROP TABLE IF EXISTS db_bookshop.tblSales;
CREATE TABLE  db_bookshop.tblSales
(Sales_ID INTEGER NOT NULL,
SalesDate VARCHAR(20),
ISBN VARCHAR(20),
OrderID varchar(20),
PRIMARY KEY(Sales_ID));

-- Import Data to tblSales Table
LOAD DATA INFILE 'D:/CEU/DE1SQL_Yuri_Cunha/TERM_PROJECT/DATA/tblSales.csv'
INTO TABLE db_bookshop.tblSales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Sales_ID,SalesDate,ISBN,OrderID);

