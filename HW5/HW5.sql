Use classicmodels;

-- Exercise 5 - Continue the last script: complete the US local phones to international using the city code. Hint: for this you need to find a data source with domestic prefixes mapped to cities, import as a table to the database and add new business logic to the procedure.

SELECT * FROM customers WHERE Country = 'USA';
SELECT count(*) FROM customers WHERE Country = 'USA';
SELECT city FROM customers WHERE Country = 'USA';
SELECT Count(Distinct city) FROM customers WHERE Country = 'USA';
SELECT Distinct city  FROM customers WHERE Country = 'USA';

-- Import the table with phone codes
CREATE TABLE USPhoneCodes (
city varchar(50),
AreaCode varchar(5));

SET GLOBAL local_infile = ON;

-- Import Data to tblBooks Table
LOAD DATA LOCAL INFILE '/Users/yuri/Desktop/CEU/DE1SQL_Yuri_Cunha/HW5/HW5.csv'
INTO TABLE USPhoneCodes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(city,AreaCode);

-- Check Data Import
SELECT * FROM USPhoneCodes;
SELECT * FROM customers;

-- Joined Table
(SELECT Customers.customerNumber,
		Customers.customerName, 
        Customers.contactLastName, 
        Customers.contactFirstName, 
        Customers.phone,
        Customers.addressLine1, 
        Customers.addressLine2,
        Customers.city,
        Customers.state,
        Customers.postalCode,
        Customers.country,
        Customers.salesRepEmployeeNumber, 
        Customers.creditLimit,
        USPhoneCodes.AreaCode FROM Customers
INNER JOIN USPhoneCodes
ON Customers.city = USPhoneCodes.city);


-- create a copy of the customer table 
	DROP TABLE IF EXISTS classicmodels.USfixed_customers;
	CREATE TABLE classicmodels.USfixed_customers(
    ID int NOT NULL AUTO_INCREMENT,
    customerNumber int NOT NULL,
	customerName varchar(50) NOT NULL,
    contactLastName varchar(50) NOT NULL,
    contactFirstName varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressLine1 varchar(50) NOT NULL,
    addressLine2 varchar(50) DEFAULT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) DEFAULT NULL,
    postalCode varchar(15) DEFAULT NULL,
    country varchar(50) NOT NULL,
    salesRepEmployeeNumber int DEFAULT NULL,
    creditLimit decimal(10,2) DEFAULT NULL,
    AreaCode varchar(5) DEFAULT NULL,
    PRIMARY KEY (ID));
	INSERT USfixed_customers (
    SELECT 
		NULL,
        Customers.customerNumber,
		Customers.customerName, 
        Customers.contactLastName, 
        Customers.contactFirstName, 
        Customers.phone,
        Customers.addressLine1, 
        Customers.addressLine2,
        Customers.city,
        Customers.state,
        Customers.postalCode,
        Customers.country,
        Customers.salesRepEmployeeNumber, 
        Customers.creditLimit,
        USPhoneCodes.AreaCode FROM Customers
INNER JOIN USPhoneCodes
ON Customers.city = USPhoneCodes.city);



DROP PROCEDURE IF EXISTS USfixed_customers;

DELIMITER $$
CREATE PROCEDURE USfixed_customers()
BEGIN
	DECLARE counter INT;
    DECLARE Seven_Digit varchar(7);
    DECLARE Three_Digit varchar(3);
	DECLARE TotalRows int;
    SET counter = 0;
   
   -- Create the fixed table 
    DROP TABLE IF EXISTS classicmodels.USfixed_customers;
	CREATE TABLE classicmodels.USfixed_customers(
    ID int NOT NULL AUTO_INCREMENT,
    customerNumber int NOT NULL,
	customerName varchar(50) NOT NULL,
    contactLastName varchar(50) NOT NULL,
    contactFirstName varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressLine1 varchar(50) NOT NULL,
    addressLine2 varchar(50) DEFAULT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) DEFAULT NULL,
    postalCode varchar(15) DEFAULT NULL,
    country varchar(50) NOT NULL,
    salesRepEmployeeNumber int DEFAULT NULL,
    creditLimit decimal(10,2) DEFAULT NULL,
    AreaCode varchar(50) DEFAULT NULL,
    PRIMARY KEY (ID));
	INSERT USfixed_customers (
    SELECT 
		NULL,
        Customers.customerNumber,
		Customers.customerName, 
        Customers.contactLastName, 
        Customers.contactFirstName, 
        Customers.phone,
        Customers.addressLine1, 
        Customers.addressLine2,
        Customers.city,
        Customers.state,
        Customers.postalCode,
        Customers.country,
        Customers.salesRepEmployeeNumber, 
        Customers.creditLimit,
        USPhoneCodes.AreaCode FROM Customers
INNER JOIN USPhoneCodes
ON Customers.city = USPhoneCodes.city);
	
    SET TotalRows = (SELECT COUNT(*) FROM USfixed_customers);
    
    myloop: LOOP 
		
        SET  counter = counter + 1;
		SET Seven_Digit = (SELECT RIGHT(phone,7) FROM USfixed_customers WHERE ID = Counter);
		SET Three_Digit = (SELECT AreaCode FROM USfixed_customers WHERE ID = Counter);
        
        UPDATE USfixed_customers
        SET phone = CONCAT('+1-',Three_Digit,'-',Seven_Digit)
        WHERE ID = Counter;
        
        IF (counter = TotalRows) THEN
			LEAVE myloop;
         	END  IF;
         
	END LOOP myloop;
END$$

DELIMITER ;

-- Call Store Proccedure
CALL USfixed_customers();

-- Check the Store Proccedure Results
SELECT * FROM USfixed_customers;

