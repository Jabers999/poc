/* PoC Data Definition Language (DDL) file
Deze file bepaald de structuur van de database (EDB)
*/

/* Creating database for PoC */

DROP DATABASE IF EXISTS PoC;

CREATE DATABASE PoC;

USE PoC;

/* Table structure for table users */

DROP TABLE IF EXISTS Users;

CREATE TABLE `Users` (
  `UserID` INT(10) AUTO_INCREMENT PRIMARY KEY,
  `Name` VARCHAR(255) NOT NULL,
  `Email` VARCHAR (255) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Zipcode` VARCHAR(255) NOT NULL,
  `City` VARCHAR(255) NOT NULL,
  `Country` VARCHAR (255) NOT NULL,
  `Phone` VARCHAR(255) NOT NULL
) Engine=INNODB;


/* Table structure for table accounts */

DROP TABLE IF EXISTS Accounts;

CREATE TABLE `Accounts`(
  `AccountID` INT(10) AUTO_INCREMENT PRIMARY KEY,
  `UserID` INT(10) NOT NULL,
  `Username` VARCHAR(255) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
  ON UPDATE CASCADE ON DELETE CASCADE
) Engine=INNODB;


/* Table structure for table roles */

DROP TABLE IF EXISTS Roles;

CREATE TABLE `Roles`(
  `RoleID` INT(10) PRIMARY KEY,
  `Description` varchar(255)
) Engine=INNODB;
  
  
 /* Table structure for table usersRoles */
DROP TABLE IF EXISTS UsersRoles;

CREATE TABLE `UsersRoles`(
  `RoleID` INT(10),
  `AccountID` INT(10),
  FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
  FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
  ON UPDATE CASCADE ON DELETE CASCADE
) Engine=INNODB;