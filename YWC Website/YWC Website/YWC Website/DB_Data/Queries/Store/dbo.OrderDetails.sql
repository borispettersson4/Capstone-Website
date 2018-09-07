CREATE TABLE [dbo].[OrderDetails]
(
	[Id] INT NOT NULL , 
    [product_name] NCHAR(50) NOT NULL, 
    [product_price] NCHAR(50) NOT NULL, 
    [product_quantity] NCHAR(50) NOT NULL, 
    [product_image] NCHAR(50) NULL, 
    CONSTRAINT [PK_OrderDetails] PRIMARY KEY ([Id]) 
)
