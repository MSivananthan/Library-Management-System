Name      : M Sivananthan 
Company: CODTECH IT SOLUTIONS
Intern ID : CT08DS6401
Domain  : SQL
Duration: Augest to September 2024
Mentor : Muzammil Ahmed

## Library Management System

Welcome to the **Library Management System (LMS)** repository! This project is designed to facilitate the efficient management of a library's book inventory, member records, and borrow/return transactions. It aims to provide a practical learning experience in SQL commands, database design principles, and data manipulation techniques.

### **Project Overview**

The LMS aims to help librarians streamline their operations, improve user experience, and maintain accurate records. Key objectives include:

- **Database Design**: Create a relational database that effectively captures the relationships between books, members, and transactions.
  
- **Data Manipulation**: Implement SQL queries for inserting, updating, deleting, and retrieving data.
  
- **User Management**: Manage library members and their borrowing privileges.
  
- **Reporting**: Generate reports and statistics that provide insights into library usage and inventory status.
  
- **Future Enhancements**: Outline potential improvements and features for the LMS.

### **Database Design**

The database consists of five primary tables:

- **Books**
- **Members**
- **Transactions**
- **BookCategories**
- **MembershipTypes**

### **SQL Queries**

Here are some key SQL commands used in the project:

1. **Create Database**
   ```sql
   CREATE DATABASE Library_Management_System;
   ```

2. **Use Database**
   ```sql
   USE Library_Management_System;
   ```

3. **Create Tables**
   - **BookCategories Table**
     ```sql
     CREATE TABLE BookCategories (
         CategoryID INT PRIMARY KEY AUTO_INCREMENT,
         CategoryName VARCHAR(100) NOT NULL
     );
     ```

   - **MembershipTypes Table**
     ```sql
     CREATE TABLE MembershipTypes (
         MembershipTypeID INT PRIMARY KEY AUTO_INCREMENT,
         TypeName VARCHAR(50) NOT NULL,
         MaxBorrowedBooks INT NOT NULL,
         BorrowPeriod INT NOT NULL
     );
     ```

   - **Books Table**
     ```sql
     CREATE TABLE Books (
         BookID INT PRIMARY KEY AUTO_INCREMENT,
         Title VARCHAR(255) NOT NULL,
         Author VARCHAR(255) NOT NULL,
         Publisher VARCHAR(255) NOT NULL,
         PublicationYear YEAR NOT NULL,
         ISBN VARCHAR(13) NOT NULL UNIQUE,
         Quantity INT NOT NULL,
         ShelfLocation VARCHAR(50) NOT NULL,
         CategoryID INT,
         FOREIGN KEY (CategoryID) REFERENCES BookCategories(CategoryID)
     );
     ```

   - **Members Table**
     ```sql
     CREATE TABLE Members (
         MemberID INT PRIMARY KEY AUTO_INCREMENT,
         FirstName VARCHAR(50) NOT NULL,
         LastName VARCHAR(50) NOT NULL,
         Email VARCHAR(100) NOT NULL UNIQUE,
         PhoneNumber VARCHAR(15),
         MembershipStartDate DATE NOT NULL,
         MembershipExpirationDate DATE NOT NULL,
         MembershipTypeID INT,
         FOREIGN KEY (MembershipTypeID) REFERENCES MembershipTypes(MembershipTypeID)
     );
     ```

   - **Transactions Table**
     ```sql
     CREATE TABLE Transactions (
         TransactionID INT PRIMARY KEY AUTO_INCREMENT,
         BookID INT,
         MemberID INT,
         BorrowDate DATE NOT NULL,
         DueDate DATE NOT NULL,
         ReturnDate DATE,
         Returned BOOLEAN NOT NULL DEFAULT 0,
         FOREIGN KEY (BookID) REFERENCES Books(BookID),
         FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
     );
     ```

### **Contact Information**

For any inquiries or contributions, feel free to reach out:

[GitHub Profile](https://github.com/MSivananthan)

Thank you for visiting the Library Management System repository! Your feedback and contributions are welcome.

Citations:
[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/24505429/ce82e39d-024c-498b-937b-b60272bc5d91/Library-Management-System.pdf
