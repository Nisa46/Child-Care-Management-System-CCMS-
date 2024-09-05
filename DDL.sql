/*
					SQL Project Name : child Care Management System(CCMS)
							    Trainee Name :  Nisa Akter   
						    	  Trainee ID : 1280694        
							Batch ID : CS/PNTL-M/58/01 

 --------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [CCMS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, ) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
	                CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/


CREATE DATABASE CCMS
ON
(
	name = 'ccms_data',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ccms_data.mdf',
	size = 6MB,
	maxsize = 50MB,
	filegrowth = 10%
)
LOG ON
(
	name = 'ccms_log',
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ccms_log.ldf',
	size = 8MB,
	maxsize = 50MB,
	filegrowth = 7MB
)
GO

USE CCMS
GO


/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

--============== Table with IDENTITY, PRIMARY KEY & nullability CONSTRAINT... ============--

CREATE TABLE gender
(
	genderId INT PRIMARY KEY IDENTITY,
	genderName VARCHAR(10) NOT NULL
)
GO
CREATE TABLE religion
(
	religionId INT not null,
	religionName VARCHAR(12) NOT NULL
)
GO
CREATE TABLE bloodGroup
(
	bloodGroupId INT IDENTITY PRIMARY KEY,
	bloodGroupType VARCHAR(5) NOT NULL
)
GO
CREATE TABLE maritalStatus
(
	maritalStatusId INT IDENTITY PRIMARY KEY,
	[status] VARCHAR(9) NOT NULL
)
GO
CREATE TABLE activity
(
	activityId int primary key identity ,
	activityName VARCHAR(30) NOT NULL
)
GO
--============== Table with PRIMARY KEY & FOREIGN KEY & DEFAULT CONSTRAINT... ============--
CREATE TABLE Child
(
	ChildId INT IDENTITY PRIMARY KEY,
	childname VARCHAR(40) NOT NULL,
	dateofbirth DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	bloodGroupId INT REFERENCES bloodGroup(bloodGroupId),
	father VARCHAR(30) NOT NULL,
	mother VARCHAR(15) NOT NULL,
	email VARCHAR(30)  NOT NULL,
	phone VARCHAR(14) UNIQUE,
	[address] VARCHAR(50) NOT NULL,
    activityId INT REFERENCES activity(activityId),
    enrollmentDate DATE DEFAULT getDate(),
)
GO
CREATE TABLE food
(
	foodId UNIQUEIDENTIFIER NOT NULL ,
	foodCategoryName VARCHAR(30) NOT NULL,
	foodPrice MONEY not null,
	childId INT REFERENCES child(childId)
)
GO

--============== Table with CHECK CONSTRAINT & set CONSTRAINT name ============--
CREATE TABLE Babysitter
(
	BabysitterId INT IDENTITY PRIMARY KEY,
	babysittername VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	genderId INT REFERENCES gender(genderId),
	maritalStatusId INT REFERENCES maritalStatus(maritalStatusId),
	bloodGroupId INT REFERENCES bloodGroup(bloodGroupId),
	nid VARCHAR(10) UNIQUE CHECK(nid LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	email VARCHAR(40) UNIQUE CONSTRAINT ck_emailCheck CHECK (email LIKE '%@%' ),
    contactNumber VARCHAR(20),
	[address] VARCHAR(70) NOT NULL
)
GO
--============== Table with composite PRIMARY KEY ============--

CREATE TABLE ChildActivityInfo
(   childActivityID INT identity,
	childId INT REFERENCES child(childId),
	activityId INT REFERENCES activity(activityId),
	babysitterId INT REFERENCES babysitter(babysitterID),
	PRIMARY KEY(childId,activityId,babysitterID)
)
GO
CREATE TABLE enrollmentInfo
(
	enrollmentId INT IDENTITY(100,1) PRIMARY KEY,
	enrollmentDate DATETIME DEFAULT GETDATE(),
    childID INT REFERENCES Child(childId),
	EnrollmentFee MONEY DEFAULT 0.00,
)
GO

CREATE TABLE Comments
(
	commentId INT primary key,
	comment NVARCHAR(100) NULL
)
GO


/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/

============== Update column definition ============--

update food set foodPrice=600 where foodID=3
go

ALTER TABLE enrollment
ALTER COLUMN bloodGroupName VARCHAR(4) NOT NULL
GO

--============== ADD column with DEFAULT CONSTRAINT ============--

ALTER TABLE activity
ADD activityFee MONEY DEFAULT 50
GO

============== DROP COLUMN ============--

ALTER TABLE babysitter
DROP COLUMN nid 
GO


/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

-- Clustered Index
CREATE CLUSTERED INDEX IX_religion
ON religion (religionId)
GO

-- Nonclustered Index
CREATE NONCLUSTERED INDEX IX_religionName
ON religion(religionName)
GO

/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

CREATE SEQUENCE SequenceExample
	AS INT
	START WITH 1
	INCREMENT BY 1
 GO

/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/

CREATE VIEW VW_ChildInfo
AS
SELECT childId,activityID, EnrollmentDate FROM child
GO

-- VIEW WITH ENCRYPTION, SCHEMABINDING & WITH CHECK OPTION

CREATE VIEW vw_activityname
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT* FROM activity
WHERE activityName='ball ninja'
WITH CHECK OPTION
GO



--============== ALTER VIEW ============--

ALTER VIEW VW_ChildInfo
AS
SELECT childId,activityID, EnrollmentDate FROM child
GO

/*
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/
--============== STORED PROCEDURE for insert data using parameter ============--
CREATE PROCEDURE spInsertbabysitter	@babysittername VARCHAR(50),
									@dob DATE,
									@genderId INT,
									@maritalStatusId INT,
									@bloodGroupId INT,
									@nid VARCHAR(10),
									@email VARCHAR(40),
									@contactNumber CHAR(20),
									@address VARCHAR(70)
									
AS
BEGIN
	INSERT INTO babysitter(babysittername, dob, genderId, maritalStatusId, bloodGroupId, nid, email,contactNumber, [address]) 
	VALUES(@babysittername, @dob, @genderId, @maritalStatusId, @bloodGroupId, @nid, @email, @contactNumber, @address)
END
GO


--============== STORED PROCEDURE for UPDATE data ============--
CREATE PROCEDURE spactivity 	@activityId INT,
									@activityName VARCHAR
AS
BEGIN
	UPDATE activity
	SET
	activityName = @activityName
	WHERE activityId = @activityId
END
GO


--============== STORED PROCEDURE for DELETE Table data ============--

CREATE PROCEDURE spDeleteactivity	@activityId INT
AS
BEGIN
	DELETE FROM activity
	WHERE activityId = @activityId
END
GO

--============== ALTER STORED PROCEDURE ============--

ALTER PROCEDURE spactivity	@activityId INT,
							@activityName VARCHAR(30)
								
AS
BEGIN
	UPDATE activity
	SET
	activityName = @activityName
	WHERE activityId = @activityId
END
GO

/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

--============== A SCALAR FUNCTION ============--
-- A Scalar Function to get Current Year Total Sales

CREATE FUNCTION fnCurrentYearfees()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalfees MONEY
	SELECT @totalfees = childID*enrollmentfee FROM enrollmentInfo
	WHERE YEAR [date]=@YEAR and month[date]=@month
    RETURN @totalfees
END
GO

--============== A SIMPLE TABLE VALUED FUNCTION ============--
-- A Inline Table Valued Function to get monthly total fees---
CREATE FUNCTION fnMonthlytotalenrollmentFee (@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
			SUM(enrollmentFee) AS 'Total amount of fees',
			
	FROM enrollmentInfo
	WHERE YEAR(enrollmentFee.enrollmentDate) = @year AND MONTH(enrollmentFee.enrollmentDate) = @month

)
GO



--============== ALTER FUNCTION ============--

ALTER FUNCTION fnMonthlyCourseSales(@year INT, @month INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
	SUM(enrollmentFee) AS 'Total fee',
	FROM enrollmentInfo
	WHERE YEAR(enrollmentFee.enrollmentDate) = @year AND MONTH(enrollmentFee.enrollmentDate) = @month

)
GO
/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

-- Create trigger on Stockin table and update stock in product table
CREATE TRIGGER trfood
ON food
FOR UPDATE,DELETE
AS
BEGIN
	PRINT 'This table is restricted for update and delete'
	ROLLBACK TRANSACTION
END
GO

/*
==============================  SECTION 10  ==============================
							INSTEAD OF TRIGGER
==========================================================================
*/

CREATE TRIGGER trEnrollment
ON enrollmentInfo
INSTEAD OF INSERT
AS
BEGIN
	
			INSERT INTO enrollmentInfo(enrollmentId, childId, enrollmentFee,activityID,enrollmentDate)
			SELECT enrollmentId, childId, enrollmentFee,activityID,enrollmentDate
			FROM inserted
END
GO



============== ALTER TRIGGER ============
ALTER TRIGGER trEnrollment
ON enrollmentInfo
INSTEAD OF INSERT
AS
BEGIN
	
			INSERT INTO enrollmentInfo(enrollmentId, childId, enrollmentFee,activityID,enrollmentDate)
			SELECT enrollmentId, childId, enrollmentFee,activityID,enrollmentDate
			FROM inserted
END
GO
GO