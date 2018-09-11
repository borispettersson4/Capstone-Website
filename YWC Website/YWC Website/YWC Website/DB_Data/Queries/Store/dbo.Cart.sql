CREATE TABLE [dbo].[Cart] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [ClientID]      INT NOT NULL,
    [ProductID]     INT           NOT NULL,
    [Amount]        INT           NOT NULL,
    [DatePurchased] DATETIME      DEFAULT (getdate()) NULL,
    [IsInCart]      BIT           NOT NULL,
    CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Cart_Product] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Product] ([Id]), 
    CONSTRAINT [FK_Cart_UserInformation] FOREIGN KEY ([ClientID]) REFERENCES [UserInformation]([id])
);

