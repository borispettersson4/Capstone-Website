CREATE TABLE [dbo].[OrderDetails] (
    [Id]            INT NOT NULL,
    [ClientID]      NVARCHAR(50)         NOT NULL,
    [DatePurchased] DATETIME    NULL,
    [isSent]        BIT         DEFAULT ((0)) NOT NULL,
    [ClientName]    NCHAR (100) NULL,
    [ClientAddress] NCHAR (10)  NULL,
    CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
);

