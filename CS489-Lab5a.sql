CREATE SCHEMA DentalSurgerySystem;
use DentalSurgerySystem;
-- Create Dentist table
CREATE TABLE Dentist (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactPhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    Specialization VARCHAR(100)
);

-- Create Patient table
CREATE TABLE Patient (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactPhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    MailingAddress VARCHAR(255),
    DateOfBirth DATE
);

-- Create Appointment table
CREATE TABLE Appointment (
    ID INT PRIMARY KEY,
    DateAndTime DATETIME,
    DentistID INT,
    PatientID INT,
    SurgeryLocationID INT,
    FOREIGN KEY (DentistID) REFERENCES Dentist(ID),
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (SurgeryLocationID) REFERENCES SurgeryLocation(ID)
);

-- Create SurgeryLocation table
CREATE TABLE SurgeryLocation (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    TelephoneNumber VARCHAR(20)
);

-- Insert data into Dentist table
INSERT INTO DentalSurgerySystem.Dentist (ID, FirstName, LastName, ContactPhoneNumber, Email, Specialization) 
VALUES 
(1, 'John', 'Smith', '123-456-7890', 'john.smith@example.com', 'General Dentistry'),
(2, 'Jane', 'Doe', '987-654-3210', 'jane.doe@example.com', 'Orthodontics');

-- Insert data into Patient table
INSERT INTO DentalSurgerySystem.Patient (ID, FirstName, LastName, ContactPhoneNumber, Email, MailingAddress, DateOfBirth) 
VALUES 
(1, 'Michael', 'Johnson', '555-123-4567', 'michael.johnson@example.com', '123 Main St, Anytown, USA', '1985-05-15'),
(2, 'Emily', 'Brown', '555-987-6543', 'emily.brown@example.com', '456 Elm St, Anycity, USA', '1990-10-20');

-- Insert data into SurgeryLocation table
INSERT INTO DentalSurgerySystem.SurgeryLocation (ID, Name, Address, TelephoneNumber) 
VALUES 
(1, 'Main Clinic', '789 Oak St, Anytown, USA', '555-789-1234'),
(2, 'Downtown Clinic', '321 Maple St, Anycity, USA', '555-456-7890');

-- Insert data into Appointment table
INSERT INTO DentalSurgerySystem.Appointment (ID, DateAndTime, DentistID, PatientID, SurgeryLocationID) 
VALUES 
(1, '2024-04-15 10:00:00', 1, 1, 1),
(2, '2024-04-20 13:30:00', 2, 2, 2);


commit;

SELECT * FROM Dentist ORDER BY LastName ASC;

SELECT Appointment.*, Patient.FirstName AS PatientFirstName, Patient.LastName AS PatientLastName
FROM Appointment
INNER JOIN Patient ON Appointment.PatientID = Patient.ID
WHERE Appointment.DentistID = 1;

SELECT Appointment.*, SurgeryLocation.Name AS SurgeryLocationName
FROM Appointment
INNER JOIN SurgeryLocation ON Appointment.SurgeryLocationID = SurgeryLocation.ID;


SELECT Appointment.*
FROM Appointment
INNER JOIN Patient ON Appointment.PatientID = Patient.ID
WHERE Patient.ID = 1 AND DATE(Appointment.DateAndTime) = '2024-04-15';
