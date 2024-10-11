/*

					SQL Project Name : Child Care Management System(CCMS)
							    Trainee Name : Nisa Akter  
						    	  Trainee ID : 1280694       
							Batch ID : CS/PNTL-M/58/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
			    SUB SECTION => 2.1:INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
		    => SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: QUERY
				SUB SECTION => 5.01 : SELECT FROM TABLE
				SUB SECTION => 5.02 : DISTINCT
				SUB SECTION => 5.03 : TOP CLAUSE 
				SUB SECTION => 5.04 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 5.05 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 5.06 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 5.07 : ORDER BY
				SUB SECTION => 5.08 : OFFSET FETCH
				SUB SECTION => 5.09 : JOIN(INNER JOIN,LEFT JOIN,RIGHT JOIN,FULL JOIN)
				SUB SECTION => 5.10 : UNION
				SUB SECTION => 5.11 : AGGREGATE FUNCTIONS(COUNT,MIN,MAX,SUM,AVG)
				SUB SECTION => 5.12 : SUMMARY QUERIES(GROUP BY,ROLLUP & CUBE,GROUPING SETS)
				SUB SECTION => 5.13 : SUB-QUERIES (ALL,ANY,SOME,INNER, CORRELATED,EXISTS)
				SUB SECTION => 5.14 : CTE
				SUB SECTION => 5.15 : CONVERT DATA TYPES(CONVERT,CAST,TRY_CONVERT)
				SUB SECTION => 5.16 : GETDATE
				SUB SECTION => 5.17 :  DATEADD
				SUB SECTION => 5.18 : DATEDIFF
				SUB SECTION => 5.19 : CASE
				SUB SECTION => 5.20 : CHOOSE
			
*/				

/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/

USE CCMS
GO

INSERT INTO gender VALUES('Male'),('Female')
GO
SELECT * FROM gender
GO

INSERT INTO religion VALUES ('islam'), ('Hinduism'), ('Buddhism'), ('Christianity')
GO
SELECT * FROM religion
GO

INSERT INTO bloodGroup VALUES ('A+'), ('A-'), ('B+'), ('B-'), ('AB+'), ('AB-'), ('O+'), ('O-')
GO
SELECT * FROM bloodGroup
GO

INSERT INTO maritalStatus VALUES ('Single'), ('Married'), ('Divorced')
GO
SELECT * FROM maritalStatus
GO

INSERT INTO activity VALUES
('tissue paper roll activity'),
('save the trapped animal and people'),
('water spray and clean'),
('nail polish activity'),
('pin the snowflakes'),
('food sculpture'),
('feed the baby'),
('cardboard box fun'),
('egg shell hammer'),
('action word activity'),
('ball pan transfer'),
('ball ninja'),
('ball drop')
Go
SELECT * FROM activity
GO

--============== Insert data by column sequence ============--
INSERT INTO child VALUES
('tadiba','2020-07-09', 2, 1,'Tajul Islam','Hasna Akter','Tajul@gmail.com','01733466870','mohammadpur',10,'2023-01-05'),
('tahia','2021-08-20', 2, 2,'kashem Ali','Trisna','kashem@gmail.com','01526060894','dhanmondi',1,'2023-01-07'),
('arafat','2020-08-15', 1, 3,'masud vhuiyan','Monira','masud@gmail.com','01841092574','ajimpur',2,'2023-04-08'),
('arefin','2022-03-27',1, 1,'Iftekhar Rahman','Sathi','Iftekhar@gmail.com','01586795789','farmgate',4,'2023-02-01')
GO
SELECT * FROM child
GO
INSERT INTO food VALUES
('Bone Strength',300,1),
('Weight Gain'250,2),
('Brain Development'400,3),

INSERT INTO babysitter VALUES
('fariha', '1999-06-12',  2, 1,1, '1948589698', 'fariha@gmail.com', '01580812341','agargaon'),
('nikhad', '1998-12-28',  2, 2, 3,'1956524757', 'nikhad@gmail.com', '01792949053','shamoly'),
('jimly', '1997-03-08',  2, 3, 2,'1953252525', 'jimly@gmail.com', '01989457262','sukrabad'),
('marisha', '1996-04-28', 2, 2,4, '1954525252', 'marisha@gmail.com', '01863204814','ajimpur'),
('jeba', '1998-06-15', 2, 1,6 ,'1968582545', 'jeba@gmail.com', '01765468939','dhanmondi'),
('tamanna', '1996-03-21', 2, 1,5, '1969853214', 'tamanna@gmail.com', '01550585386','farmgate'),
('kakoly', '1998-02-12',  2, 1,7, '1987542136', 'kakoly@gmail.com', '01765158328','tejgaon'),
('resma', '1999-07-31', 2, 2,1, '1956987412', 'resma@gmail.com', '01845358160','mohammadpur'),
('bristy', '1997-09-02', 2, 1,7, '1956454545', 'bristy@gmail.com', '01746247138','jigatola')
GO
SELECT * FROM babysitter
GO


