USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'project1')
BEGIN
	ALTER DATABASE [project1] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [project1] SET ONLINE;
	DROP DATABASE [project1];
END

GO

CREATE DATABASE [project1]
GO

USE [project1]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

CREATE TABLE Accounts (
	accountID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[userName] nvarchar(200) NOT NULL UNIQUE,
	[password] nvarchar(200) NOT NULL,
	[amount] money,
	[email] nvarchar(255),
	[role] int,
	[registerAt] date,
)
GO

CREATE TABLE Profiles (
	accountID INT UNIQUE NOT NULL,
	firstName nvarchar(50) NULL,
	lastName nvarchar(50) NULL,
	avatar nvarchar(200) null,
	country nvarchar(150) null,
	address nvarchar(150) null,
	birthday datetime null,
	phone nvarchar(15) null,
	gender bit null,
)
GO

ALTER TABLE Profiles
ADD constraint fk_profile_account foreign key (accountID) references Accounts(accountID)
GO

CREATE TABLE Categories (
	categoryID int identity(1, 1) not null,
	cid int,
	categoryName nvarchar(255) not null,
	describe nvarchar(255) null,
	primary key(categoryID),
	
)
GO

alter table Categories
add constraint pk_categories_categories foreign key (cid) references Categories(categoryID)
go

CREATE TABLE Producers (
	producerID int identity(1, 1) not null,
	producerName nvarchar(255) not null unique,
	country nvarchar(255),
	primary key(producerID)
)
GO

CREATE TABLE Products (
	productID int identity(1, 1) not null,
	categoryID int,
	producerID int,
	productName nvarchar(255) not null,
	price money,
	quantity int,	
	insurance int, /*tinh theo thang*/
	/*card nvarchar(255),*/
	primary key (productID),
	constraint fk_product_category foreign key (categoryID) references Categories(categoryID),
	constraint fk_product_producer foreign key (producerID) references Producers(producerID)
)
go
create table Productsize(
	productID int,
	size1 nvarchar(255) null,
	size2 nvarchar(255) null,
	size3 nvarchar(255) null,
	size4 nvarchar(255) null,
	primary key(productID),
	constraint fk_product_productsize foreign key (productID) references Products(productID)
)
GO

create table Productcolor(
	productID int,
	color1 nvarchar(255) null,
	color2 nvarchar(255) null,
	color3 nvarchar(255) null,
	color4 nvarchar(255) null,
	color5 nvarchar(255) null,
	primary key(productID),
	constraint fk_product_productcolor foreign key (productID) references Products(ProductID)
)

create table Productimage(
	productID int,
	image1 nvarchar(255) null,
	image2 nvarchar(255) null,
	image3 nvarchar(255) null,	
	image4 nvarchar(255) null,
	primary key(productID),
	constraint fk_product_productimage foreign key (productID) references Products(ProductID)
)
GO
create table review(
	productID int,
	accountID int,
	reviewID int identity(1, 1),
	content nvarchar(255),
	primary key(productID, accountID),
	constraint fk_account_review foreign key (accountID) references Accounts(accountID),
	constraint fk_product_review foreign key (productID) references Products(ProductID)
)
CREATE TABLE Orders (
	orderID int identity(1, 1) not null,
	accountID int,
	total money, /* tong so tien don */
	createAt date,
	deliveryAddress nvarchar(255),
	primary key (orderID),
	constraint fk_account_order foreign key (accountID) references Accounts(accountID)
)
GO

CREATE TABLE OrderDetail(
	orderID int,
	productID int,
	quantity int,
	price money, /* price cua san pham */
	primary key (orderID, productID),
	constraint fk_product_orderLine foreign key (productID) references Products(productID),
	constraint fk_orderLine_order foreign key (orderID) references Orders(orderID)
)
GO

/*account admin*/
INSERT INTO [dbo].[Accounts]([userName],[password],[amount],[email],[role],[registerAt])
VALUES('admin','123',null,'testzed920@gmail.com',1, getDate())
GO
INSERT INTO [dbo].[Profiles]([accountID],[firstName],[lastName],[avatar],[country] ,[address],[birthday],[phone],[gender])
VALUES(1,N'Lê',N'Thành',null,N'Việt Nam',N'Hà Nội',N'07-02-2002','0364716472',1)
GO

/*producer*/
INSERT INTO [dbo].[Producers]([producerName],[country])
VALUES('Dr.Martens','UK')

INSERT INTO [dbo].[Producers]([producerName],[country])
VALUES('COCO','Denmark')

INSERT INTO [dbo].[Producers]([producerName],[country])
VALUES('The Wolf',N'Việt Nam')

INSERT INTO [dbo].[Producers]([producerName],[country])
VALUES('JOG04',N'Việt Nam')

