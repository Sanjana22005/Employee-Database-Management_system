create database employeeDB;
use employeeDB;


-- 1. Admin Table
CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    Email VARCHAR(100) NOT NULL UNIQUE,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('SuperAdmin', 'HR', 'Manager')),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Departments Table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- 3. EmpDetails (Employee Details) Table
CREATE TABLE EmpDetails (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
    DateOfBirth DATE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    JobTitle VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE NOT NULL,
    Status VARCHAR(10) DEFAULT 'Active' CHECK (Status IN ('Active', 'Inactive')),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- 4. EmpEducation (Employee Education) Table
CREATE TABLE EmpEducation (
    EducationID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    SSC_Board VARCHAR(100) NOT NULL,
    SSC_YearOfPassing YEAR NOT NULL,
    SSC_Percentage DECIMAL(5,2),
    HSC_Board VARCHAR(100),
    HSC_YearOfPassing YEAR,
    HSC_Percentage DECIMAL(5,2),
    UG_Course VARCHAR(100),
    UG_University VARCHAR(100),
    UG_YearOfPassing YEAR,
    UG_Percentage DECIMAL(5,2),
    PG_Course VARCHAR(100),
    PG_University VARCHAR(100),
    PG_YearOfPassing YEAR,
    PG_Percentage DECIMAL(5,2),
    FOREIGN KEY (EmployeeID) REFERENCES EmpDetails(EmployeeID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 5. Experience Table
CREATE TABLE Experience (
    ExperienceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    CompanyName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Description TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES EmpDetails(EmployeeID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- 6. Projects Table
CREATE TABLE Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE
);


-- 7. EmployeeProjects (Many-to-Many Relationship) Table
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    AssignedDate DATETIME DEFAULT NOW(),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES EmpDetails(EmployeeID) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- 8. Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,	
    EmployeeID INT,
    Date DATE NOT NULL,
    Status VARCHAR(10) NOT NULL CHECK (Status IN ('Present', 'Absent', 'Leave')),
    FOREIGN KEY (EmployeeID) REFERENCES EmpDetails(EmployeeID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Insert into Admin Table
INSERT INTO Admin (Username, Password, FullName, Email, Role) VALUES
('superadmin_kate', 'superpass321', 'Kate Winslet', 'kate.super@example.com', 'SuperAdmin'),
('hr_josh', 'hrkey998', 'Josh Turner', 'josh.hr@example.com', 'HR'),
('manager_ron', 'ronpass007', 'Ron Watson', 'ron.manager@example.com', 'Manager'),
('admin_lisa', 'lisaadmin@2024', 'Lisa Ray', 'lisa.admin@example.com', 'SuperAdmin'),
('hr_emma', 'emmaHR456', 'Emma Stone', 'emma.hr@example.com', 'HR'),
('mgr_chris', 'chrisMgmt$', 'Chris Evans', 'chris.manager@example.com', 'Manager');

-- Insert into Departments Table
INSERT INTO Departments (DepartmentName) VALUES
('Human Resources'),
('Engineering'),
('Finance'),
('Accounting'),
('Marketing'),
('Sales'),
('Customer Support');

-- Insert into EmpDetails Table
INSERT INTO EmpDetails 
(FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, City, State, ZipCode, JobTitle, DepartmentID, Salary, HireDate, Status) 
VALUES
('Michael', 'Johnson', 'Male', '1990-05-15', 'michael.j@example.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'Software Engineer', 2, 75000.00, '2022-06-01', 'Active'),
('Sarah', 'Williams', 'Female', '1992-08-22', 'sarah.w@example.com', '0987654321', '456 Oak St', 'San Francisco', 'CA', '94105', 'HR Specialist', 1, 60000.00, '2023-01-15', 'Active'),
('David', 'Miller', 'Male', '1985-11-10', 'david.m@example.com', '1122334455', '789 Pine St', 'Chicago', 'IL', '60611', 'Accountant', 3, 65000.00, '2021-03-20', 'Active'),
('Sarah', 'Joe', 'Female', '1990-08-22', 'sarah@example.com', '1287654321', '456 Oak St', 'San Francisco', 'CA', '94105', 'HR Specialist', 1, 90000.00, '2023-01-15', 'Active'),
('Keifer', 'Watson', 'Male', '2000-10-24', 'keiferwat@example.com', '2147895632', '25 Mud St', 'Manila', 'PH', '10023', 'Engineer', 6, 80000.00, '2025-02-12', 'Active'),
('Jasper', 'Jean', 'Female', '1996-11-14', 'jasperjeanmariano@example.com', '2147820362', '14 Gun St', 'Sydney', 'AUS', '2000', 'Engineer', 2, 90000.00, '2022-02-28', 'Active'),
('Denzel', 'Mariano', 'Male', '2001-10-24', 'denzel@example.com', '2178195632', '25 Mud St', 'Manila', 'PH', '10523', 'Sales Person', 6, 30000.00, '2025-02-22', 'Active'),
('Ci-N', 'Peralta', 'Male', '1995-10-24', 'peralta@example.com', '2147895632', '12 Rocket St', 'Cape Town', 'AFR', '15623', 'Marketing Person', 5, 60000.00, '2015-08-22', 'Inactive'),
('Felix', 'Collins', 'Male', '1994-06-18', 'collins@example.com', '3157895632', '39 Bun St', 'Cebu', 'PH', '23763', 'Engineer', 2, 70000.00, '2021-02-12', 'Inactive'),
('Benjamin', 'Tennison', 'Male', '2002-10-24', 'ben@example.com', '9547895632', '23 Revenue St', 'Chennai', 'CH', '12022', 'Accountant', 4, 20000.00, '2022-02-02', 'Active'),
('Alan', 'Walker', 'Male', '1995-10-24', 'alan@example.com', '9547892841', '23 Chilli St', 'Hyderabad', 'HY', '23579', 'Customer Support', 7, 40000.00, '2021-03-05', 'Inactive'),
('Liya', 'Mishra', 'Female', '2001-06-14', 'liya@example.com', '9876543210', '10 Park Lane', 'Mumbai', 'MH', '22561', 'HR Manager', 1, 35000.00, '2021-01-15', 'Active'),
('Ravi', 'Chandran', 'Male', '1999-03-10', 'ravi@example.com', '9123456789', '52 MG Road', 'Delhi', 'DL', '35871', 'Software Engineer', 2, 45000.00, '2020-07-01', 'Inactive'),
('Sneha', 'Menon', 'Female', '1998-11-05', 'sneha@example.com', '9988776655', '88 Garden Street', 'Bangalore', 'KA', '12459', 'Accountant', 4, 30000.00, '2019-09-12', 'Active'),
('Amit', 'Kumar', 'Male', '1997-12-25', 'amit@example.com', '9012345678', '99 Tech Zone', 'Hyderabad', 'TG', '56782', 'Customer Support', 7, 28000.00, '2022-05-21', 'Inactive'),
('Meera', 'Akash', 'Female', '2000-04-02', 'meera@example.com', '9090909090', '18 Palm Street', 'Chennai', 'CH', '12598', 'Marketing Person', 5, 18000.00, '2023-03-05', 'Inactive'),
('John', 'Jerome', 'Male', '1995-01-11', 'john@example.com', '9345678123', '27 North Ave', 'Kolkata', 'WB', '79586', 'Sales Executive', 6, 32000.00, '2018-06-30', 'Active'),
('Ayesha', 'Begum', 'Female', '2002-09-09', 'ayesha@example.com', '9678901234', '66 Rose St', 'Pune', 'MH', '45976', 'Sales Executive', 6, 40000.00, '2020-08-22', 'Active'),
('Arun', 'Kumar', 'Male', '2001-05-20', 'arun@example.com', '7894561230', '12 Green Way', 'Coimbatore', 'TN', '14569', 'Finance Officer', 3, 26000.00, '2021-11-10', 'Inactive'),
('Diya', 'Rema', 'Female', '1996-02-14', 'diya@example.com', '8765432190', '45 Blue Lane', 'Ahmedabad', 'GJ', '45211', 'Engineer', 2, 84000.00, '2019-04-17', 'Active'),
('Nathan', 'Drake', 'Male', '1988-07-16', 'nathan@example.com', '9871234567', '11 Jungle Rd', 'Los Angeles', 'CA', '90001', 'HR Specialist', 1, 100000.00, '2017-10-10', 'Active'),
('Elena', 'Fisher', 'Female', '1990-09-25', 'elena@example.com', '9877654321', '12 Ocean Ave', 'Los Angeles', 'CA', '90002', 'Sales Executive', 6, 95000.00, '2018-03-18', 'Active'),
('Liam', 'Bennett', 'Male', '1993-07-09', 'liam.bennett@example.com', '9123456781', '101 Elm St', 'Boston', 'MA', '02108', 'Engineer', 2, 82000.00, '2020-09-01', 'Inactive'),
('Emma', 'Robinson', 'Female', '1995-02-20', 'emma.robinson@example.com', '9123456782', '202 Maple Ave', 'Seattle', 'WA', '98104', 'Engineer', 2, 70000.00, '2021-03-10', 'Active'),
('Noah', 'Harris', 'Male', '1991-03-18', 'noah.harris@example.com', '9123456783', '303 Cedar Rd', 'Austin', 'TX', '73301', 'Sales Executive', 6, 60000.00, '2022-05-05', 'Active'),
('Olivia', 'Wright', 'Female', '1994-09-11', 'olivia.wright@example.com', '9123456784', '404 Spruce St', 'Miami', 'FL', '73301', 'Business Analyst', 3, 75000.00, '2023-01-22', 'Active'),
('Lucas', 'Lee', 'Male', '1988-12-30', 'lucas.lee@example.com', '9123456787', '707 Redwood Ct', 'Phoenix', 'AZ', '85001', 'Account Executive', 3, 72000.00, '2021-08-18', 'Inactive'),
('Henry', 'Young', 'Male', '1993-04-10', 'henry.young@example.com', '9123456791', '1111 Cherry St', 'Atlanta', 'GA', '30301', 'Data Analyst', 3, 78000.00, '2020-10-12', 'Inactive'),
('Isabella', 'King', 'Female', '1990-12-06', 'isabelle@example.com', '9123456792', '1212 Poplar Ave', 'Charlotte', 'NC', '28202', 'UI Developer', 2, 73000.00, '2021-12-25', 'Active'),
('Mia', 'Scott', 'Female', '1992-05-07', 'mia.scott@example.com', '9123456788', '808 Fir Ave', 'San Diego', 'CA', '92101', 'Content Writer', 5, 55000.00, '2024-02-14', 'Active');


-- Insert into EmpEducation Table
INSERT INTO EmpEducation (
    EmployeeID, SSC_Board, SSC_YearOfPassing, SSC_Percentage, 
    HSC_Board, HSC_YearOfPassing, HSC_Percentage, 
    UG_Course, UG_University, UG_YearOfPassing, UG_Percentage, 
    PG_Course, PG_University, PG_YearOfPassing, PG_Percentage
) VALUES 
(1, 'CBSE', 2015, 88.5, 'State Board', 2017, 85.3, 'B.Tech', 'ABC University', 2021, 80.2, NULL, NULL, NULL, NULL),
(2, 'ICSE', 2014, 75.2, 'CBSE', 2016, 78.9, 'B.Sc', 'PQR University', 2020, 79.1, 'M.Sc', 'LMN University', 2022, 81.5),
(3, 'State Board', 2013, 67.8, 'State Board', 2015, 72.5, 'B.Com', 'DEF University', 2019, 76.0, NULL, NULL, NULL, NULL),
(4, 'CBSE', 2016, 92.1, 'CBSE', 2018, 89.5, 'BBA', 'XYZ University', 2022, 85.7, 'MBA', 'ABC University', 2024, 87.9),
(5, 'ICSE', 2012, 74.3, 'State Board', 2014, 76.8, 'BCA', 'LMN University', 2018, 80.4, NULL, NULL, NULL, NULL),
(6, 'State Board', 2011, 65.0, 'CBSE', 2013, 68.9, 'BA', 'DEF University', 2017, 70.5, 'MA', 'GHI University', 2019, 72.8),
(7, 'CBSE', 2015, 81.9, 'ICSE', 2017, 84.2, 'B.Tech', 'XYZ University', 2021, 82.3, NULL, NULL, NULL, NULL),
(8, 'ICSE', 2013, 79.4, 'CBSE', 2015, 83.7, 'B.Sc', 'PQR University', 2019, 77.2, 'M.Sc', 'LMN University', 2021, 79.8),
(9, 'State Board', 2010, 69.1, 'State Board', 2012, 71.3, 'B.Com', 'DEF University', 2016, 74.5, NULL, NULL, NULL, NULL),
(10, 'CBSE', 2017, 94.5, 'CBSE', 2019, 91.2, 'BBA', 'XYZ University', 2023, 88.5, 'MBA', 'ABC University', 2025, 90.7),
(11, 'ICSE', 2016, 78.5, 'State Board', 2018, 80.3, 'BCA', 'LMN University', 2022, 82.4, NULL, NULL, NULL, NULL),
(12, 'State Board', 2015, 64.9, 'CBSE', 2017, 67.8, 'BA', 'DEF University', 2021, 70.2, 'MA', 'GHI University', 2023, 72.6),
(13, 'CBSE', 2014, 88.2, 'ICSE', 2016, 90.1, 'B.Tech', 'XYZ University', 2020, 85.4, NULL, NULL, NULL, NULL),
(14, 'ICSE', 2013, 76.9, 'CBSE', 2015, 79.2, 'B.Sc', 'PQR University', 2019, 78.5, 'M.Sc', 'LMN University', 2021, 81.0),
(15, 'State Board', 2012, 70.1, 'State Board', 2014, 73.4, 'B.Com', 'DEF University', 2018, 76.8, NULL, NULL, NULL, NULL),
(16, 'CBSE', 2011, 91.5, 'CBSE', 2013, 89.6, 'BBA', 'XYZ University', 2017, 86.3, 'MBA', 'ABC University', 2019, 88.7),
(17, 'ICSE', 2010, 80.7, 'State Board', 2012, 82.5, 'BCA', 'LMN University', 2016, 83.9, NULL, NULL, NULL, NULL),
(18, 'State Board', 2009, 66.5, 'CBSE', 2011, 69.3, 'BA', 'DEF University', 2015, 72.1, 'MA', 'GHI University', 2017, 74.5),
(19, 'CBSE', 2015, 89.2, 'ICSE', 2017, 91.5, 'B.Tech', 'XYZ University', 2021, 87.0, NULL, NULL, NULL, NULL),
(20, 'ICSE', 2014, 77.3, 'CBSE', 2016, 80.2, 'B.Sc', 'PQR University', 2020, 79.5, 'M.Sc', 'LMN University', 2022, 82.1),
(21, 'State Board', 2013, 71.2, 'State Board', 2015, 74.8, 'B.Com', 'DEF University', 2019, 77.4, NULL, NULL, NULL, NULL),
(22, 'CBSE', 2012, 92.3, 'CBSE', 2014, 90.7, 'BBA', 'XYZ University', 2018, 87.5, 'MBA', 'ABC University', 2020, 89.8),
(23, 'ICSE', 2011, 81.6, 'State Board', 2013, 83.7, 'BCA', 'LMN University', 2017, 84.2, NULL, NULL, NULL, NULL),
(24, 'State Board', 2010, 67.3, 'CBSE', 2012, 70.1, 'BA', 'DEF University', 2016, 73.0, 'MA', 'GHI University', 2018, 75.4),
(25, 'CBSE', 2009, 90.2, 'ICSE', 2011, 92.5, 'B.Tech', 'XYZ University', 2015, 88.3, NULL, NULL, NULL, NULL),
(26, 'ICSE', 2008, 78.1, 'CBSE', 2010, 81.4, 'B.Sc', 'PQR University', 2014, 80.2, 'M.Sc', 'LMN University', 2016, 82.7),
(27, 'State Board', 2007, 72.0, 'State Board', 2009, 75.6, 'B.Com', 'DEF University', 2013, 78.0, NULL, NULL, NULL, NULL),
(28, 'CBSE', 2006, 93.1, 'CBSE', 2008, 91.8, 'BBA', 'XYZ University', 2012, 89.2, 'MBA', 'ABC University', 2014, 91.5),
(29, 'ICSE', 2005, 82.5, 'State Board', 2007, 84.9, 'BCA', 'LMN University', 2011, 85.4, NULL, NULL, NULL, NULL),
(30, 'State Board', 2004, 68.7, 'CBSE', 2006, 71.0, 'BA', 'DEF University', 2010, 73.8, 'MA', 'GHI University', 2012, 76.2);

-- Insert into Experience Table
INSERT INTO Experience (EmployeeID, CompanyName, JobTitle, StartDate, EndDate, Description) VALUES
(1, 'TechCorp', 'Junior Developer', '2012-07-01', '2016-12-31', 'Worked on web applications.'),
(2, 'PeopleSoft', 'HR Assistant', '2013-06-01', '2017-10-31', 'Assisted in recruitment.'),
(3, 'FinancePro', 'Financial Analyst', '2011-09-01', '2018-05-31', 'Managed financial reports.'),
(4, 'InnovaTech', 'Software Engineer', '2015-01-15', '2020-12-31', 'Developed mobile apps.'),
(5, 'MediCare', 'Pharmacist', '2014-05-20', '2019-07-15', 'Managed prescriptions and patient records.'),
(6, 'EduTech', 'Lecturer', '2016-02-01', '2022-11-30', 'Taught computer science courses.'),
(7, 'CloudSync', 'System Administrator', '2013-08-10', '2017-06-30', 'Maintained IT infrastructure.'),
(8, 'RetailCorp', 'Sales Manager', '2017-03-25', '2021-09-30', 'Led a team of sales representatives.'),
(9, 'BankOne', 'Account Manager', '2010-11-05', '2018-07-20', 'Handled customer accounts and loans.'),
(10, 'SmartTech', 'AI Engineer', '2019-01-01', NULL, 'Working on AI and ML models.'),
(11, 'AutoDrive', 'Mechanical Engineer', '2015-07-15', '2020-03-31', 'Designed car engines and components.'),
(12, 'FoodChain', 'Operations Manager', '2016-04-10', '2021-12-31', 'Oversaw restaurant operations.'),
(13, 'DataWorks', 'Data Analyst', '2018-06-20', NULL, 'Analyzing business data for insights.'),
(14, 'BuildRight', 'Civil Engineer', '2012-03-01', '2017-09-30', 'Worked on infrastructure projects.'),
(15, 'GlobalTech', 'IT Support', '2017-10-01', '2023-05-30', 'Provided technical support for clients.'),
(16, 'AdWorld', 'Marketing Executive', '2014-02-10', '2021-08-15', 'Handled digital marketing campaigns.'),
(17, 'HealthFirst', 'Nurse', '2011-05-05', '2019-10-31', 'Provided patient care in hospitals.'),
(18, 'GreenEnergy', 'Electrical Engineer', '2013-09-15', '2018-12-30', 'Worked on renewable energy projects.'),
(19, 'SecureNet', 'Cybersecurity Specialist', '2016-07-01', NULL, 'Monitoring security threats and incidents.'),
(20, 'FinTrust', 'Investment Banker', '2015-12-10', '2021-04-15', 'Managed high-value client investments.'),
(21, 'CodeSprint', 'Full Stack Developer', '2018-01-01', NULL, 'Developing front-end and back-end systems.'),
(22, 'HealthPlus', 'Medical Researcher', '2012-06-10', '2018-09-30', 'Conducted clinical trials.'),
(23, 'TransLogistics', 'Supply Chain Manager', '2014-08-15', '2020-07-31', 'Optimized distribution networks.'),
(24, 'SkyHigh Airlines', 'Pilot', '2011-11-20', NULL, 'Flying international commercial flights.'),
(25, 'NewsMedia', 'Journalist', '2013-05-01', '2019-10-15', 'Reported on global events.'),
(26, 'GovAgency', 'Public Relations Officer', '2017-02-01', '2022-06-30', 'Managed government communications.'),
(27, 'BioGen', 'Biochemist', '2015-09-10', '2021-11-20', 'Conducted pharmaceutical research.'),
(28, 'SmartHome', 'IoT Engineer', '2016-10-05', '2023-02-28', 'Developed smart home automation systems.'),
(29, 'AI Innovations', 'Machine Learning Engineer', '2019-04-01', NULL, 'Developing deep learning models.'),
(30, 'FutureSpace', 'Aerospace Engineer', '2010-12-15', '2018-08-31', 'Worked on satellite technology.');


-- Insert into Projects Table
INSERT INTO Projects (ProjectName, StartDate, EndDate) VALUES
('AI Development', '2022-05-01', '2023-12-31'),
('HR Management System', '2023-01-15', '2024-06-30'),
('Financial Analytics Tool', '2021-07-01', '2023-05-31'),
('E-Commerce Website', '2020-09-01', '2022-03-31'),
('Cloud Security Platform', '2021-08-01', '2023-09-30'),
('Healthcare Data Management', '2022-02-01', '2024-07-31'),
('IoT Smart Home System', '2020-04-10', '2023-01-31'),
('Autonomous Vehicle AI', '2023-06-01', NULL),
('Online Learning Portal', '2018-10-15', '2021-12-31'),
('Cybersecurity Threat Detection', '2019-01-01', '2022-06-30'),
('Automated Customer Support Chatbot', '2021-05-10', '2023-08-15'),
('Blockchain Payment System', '2022-07-01', '2024-12-31'),
('Inventory Management Software', '2017-03-01', '2019-11-30'),
('Social Media Analytics Tool', '2020-11-05', '2022-10-31'),
('Augmented Reality Shopping App', '2021-12-01', '2024-05-30');

-- Insert into EmployeeProjects Table
INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES
(1, 1), (1, 5),
(2, 2), (2, 6), (2, 10),
(3, 3), (3, 7),
(4, 4), (4, 8), (4, 12),
(5, 5), (5, 9),
(6, 6), (6, 10), (6, 14),
(7, 7), (7, 11),
(8, 8), (8, 12), (8, 15),
(9, 9), (9, 13),
(10, 10), (10, 14), (10, 2),
(11, 11), (11, 15),
(12, 12), (12, 3), (12, 7),
(13, 13), (13, 1),
(14, 14), (14, 4), (14, 8),
(15, 15), (15, 5),
(16, 1), (16, 6), (16, 10),
(17, 2), (17, 7),
(18, 3), (18, 8), (18, 12),
(19, 4), (19, 9),
(20, 5), (20, 10), (20, 14),
(21, 6), (21, 11),
(22, 7), (22, 12), (22, 15),
(23, 8), (23, 13),
(24, 9), (24, 14), (24, 2),
(25, 10), (25, 15),
(26, 11), (26, 3), (26, 7),
(27, 12), (27, 1),
(28, 13), (28, 4), (28, 8),
(29, 14), (29, 5),
(30, 15), (30, 6), (30, 10);

-- Insert into Attendance Table
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES
(1, '2024-04-03', 'Leave'),
(2, '2024-04-03', 'Leave'),
(3, '2024-04-03', 'Present'),
(4, '2024-04-03', 'Present'),
(5, '2024-04-03', 'Present'),
(6, '2024-04-03', 'Present'),
(7, '2024-04-03', 'Present'),
(8, '2024-04-03', 'Present'),
(9, '2024-04-03', 'Present'),
(10, '2024-04-03', 'Present'),
(11, '2024-04-03', 'Present'),
(12, '2024-04-03', 'Present'),
(13, '2024-04-03', 'Present'),
(14, '2024-04-03', 'Present'),
(15, '2024-04-03', 'Present'),
(16, '2024-04-03', 'Present'),
(17, '2024-04-03', 'Present'),
(18, '2024-04-03', 'Absent'),
(19, '2024-04-03', 'Leave'),
(20, '2024-04-03', 'Present'),
(21, '2024-04-03', 'Present'),
(22, '2024-04-03', 'Absent'),
(23, '2024-04-03', 'Leave'),
(24, '2024-04-03', 'Present'),
(25, '2024-04-03', 'Present'),
(26, '2024-04-03', 'Present'),
(27, '2024-04-03', 'Absent'),
(28, '2024-04-03', 'Present'),
(29, '2024-04-03', 'Present'),
(30, '2024-04-03', 'Present');


--  Show all employees
DELIMITER //
CREATE PROCEDURE show_all_employees()
BEGIN
    SELECT * FROM EmpDetails;
END //
DELIMITER ;

CALL show_all_employees();

-- 2. Procedure to Get Employee Count by Department
DELIMITER //
CREATE PROCEDURE DeptEmp_count()
BEGIN
    SELECT 
        d.DepartmentName,
        COUNT(e.EmployeeID) AS EmployeeCount
    FROM 
        Departments d
    LEFT JOIN 
        EmpDetails e ON d.DepartmentID = e.DepartmentID
    GROUP BY 
        d.DepartmentID;
END //
DELIMITER ;

call DeptEmp_count();


-- 3. Procedure to View Full Employee Profile (with education and experience)
DELIMITER //
CREATE PROCEDURE Deptcount()
BEGIN
    SELECT 
        d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployees
    FROM 
        Departments d
    LEFT JOIN 
        EmpDetails e ON d.DepartmentID = e.DepartmentID
    GROUP BY 
        d.DepartmentID;
END //
DELIMITER ;

call deptcount();

-- 4. show employees whose status is inactive
DELIMITER //
CREATE PROCEDURE inactive_empl()
BEGIN
    SELECT * FROM Empdetails
    WHERE status = 'inactive';
END //
DELIMITER ;

CALL inactive_empl();

-- 5. Show employees with salary above 50,000
DELIMITER //
CREATE PROCEDURE highest_salary()
BEGIN
    SELECT * FROM EmpDetails
    WHERE salary > 50000;
END //
DELIMITER ;

CALL highest_salary();

-- 6. Show employees by department
DELIMITER //
CREATE PROCEDURE emp_dept(IN dept_id INT)
BEGIN
    SELECT * FROM EmpDetails
    WHERE DepartmentID = dept_id;
END //
DELIMITER ;

CALL emp_dept(2);

-- 7. Show employee details by ID
DELIMITER //
CREATE PROCEDURE show_employeebyid(IN emp_id INT)
BEGIN
    SELECT * FROM EmpDetails
    WHERE EmployeeID = emp_id;
END //
DELIMITER ;

CALL show_employeebyid(4);

-- 8. Show project details by name
DELIMITER //
CREATE PROCEDURE project_name(IN proj_name VARCHAR(100))
BEGIN
    SELECT * FROM Projects
    WHERE projectname = proj_name;
END //
DELIMITER ;

CALL project_name('Cloud Security Platform');

-- 9. Show employees in a specific department with a salary above a certain amount
DELIMITER //
CREATE PROCEDURE emp_dept_salary(IN dept_id INT, IN min_salary DECIMAL(10,2))
BEGIN
    SELECT * FROM EmpDetails
    WHERE DepartmentID = dept_id AND Salary > min_salary;
END //
DELIMITER ;

CALL emp_dept_salary(2, 40000);


CALL show_attendance_by_emp(3);

-- 10. Show employees with a specific qualification from a specific university				
DELIMITER //
CREATE PROCEDURE emp_education(
    IN course_name VARCHAR(100), 
    IN university_name VARCHAR(100)
)
BEGIN
    SELECT e.*
    FROM EmpEducation ed
    JOIN EmpDetails e ON ed.EmployeeID = e.EmployeeID
    WHERE 
        (ed.UG_Course = course_name AND ed.UG_University = university_name)
        OR 
        (ed.PG_Course = course_name AND ed.PG_University = university_name);
END //
DELIMITER ;

CALL emp_education('B.Tech', 'XYZ University');

-- Views
-- Retrieve a list of all employees who belong to a specific department and have a salary greater than a specified amount
CREATE VIEW FullEmployeeEducation AS
SELECT 
    e.EmployeeID, e.FirstName, e.LastName, ed.SSC_Board, ed.SSC_YearOfPassing, ed.SSC_Percentage,
    ed.HSC_Board, ed.HSC_YearOfPassing, ed.HSC_Percentage,
    ed.UG_Course, ed.UG_University, ed.UG_YearOfPassing, ed.UG_Percentage,
    ed.PG_Course, ed.PG_University, ed.PG_YearOfPassing, ed.PG_Percentage
FROM 
    EmpDetails e
JOIN 
    EmpEducation ed ON e.EmployeeID = ed.EmployeeID;
    
SELECT * FROM FullEmployeeEducation;

-- Salary Summary by Department
CREATE VIEW DeptSalarySummary AS
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees,
    AVG(e.Salary) AS AverageSalary,
    MAX(e.Salary) AS MaxSalary,
    MIN(e.Salary) AS MinSalary
FROM 
    Departments d
LEFT JOIN 
    EmpDetails e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentID;

SELECT * FROM DeptSalarySummary;

