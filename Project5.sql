-- Project 5 --

---------------------------- Modification Log  10/25/2018 ---------------------------------------------------
-- 1. Added missing Release Date ouputs for querys
-- 2. Fixed Times Disk Borrowed from Project 4, so query would Group By first two columns
-- 3. New Project 5 SQL statement additions are located on line 590 for this project
---------------------------------------------------------------------------------------

-- Drop database if it exists --
DROP DATABASE IF EXISTS disk_inventory;
go
-- Creates a new database --
CREATE DATABASE disk_inventory;
go

Use disk_inventory

-- Create tables for database --
CREATE TABLE customer
	(cust_ID	INT			PRIMARY KEY IDENTITY,
	first_name	CHAR(30)	NOT NULL,						
	last_name	CHAR(30)	NOT NULL,						
	cust_phone	INT			NULL,
	cust_email	CHAR(30)	NOT NULL);						

CREATE TABLE inventory
	(inv_ID		INT			PRIMARY KEY IDENTITY,
	inv_name	VARCHAR(30)	NOT NULL,						
	status		CHAR(20)	NOT NULL,						
	genre		CHAR(20)	NOT NULL);						
	 
CREATE TABLE loan_status
	(borrow_date	DATE	NOT NULL,
	cust_ID			INT		REFERENCES customer (cust_ID),
	inv_ID			INT		REFERENCES inventory (inv_ID),
	return_date		DATE	NULL,							
	release_date	DATE	NULL,							
	PRIMARY KEY (borrow_date, cust_ID, inv_ID));			
	 
CREATE TABLE artist
	(artist_ID		INT			PRIMARY KEY,	
	artist_fname	VARCHAR(50) NOT NULL,					
	artist_lname	VARCHAR(50) NOT NULL);					
	
CREATE TABLE artist_type
	(artist_type	CHAR(20)	NOT NULL,			
	artist_ID		INT			REFERENCES artist (artist_ID));					

-- Intersecting table for artist and inventory tables --	
CREATE TABLE artist_inv
	(artist_inv_ID	INT		PRIMARY KEY IDENTITY,
	artist_ID		INT		REFERENCES artist (artist_ID),
	inv_ID			INT		REFERENCES inventory (inv_ID));


--------------------Project 3 New Additions Below Here------------------------------------------------------

-- Part C: Insert Data into Inventory(Disk table) table --	
INSERT INTO [dbo].[inventory]
           ([inv_name]
           ,[status]
           ,[genre])
     VALUES
           ('Pet Sounds'
           ,'NOT NULL'
           ,'Rock'),
		    ('Revolver'
           ,'NOT NULL'
           ,'Rock'),
		    ('Whats Going On'
           ,'NOT NULL'
           ,'Soul'),
		    ('Exile on Main St.'
           ,'NOT NULL'
           ,'Rock'),
		    ('London Calling'
           ,'NOT NULL'
           ,'Rock'),
		    ('Blonde on Blonde'
           ,'NOT NULL'
           ,'Rock'),
		    ('Kind of Blue'
           ,'NOT NULL'
           ,'Jazz'),
		    ('Nevermind'
           ,'NOT NULL'
           ,'Rock'),
		    ('Born To Run'
           ,'NOT NULL'
           ,'Rock'),
		    ('Thriller'
           ,'NOT NULL'
           ,'Pop'),
		    ('Rumours'
           ,'NOT NULL'
           ,'Rock'),
		    ('Whos Next'
           ,'NOT NULL'
           ,'Rock'),
		    ('Ramones'
           ,'NOT NULL'
           ,'Rock'),
		    ('The Band'
           ,'NOT NULL'
           ,'Rock'),
		    ('A Love Supreme'
           ,'NOT NULL'
           ,'Jazz'),
		    ('Achtung Baby'
           ,'NOT NULL'
           ,'Rock'),
		    ('Moondance'
           ,'NOT NULL'
           ,'Rock'),
		   ('Kid A'
           ,'NOT NULL'
           ,'Rock'),
		   ('Star Time'
           ,'NOT NULL'
           ,'Soul'),
		   ('Harvest'
           ,'NOT NULL'
           ,'Rock')
