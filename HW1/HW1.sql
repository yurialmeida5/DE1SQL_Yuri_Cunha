-- Please Extract the "BookShop_Data.zip" file to the folder "DE1SQL_Yuri_Cunha/HW1" and change the import location accordingly

-- Create BookStore DataBase
CREATE SCHEMA db_bookshop;

-- Use the BookStore DataBase
USE db_bookshop;

-- Set Global Local_Infile ON - Import table from local Folders
SET GLOBAL local_infile = ON;

-- Create tblBooks Table
CREATE TABLE  db_bookshop.tblBooks
(ID INTEGER NOT NULL,
BookID VARCHAR(15),
Title VARCHAR(255),
AuthID VARCHAR(15),
PRIMARY KEY(id));

-- Import Data to tblBooks Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblBooks.csv'
INTO TABLE db_bookshop.tblBooks
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, BookID, Title, AuthId);

-- Check Imported Data
SELECT * FROM db_bookshop.tblBooks;

-- Create tblAuthors 
CREATE TABLE  db_bookshop.tblAuthors
(ID INTEGER NOT NULL,
AuthID VARCHAR(15),
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Birthday varchar(50),
Residence_Country VARCHAR(50),
WritingHrs double,
PRIMARY KEY(id));

-- Import Data to tblAuthors Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblAuthors.csv'
INTO TABLE db_bookshop.tblAuthors
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, AuthID, First_Name, Last_Name, Birthday, Residence_Country, WritingHrs);

-- Check Imported Data
SELECT * FROM db_bookshop.tblAuthors;


-- Create BookInfo 
CREATE TABLE  db_bookshop.tblBookInfo
(ID INTEGER NOT NULL,
BookID VARCHAR(15),
Genre VARCHAR(50),
SeriesID varchar(15),
Volume_Number VARCHAR(10),
Staff_Comment VARCHAR(1000),
PRIMARY KEY(id));

-- Import Data to tblBookInfo Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblBookInfo.csv'
INTO TABLE db_bookshop.tblBookInfo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, BookID1, BookID2, Genre, SeriesID, Volume_Number, Staff_Comment);

-- Check Imported Data
SELECT * FROM db_bookshop.tblBookInfo;

-- Create tblCheckouts 
CREATE TABLE  db_bookshop.tblCheckouts
(ID INTEGER NOT NULL,
BookID VARCHAR(15),
CheckOutMonth VARCHAR(2),
CheckOutNumbers integer,
PRIMARY KEY(id));

-- Import Data to tblCheckouts Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblCheckouts.csv'
INTO TABLE db_bookshop.tblCheckouts
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, BookID, CheckOutMonth, CheckOutNumbers);

-- Check Imported Data
SELECT * FROM db_bookshop.tblCheckouts;

-- Create tblEdition
CREATE TABLE  db_bookshop.tblEdition
(ID INTEGER NOT NULL,
ISBN VARCHAR(20),
BookID VARCHAR(10),
BookFormat varchar(50),
PublisherID varchar(10),
PublicationDate varchar(15),
Pages integer,
PrintRunSize integer,
Price double,
PRIMARY KEY(id));

-- Import Data to tblEdition Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblEdition.csv'
INTO TABLE db_bookshop.tblEdition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, ISBN, BookID, BookFormat, PublisherID, PublicationDate, Pages, PrintRunSize,Price);

-- Check Imported Data
SELECT * FROM db_bookshop.tblEdition;

-- Create tblPublisher
CREATE TABLE  db_bookshop.tblPublisher
(ID INTEGER NOT NULL,
PublisherID VARCHAR(20),
PublishinHouse VARCHAR(50),
City varchar(50),
State varchar(50),
Country varchar(50),
EstablishYear integer,
MarketingInvestment double,
PRIMARY KEY(id));

-- Import Data to tblPublisher Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblPublisher.csv'
INTO TABLE db_bookshop.tblPublisher
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,PublisherID,PublishinHouse,City,State,Country,EstablishYear,MarketingInvestment);

-- Check Imported Data
SELECT * FROM db_bookshop.tblPublisher;

-- Create tblSales
CREATE TABLE  db_bookshop.tblSales
(ID INTEGER NOT NULL,
SalesDate VARCHAR(20),
ISBN VARCHAR(20),
Discount double,
ItemID varchar(20),
OrderID varchar(20),
PRIMARY KEY(id));

-- Import Data to tblSales Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW1/tblSales.csv'
INTO TABLE db_bookshop.tblSales
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ID,SalesDate,ISBN,Discount,ItemID,OrderID);

-- Check Imported Data
SELECT * FROM db_bookshop.tblSales





































 