/*
==============================  SECTION 02  ==============================
					INSERT DATA THROUGH STORED PROCEDURE
==========================================================================
*/
EXEC spInsertbabysitter 'othoi', '1997-05-10', 2, 1, 7, '1988779846', 'othoi@gmail.com', '01709623584', 'farmgate'
EXEC spInsertbabysitter 'rani', '1996-05-12', 2, 1, 4, '1994145054', 'rani@gmail.com', '01818935546', 'asadgate'                   
SELECT * FROM babysitter
GO

-- insert data with relation
INSERT INTO childActivityInfo VALUES
(1, 3, 1),
(2, 2, 2),
(3,10, 3),
(4, 9, 4),
(1, 8, 1),
(2, 7, 2),
(3, 6, 3),
(4, 5, 4),
(4, 4, 4),
(1, 11,1)
GO
SELECT * FROM childActivityInfo
GO

INSERT INTO enrollmentInfo(enrollmentId,,enrollmentDate, childActivityId, enrollmentFee,) VALUES
('2023-01-05', 1, 2500),
('2023-01-07', 2, 3000),
('2023-04-08', 3, 2000),
('2023-02-01', 4, 1500)
GO
SELECT * FROM enrollmentInfo
GO

INSERT INTO Comments VALUES
(1, 'Great'),
(2, 'Bad'),
(3, 'Good')
GO

--============== INSERT DATA USING SEQUENCE VALUE ============--

INSERT INTO Comments VALUES((NEXT VALUE FOR dbo.sequenceExample), NULL)
GO
SELECT * FROM Comments
GO

/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/


--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

EXEC spUpdatefood 'bone strength',400
GO

SELECT * FROM food
GO

--============== DELETE DATA THROUGH STORED PROCEDURE ============--
EXEC spDeletefood 'brain development'
GO

SELECT * FROM food
GO

/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--============== INSERT DATA through view ============--
SELECT * FROM VW_ChildInfo
GO

INSERT INTO VW_ChildInfo(childName,dob) VALUES ('kashfia','2021-12-25', 2, 1,'Reajul Islam','Hasina Akter','kashfia@gmail.com','01933466860','collegeGate',10,NULL),
)
GO

SELECT * FROM VW_Childinfo
GO



--============== UPDATE DATA through view ============--
UPDATE VW_childinfo
SET dateofbirth = '2022-12-26'
WHERE  childName = 'kashfia'
GO
SELECT * FROM VW_childinfo
GO

--============== DELETE DATA through view ============--
DELETE FROM VW_childinfo
WHERE childName = 'kashfia'
GO

SELECT * FROM VW_childinfo
GO

/*
==============================  SECTION 05  ==============================
								  QUERY
==========================================================================
*/
                             --5.01--
--============== A SELECT STATEMENT TO GET ALL THE DATA FROM child TABLE ============--

SELECT * FROM child
GO

--============== A SELECT STATEMENT TO GET 3 Column From child Table ============--

SELECT childId,childName,dateofbirth FROM child
GO


--==========A SELECT STATEMENT TO GET Data with dob older than 2021 From child Table ============--
SELECT * FROM child
WHERE dateofbirth<'2021-01-01'
GO

-============== 5.02 -USE OF DISTINCT KEYWORD: ============--

SELECT DISTINCT childID, activityId FROM child
INNER JOIN activity ON activity.activityId = child.activityId
ORDER BY childID
GO

--USE OF DISTINCT KEYWORD:
SELECT DISTINCT childName FROM child
GO

------------------------5.03 USE of TOP Clause-------------------

SELECT TOP 3 FROM child
GO


--============== 5.04 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--

SELECT * FROM babysitter
WHERE bloodgroupId = 7
AND dob BETWEEN '1996-02-21' AND '1997-12-30'
AND NOT maritalStatusId = 3
OR genderId = 2
GO

=================WHERE CLAUSE:=======================
--AND OPERATOR

SELECT * FROM babysitter
WHERE babysitterID=1 AND babisitterName=Tahia
GO