GO

UPDATE [dbo].[inventory]
   SET [inv_name] = 'Lady Soul'      
      ,[genre] = 'Soul'
 WHERE inv_ID = 20
GO

-- Part D: Insert data into Customer(Borrower) table --
INSERT INTO [dbo].[customer]
           ([first_name]
           ,[last_name]
           ,[cust_phone]
           ,[cust_email])
     VALUES
           ('Bugs'
           ,'Bunny'
           ,NULL
           ,'bugs@emailcom'),
		   ('Homer'
           ,'Simpson'
           ,NULL
           ,'homer@emailcom'),
		   ('Mickey'
           ,'Mouse'
           ,NULL
           ,'mouse@emailcom'),
		   ('Charlie'
           ,'Brown'
           ,NULL
           ,'cbrown@emailcom'),
		   ('Fred'
           ,'Flintstone'
           ,NULL
           ,'flint@emailcom'),
		   ('Eric'
           ,'Cartman'
           ,NULL
           ,'ecart@emailcom'),
		   ('Daffy'
           ,'Duck'
           ,NULL
           ,'daffy@emailcom'),
		   ('Porky'
           ,'Pig'
           ,NULL
           ,'porky@emailcom'),
		   ('Fat'
           ,'Albert'
           ,NULL
           ,'fatal@emailcom'),
		   ('Betty'
           ,'Boop'
           ,NULL
           ,'boop@emailcom'),
		   ('George'
           ,'Jetson'
           ,NULL
           ,'jetson@emailcom'),
		   ('Pink'
           ,'Panther'
           ,NULL
           ,'panther@emailcom'),
		   ('Tweety'
           ,'Bird'
           ,NULL
           ,'tweety@emailcom'),
		   ('Speed'
           ,'Racer'
           ,NULL
           ,'speed@emailcom'),
		   ('Space'
           ,'Ghost'
           ,NULL
           ,'ghost@emailcom'),
		   ('Yogi'
           ,'Bear'
           ,NULL
           ,'bugs@emailcom'),
		   ('Woody'
           ,'Woodpecker'
           ,NULL
           ,'woody@emailcom'),
		   ('Angelica'
           ,'Pickles'
           ,NULL
           ,'apickles@emailcom'),
		   ('Wonder'
           ,'Woman'
           ,NULL
           ,'wonder@emailcom'),
		   ('Bobby'
           ,'Hill'
           ,NULL
           ,'bhill@emailcom')

GO

DELETE FROM [dbo].[customer]
      WHERE cust_ID = 20
GO

-- Part E: Insert data into Artist table --
INSERT INTO [dbo].[artist]
           ([artist_ID]
           ,[artist_fname]
		   ,[artist_lname])
     VALUES
           (1
           ,'Beach Boys'
		   ,''),
		    (2
           ,'The Beatles'
		   ,''),
		    (3
           ,'Marvin'
		   ,'Gaye'),
		    (4
           ,'Rolling Stones'
		   ,''),
		    (5
           ,'The Clash'
		   ,''),
		    (6
           ,'Bob'
		   ,'Dylan'),
		    (7
           ,'Miles'
		   ,'Davis'),
		    (8
           ,'Nirvana'
		   ,''),
		    (9
           ,'Bruce'
		   ,'Springsteen'),
		    (10
           ,'Michael'
		   ,'Jackson'),
		    (11
           ,'Fleetwood Mac'
		   ,''),
		    (12
           ,'The Who'
		   ,''),
		    (13
           ,'Ramones'
		   ,''),
		    (14
           ,'The Band'
		   ,''),
		    (15
           ,'John'
		   ,'Coltrane'),
		    (16
           ,'U2'
		   ,''),
		    (17
           ,'Van'
		   ,'Morrison'),
		    (18
           ,'Radiohead'
		   ,''),
		    (19
           ,'James'
		   ,'Brown'),
		    (20
           ,'Aretha'
		   ,'Franklin')
GO