/*category*/
INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(null,N'Giày nam','For men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(null,N'Giày Nữ','For Women')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Chelsea Boot','For Men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Combat Boot','For Men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Derby','For Men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Harness Boot','For Men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Loafer','For Men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Oxford','For Men')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(1,N'Slipper','For Men')

/*giày n? */




INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(2,N'Chelsea Boot','For Women')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(2,N'Combat Boot','For Women')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(2,N'Derby','For Women')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(2,N'Loafer','For Women')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(2,N'Slipper','For Women')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(null,N'Jacket','Unisex')
INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(null,N'Shirt','Unisex')
INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(null,N'ToteBag','Unisex')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(17,N'Amano ToteBag','Unisex')

INSERT INTO [dbo].[Categories]([cid],[categoryName],[describe])
VALUES(17,N'S-Totebag','Unisex')


/*chelseaboot*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(3,3,'Chunky Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(1,'beige','black',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(1,'usercss/images/giaynam/chelseaboot/chunkychelseaboot-beige.png','usercss/images/giaynam/chelseaboot/chunkychelseaboot-black.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(1,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(3,2,'Classic Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(2,N'?en da l?n',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(2,'usercss/images/giaynam/chelseaboot/classicchelseaboot-dendalon.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(2,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(3,1,'Minimal Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(3,N'Black','Tan',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(3,'usercss/images/giaynam/chelseaboot/minimalchelseaboot-black.png','usercss/images/giaynam/chelseaboot/minimalchelseaboot-tan.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(3,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(3,4,'Walk Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(4,N'Black','Black Suede','Tan',null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(4,'usercss/images/giaynam/chelseaboot/walkchelseaboot-black.png','usercss/images/giaynam/chelseaboot/walkchelseaboot-blacksuede.png','usercss/images/giaynam/chelseaboot/walkchelseaboot-tan.png')
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(4,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(3,4,'Wild Walk Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(5,N'Black lizard',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(5,'usercss/images/giaynam/chelseaboot/wildwalkchelseaboot-blacklizard.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(5,'39','40','41','42')

/*combat boot*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(4,3,'Chunky Combat Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(6,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(6,'usercss/images/giaynam/combatboot/chunkycombatboot-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(6,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(4,2,'Marbe Chunky Combat Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(7,N'Beige',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(7,'usercss/images/giaynam/combatboot/marbechunkycombatboot-beige.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(7,'39','40','41','42')

/*derby*/

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,1,'4cm heel derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(8,N'Black lizard',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(8,'usercss/images/giaynam/derby/4cmheelderby-blacklizard.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(8,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,4,'Chunky Derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(9,N'Black','Black White',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(9,'usercss/images/giaynam/derby/chunkyderby-black.png','usercss/images/giaynam/derby/chunkyderby-blackwhite.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(9,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,2,'Chunky Derby 4 Eyelet',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(10,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(10,'usercss/images/giaynam/derby/chunkyderby4eyelet-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(10,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,1,'Marbe Chunky Derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(11,N'Beige',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(11,'usercss/images/giaynam/derby/marbechunkyderby-beige.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(11,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,3,'Mordern Brogue Derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(12,N'Black grain and white',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(12,'usercss/images/giaynam/derby/mordernbroguederby-blackgrainandwhite.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(12,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,4,'Mordern Derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(13,N'Black','Blackgrain',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(13,'usercss/images/giaynam/derby/mordernderby-black.png','usercss/images/giaynam/derby/mordernderby-blackgrain.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(13,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,3,'Mordern Eva',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(14,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(14,'usercss/images/giaynam/derby/morderneva-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(14,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(5,1,'Mordern Eva Brogue',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(15,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(15,'usercss/images/giaynam/derby/mordernevabrogue-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(15,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(6,3,'Harnessboot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(16,N'Black','Tobacco',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(16,'usercss/images/giaynam/harnessboot/harnessboot-black.png','usercss/images/giaynam/harnessboot/harnessboot-tobacco.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(16,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(7,4,'Chunky Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(17,N'Black','Black white',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(17,'usercss/images/giaynam/loafer/chunkyloafer-black.png','usercss/images/giaynam/loafer/chunkyloafer-blackwhite.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(17,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(7,2,'Minimal Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(18,N'Black','Tan',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(18,'usercss/images/giaynam/loafer/minimalloafer-black.png','usercss/images/giaynam/loafer/minimalloafer-tan.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(18,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(7,3,'Marbe Chunky Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(19,N'Beige',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(19,'usercss/images/giaynam/loafer/marbechunkyloafer-beige.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(19,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(7,2,'Mordern Eva Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(20,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(20,'usercss/images/giaynam/loafer/mordernevaloafer-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(20,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(7,4,'Penny Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(21,N'Black','Black white',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(21,'usercss/images/giaynam/loafer/pennyloafer-black.png','usercss/images/giaynam/loafer/pennyloafer-blackwhite.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(21,'39','40','41','42')


/*oxford*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(8,1,'Penny Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(22,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(22,'usercss/images/giaynam/oxford/oxfordblack.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(22,'39','40','41','42')

/*slipper*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(9,3,'Mordern S Slipper',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(23,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(23,'usercss/images/giaynam/slipper/mordernsslipper-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(23,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(9,1,'Slipper',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(24,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(24,'usercss/images/giaynam/slipper/slipper-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(24,'39','40','41','42')


/*n?*/
/*chelsea*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(10,2,'Lady Chunky Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(25,N'Beige','Black',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(25,'usercss/images/giaynu/chelseaboot/ladychunky-beige.png','usercss/images/giaynu/chelseaboot/ladychunky-black.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(25,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(10,4,'Lady Mordern Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(26,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(26,'usercss/images/giaynu/chelseaboot/ladymordern-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(26,'39','40','41','42')

/*combat boot*/

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(11,1,'Lady Chunky Chelsea Boot',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(27,N'Beige','Black',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(27,'usercss/images/giaynu/combatboot/ladychunky-beige.png','usercss/images/giaynu/combatboot/ladychunky-black.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(27,'39','40','41','42')

/*derby*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(12,3,'Lady Chunky Derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(28,N'Black White','Beige',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(28,'usercss/images/giaynu/derby/ladychunky-blackwhite.png','usercss/images/giaynu/derby/ladychunkybeige.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(28,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(12,4,'Lady Chunky 4 Eyelet Derby',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(29,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(29,'usercss/images/giaynu/derby/ladychunky4eyelet-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(29,'39','40','41','42')

/*loafer*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(13,2,'Lady Chunky Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(30,N'Black','Black White',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(30,'usercss/images/giaynu/loafer/ladychunky-black.png','usercss/images/giaynu/loafer/ladychunky-blackwhite.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(30,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(13,4,'Lady Marbe Chunky Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(31,N'Beige',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(31,'usercss/images/giaynu/loafer/ladymarbechunky-beige.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(31,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(13,3,'Lady Mordern Eva Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(32,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(32,'usercss/images/giaynu/loafer/ladymorderneva-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(32,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(13,2,'Lady Penny Loafer',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(33,N'Black','Black White',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(33,'usercss/images/giaynu/loafer/ladypenny-black.png','usercss/images/giaynu/loafer/ladypenny-blackwhite.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(33,'39','40','41','42')

/*slipper*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(14,1,'Lady Slipper',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(34,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(34,'usercss/images/giaynu/slipper/lady-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(34,'39','40','41','42')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(14,1,'Lady Mordern S Slipper',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(35,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(35,'usercss/images/giaynu/slipper/ladymordernsslipper-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(35,'39','40','41','42')

/*jacket*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(15,3,'Classic Jacket',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(36,N'Black',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(36,'usercss/images/jacket/classic-black.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(36,'S','M','L','XL')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(15,3,'Varsity',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(37,N'Red',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(37,'usercss/images/jacket/varsity-red.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(37,'S','M','L','XL')

/*shirt*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(16,3,'Classic Shirt',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(38,N'Grey','Light Brown',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(38,'usercss/images/shirt/shirtgrey.png','usercss/images/shirt/shirtlightbrown.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(38,'S','M','L','XL')

/*totebag*/
INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(18,3,'Alinsac Totebag',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(39,N'Beige','Plat',null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(39,'usercss/images/totebag/amano/alinsacbeige.png','usercss/images/totebag/amano/alinsacplat.png',null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(39,'S','M','L','XL')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(18,3,'Crossic Petit Totebag',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(40,N'Plat',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(40,'usercss/images/totebag/amano/crossicpetitplat.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(40,'S','M','L','XL')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(18,3,'Ressy Pettit Totebag',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(41,N'Beige',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(41,'usercss/images/totebag/amano/ressypetitbeige.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(41,'S','M','L','XL')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(18,3,'Ressy Pettit Totebag',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(42,N'Beige',null,null,null,null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3])
VALUES(42,'usercss/images/totebag/amano/ressypetitbeige.png',null,null)
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(42,'S','M','L','XL')

INSERT INTO [dbo].[Products]([categoryID],[producerID],[productName],[price],[quantity],[insurance])
VALUES(19,3,'S Collection Totebag',2000000,5,6)
INSERT INTO [dbo].[Productcolor]([productID],[color1],[color2],[color3],[color4],[color5])
VALUES(43,N'Black','Military Green','Orange','Whitecream',null)
INSERT INTO [dbo].[Productimage]([productID],[image1],[image2],[image3],[image4])
VALUES(43,'usercss/images/totebag/s/s-totebag-militarygreen.png','usercss/images/totebag/s/s-totebag-militarygreen.png','usercss/images/totebag/s/s-totebag-orange.png','usercss/images/totebag/s/s-totebag-whitecream.png')
INSERT INTO [dbo].[Productsize]([productID],[size1],[size2],[size3],[size4])
VALUES(43,'S','M','L','XL')

GO



