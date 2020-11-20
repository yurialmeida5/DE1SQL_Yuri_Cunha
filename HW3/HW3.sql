USE birdstrikes;

-- Exercise 1 - Do the same with speed. If speed is NULL or speed < 100 create a "LOW SPEED" category, otherwise, mark as "HIGH SPEED". Use IF instead of CASE!
-- Answer: 
SELECT aircraft, airline, speed,
If (speed is NUll, 'Low Speed', if(speed < 100, 'Low Speed', 'High Speed')) AS Speed_Category
FROM firstdb.birdstrikes
order by speed_category;

-- Exercise 2 - How many distinct 'aircraft' we have in the database?
-- Answer: 3
SELECT count(distinct(aircraft)) FROM birdstrikes;

-- If you don't consider blank as a valid aircraft value, the answer would be 2 and the statement would be the following
SELECT count(distinct(aircraft)) FROM birdstrikes
Where aircraft != '';

-- Exercise 3 - What was the lowest speed of aircrafts starting with 'H'
-- Answer: 9

SELECT min(speed) as LowestSpeed FROM birdstrikes
Group by aircraft
Having aircraft like 'H%';

Select speed from birdstrikes
Where aircraft like 'H%'
Order by Speed ASC Limit 1;

-- Exercise 4 - Which phase_of_flight has the least of incidents?
-- Answer: Taxi 
SELECT phase_of_flight, count(*) as Number_Accidents FROM birdstrikes
group by phase_of_flight
Order by Number_Accidents ASC Limit 1;

-- Exercise 5 - What is the rounded highest average cost by phase_of_flight?
-- Answer: 54673
Select round(avg(cost)) as Avarage_Cost From birdstrikes
group by phase_of_flight
Order by Avarage_Cost Desc Limit 1;

-- Exercise 6 - What the highest AVG speed of the states with names less than 5 characters?
-- Answer: 2862.5

Select avg(speed) as Avarage_Speed from birdstrikes
Group By state
Having length(state) < 5
Order by Avarage_Speed Desc Limit 1;

Select avg(speed) as Avarage_Speed from birdstrikes
Where length(state) < 5
Group By state
Order by Avarage_Speed Desc Limit 1;