-- Part F: Insert data into loan_status(DiskHasBorrower) table --
INSERT INTO [dbo].[loan_status]
           ([borrow_date]
           ,[cust_ID]
           ,[inv_ID]
           ,[return_date]
           ,[release_date])
     VALUES
           ('2018/10/01'
           ,1
           ,1
           ,'2018/10/10'
           ,'1966/05/16'),
		   ('2018/09/01'
           ,1
           ,1
           ,'2018/09/15'
           ,'1966/05/16'),
		   ('2018/10/05'
           ,2
           ,2
           ,'2018/10/10'
           ,'1966/08/05'),
		   ('2018/10/01'
           ,3
           ,2
           ,'2018/10/03'
           ,''),
		   ('2018/10/01'
           ,4
           ,4
           ,'2018/10/10'
           ,'1972/05/12'),
		   ('2018/10/02'
           ,4
           ,5
           ,'2018/10/05'
           ,'1979/12/14'),
		   ('2018/10/01'
           ,5
           ,6
           ,'2018/10/10'
           ,'1966/06/27'),
		   ('2018/10/01'
           ,6
           ,7
           ,'2018/10/10'
           ,'1959/08/17'),
		   ('2018/10/01'
           ,7
           ,8
           ,'2018/10/10'
           ,'1991/09/24'),
		   ('2018/10/01'
           ,8
           ,9
           ,'2018/10/10'
           ,'1975/08/25'),
		   ('2018/10/01'
           ,9
           ,10
           ,'2018/10/10'
           ,'1982/11/30'),
		   ('2018/10/01'
           ,11
           ,12
           ,NULL
           ,NULL),
		   ('2018/10/01'
           ,12
           ,13
           ,NULL
           ,NULL),
		   ('2018/10/01'
           ,13
           ,14
           ,'2018/10/10'
           ,'1969/09/22'),
		   ('2018/10/01'
           ,14
           ,15
           ,'2018/10/10'
           ,'1965/01/15'),
		   ('2018/10/01'
           ,15
           ,16
           ,'2018/10/10'
           ,'1991/11/18'),
		   ('2018/10/01'
           ,16
           ,17
           ,'2018/10/10'
           ,'1970/01/27'),
		   ('2018/10/01'
           ,17
           ,18
           ,'2018/10/10'
           ,'2000/10/02'),
		   ('2018/10/01'
           ,18
           ,10
           ,'2018/10/05'
           ,'1982/11/30'),
		   ('2018/10/01'
           ,19
           ,11
           ,'2018/10/02'
           ,'1977/02/04')
GO

-- Part G: Insert data into artist_inv(DiskHasArtist) table --
INSERT INTO [dbo].[artist_inv]
           ([artist_ID]
           ,[inv_ID])
     VALUES 
			(1
           ,1),
		    (2
           ,2),
		    (2
		   ,2),
		    (3
		   ,3),
		    (3
		   ,4),
		    (4
           ,4),
		    (5
           ,5),
		    (6
           ,6),
		    (7
           ,7),
		    (8
           ,8),
		    (9
           ,9),
		    (10
           ,10),
		    (11
           ,11),
		    (12
           ,12),
		    (12
           ,12),
		    (13
           ,13),
		    (14
           ,14),
		    (15
           ,15),
		    (16
           ,16),
		    (17
           ,17),
		    (18
		   ,18),
		    (19
		   ,19),
		    (20
		   ,20)
GO

-- Part H: Create query that lists discs on loan and not returned --
SELECT cust_ID, inv_id, borrow_date, return_date
FROM loan_status
WHERE return_date IS NULL;
GO

--Insert Data into artist_type columns for Solo and Group options--


-- Project 4 New Query additions ---------------------------------------------------------------------------------------------
INSERT INTO [dbo].[artist_type]
           ([artist_type]
           ,[artist_ID])		   
     VALUES
           ('Group'
		   ,1),
		   ('Group'
		   ,2),
		   ('Solo'
		   ,3),
		   ('Group'
		   ,4),
		   ('Group'
		   ,5),
		   ('Solo'
		   ,6),
		   ('Solo'
		   ,7),
		   ('Group'
		   ,8),
		   ('Solo'
		   ,9),
		   ('Solo'
		   ,10),
		   ('Group'
		   ,11),
		   ('Group'
		   ,12),
		   ('Group'
		   ,13),
		   ('Group'
		   ,14),
		   ('Solo'
		   ,15),
		   ('Group'
		   ,16),
		   ('Solo'
		   ,17),
		   ('Group'
		   ,18),
		   ('Solo'
		   ,19),
		   ('Solo'
		   ,20)
