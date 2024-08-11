--crete a databse
CREATE DATABASE LIBRARY_MANAGMENT_SYSTEM;
--use database
USE LIBRARY_MANAGMENT_SYSTEM;
--Database Design
--1. Tables
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    PublishedYear INT,
    Genre VARCHAR(100),
    CopiesAvailable INT DEFAULT 1
);

--Members Table

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    JoinDate DATE DEFAULT CURRENT_DATE
);

--Transactions Table

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

--SQL Queries
--2. Inserting Data
--Insert a New Book

INSERT INTO Books (Title, Author, ISBN, PublishedYear, Genre, CopiesAvailable)
VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 'Fiction', 3);

--Insert a New Member
INSERT INTO Members (FirstName, LastName, Email, PhoneNumber)
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890');

--Record a New Transaction (Borrowing a Book)

INSERT INTO Transactions (BookID, MemberID, BorrowDate)
VALUES (1, 1, CURRENT_DATE);

--Updating Data
--Update Book Information

UPDATE Books
SET CopiesAvailable = CopiesAvailable - 1
WHERE BookID = 1;

Update Member Information
sql
UPDATE Members
SET PhoneNumber = '0987654321'
WHERE MemberID = 1;

--4. Deleting Data
--Delete a Book
DELETE FROM Books
WHERE BookID = 1;

--Delete a Member
DELETE FROM Members
WHERE MemberID = 1;

--5. Retrieving Data
--Retrieve All Books

SELECT * FROM Books;

--Retrieve All Members

SELECT * FROM Members;

--Retrieve All Transactions

SELECT * FROM Transactions;

--Retrieve Books Borrowed by a Member

SELECT b.Title, t.BorrowDate, t.ReturnDate
FROM Transactions t
JOIN Books b ON t.BookID = b.BookID
WHERE t.MemberID = 1;

--Retrieve Members Who Borrowed a Specific Book

SELECT m.FirstName, m.LastName, t.BorrowDate
FROM Transactions t
JOIN Members m ON t.MemberID = m.MemberID
WHERE t.BookID = 1;
