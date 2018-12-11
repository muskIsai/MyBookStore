CREATE DATABASE CadastralManagBD1
GO
USE CadastralManagBD1
GO
CREATE TABLE Users
(
IdUsers INT IDENTITY(1,1) NOT NULL,
fullname VARCHAR(80) NOT NULL,

);
GO
DROP TABLE Users
USE CadastralManagBD1
GO
CREATE TABLE Users
(
IDusers int IDENTITY(1,1) NOT NULL,
fullname VARCHAR(80) NOT NULL,
phoneNumber VARCHAR(15) NOT NULL,
address VARCHAR(100) NOT NULL,
email VARCHAR (100) NOT NULL,
login VARCHAR (30) NOT NULL,
password VARCHAR(10) NOT NULL,
PRIMARY KEY (IDusers)
);
GO
CREATE TABLE CadastreObjectsTB
(
IDcadastreObjects INT IDENTITY(1,1) NOT NULL,
price DECIMAL(15, 2) NOT NULL,
typeCadastre VARCHAR(100) NOT NULL,
registrationDate DATE NOT NULL,
comment VARCHAR(120) NOT NULL,
IDusers INT NOT NULL,
IDreques INT NOT NULL
PRIMARY KEY (IDcadastreObjects)
);
GO
CREATE TABLE Client
(
IDclient INT IDENTITY(1,1) NOT NULL,
passportNumber VARCHAR(15) NOT NULL,
IDusers INT NOT NULL,
PRIMARY KEY (IDclient)
);
GO
CREATE TABLE RequestTB
(
IDrequest INT IDENTITY(1,1) NOT NULL,
requestDate DATE NOT NULL,
status VARCHAR(15) NOT NULL,
IDusers INT NOT NULL,
PRIMARY KEY (IDrequest)
);
GO
CREATE TABLE AdiminTB
(
IDadmin INT IDENTITY(1,1) NOT NULL,
IDusers INT NOT NULL,
PRIMARY KEY (IDadmin)
);
GO
CREATE TABLE IdengineerTB
(
IDengineer INT IDENTITY(1,1) NOT NULL,
acept VARCHAR(5) NOT NULL,
refuse VARCHAR(5) NOT NULL,
IDusers INT NOT NULL,
PRIMARY KEY (IDengineer)
);
GO
ALTER TABLE CadastreObjectsTB ADD CONSTRAINT FK_CadastreObjects
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
ALTER TABLE RequestTB ADD IDcadastreObjects INT NOT NULL
GO
ALTER TABLE RequestTB ADD CONSTRAINT FK_Request
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
ALTER TABLE RequestTB ADD CONSTRAINT FK_Request_Object
FOREIGN KEY (IDcadastreObjects) REFERENCES CadastreObjectsTB (IDcadastreObjects)
GO
ALTER TABLE Client ADD CONSTRAINT FK_Client_Users
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
ALTER TABLE AdiminTB ADD CONSTRAINT FK_Adimin_Users
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
ALTER TABLE IdengineerTB ADD CONSTRAINT FK_Idengineer_Users
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
ALTER TABLE CadastreObjectsTB DROP CONSTRAINT FK_CadastreObjects
GO
ALTER TABLE RequestTB DROP CONSTRAINT FK_Request
GO
ALTER TABLE CadastreObjectsTB ADD CONSTRAINT FK_CadastreObject_Users
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
ALTER TABLE RequestTB ADD CONSTRAINT FK_Request_Users 
FOREIGN KEY (IDusers) REFERENCES Users (IDusers)
GO