--OR OPERATOR
SELECT * FROM babysitter
WHERE babysitterId=1 OR maritalStatus=3
GO

--NOT OPERATOR
SELECT * FROM child
WHERE NOT(childId=2)
GO

--IN PHRASE

SELECT * FROM child
WHERE childId IN(1,2)
GO
-
--BETWEEN PHRASE
SELECT * FROM child
WHERE dateofbirth BETWEEN '2019-01-01' AND '2021-10-30'
GO
============== 5.05 LIKE, IN, NOT IN CLAUSE ============--

SELECT * FROM child
WHERE childName LIKE '%t'
AND childId NOT IN ('1','2')
GO

--LIKE OPERATOR
SELECT * FROM child
WHERE childName LIKE 'T%'
GO

SELECT * FROM child
WHERE childName LIKE '[Ara]%'
GO

SELECT * FROM child
WHERE childName LIKE '_[A-T]%'
GO

SELECT * FROM child
WHERE childId LIKE '[1-4]%'
GO

SELECT * FROM babaysitter
WHERE babysitterId LIKE '[^1-4]%'
GO

--IS NULL CLAUSE
SELECT * FROM child
WHERE childName IS NULL
GO
--IS NOT NULL CLAUSE
SELECT * FROM child
WHERE childId IS NOT NULL
GO

--ORDER BY CLAUSE
SELECT * FROM child
ORDER BY childName
GO

--ORDER BY DESC 
SELECT * FROM child
ORDER BY childName DESC
GO


--ORDER BY 2 COLUMN
SELECT * FROM childActivity
ORDER BY childID,activityId
GO



--============== 5.08 OFFSET FETCH ============--

-- OFFSET 2 ROWS
SELECT * FROM babysitter
ORDER BY babysitterId
OFFSET 2 ROWS
GO

-- OFFSET 2 ROWS AND GET NEXT 3 ROWS

SELECT * FROM babysitter
ORDER BY babysitterID
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY
GO
--OFFSET & FETCH
SELECT * FROM child
ORDER BY childId
OFFSET 2 ROWS
FETCH NEXT 2 ROWS ONLY
GO



--=========================5.09 JOIN============================

--INNER JOIN
SELECT childName,activityName FROM players
INNER JOIN activity ON child.ActivityID=activity.activityID

--LEFT OUTER JOIN
SELECT childName,foodName FROM food
LEFT JOIN child ON child.foodId=food.foodId
GO

--RIGHT OUTER JOIN
SELECT childName,foodName FROM food
RIGHT JOIN child ON child.foodId=food.foodId
GO

--FULL OUTER JOIN
SELECT childName,foodName FROM food
full JOIN child ON child.foodId=food.foodId
GO

--INNER JOIN THAT JOIN MORE THAN TWO TABLE
SELECT childId,childName,dateofbirth,activityName,foodName FROM child
JOIN role ON child.activityId=activity.activityId
JOIN food ON child.foodId=food.foodId
GO

--============== 5.10 UNION ============--

SELECT * FROM child
WHERE childId IN ('1','2')

UNION

SELECT * FROM child
WHERE childId IN ('3','4')
GO

--==UNION OPERATION==
SELECT * FROM child
WHERE childId <=4
UNION
SELECT * FROM child
WHERE childId >4
GO


-
--============5.11 AGGREGATE FUNCTIONS===============

--COUNT
SELECT COUNT(babysitterId) AS TOTAL_babysitter FROM babysitter
GO

--MIN
SELECT MIN(dateofbirth) AS OLD_babysitter_DOB FROM babysitter
GO

--MAX
SELECT MIN(dateofbirth) AS YOUNG_babysitter_DOB FROM babysitter
GO

--SUM
SELECT SUM(childId) AS SUM_child FROM child
GO

--AVG
SELECT AVG(foodprice) AS AVG_price FROM food
GO

--====================5.12 SUMMARY QUERIES===================

--GROUP BY
SELECT activityID,COUNT(childId) AS no_of_child FROM child
GROUP BY activityID
GO
--==============  ROLLUP & CUBE OPERATOR ============--
--ROLLUP
SELECT activityID,COUNT(childId) AS no_of_child FROM child
GROUP BY ROLLUP (activityID)
GO
--ROLLUP
SELECT enrollmentID,enrollmentDate,enrollmentfee SUM('enrollmentfee')as fee FROM enrollmentInfo
GROUP BY  ROLLUP (enrollmentID,enrollmentDate,enrollmentfee)
ORDER BY enrollmentID DESC
GO

