CREATE TABLE [dbo].Customers
(
    Customer_id INT IDENTITY(1000, 1) PRIMARY KEY,
    First_Name nvarchar(100) not null,
    Last_Name nvarchar(100) not null,
    Street nvarchar(100) not null,
    City nvarchar(100) not null,
    State nvarchar (100) not null,
    Zip_Code INT not null,
    Phone bigint not null,
    Email NVARCHAR(100) not null
)
GO
J
ALTER TABLE [dbo].CustomerInfo ALTER column Phone BIGINT
SELECT * FROM Customers

INSERT INTO [dbo].[Customers]
(
 [First_Name],[Last_Name],[Street],[City], [State],[Zip_Code],[Phone],[Email]
)
VALUES
(
    'Jeff', 'Bezos', '410 Terry Avenue','Seattle','WA', 98109, 2062661000, 'jeff@amazon.com'
),
(
    'Elon','Musk', '3500 Deer Creek Road', 'Palo Alto', 'CA', 94304, 18885183752, 'elonmusk@tesla.com'
),
(
    'Bill','Gates','23350 Windermere Lane', 'Seattle', 'WA', 98102, 2067093100, 'billgates@microsoft.com'
),
(
   'Mark', 'Cuban', '500 S Buena Vista Street', 'Burbank', 'CA', 91521, 2146126002, 'markcuban@dallasmavericks.com' 
),
(
   'Mark', 'Zuckerberg', '1456 Edgewood Drive', 'Palo Alto', 'CA', 94301, 6505434800, 'zuck@fb.com'
)
Go


CREATE TABLE [dbo].Billing
(
    Account_id INT IDENTITY(210, 1) PRIMARY KEY,
    Customer_id INT not null,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id), 
    Card_Type nvarchar (45) not null,
    Card_Number nvarchar (45) not null,
    Exp_Month nvarchar (45) not null,
    Exp_Year int not null,
    Security_Code INT not null 
    
)
GO
SELECT * FROM Billing
drop table billing
--Want to use values (Encryptbypassphrase('secretcode','Card Number')) to mask the CC number.
INSERT INTO [dbo].Billing
(
 [Customer_id],[Card_Type],[Card_Number],[Exp_Month], [Exp_Year],[Security_Code]
)
VALUES
(
    1000, 'Visa', 4342815494560001,'January', 2016, 873
),
(
    1001, 'Visa', 4310740958948962, 'May', 2017, 663
),
(
    1002, 'Mastercard', 5801896484015993, 'June', 2016, 104
),
(
    1003, 'Mastercard', 5113446685247763, 'November', 2019, 871
),
(
    1004,'Visa', 4715890074018585, 'February', 2018, 473
)    
Go
CREATE TABLE [dbo].Vendors

(
    Store_ID INT IDENTITY (1,10) PRIMARY KEY,
    Store_Name NVARCHAR (100) NOT NULL,
    Address NVARCHAR (100) NOT NULL,
    City NVARCHAR (100) NOT NULL,
    State NVARCHAR (5) NOT NULL,
    Zip_Code INT NOT NULL,
    Commission_Rate DECIMAL(10,2) NOT NULL,
);
GO
SELECT * FROM Vendors
INSERT INTO [dbo].Vendors
(
[Store_Name],[Address],[City],[State],[Zip_Code],[Commission_Rate]
)
VALUES
(
  'Pega','123 Pega Platform Way','Philadelphia','PA',12345,.20  
);
GO


CREATE TABLE [dbo].Orders
ALTER TABLE [dbo].Orders ALTER column Total DECIMAL(10,2)
SELECT * FROM Orders
DELETE FROM Orders Where Customer_id=1000
SELECT * FROM Orders Where Customer_id=
(
    Order_Number INT PRIMARY KEY not null,
    Customer_id INT not null,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id), 
    Order_Date DATETIME not null,
    Total INT not null,

    
)
Go
select * from Ordered_Items
ALTER TABLE [dbo].Ordered_Items ALTER column Total DECIMAL(10,2)
DELETE FROM Ordered_Items Where Order_Number=527958
CREATE TABLE [dbo].[Ordered_Items](
	[Order_Number] [int] NOT NULL,
	[Product] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO