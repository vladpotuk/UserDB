CREATE DATABASE UserDB;
GO

-- Використання бази даних UserDB
USE UserDB;
GO

-- Створення таблиці User
CREATE TABLE [User] (
    UserId INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL
);
GO

-- Створення таблиці HR
CREATE TABLE [HR] (
    HRId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15)
);
GO

-- Створення таблиці UserHR для зв'язку User та HR
CREATE TABLE [UserHR] (
    UserId INT NOT NULL,
    HRId INT NOT NULL,
    PRIMARY KEY (UserId, HRId),
    FOREIGN KEY (UserId) REFERENCES [User](UserId),
    FOREIGN KEY (HRId) REFERENCES [HR](HRId)
);
GO

-- Вставка даних у таблицю User
INSERT INTO [User] (Username, Email, Password) VALUES
('alice99', 'alice99@example.com', 'password123'),
('bob_smith', 'bob_smith@example.com', 'securepass456'),
('charlie_brown', 'charlie_brown@example.com', 'mypassword789'),
('david_jones', 'david_jones@example.com', 'davidpass101'),
('emma_wilson', 'emma_wilson@example.com', 'emma2024'),
('frank_lucas', 'frank_lucas@example.com', 'frankpass202'),
('grace_kim', 'grace_kim@example.com', 'grace2023'),
('henry_miller', 'henry_miller@example.com', 'henrypass202'),
('irene_young', 'irene_young@example.com', 'irene2024'),
('jackson_white', 'jackson_white@example.com', 'jackson2023');
GO

-- Вставка даних у таблицю HR
INSERT INTO [HR] (Name, Email, Phone) VALUES
('John Smith', 'john.smith@hrcompany.com', '555-1234'),
('Jane Doe', 'jane.doe@hrcompany.com', '555-5678'),
('Robert Brown', 'robert.brown@hrcompany.com', '555-8765'),
('Alice Johnson', 'alice.johnson@hrcompany.com', '555-4321'),
('Michael Lee', 'michael.lee@hrcompany.com', '555-6789');
GO

-- Вставка даних у таблицю UserHR
INSERT INTO [UserHR] (UserId, HRId) VALUES
(1, 1), -- alice99 with John Smith
(2, 2), -- bob_smith with Jane Doe
(3, 3), -- charlie_brown with Robert Brown
(4, 4), -- david_jones with Alice Johnson
(5, 5), -- emma_wilson with Michael Lee
(6, 1), -- frank_lucas with John Smith
(7, 2), -- grace_kim with Jane Doe
(8, 3), -- henry_miller with Robert Brown
(9, 4), -- irene_young with Alice Johnson
(10, 5); -- jackson_white with Michael Lee
GO

-- Вибірка всіх записів з таблиці User
SELECT * FROM User;
GO

-- Вибірка всіх записів з таблиці HR
SELECT * FROM HR;
GO

-- Вибірка всіх записів з таблиці UserHR
SELECT * FROM UserHR;
GO

-- Вибірка всіх користувачів, які пов'язані з конкретним HR (наприклад, з HRId = 1)
SELECT 
    u.Username, 
    u.Email
FROM 
    User u
JOIN 
    UserHR uh ON u.UserId = uh.UserId
WHERE 
    uh.HRId = 1;
GO

-- Вибірка всіх HR, які відповідають за конкретного користувача (наприклад, з UserId = 1)
SELECT 
    h.Name, 
    h.Email
FROM 
    HR h
JOIN 
    UserHR uh ON h.HRId = uh.HRId
WHERE 
    uh.UserId = 1;
GO
