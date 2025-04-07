CREATE DATABASE  IF NOT EXISTS `employeedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employeedb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: employeedb
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` varchar(20) NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `admin_chk_1` CHECK ((`Role` in (_utf8mb4'SuperAdmin',_utf8mb4'HR',_utf8mb4'Manager')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'superadmin_kate','superpass321','Kate Winslet','kate.super@example.com','SuperAdmin','2025-04-04 14:06:02'),(2,'hr_josh','hrkey998','Josh Turner','josh.hr@example.com','HR','2025-04-04 14:06:02'),(3,'manager_ron','ronpass007','Ron Watson','ron.manager@example.com','Manager','2025-04-04 14:06:02'),(4,'admin_lisa','lisaadmin@2024','Lisa Ray','lisa.admin@example.com','SuperAdmin','2025-04-04 14:06:02'),(5,'hr_emma','emmaHR456','Emma Stone','emma.hr@example.com','HR','2025-04-04 14:06:02'),(6,'mgr_chris','chrisMgmt$','Chris Evans','chris.manager@example.com','Manager','2025-04-04 14:06:02');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `AttendanceID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT NULL,
  `Date` date NOT NULL,
  `Status` varchar(10) NOT NULL,
  PRIMARY KEY (`AttendanceID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `empdetails` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendance_chk_1` CHECK ((`Status` in (_utf8mb4'Present',_utf8mb4'Absent',_utf8mb4'Leave')))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2024-04-03','Leave'),(2,2,'2024-04-03','Leave'),(3,3,'2024-04-03','Present'),(4,4,'2024-04-03','Present'),(5,5,'2024-04-03','Present'),(6,6,'2024-04-03','Present'),(7,7,'2024-04-03','Present'),(8,8,'2024-04-03','Present'),(9,9,'2024-04-03','Present'),(10,10,'2024-04-03','Present'),(11,11,'2024-04-03','Present'),(12,12,'2024-04-03','Present'),(13,13,'2024-04-03','Present'),(14,14,'2024-04-03','Present'),(15,15,'2024-04-03','Present'),(16,16,'2024-04-03','Present'),(17,17,'2024-04-03','Present'),(18,18,'2024-04-03','Absent'),(19,19,'2024-04-03','Leave'),(20,20,'2024-04-03','Present'),(21,21,'2024-04-03','Present'),(22,22,'2024-04-03','Absent'),(23,23,'2024-04-03','Leave'),(24,24,'2024-04-03','Present'),(25,25,'2024-04-03','Present'),(26,26,'2024-04-03','Present'),(27,27,'2024-04-03','Absent'),(28,28,'2024-04-03','Present'),(29,29,'2024-04-03','Present'),(30,30,'2024-04-03','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(100) NOT NULL,
  PRIMARY KEY (`DepartmentID`),
  UNIQUE KEY `DepartmentName` (`DepartmentName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (4,'Accounting'),(7,'Customer Support'),(2,'Engineering'),(3,'Finance'),(1,'Human Resources'),(5,'Marketing'),(6,'Sales');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `deptsalarysummary`
--

DROP TABLE IF EXISTS `deptsalarysummary`;
/*!50001 DROP VIEW IF EXISTS `deptsalarysummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `deptsalarysummary` AS SELECT 
 1 AS `DepartmentName`,
 1 AS `TotalEmployees`,
 1 AS `AverageSalary`,
 1 AS `MaxSalary`,
 1 AS `MinSalary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empdetails`
--

DROP TABLE IF EXISTS `empdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empdetails` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `JobTitle` varchar(50) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `HireDate` date NOT NULL,
  `Status` varchar(10) DEFAULT 'Active',
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `empdetails_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `empdetails_chk_1` CHECK ((`Gender` in (_utf8mb4'Male',_utf8mb4'Female',_utf8mb4'Other'))),
  CONSTRAINT `empdetails_chk_2` CHECK ((`Status` in (_utf8mb4'Active',_utf8mb4'Inactive')))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empdetails`
--

LOCK TABLES `empdetails` WRITE;
/*!40000 ALTER TABLE `empdetails` DISABLE KEYS */;
INSERT INTO `empdetails` VALUES (1,'Michael','Johnson','Male','1990-05-15','michael.j@example.com','1234567890','123 Main St','New York','NY','10001','Software Engineer',2,75000.00,'2022-06-01','Active'),(2,'Sarah','Williams','Female','1992-08-22','sarah.w@example.com','0987654321','456 Oak St','San Francisco','CA','94105','HR Specialist',1,60000.00,'2023-01-15','Active'),(3,'David','Miller','Male','1985-11-10','david.m@example.com','1122334455','789 Pine St','Chicago','IL','60611','Accountant',3,65000.00,'2021-03-20','Active'),(4,'Sarah','Joe','Female','1990-08-22','sarah@example.com','1287654321','456 Oak St','San Francisco','CA','94105','HR Specialist',1,90000.00,'2023-01-15','Active'),(5,'Keifer','Watson','Male','2000-10-24','keiferwat@example.com','2147895632','25 Mud St','Manila','PH','10023','Engineer',6,80000.00,'2025-02-12','Active'),(6,'Jasper','Jean','Female','1996-11-14','jasperjeanmariano@example.com','2147820362','14 Gun St','Sydney','AUS','2000','Engineer',2,90000.00,'2022-02-28','Active'),(7,'Denzel','Mariano','Male','2001-10-24','denzel@example.com','2178195632','25 Mud St','Manila','PH','10523','Sales Person',6,30000.00,'2025-02-22','Active'),(8,'Ci-N','Peralta','Male','1995-10-24','peralta@example.com','2147895632','12 Rocket St','Cape Town','AFR','15623','Marketing Person',5,60000.00,'2015-08-22','Inactive'),(9,'Felix','Collins','Male','1994-06-18','collins@example.com','3157895632','39 Bun St','Cebu','PH','23763','Engineer',2,70000.00,'2021-02-12','Inactive'),(10,'Benjamin','Tennison','Male','2002-10-24','ben@example.com','9547895632','23 Revenue St','Chennai','CH','12022','Accountant',4,20000.00,'2022-02-02','Active'),(11,'Alan','Walker','Male','1995-10-24','alan@example.com','9547892841','23 Chilli St','Hyderabad','HY','23579','Customer Support',7,40000.00,'2021-03-05','Inactive'),(12,'Liya','Mishra','Female','2001-06-14','liya@example.com','9876543210','10 Park Lane','Mumbai','MH','22561','HR Manager',1,35000.00,'2021-01-15','Active'),(13,'Ravi','Chandran','Male','1999-03-10','ravi@example.com','9123456789','52 MG Road','Delhi','DL','35871','Software Engineer',2,45000.00,'2020-07-01','Inactive'),(14,'Sneha','Menon','Female','1998-11-05','sneha@example.com','9988776655','88 Garden Street','Bangalore','KA','12459','Accountant',4,30000.00,'2019-09-12','Active'),(15,'Amit','Kumar','Male','1997-12-25','amit@example.com','9012345678','99 Tech Zone','Hyderabad','TG','56782','Customer Support',7,28000.00,'2022-05-21','Inactive'),(16,'Meera','Akash','Female','2000-04-02','meera@example.com','9090909090','18 Palm Street','Chennai','CH','12598','Marketing Person',5,18000.00,'2023-03-05','Inactive'),(17,'John','Jerome','Male','1995-01-11','john@example.com','9345678123','27 North Ave','Kolkata','WB','79586','Sales Executive',6,32000.00,'2018-06-30','Active'),(18,'Ayesha','Begum','Female','2002-09-09','ayesha@example.com','9678901234','66 Rose St','Pune','MH','45976','Sales Executive',6,40000.00,'2020-08-22','Active'),(19,'Arun','Kumar','Male','2001-05-20','arun@example.com','7894561230','12 Green Way','Coimbatore','TN','14569','Finance Officer',3,26000.00,'2021-11-10','Inactive'),(20,'Diya','Rema','Female','1996-02-14','diya@example.com','8765432190','45 Blue Lane','Ahmedabad','GJ','45211','Engineer',2,84000.00,'2019-04-17','Active'),(21,'Nathan','Drake','Male','1988-07-16','nathan@example.com','9871234567','11 Jungle Rd','Los Angeles','CA','90001','HR Specialist',1,100000.00,'2017-10-10','Active'),(22,'Elena','Fisher','Female','1990-09-25','elena@example.com','9877654321','12 Ocean Ave','Los Angeles','CA','90002','Sales Executive',6,95000.00,'2018-03-18','Active'),(23,'Liam','Bennett','Male','1993-07-09','liam.bennett@example.com','9123456781','101 Elm St','Boston','MA','02108','Engineer',2,82000.00,'2020-09-01','Inactive'),(24,'Emma','Robinson','Female','1995-02-20','emma.robinson@example.com','9123456782','202 Maple Ave','Seattle','WA','98104','Engineer',2,70000.00,'2021-03-10','Active'),(25,'Noah','Harris','Male','1991-03-18','noah.harris@example.com','9123456783','303 Cedar Rd','Austin','TX','73301','Sales Executive',6,60000.00,'2022-05-05','Active'),(26,'Olivia','Wright','Female','1994-09-11','olivia.wright@example.com','9123456784','404 Spruce St','Miami','FL','73301','Business Analyst',3,75000.00,'2023-01-22','Active'),(27,'Lucas','Lee','Male','1988-12-30','lucas.lee@example.com','9123456787','707 Redwood Ct','Phoenix','AZ','85001','Account Executive',3,72000.00,'2021-08-18','Inactive'),(28,'Henry','Young','Male','1993-04-10','henry.young@example.com','9123456791','1111 Cherry St','Atlanta','GA','30301','Data Analyst',3,78000.00,'2020-10-12','Inactive'),(29,'Isabella','King','Female','1990-12-06','isabelle@example.com','9123456792','1212 Poplar Ave','Charlotte','NC','28202','UI Developer',2,73000.00,'2021-12-25','Active'),(30,'Mia','Scott','Female','1992-05-07','mia.scott@example.com','9123456788','808 Fir Ave','San Diego','CA','92101','Content Writer',5,55000.00,'2024-02-14','Active');
/*!40000 ALTER TABLE `empdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empeducation`
--

DROP TABLE IF EXISTS `empeducation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empeducation` (
  `EducationID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT NULL,
  `SSC_Board` varchar(100) NOT NULL,
  `SSC_YearOfPassing` year NOT NULL,
  `SSC_Percentage` decimal(5,2) DEFAULT NULL,
  `HSC_Board` varchar(100) DEFAULT NULL,
  `HSC_YearOfPassing` year DEFAULT NULL,
  `HSC_Percentage` decimal(5,2) DEFAULT NULL,
  `UG_Course` varchar(100) DEFAULT NULL,
  `UG_University` varchar(100) DEFAULT NULL,
  `UG_YearOfPassing` year DEFAULT NULL,
  `UG_Percentage` decimal(5,2) DEFAULT NULL,
  `PG_Course` varchar(100) DEFAULT NULL,
  `PG_University` varchar(100) DEFAULT NULL,
  `PG_YearOfPassing` year DEFAULT NULL,
  `PG_Percentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`EducationID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `empeducation_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `empdetails` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empeducation`
--

LOCK TABLES `empeducation` WRITE;
/*!40000 ALTER TABLE `empeducation` DISABLE KEYS */;
INSERT INTO `empeducation` VALUES (1,1,'CBSE',2015,88.50,'State Board',2017,85.30,'B.Tech','ABC University',2021,80.20,NULL,NULL,NULL,NULL),(2,2,'ICSE',2014,75.20,'CBSE',2016,78.90,'B.Sc','PQR University',2020,79.10,'M.Sc','LMN University',2022,81.50),(3,3,'State Board',2013,67.80,'State Board',2015,72.50,'B.Com','DEF University',2019,76.00,NULL,NULL,NULL,NULL),(4,4,'CBSE',2016,92.10,'CBSE',2018,89.50,'BBA','XYZ University',2022,85.70,'MBA','ABC University',2024,87.90),(5,5,'ICSE',2012,74.30,'State Board',2014,76.80,'BCA','LMN University',2018,80.40,NULL,NULL,NULL,NULL),(6,6,'State Board',2011,65.00,'CBSE',2013,68.90,'BA','DEF University',2017,70.50,'MA','GHI University',2019,72.80),(7,7,'CBSE',2015,81.90,'ICSE',2017,84.20,'B.Tech','XYZ University',2021,82.30,NULL,NULL,NULL,NULL),(8,8,'ICSE',2013,79.40,'CBSE',2015,83.70,'B.Sc','PQR University',2019,77.20,'M.Sc','LMN University',2021,79.80),(9,9,'State Board',2010,69.10,'State Board',2012,71.30,'B.Com','DEF University',2016,74.50,NULL,NULL,NULL,NULL),(10,10,'CBSE',2017,94.50,'CBSE',2019,91.20,'BBA','XYZ University',2023,88.50,'MBA','ABC University',2025,90.70),(11,11,'ICSE',2016,78.50,'State Board',2018,80.30,'BCA','LMN University',2022,82.40,NULL,NULL,NULL,NULL),(12,12,'State Board',2015,64.90,'CBSE',2017,67.80,'BA','DEF University',2021,70.20,'MA','GHI University',2023,72.60),(13,13,'CBSE',2014,88.20,'ICSE',2016,90.10,'B.Tech','XYZ University',2020,85.40,NULL,NULL,NULL,NULL),(14,14,'ICSE',2013,76.90,'CBSE',2015,79.20,'B.Sc','PQR University',2019,78.50,'M.Sc','LMN University',2021,81.00),(15,15,'State Board',2012,70.10,'State Board',2014,73.40,'B.Com','DEF University',2018,76.80,NULL,NULL,NULL,NULL),(16,16,'CBSE',2011,91.50,'CBSE',2013,89.60,'BBA','XYZ University',2017,86.30,'MBA','ABC University',2019,88.70),(17,17,'ICSE',2010,80.70,'State Board',2012,82.50,'BCA','LMN University',2016,83.90,NULL,NULL,NULL,NULL),(18,18,'State Board',2009,66.50,'CBSE',2011,69.30,'BA','DEF University',2015,72.10,'MA','GHI University',2017,74.50),(19,19,'CBSE',2015,89.20,'ICSE',2017,91.50,'B.Tech','XYZ University',2021,87.00,NULL,NULL,NULL,NULL),(20,20,'ICSE',2014,77.30,'CBSE',2016,80.20,'B.Sc','PQR University',2020,79.50,'M.Sc','LMN University',2022,82.10),(21,21,'State Board',2013,71.20,'State Board',2015,74.80,'B.Com','DEF University',2019,77.40,NULL,NULL,NULL,NULL),(22,22,'CBSE',2012,92.30,'CBSE',2014,90.70,'BBA','XYZ University',2018,87.50,'MBA','ABC University',2020,89.80),(23,23,'ICSE',2011,81.60,'State Board',2013,83.70,'BCA','LMN University',2017,84.20,NULL,NULL,NULL,NULL),(24,24,'State Board',2010,67.30,'CBSE',2012,70.10,'BA','DEF University',2016,73.00,'MA','GHI University',2018,75.40),(25,25,'CBSE',2009,90.20,'ICSE',2011,92.50,'B.Tech','XYZ University',2015,88.30,NULL,NULL,NULL,NULL),(26,26,'ICSE',2008,78.10,'CBSE',2010,81.40,'B.Sc','PQR University',2014,80.20,'M.Sc','LMN University',2016,82.70),(27,27,'State Board',2007,72.00,'State Board',2009,75.60,'B.Com','DEF University',2013,78.00,NULL,NULL,NULL,NULL),(28,28,'CBSE',2006,93.10,'CBSE',2008,91.80,'BBA','XYZ University',2012,89.20,'MBA','ABC University',2014,91.50),(29,29,'ICSE',2005,82.50,'State Board',2007,84.90,'BCA','LMN University',2011,85.40,NULL,NULL,NULL,NULL),(30,30,'State Board',2004,68.70,'CBSE',2006,71.00,'BA','DEF University',2010,73.80,'MA','GHI University',2012,76.20);
/*!40000 ALTER TABLE `empeducation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeprojects`
--

DROP TABLE IF EXISTS `employeeprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeprojects` (
  `EmployeeID` int NOT NULL,
  `ProjectID` int NOT NULL,
  `AssignedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmployeeID`,`ProjectID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `employeeprojects_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `empdetails` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employeeprojects_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeprojects`
--

LOCK TABLES `employeeprojects` WRITE;
/*!40000 ALTER TABLE `employeeprojects` DISABLE KEYS */;
INSERT INTO `employeeprojects` VALUES (1,1,'2025-04-04 19:36:51'),(1,5,'2025-04-04 19:36:51'),(2,2,'2025-04-04 19:36:51'),(2,6,'2025-04-04 19:36:51'),(2,10,'2025-04-04 19:36:51'),(3,3,'2025-04-04 19:36:51'),(3,7,'2025-04-04 19:36:51'),(4,4,'2025-04-04 19:36:51'),(4,8,'2025-04-04 19:36:51'),(4,12,'2025-04-04 19:36:51'),(5,5,'2025-04-04 19:36:51'),(5,9,'2025-04-04 19:36:51'),(6,6,'2025-04-04 19:36:51'),(6,10,'2025-04-04 19:36:51'),(6,14,'2025-04-04 19:36:51'),(7,7,'2025-04-04 19:36:51'),(7,11,'2025-04-04 19:36:51'),(8,8,'2025-04-04 19:36:51'),(8,12,'2025-04-04 19:36:51'),(8,15,'2025-04-04 19:36:51'),(9,9,'2025-04-04 19:36:51'),(9,13,'2025-04-04 19:36:51'),(10,2,'2025-04-04 19:36:51'),(10,10,'2025-04-04 19:36:51'),(10,14,'2025-04-04 19:36:51'),(11,11,'2025-04-04 19:36:51'),(11,15,'2025-04-04 19:36:51'),(12,3,'2025-04-04 19:36:51'),(12,7,'2025-04-04 19:36:51'),(12,12,'2025-04-04 19:36:51'),(13,1,'2025-04-04 19:36:51'),(13,13,'2025-04-04 19:36:51'),(14,4,'2025-04-04 19:36:51'),(14,8,'2025-04-04 19:36:51'),(14,14,'2025-04-04 19:36:51'),(15,5,'2025-04-04 19:36:51'),(15,15,'2025-04-04 19:36:51'),(16,1,'2025-04-04 19:36:51'),(16,6,'2025-04-04 19:36:51'),(16,10,'2025-04-04 19:36:51'),(17,2,'2025-04-04 19:36:51'),(17,7,'2025-04-04 19:36:51'),(18,3,'2025-04-04 19:36:51'),(18,8,'2025-04-04 19:36:51'),(18,12,'2025-04-04 19:36:51'),(19,4,'2025-04-04 19:36:51'),(19,9,'2025-04-04 19:36:51'),(20,5,'2025-04-04 19:36:51'),(20,10,'2025-04-04 19:36:51'),(20,14,'2025-04-04 19:36:51'),(21,6,'2025-04-04 19:36:51'),(21,11,'2025-04-04 19:36:51'),(22,7,'2025-04-04 19:36:51'),(22,12,'2025-04-04 19:36:51'),(22,15,'2025-04-04 19:36:51'),(23,8,'2025-04-04 19:36:51'),(23,13,'2025-04-04 19:36:51'),(24,2,'2025-04-04 19:36:51'),(24,9,'2025-04-04 19:36:51'),(24,14,'2025-04-04 19:36:51'),(25,10,'2025-04-04 19:36:51'),(25,15,'2025-04-04 19:36:51'),(26,3,'2025-04-04 19:36:51'),(26,7,'2025-04-04 19:36:51'),(26,11,'2025-04-04 19:36:51'),(27,1,'2025-04-04 19:36:51'),(27,12,'2025-04-04 19:36:51'),(28,4,'2025-04-04 19:36:51'),(28,8,'2025-04-04 19:36:51'),(28,13,'2025-04-04 19:36:51'),(29,5,'2025-04-04 19:36:51'),(29,14,'2025-04-04 19:36:51'),(30,6,'2025-04-04 19:36:51'),(30,10,'2025-04-04 19:36:51'),(30,15,'2025-04-04 19:36:51');
/*!40000 ALTER TABLE `employeeprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `ExperienceID` int NOT NULL AUTO_INCREMENT,
  `EmployeeID` int DEFAULT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `JobTitle` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`ExperienceID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `empdetails` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,1,'TechCorp','Junior Developer','2012-07-01','2016-12-31','Worked on web applications.'),(2,2,'PeopleSoft','HR Assistant','2013-06-01','2017-10-31','Assisted in recruitment.'),(3,3,'FinancePro','Financial Analyst','2011-09-01','2018-05-31','Managed financial reports.'),(4,4,'InnovaTech','Software Engineer','2015-01-15','2020-12-31','Developed mobile apps.'),(5,5,'MediCare','Pharmacist','2014-05-20','2019-07-15','Managed prescriptions and patient records.'),(6,6,'EduTech','Lecturer','2016-02-01','2022-11-30','Taught computer science courses.'),(7,7,'CloudSync','System Administrator','2013-08-10','2017-06-30','Maintained IT infrastructure.'),(8,8,'RetailCorp','Sales Manager','2017-03-25','2021-09-30','Led a team of sales representatives.'),(9,9,'BankOne','Account Manager','2010-11-05','2018-07-20','Handled customer accounts and loans.'),(10,10,'SmartTech','AI Engineer','2019-01-01',NULL,'Working on AI and ML models.'),(11,11,'AutoDrive','Mechanical Engineer','2015-07-15','2020-03-31','Designed car engines and components.'),(12,12,'FoodChain','Operations Manager','2016-04-10','2021-12-31','Oversaw restaurant operations.'),(13,13,'DataWorks','Data Analyst','2018-06-20',NULL,'Analyzing business data for insights.'),(14,14,'BuildRight','Civil Engineer','2012-03-01','2017-09-30','Worked on infrastructure projects.'),(15,15,'GlobalTech','IT Support','2017-10-01','2023-05-30','Provided technical support for clients.'),(16,16,'AdWorld','Marketing Executive','2014-02-10','2021-08-15','Handled digital marketing campaigns.'),(17,17,'HealthFirst','Nurse','2011-05-05','2019-10-31','Provided patient care in hospitals.'),(18,18,'GreenEnergy','Electrical Engineer','2013-09-15','2018-12-30','Worked on renewable energy projects.'),(19,19,'SecureNet','Cybersecurity Specialist','2016-07-01',NULL,'Monitoring security threats and incidents.'),(20,20,'FinTrust','Investment Banker','2015-12-10','2021-04-15','Managed high-value client investments.'),(21,21,'CodeSprint','Full Stack Developer','2018-01-01',NULL,'Developing front-end and back-end systems.'),(22,22,'HealthPlus','Medical Researcher','2012-06-10','2018-09-30','Conducted clinical trials.'),(23,23,'TransLogistics','Supply Chain Manager','2014-08-15','2020-07-31','Optimized distribution networks.'),(24,24,'SkyHigh Airlines','Pilot','2011-11-20',NULL,'Flying international commercial flights.'),(25,25,'NewsMedia','Journalist','2013-05-01','2019-10-15','Reported on global events.'),(26,26,'GovAgency','Public Relations Officer','2017-02-01','2022-06-30','Managed government communications.'),(27,27,'BioGen','Biochemist','2015-09-10','2021-11-20','Conducted pharmaceutical research.'),(28,28,'SmartHome','IoT Engineer','2016-10-05','2023-02-28','Developed smart home automation systems.'),(29,29,'AI Innovations','Machine Learning Engineer','2019-04-01',NULL,'Developing deep learning models.'),(30,30,'FutureSpace','Aerospace Engineer','2010-12-15','2018-08-31','Worked on satellite technology.');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fullemployeeeducation`
--

DROP TABLE IF EXISTS `fullemployeeeducation`;
/*!50001 DROP VIEW IF EXISTS `fullemployeeeducation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fullemployeeeducation` AS SELECT 
 1 AS `EmployeeID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `SSC_Board`,
 1 AS `SSC_YearOfPassing`,
 1 AS `SSC_Percentage`,
 1 AS `HSC_Board`,
 1 AS `HSC_YearOfPassing`,
 1 AS `HSC_Percentage`,
 1 AS `UG_Course`,
 1 AS `UG_University`,
 1 AS `UG_YearOfPassing`,
 1 AS `UG_Percentage`,
 1 AS `PG_Course`,
 1 AS `PG_University`,
 1 AS `PG_YearOfPassing`,
 1 AS `PG_Percentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `ProjectID` int NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(100) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'AI Development','2022-05-01','2023-12-31'),(2,'HR Management System','2023-01-15','2024-06-30'),(3,'Financial Analytics Tool','2021-07-01','2023-05-31'),(4,'E-Commerce Website','2020-09-01','2022-03-31'),(5,'Cloud Security Platform','2021-08-01','2023-09-30'),(6,'Healthcare Data Management','2022-02-01','2024-07-31'),(7,'IoT Smart Home System','2020-04-10','2023-01-31'),(8,'Autonomous Vehicle AI','2023-06-01',NULL),(9,'Online Learning Portal','2018-10-15','2021-12-31'),(10,'Cybersecurity Threat Detection','2019-01-01','2022-06-30'),(11,'Automated Customer Support Chatbot','2021-05-10','2023-08-15'),(12,'Blockchain Payment System','2022-07-01','2024-12-31'),(13,'Inventory Management Software','2017-03-01','2019-11-30'),(14,'Social Media Analytics Tool','2020-11-05','2022-10-31'),(15,'Augmented Reality Shopping App','2021-12-01','2024-05-30');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `deptsalarysummary`
--

/*!50001 DROP VIEW IF EXISTS `deptsalarysummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `deptsalarysummary` AS select `d`.`DepartmentName` AS `DepartmentName`,count(`e`.`EmployeeID`) AS `TotalEmployees`,avg(`e`.`Salary`) AS `AverageSalary`,max(`e`.`Salary`) AS `MaxSalary`,min(`e`.`Salary`) AS `MinSalary` from (`departments` `d` left join `empdetails` `e` on((`d`.`DepartmentID` = `e`.`DepartmentID`))) group by `d`.`DepartmentID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fullemployeeeducation`
--

/*!50001 DROP VIEW IF EXISTS `fullemployeeeducation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fullemployeeeducation` AS select `e`.`EmployeeID` AS `EmployeeID`,`e`.`FirstName` AS `FirstName`,`e`.`LastName` AS `LastName`,`ed`.`SSC_Board` AS `SSC_Board`,`ed`.`SSC_YearOfPassing` AS `SSC_YearOfPassing`,`ed`.`SSC_Percentage` AS `SSC_Percentage`,`ed`.`HSC_Board` AS `HSC_Board`,`ed`.`HSC_YearOfPassing` AS `HSC_YearOfPassing`,`ed`.`HSC_Percentage` AS `HSC_Percentage`,`ed`.`UG_Course` AS `UG_Course`,`ed`.`UG_University` AS `UG_University`,`ed`.`UG_YearOfPassing` AS `UG_YearOfPassing`,`ed`.`UG_Percentage` AS `UG_Percentage`,`ed`.`PG_Course` AS `PG_Course`,`ed`.`PG_University` AS `PG_University`,`ed`.`PG_YearOfPassing` AS `PG_YearOfPassing`,`ed`.`PG_Percentage` AS `PG_Percentage` from (`empdetails` `e` join `empeducation` `ed` on((`e`.`EmployeeID` = `ed`.`EmployeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 15:05:39