Go


-- Part 3. Show Individual artists and sort by First, Last, and Disk Name
USE disk_inventory
Go

SELECT inv_name AS 'Disk Name', release_date AS 'Release Date', artist_fname AS 'Artist First Name', artist_lname AS 'Artist Last Name'
FROM  artist
JOIN inventory on artist.artist_ID = inventory.inv_ID
JOIN artist_type on inventory.inv_ID = artist_type.artist_ID
JOIN loan_status on artist.artist_ID = loan_status.inv_ID
WHERE inventory.inv_ID in
	(SELECT DISTINCT artist_ID
	FROM artist_type
	WHERE artist_type = 'Solo')
ORDER BY 'Artist Last Name', 'Artist First Name', 'Disk Name'

--Part 4. Create View that shows artists names not group names
USE disk_inventory
Go

CREATE VIEW View_Individual_Artist
AS
SELECT artist_fname AS FirstName, artist_lname AS LastName
FROM artist
JOIN inventory on artist.artist_ID = inventory.inv_ID
WHERE artist_ID NOT IN 
	(SELECT artist_ID 
	FROM artist_type
	WHERE artist_type = 'Solo');
Go
SELECT * FROM View_Individual_Artist;

--Part 5. Use previous view to show disks by group artists only
USE disk_inventory
Go

ALTER VIEW View_Individual_Artist
AS
SELECT inv_name AS 'Disk Name', artist_fname AS 'Group Name'
FROM inventory
join artist on artist.artist_ID = inventory.inv_ID
WHERE artist_ID IN
	(SELECT artist_ID
	FROM artist_type
	WHERE artist_type = 'Group'); 
GO
SELECT * FROM View_Individual_Artist

--6. Show which disks have been borrowd an by who borrowed them
SELECT DISTINCT first_name AS 'First', last_name AS 'Last', inv_name AS 'Disk Name'
FROM loan_status 
join customer on customer.cust_ID = loan_status.cust_ID
join inventory on loan_status.inv_ID = inventory.inv_ID
WHERE borrow_date IS NOT NULL
ORDER BY 'Last'

--7. Show number of times disk has been borrowed
SELECT loan_status.inv_ID , inv_name AS 'Disk Name', COUNT(DISTINCT loan_status.borrow_date) AS 'Times Borrowed'
FROM loan_status 
JOIN inventory on loan_status.inv_ID = inventory.inv_ID
GROUP BY  loan_status.inv_ID, inv_name
Order BY 'Times Borrowed'

--8. Show disks on loan and who has each disk
SELECT inv_name AS 'Disk Name', borrow_date AS 'Borrowed', return_date AS 'Returned', last_name AS 'Last Name'
FROM loan_status
JOIN customer on loan_status.cust_ID = customer.cust_ID
JOIN inventory on customer.cust_ID = inventory.inv_ID
WHERE inventory.inv_ID in
	(SELECT cust_ID
	FROM loan_status
	WHERE return_date IS NULL)
ORDER BY 'Disk Name'


---------------------------------Project 5 New Additions---------------------------------------------
-- Part 3: Create Insert, Update, and Delete stored procedures for Artist table --
-- Insert statement for Artist table --
USE disk_inventory;
IF OBJECT_ID('sp_artist_insert') IS NOT NULL
	DROP PROC sp_artist_insert;
Go

CREATE PROC sp_artist_insert
	@artist_ID	int,
	@artist_fname varchar (50) ,
	@artist_lname varchar (50) 
AS
BEGIN TRY
	INSERT INTO artist (artist_ID, artist_fname, artist_lname)
	VALUES (@artist_ID, @artist_fname, @artist_lname);
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Update statement for Artist table --
USE disk_inventory;
IF OBJECT_ID('sp_artist_update') IS NOT NULL
	DROP PROC sp_artist_update;
Go

