-- Import Data
.mode csv
.import -skip 1 RRS_Dataset/train.csv Train
.import -skip 1 RRS_Dataset/trainStatus.csv Train_Status
.import -skip 1 RRS_Dataset/passenger.csv Passenger
.import -skip 1 RRS_Dataset/booked.csv Booking


-- 1 -- Given a passenger's last name and first name and retrieve all trains they are booked on.
SELECT t.Train_Number, t.Train_Name, t.Source_Station, t.Destination_Station
FROM Train t
JOIN Booking b ON b.Train_Number = t.Train_Number
JOIN Passenger p ON p.SSN = b.Passenger_SSN
WHERE p.First_Name = "James" AND p.Last_Name = "Butt";


-- 2 -- Given a day list the passengers traveling on that day with confirmed tickets.
SELECT p.First_Name, p.Last_Name
FROM Passenger p
JOIN Booking b ON b.Passenger_SSN = p.SSN
JOIN Train t ON t.Train_Number = b.Train_Number
WHERE b.Status = 'Booked'
AND t.Available_Weekdays LIKE '%Sunday%';


-- 3 --	Display the train information (Train Number, Train Name, Source and Destination) and 
-- * -- passenger information (Name, Address, Category, ticket status) 
-- * -- of passengers who are between the ages of 50 to 60.
SELECT t.Train_Number, t.Train_Name, t.Source_Station, t.Destination_Station,
p.First_Name, p.Last_Name, p.Address, p.City, p.County, b.Ticket_Type, b.Status
FROM Train t
JOIN Passenger p ON p.SSN = b.Passenger_SSN
JOIN Booking b ON b.Train_Number = t.Train_Number
WHERE date() - p.Birthdate BETWEEN 50 AND 60;


-- 4* -- List train name, day and number of passenger on that train.
SELECT ts.Train_Name, ts.Train_Day, ts.Premium_Seats_Occupied AS Premium_Passengers,
ts.General_Seats_Occupied AS General_Passengers, (Premium_Seats_Occupied + General_Seats_Occupied) AS TOTAL_Passengers
FROM Train_Status ts
JOIN Passenger p ON p.SSN = b.Passenger_SSN
JOIN Booking b ON b.Train_Number = t.Train_Number
JOIN Train t ON t.Train_Name = ts.Train_Name
WHERE date() - p.Birthdate BETWEEN 50 AND 60;


-- 5* -- Enter a train name and retrieve all the passengers with confirmed status traveling on that train.
SELECT p.First_Name, p.Last_Name
FROM Passenger p
JOIN Booking b ON b.Passenger_SSN = p.SSN
JOIN Train t ON t.Train_Number = b.Train_Number
WHERE t.Train_Name = "Golden Arrow" AND b.Status = "Booked";


-- 6* -- List passengers that are waitlisted including the name of the train.
SELECT p.First_Name, p.Last_Name, t.Train_Name
FROM Passenger p
JOIN Booking b ON b.Passenger_SSN = p.SSN
JOIN Train t ON t.Train_Number = b.Train_Number
WHERE b.Status = "WaitList";


-- 7 -- List passenger names in descending order that have '605' phone area code.
SELECT First_Name, Last_Name
FROM Passenger
WHERE Phone LIKE '605%'
ORDER BY Last_Name DESC, First_Name DESC;


-- 8 -- List name of passengers that are traveling on Sunday in ascending order.
SELECT p.First_Name, p.Last_Name
FROM Passenger p
JOIN Booking b ON b.Passenger_SSN = p.SSN
JOIN Train t ON t.Train_Number = b.Train_Number
WHERE t.Available_Weekdays LIKE '%Sunday%'
ORDER BY p.Last_Name, p.First_Name;