-- Project 3 --

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
	first_name	CHAR(30)	NOT NULL,						-- changed to allow greater CHAR storage
	last_name	CHAR(30)	NOT NULL,						-- changed to allow greater CHAR storage
	cust_phone	INT			NULL,
	cust_email	CHAR(30)	NOT NULL);						-- changed to allow greater CHAR storage

CREATE TABLE inventory
	(inv_ID		INT			PRIMARY KEY IDENTITY,
	inv_name	VARCHAR(30)	NOT NULL,						-- changed to allow greater CHAR storage
	status		CHAR(20)	NOT NULL,						-- changed to allow greater CHAR storage
	genre		CHAR(20)	NOT NULL);						-- changed to allow greater CHAR storage
	 
CREATE TABLE loan_status
	(borrow_date	DATE	NOT NULL,
	cust_ID			INT		REFERENCES customer (cust_ID),
	inv_ID			INT		REFERENCES inventory (inv_ID),
	return_date		DATE	NULL,							-- changed to allow NULL values
	release_date	DATE	NULL,							-- changed to allow NUll values
	PRIMARY KEY (borrow_date, cust_ID, inv_ID));			-- added cust_ID and inv_ID to Primary Key
	 
CREATE TABLE artist
	(artist_ID		INT			PRIMARY KEY,
	artist_name		VARCHAR(50)	NOT NULL);					-- changed to allow greater CHAR storage
	
CREATE TABLE artist_type
	(artist_type	CHAR(20)		PRIMARY KEY,			-- changed to allow greater CHAR storage
	artist_ID		INT			REFERENCES artist (artist_ID),
	artist_solo		VARCHAR(50)	NOT NULL,					-- changed to allow greater CHAR storage
	artist_group	VARCHAR(50)	NOT NULL);					-- changed to allow greater CHAR storage

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
           ,[artist_name])
     VALUES
           (1
           ,'Beach Boys'),
		    (2
           ,'The Beatles'),
		    (3
           ,'Marvin Gaye'),
		    (4
           ,'Rolling Stones'),
		    (5
           ,'The Clash'),
		    (6
           ,'Bob Dylan'),
		    (7
           ,'Miles Davis'),
		    (8
           ,'Nirvana'),
		    (9
           ,'Bruce Springsteen'),
		    (10
           ,'Michael Jackson'),
		    (11
           ,'Fleetwood Mac'),
		    (12
           ,'The Who'),
		    (13
           ,'Ramones'),
		    (14
           ,'The Band'),
		    (15
           ,'John Coltrane'),
		    (16
           ,'U2'),
		    (17
           ,'Van Morrison'),
		    (18
           ,'Radiohead'),
		    (19
           ,'James Brown'),
		    (20
           ,'Aretha Franklin')
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
           ,'2018/10/11'),
		   ('2018/09/01'
           ,1
           ,1
           ,'2018/09/15'
           ,'2018/09/16'),
		   ('2018/10/05'
           ,2
           ,2
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,3
           ,2
           ,'2018/10/03'
           ,'2018/10/04'),
		   ('2018/10/01'
           ,4
           ,4
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/02'
           ,4
           ,5
           ,'2018/10/05'
           ,'2018/10/06'),
		   ('2018/10/01'
           ,5
           ,6
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,6
           ,7
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,7
           ,8
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,8
           ,9
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,9
           ,10
           ,'2018/10/10'
           ,'2018/10/11'),
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
           ,'2018/10/11'),
		   ('2018/10/01'
           ,14
           ,15
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,15
           ,16
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,16
           ,17
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,17
           ,18
           ,'2018/10/10'
           ,'2018/10/11'),
		   ('2018/10/01'
           ,18
           ,10
           ,'2018/10/05'
           ,'2018/10/06'),
		   ('2018/10/01'
           ,19
           ,11
           ,'2018/10/02'
           ,'2018/10/03')
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