CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [TypeId] INT NOT NULL,
    [Name] VARCHAR(100) NULL DEFAULT Unknown, 
    [Price] FLOAT NULL DEFAULT 0.00, 
    [Description] TEXT NULL DEFAULT Unknown, 
    [Image] VARCHAR(150) NULL
)