CREATE PROC sp_artist_update
	@artist_ID	int,
	@artist_fname varchar (50) ,
	@artist_lname varchar (50) 
AS
BEGIN TRY
	UPDATE artist SET artist_ID = @artist_ID
	,artist_fname = @artist_fname
	,artist_lname = @artist_lname
	WHERE artist_ID = @artist_ID
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Delete statement for Artist table --	
USE disk_inventory;
IF OBJECT_ID('sp_artist_delete') IS NOT NULL
	DROP PROC sp_artist_delete;
Go

CREATE PROC sp_artist_delete
	@artist_ID	int	
AS
BEGIN TRY
	DELETE FROM artist 
	WHERE artist_ID = @artist_ID
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Part 4: Create Insert, Update, and Delete stored procedures for Borrower table --
-- Insert statement for Borrower table --
USE disk_inventory;
IF OBJECT_ID('sp_borrower_insert') IS NOT NULL
	DROP PROC sp_borrower_insert;
Go

CREATE PROC sp_borrower_insert
	@cust_ID	int,
	@first_name char (30),
	@last_name char (30) 
AS
BEGIN TRY
	INSERT INTO customer (cust_ID, first_name, last_name)
	VALUES (@cust_ID, @first_name, @last_name);
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Update statement for Borrower table --
USE disk_inventory;
IF OBJECT_ID('sp_borrower_update') IS NOT NULL
	DROP PROC sp_borrower_update;
Go

CREATE PROC sp_borrower_update
	@cust_ID	int ,
	@first_name char (30),
	@last_name char (30),
	@cust_phone int NULL,
	@cust_email char (30) 
AS
BEGIN TRY
	SET IDENTITY_INSERT customer ON
 
	INSERT INTO customer(cust_ID, first_name, last_name, cust_phone, cust_email) VALUES(@cust_ID, @first_name, @last_name, @cust_phone, @cust_email)	
 
	SET IDENTITY_INSERT customer OFF
 END TRY
 BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go


-- Delete statement for Borrower table --	
USE disk_inventory;
IF OBJECT_ID('sp_cust_delete') IS NOT NULL
	DROP PROC sp_cust_delete;
Go

CREATE PROC sp_borrower_delete
	@cust_ID	int	
AS
BEGIN TRY
	DELETE FROM customer 
	WHERE cust_ID = @cust_ID
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Part 5: Create Insert, Update, and Delete stored procedures for Disk table --
-- Insert statement for Disk Table --
USE disk_inventory;
IF OBJECT_ID('sp_inventory_insert') IS NOT NULL
	DROP PROC sp_inventory_insert;
Go

CREATE PROC sp_inventory_insert
	@inv_ID	int,
	@inv_name varchar (30),
	@status char (20),
	@genre char (20) 
AS
BEGIN TRY
	INSERT INTO inventory (inv_ID, inv_name, status, genre)
	VALUES (@inv_ID, @inv_name, @status, @genre);
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Update statement for Disk table --
USE disk_inventory;
IF OBJECT_ID('sp_inventory_update') IS NOT NULL
	DROP PROC sp_inventory_update;
Go

CREATE PROC sp_inventory_update
	@inv_ID	int ,
	@nv_name varchar (30),
	@status char (20) ,
	@genre char (20)
AS
BEGIN TRY
	SET IDENTITY_INSERT inventory ON
 
	INSERT INTO inventory (inv_ID, inv_name, status, genre) VALUES(@inv_ID, @inv_ID, @status, @genre)	
 
	SET IDENTITY_INSERT inventory OFF
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go

-- Delete statement for Borrower table --	
USE disk_inventory;
IF OBJECT_ID('sp_inventory_delete') IS NOT NULL
	DROP PROC sp_inventory_delete;
Go

CREATE PROC sp_inventory_delete
	@inv_ID	int	
AS
BEGIN TRY
	DELETE FROM inventory 
	WHERE inv_ID = @inv_ID
END TRY
BEGIN CATCH
	SELECT 'An error occurred performing this operation '+
			ERROR_MESSAGE() AS ErrorMessage
	SELECT	ERROR_LINE() AS ErrorLine,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState
END CATCH
Go