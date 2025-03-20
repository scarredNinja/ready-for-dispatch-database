-- Create the database
CREATE DATABASE DispatchDB;
GO

USE DispatchDB;
GO

-- Table to store ReadyForDispatch main details
CREATE TABLE ReadyForDispatch (
    DispatchID INT IDENTITY(1,1) PRIMARY KEY,
    ControlNumber INT NOT NULL,
    SalesOrder NVARCHAR(50) NOT NULL
);
GO

-- Table to store delivery address
CREATE TABLE DeliveryAddress (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    DispatchID INT NOT NULL,
    Street NVARCHAR(255) NOT NULL,
    City NVARCHAR(100) NOT NULL,
    State NVARCHAR(50) NOT NULL,
    PostalCode NVARCHAR(20) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_Delivery_Dispatch FOREIGN KEY (DispatchID) 
        REFERENCES ReadyForDispatch(DispatchID) ON DELETE CASCADE
);
GO

-- Table to store containers
CREATE TABLE Containers (
    ContainerID INT IDENTITY(1,1) PRIMARY KEY,
    DispatchID INT NOT NULL,
    LoadId NVARCHAR(50) NOT NULL UNIQUE,
    ContainerType NVARCHAR(10) NOT NULL,
    CONSTRAINT CK_Container_Type CHECK (ContainerType IN ('20RF', '40RF', '20HC', '40HC')),
    CONSTRAINT FK_Containers_Dispatch FOREIGN KEY (DispatchID) 
        REFERENCES ReadyForDispatch(DispatchID) ON DELETE CASCADE
);
GO

-- Table to store items inside containers
CREATE TABLE ContainerItems (
    ItemID INT IDENTITY(1,1) PRIMARY KEY,
    ContainerID INT NOT NULL,
    ItemCode NVARCHAR(50) NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,
    CartonWeight DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Items_Containers FOREIGN KEY (ContainerID) 
        REFERENCES Containers(ContainerID) ON DELETE CASCADE
);
GO