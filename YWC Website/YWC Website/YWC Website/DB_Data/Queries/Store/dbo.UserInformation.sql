CREATE TABLE [dbo].[UserInformation] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [GUid]       NVARCHAR (50) NOT NULL,
    [FirstName]  NVARCHAR (50) NULL,
    [LastName]   NVARCHAR (50) NULL,
    [Address]    NCHAR (10)    NOT NULL,
    [PostalCode] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

