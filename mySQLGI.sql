CREATE DATABASE GI_mySQL;

-- VERY EASY
-- Create a table with your top three cars and include make, model, year. 
-- Create a query to add in two more cars

USE GI_mySQL;
CREATE TABLE Very_Easy(
Make VARCHAR(20), 
Model VARCHAR(20), 
Year int
);

SELECT * FROM Very_Easy;

INSERT INTO Very_Easy (Make, Model, Year)
VALUES ('Toyota', 'Camry', 2014);

INSERT INTO Very_Easy (Make, Model, Year)
VALUES ('Honda','Civic',1999);

INSERT INTO Very_Easy (Make, Model, Year)
VALUES ('Ford','F150',2020);

-- Query
INSERT INTO Very_Easy (Make, Model, Year)
VALUES ('Nissan','Maxima',2009);

INSERT INTO Very_Easy (Make, Model, Year)
VALUES ('Mini Cooper','Countryman',2005);

-- EASY
-- Create a table with your top five favorite books with Title, Publish Date, and Author First/Last Name 
-- Create a query to add in two new books 
-- Remove the oldest book 
-- Provide an additional query giving the sum of all books

USE GI_mySQL;
CREATE TABLE Easy(
Id INT PRIMARY KEY,
Title VARCHAR(20), 
Published_Date DATE, 
Author VARCHAR(20)
);

SELECT * FROM Easy;

INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (1, 'The Last Battle', '1956-09-04', 'C.S Lewis');

INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (2, 'The Two Towers','1954-11-11','J.R.R Tolkien');

INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (3, 'The Silver Chair','1953-09-07','C.S Lewis');

INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (4, 'The Hobbit', '1937-09-21', 'J.R.R Tolkien');

INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (5, 'Prince Caspian','1951-10-15','C.S Lewis');

-- Query
INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (6, 'Goblet of Fire', '2000-07-08', 'J.K Rowling');

INSERT INTO Easy (Id, Title, Published_Date, Author)
VALUES (7, 'Deathly Hallows','2007-07-14','J.K Rowling');

DELETE FROM GI_mySQL.Easy WHERE id = 1
ORDER BY Published_Date DESC 
LIMIT 1;

SELECT COUNT(*) FROM Easy;

-- MEDIUM 
-- Create a table with your top 10 movies. Include title, release date, and rating 
-- Create a query that pulls all movies, in order of release date, where the title includes the letter “s”.

USE GI_mySQL;
CREATE TABLE Medium(
Title VARCHAR(30),
Release_Date DATE, 
Rating DECIMAL(2,1)
);

SELECT * FROM Medium;

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('Iron Man', '2008-05-02', 4.7);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('The Incredible Hulk', '2008-06-13', 4.2);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('Iron Man 2', '2010-05-07', 4.5);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('Thor', '2011-05-06', 4.1);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('The First Avenger', '2011-07-22', 4.5);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('The Avengers', '2012-05-04', 4.7);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('Iron Man 3', '2013-05-03', 4.2);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('Thor: The Dark World', '2013-11-08', 4.1);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('The Winter Soldier', '2014-04-04', 4.5);

INSERT INTO Medium (Title, Release_Date, Rating)
VALUES ('Guardians of the Galaxy', '2014-08-01', 4.5);

-- Query
SELECT * FROM Medium
WHERE Title LIKE '%s%'
ORDER BY Release_Date;

-- HARD
-- Make a copy of your Medium Challenge 
-- Write out the queries that would add the director’s First Name and Last Name into two separate columns. 
-- Create a query that puts the names together. 
-- Create a query to put the list in alphabetical order by the last name from A-Z 
-- Remove the Movies where the Last Name ends with ”R-Z” 
-- Write a query where the first three appear

USE GI_mySQL;
CREATE TABLE Hard AS
SELECT Title, Release_Date, Rating
FROM Medium;

SELECT * FROM Hard;

ALTER TABLE Hard
ADD Director_First_Name VARCHAR(20);

ALTER TABLE Hard
ADD Director_Last_Name VARCHAR(20);

ALTER TABLE Hard
ADD COLUMN full_Name VARCHAR(30);

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('John','Favreau');
       
INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Louis','Leterrier');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('John','Favreau');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Kenneth','Bragnagh');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Joe','Johnson');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Joss','Whedon');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Shane','Black');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Alan','Taylor');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('Russo','Brothers');

INSERT INTO Hard (Director_First_Name, Director_Last_Name)
VALUES ('James','Gunn');

SELECT  *, CONCAT(Director_First_Name, Director_Last_Name) AS Full_Name
FROM Hard;

SELECT * FROM Hard
ORDER BY Director_Last_Name ASC;

DELETE FROM Hard
WHERE Director_Last_Name LIKE '%r-z';

SELECT *
FROM Hard
LIMIT 3;

    
-- VERY HARD
-- Copy the table from your Very Easy Challenge
-- Write a query to add in three cars at once
-- Write a query to add in prices and colors for each of these cars
-- Write a query to put the Make and Model together in one column
-- Create a new query that adds an additional column to the results to show how many cars have the same Make.


USE GI_mySQL;
CREATE TABLE Very_Hard AS
SELECT Make, Model, Year
FROM Very_Easy;

SELECT * FROM Very_Hard;

-- Query
INSERT INTO Very_Hard (Make, Model, Year)
VALUES ('Toyota', 'Camry', 2014),
	   ('Honda','Civic',1999),
       ('Ford','F150',2020);

ALTER TABLE Very_Hard
MODIFY COLUMN Prices DECIMAL(10,3);

ALTER TABLE Very_Hard
ADD Colors VARCHAR(20);

INSERT INTO Very_Hard (Prices, Colors)
VALUES (55657, 'Black'),
	   (20463, 'Red'),
       (72286, 'Blue');

SELECT *, CONCAT(Make, Model) AS MakeAndModel
FROM Very_Hard;


SELECT COUNT(Make), Make
FROM Very_Hard
GROUP BY Make;