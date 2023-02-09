
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/17/2023 19:58:18
-- Generated from EDMX file: C:\Users\vPro\Desktop\.net\Hotel_Management-master\HOTEL_MANAGEMENT\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB_HOTEL_MANAGEMENT];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[fk_Ct_IdC_IdH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [fk_Ct_IdC_IdH];
GO
IF OBJECT_ID(N'[dbo].[fk_Ct_IdC_IdU]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [fk_Ct_IdC_IdU];
GO
IF OBJECT_ID(N'[dbo].[fk_Ht_IdH]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Hotels] DROP CONSTRAINT [fk_Ht_IdH];
GO
IF OBJECT_ID(N'[dbo].[fk_Rm_IdR_IdU]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Rooms] DROP CONSTRAINT [fk_Rm_IdR_IdU];
GO
IF OBJECT_ID(N'[dbo].[fk_Rs_IdR_IdR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [fk_Rs_IdR_IdR];
GO
IF OBJECT_ID(N'[dbo].[fk_Rs_IdR_IdU]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [fk_Rs_IdR_IdU];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Hotels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hotels];
GO
IF OBJECT_ID(N'[dbo].[Reservations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservations];
GO
IF OBJECT_ID(N'[dbo].[Rooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Rooms];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id_Comment] int IDENTITY(1,1) NOT NULL,
    [Opinion] bit  NOT NULL,
    [Comment1] varchar(400)  NOT NULL,
    [Date_Comment] datetime  NOT NULL,
    [Id_user] int  NOT NULL,
    [Id_Hotel] int  NOT NULL
);
GO

-- Creating table 'Hotels'
CREATE TABLE [dbo].[Hotels] (
    [Id_Hotel] int IDENTITY(1,1) NOT NULL,
    [Name_Hotel] varchar(20)  NOT NULL,
    [Address_Hotel] varchar(100)  NOT NULL,
    [City_Hotel] varchar(40)  NOT NULL,
    [Stars] int  NOT NULL,
    [Id_user] int  NULL,
    [Description_Hotel] varchar(400)  NOT NULL,
    [Image_Hotel] varchar(2000)  NULL,
    [Number_Room] int  NULL,
    [Telephone] varchar(20)  NULL
);
GO

-- Creating table 'Reservations'
CREATE TABLE [dbo].[Reservations] (
    [Id_Reservation] int IDENTITY(1,1) NOT NULL,
    [Date_Begin] datetime  NOT NULL,
    [Date_End] datetime  NOT NULL,
    [Date_Reservation] datetime  NOT NULL,
    [Bill] float  NOT NULL,
    [Id_user] int  NOT NULL,
    [Id_Room] int  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [Id_Room] int IDENTITY(1,1) NOT NULL,
    [Type_Room] int  NOT NULL,
    [Price] float  NOT NULL,
    [Id_Hotel] int  NOT NULL,
    [Image_Room] varchar(2000)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id_user] int IDENTITY(1,1) NOT NULL,
    [First_Name] varchar(20)  NOT NULL,
    [Last_Name] varchar(20)  NOT NULL,
    [Email] varchar(60)  NOT NULL,
    [Pwd] varchar(200)  NULL,
    [Roles] bit  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id_Comment] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id_Comment] ASC);
GO

-- Creating primary key on [Id_Hotel] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [PK_Hotels]
    PRIMARY KEY CLUSTERED ([Id_Hotel] ASC);
GO

-- Creating primary key on [Id_Reservation] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [PK_Reservations]
    PRIMARY KEY CLUSTERED ([Id_Reservation] ASC);
GO

-- Creating primary key on [Id_Room] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([Id_Room] ASC);
GO

-- Creating primary key on [Id_user] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id_user] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id_Hotel] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [fk_Ct_IdC_IdH]
    FOREIGN KEY ([Id_Hotel])
    REFERENCES [dbo].[Hotels]
        ([Id_Hotel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Ct_IdC_IdH'
CREATE INDEX [IX_fk_Ct_IdC_IdH]
ON [dbo].[Comments]
    ([Id_Hotel]);
GO

-- Creating foreign key on [Id_user] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [fk_Ct_IdC_IdU]
    FOREIGN KEY ([Id_user])
    REFERENCES [dbo].[Users]
        ([Id_user])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Ct_IdC_IdU'
CREATE INDEX [IX_fk_Ct_IdC_IdU]
ON [dbo].[Comments]
    ([Id_user]);
GO

-- Creating foreign key on [Id_user] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [fk_Ht_IdH]
    FOREIGN KEY ([Id_user])
    REFERENCES [dbo].[Users]
        ([Id_user])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Ht_IdH'
CREATE INDEX [IX_fk_Ht_IdH]
ON [dbo].[Hotels]
    ([Id_user]);
GO

-- Creating foreign key on [Id_Hotel] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [fk_Rm_IdR_IdU]
    FOREIGN KEY ([Id_Hotel])
    REFERENCES [dbo].[Hotels]
        ([Id_Hotel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Rm_IdR_IdU'
CREATE INDEX [IX_fk_Rm_IdR_IdU]
ON [dbo].[Rooms]
    ([Id_Hotel]);
GO

-- Creating foreign key on [Id_Room] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [fk_Rs_IdR_IdR]
    FOREIGN KEY ([Id_Room])
    REFERENCES [dbo].[Rooms]
        ([Id_Room])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Rs_IdR_IdR'
CREATE INDEX [IX_fk_Rs_IdR_IdR]
ON [dbo].[Reservations]
    ([Id_Room]);
GO

-- Creating foreign key on [Id_user] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [fk_Rs_IdR_IdU]
    FOREIGN KEY ([Id_user])
    REFERENCES [dbo].[Users]
        ([Id_user])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'fk_Rs_IdR_IdU'
CREATE INDEX [IX_fk_Rs_IdR_IdU]
ON [dbo].[Reservations]
    ([Id_user]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------