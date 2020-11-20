Use birdstrikes;

-- Exercise 1 - What state figures in the 145th line of our database?
-- Answer: Tennessee
SELECT state FROM birdstrikes Limit 144,1;
-- Rows are default organized by ID, considering that we also may use the following
SELECT row_number() OVER(order by id) as 'rownum', state From birdstrikes;
-- WHERE rownum = 145;

-- Exercise 2 - What is flight_date of the latest birdstrike in this database?
-- Answer: 2000-04-18
SELECT max(flight_date) as 'Date of the Lastest BirdStrike' FROM birdstrikes;

-- Exercise 3 - What was the cost of the 50th most expensive damage?
-- Answer: 6014
Select Distinct (cost) FROM birdstrikes ORDER BY cost DESC Limit 49,1;

-- Exercise 4 - What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
-- Answer: Colorado
Select state from birdstrikes 
Where state != '' and bird_size != '' Limit 1,1;

SELECT state ,row_number() OVER(order by id) as 'rownum' From birdstrikes
Where state != '' and bird_size != ''; -- and rownum = 2;

-- Exercise 5 - How many days elapsed between the current date and the flights happening in week 52, for incidents from Colorado? 
-- Answer: 7584

-- As it's only one flight we can use the following instruction to give a direct answer
Select datediff(now(),flight_date) As 'Flights_Colorado_Week_52' FROM birdstrikes 
WHERE state = 'Colorado' and weekofyear(flight_date) = 52;

-- However, if there were more than 1 flight, the total sum of elapsed days would be
Select Sum(datediff(now(),flight_date)) As 'Flights_Colorado_Week_52' FROM birdstrikes
where state = 'Colorado' and weekofyear(flight_date) = 52
group by flight_date;