--CUBE
SELECT activityID,COUNT(childId) AS no_of_child FROM child
GROUP BY CUBE (activityID)
GO
-- CUBE
SELECT enrollmentID,enrollmentDate,enrollmentfee SUM('enrollmentfee')as fee FROM enrollmentInfo
GROUP BY  CUBE (enrollmentID,enrollmentDate,enrollmentfee)
ORDER BY enrollmentID DESC
GO

--==============  GROUPING SETS ============--

--GROUPING SETS
SELECT activityID,COUNT(childId) AS no_of_child FROM child
GROUP BY GROUPING SETS (activityID,())
GO
SELECT enrollmentID,enrollmentDate,enrollmentfee SUM('enrollmentfee')as fee FROM enrollmentInfo
GROUP BY  GROUPINg SETS (enrollmentID,enrollmentDate,enrollmentfee)
ORDER BY enrollmentID DESC
GO

--HAVING CLAUSE
SELECT childId,COUNT(babysitterId) AS no_of_babysitter FROM child
GROUP BY childId
HAVING childId>5
GO

-
--=============5.13 SUB QUERIES=============

SELECT * FROM child
WHERE childId IN(SELECT childId FROM activity)
GO

--ALL KEYWORD

SELECT * FROM child
WHERE activityId <= ALL
(SELECT activityId FROM activity)

--ANY KEYWORD
SELECT * FROM child
WHERE activityId < ANY
(SELECT activityId FROM activity)

--SOME KEYWORD
SELECT * FROM child
WHERE activityId < SOME
(SELECT activityId FROM activity)

--CORRELATED SUBQUERIES
SELECT childName,activityId FROM child
WHERE activityId=(SELECT activityId FROM activity
WHERE child.activityId=activity.activityId
)
GO

--EXISTS OPERATOR
SELECT childName,activityId FROM child
WHERE EXISTS (
SELECT * FROM activity
WHERE child.activityId=activity.activityId
)
GO


================14 CTE==================

WITH childInfo AS
(
	SELECT childID,childname,dateofbirth FROM child
)
babysitterInfo AS
(
	SELECT babysitterID,babysittername,childID FROM babysitter
)

SELECT childID,childName FROM child
JOIN babysitter ON child.childId=babysitter.childId
GO

--==============================5.15 CONVERT DATA TYPES===========================

--CONVERT
SELECT childId,childName,CONVERT(VARCHAR(40),dateofbirth,101) AS DOB FROM child
GO

--CAST
SELECT childId,childName,CAST(Dateofbirth AS VARCHAR(30)) AS DOB FROM child
GO

--TRY CONVERT
SELECT childId,childName,TRY_CONVERT(VARCHAR(50),Dateofbirth,107) AS DOB FROM child
GO


--------=========5.16 GETDATE()=============-------

SELECT GETDATE() AS 'CURRENT DATE'
GO

--DAY
SELECT DAY(GETDATE()) AS 'DAY'
GO

--MONTH
SELECT MONTH(GETDATE()) AS 'MONTH'
GO

--YEAR
SELECT YEAR(GETDATE()) AS 'YEAR'
GO


--=======================5.17 DATEADD===================
SELECT DATEADD(DAY,2,GETDATE())
GO

SELECT DATEADD(MONTH,2,GETDATE())
GO

SELECT DATEADD(YEAR,2,GETDATE())
GO

SELECT DATEADD(HOUR,2,GETDATE())
GO

SELECT DATEADD(MINUTE,2,GETDATE())
GO

--================5.18 DATEDIFF===================
SELECT DATEDIFF(DAY,'1997-02-15',GETDATE()) AS 'DAY'
GO

SELECT DATEDIFF(MONTH,'1998-05-20',GETDATE()) AS 'MONTH'
GO

SELECT DATEDIFF(YEAR,'2009-02-27',GETDATE()) AS 'YEAR'
GO

--==============5.19 CASE FUNCTION=================
SELECT 
childName,activityId,
CASE activityID
WHEN 1 THEN 'tissue paper roll activity'
WHEN 2 THEN 'save the trapped animal and people'
WHEN 3 THEN 'water spray and clean'
WHEN 4 THEN 'nail polish activity'
END AS 'activity'
FROM child
GO

--============5.20 CHOOSE FUNCTION==================
SELECT childName, activityId,
CHOOSE(activityId,'cardboard box fun','egg shell hammer','action word activity','ball pan transfer')
AS 'activity'
FROM child
GO
















-



-

