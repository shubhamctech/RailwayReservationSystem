CREATE TABLE Train (
    Train_Number INTEGER PRIMARY KEY,
    Train_Name CHAR(32) UNIQUE NOT NULL,
    Premium_Fair DECIMAL(4,2) NOT NULL,
    General_Fair DECIMAL(4,2) NOT NULL,
    Source_Station VARCHAR NOT NULL,
    Destination_Station VARCHAR NOT NULL,
    Available_Weekdays VARCHAR NOT NULL
);

CREATE TABLE Train_Status (
    Train_Day VARCHAR NOT NULL,
    Train_Name CHAR(32) UNIQUE NOT NULL,
    Premium_Seats_Available INTEGER NOT NULL,
    General_Seats_Available INTEGER NOT NULL,
    Premium_Seats_Occupied INTEGER NOT NULL,
    General_Seats_Occupied INTEGER NOT NULL,
    FOREIGN KEY (Train_Name) REFERENCES Train(Train_Name)
);

CREATE TABLE Passenger (
    First_Name VARCHAR NOT NULL,
    Last_Name VARCHAR NOT NULL,
    Address VARCHAR NOT NULL,
    City VARCHAR NOT NULL,
    County VARCHAR NOT NULL,
    Phone VARCHAR NOT NULL,
    SSN INTEGER PRIMARY KEY,
    Birthdate DATE NOT NULL
);

CREATE TABLE Booking (
    Passenger_SSN INTEGER NOT NULL,
    Train_Number INTEGER NOT NULL,
    Ticket_Type CHAR(8) CHECK(Ticket_Type IN ('Premium', 'General')) NOT NULL,
    Status CHAR(32) CHECK(Status IN ('Booked', 'WaitList')) NOT NULL,
    FOREIGN KEY (Passenger_SSN) REFERENCES Passenger(SSN),
    FOREIGN KEY (Train_Number) REFERENCES Train(Train_Number)
);