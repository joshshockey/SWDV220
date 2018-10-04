-- Project 2 --

-- Drop database if it exists --
DROP DATABASE IF EXISTS disk_inventory;

-- Creates a new database --
CREATE DATABASE disk_inventory;

Use disk_inventory
go

-- Create tables for database --
CREATE TABLE customer
	(cust_ID	INT		PRIMARY KEY IDENTITY,
	first_name	CHAR	NOT NULL,
	last_name	CHAR	NOT NULL,
	cust_phone	INT		NOT NULL,
	cust_email	CHAR	NOT NULL);

CREATE TABLE inventory
	(inv_ID		INT		PRIMARY KEY IDENTITY,
	status		CHAR	NOT NULL,
	cd_ID		CHAR	NOT NULL,
	dvd_ID		CHAR	NOT NULL,
	genre		CHAR	NOT NULL);
	 
CREATE TABLE loan_status
	(borrow_date	DATE	PRIMARY KEY,
	cust_ID			INT		REFERENCES customer (cust_ID),
	inv_ID			INT		REFERENCES inventory (inv_ID),
	return_date		DATE	NOT NULL,
	release_date	DATE	NOT NULL);
	 
CREATE TABLE artist
	(artist_ID		VARCHAR		PRIMARY KEY,
	artist_name		CHAR		NOT NULL,
	cd_name			CHAR		NOT NULL,
	dvd_name		CHAR		NOT NULL);

CREATE TABLE artist_type
	(artist_type	CHAR	PRIMARY KEY,
	artist_solo		CHAR	NOT NULL,
	artist_group	CHAR	NOT NULL);

-- Intersecting table for artist and inventory tables --	
CREATE TABLE artist_inv
	(artist_inv_ID	INT		PRIMARY KEY IDENTITY,
	artist_ID		VARCHAR	REFERENCES artist (artist_ID),
	inv_ID			INT		REFERENCES inventory (inv_ID));



		