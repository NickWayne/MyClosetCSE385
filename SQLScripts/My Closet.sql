USE master
GO
/****** Object:  Database MyCloset     ******/
IF DB_ID('MyCloset') IS NOT NULL
	DROP DATABASE MyCloset
GO

CREATE DATABASE MyCloset
GO

USE MyCloset
GO


/******* Object: Table Users ***********/
CREATE TABLE [Users] (
[UserID]		INTEGER		IDENTITY(1,1)	PRIMARY KEY	NOT NULL, 	
[Fname]			NVARCHAR(50)	NOT NULL,
[Lname]			NVARCHAR(50)	NOT NULL,
[PhoneNumber]	VARCHAR(30)		NOT NULL,
[Email]			NVARCHAR(320)	NOT NULL,
[Username]		VARCHAR(50)		NOT NULL,
[Password]		VARCHAR(50)
)
GO

/******* Object: Table Clothing Categories ***********/
CREATE TABLE [ClothingCategories] (
[CategoryID]	INTEGER		IDENTITY(1,1)	PRIMARY KEY	NOT NULL,
[Name]			VARCHAR(50)	NOT NULL
)
GO

/******* Object: Table Sub categories ***********/
CREATE TABLE [ClothingSubCategories] (
[SubCatID]		INTEGER		IDENTITY(1,1)			PRIMARY KEY	NOT NULL,
[CategoryID]	INTEGER		FOREIGN KEY REFERENCES	ClothingCategories(CategoryID),
[Name]			VARCHAR(50)	NOT NULL
)
GO

/******* Object: Table clothing items ***********/
CREATE TABLE [ClothingItems] (
[ClothingID]	INTEGER			IDENTITY(1,1)	PRIMARY KEY	NOT NULL,
[SubCatID]		INTEGER			FOREIGN KEY REFERENCES ClothingSubCategories(SubCatID),
[UserID]		INTEGER			FOREIGN KEY REFERENCES Users(UserID),
[Name]			VARCHAR(50)		NOT NULL,
[Description]	VARCHAR(MAX)	NOT NULL,
[Color]			VARCHAR(50)		NOT NULL,
[Size]			VARCHAR(50)		NOT NULL,
[Condition]		VARCHAR(50)		NOT	NULL,
[Picture]		NVARCHAR(MAX)	NOT	NULL
)
GO

/******* Object: Table user ratings ***********/
CREATE TABLE [UserRatings] (
[UserID]		INTEGER			FOREIGN KEY REFERENCES Users(UserID),
[ClothingID]	INTEGER			FOREIGN KEY REFERENCES ClothingItems(ClothingID),
[Rating]		INTEGER			NOT NULL,
[Description]	VARCHAR(200)	Default(''),
PRIMARY KEY (UserID,ClothingID)

)
GO

--###################################### Inserting Data ############################################

--Inserting data into all the tables

INSERT INTO Users (FName, LName, PhoneNumber, Email, Username, [Password]) VALUES
    ('Alyssa','Melendez','440-281-6737','melendak@miamioh.edu', 'AlyssaKirstine','pass123'),
    ('Colin','Evans','614-425-4897','evansct@miamioh.edu','ColinTroy','alyssaismyfavorite'),
    ('Nick','Wayne','513-504-2402','waynens@miamioh.edu','NickSteven','pass321'),
    ('Alex','Kwon','513-795-3644','kwonw@miamioh.edu','AlexNull','necnyc'),
    ('Yichen','Wang','513-593-5726','wangy99@miamioh.edu','YichenNull','321ssap');
GO

INSERT INTO ClothingCategories ([Name]) VALUES
    ('Women Summer'),
    ('Women Winter'),
    ('Men Summer'),
    ('Men Winter');
GO

INSERT INTO ClothingSubCategories (CategoryID, [Name]) VALUES
    (1, 'Skirts'),
    (1, 'Dresses'),
    (1, 'Tank Tops'),
    (1, 'Shirts'),
    (1, 'Bathing Suits'),
    (1, 'Shorts'),
    (1, 'Sandals'),
    (2, 'Pants'),
    (2, 'Leggings'),
    (2, 'Coats'),
    (2, 'Boots'),
    (2, 'Hats'),
    (2, 'Sweaters'),
    (3, 'Tank Tops'),
    (3, 'Shirts'),
    (3, 'Bathing Suits'),
    (3, 'Shorts'),
    (3, 'Sandals'),
    (4, 'Pants'),
    (4, 'Coats'),
    (4, 'Boots'),
    (4, 'Hats'),
    (4, 'Sweaters');   
GO
    
INSERT INTO ClothingItems(SubCatID,UserID,Name,Description,Color,Size,[Condition],Picture)
VALUES(2, 1, 'Button-Down Denim Mini Dress',
	  'Built from a washed denim in a button-down construction with a defined waist. ',
	  'Green','6','brand new',
	  'https://images.urbanoutfitters.com/is/image/UrbanOutfitters/45942638_030_b?$xlarge$&hei=900&qlt=80&fit=constrain'),

	  (14, 2,'U Can’t Touch This Tee',
	  'Don’t be grabby in this GMT t-shirt. Cut in a standard fit and finished with a banded crew neck.',
	  'white','M','brand new',
	  'https://images.urbanoutfitters.com/is/image/UrbanOutfitters/44614741_010_d?$medium$&qlt=80&fit=constrain'),

	  (8, 5 ,'Wide-Leg Cropped Pant',
	  ' Made from a super soft yet structured cotton in a relaxed-fit that’s topped with a paperbag ',
	  'Pink','8','brand new',
	  'https://images.urbanoutfitters.com/is/image/UrbanOutfitters/45598331_066_b?$medium$&qlt=80&fit=constrain'),

	  (10, 4, 'Timberland boots',
	  'Original + iconic wheat boot from the experts at Timberland. ',
	  'yellow','9','brand new',
	  'https://images.urbanoutfitters.com/is/image/UrbanOutfitters/26847640_016_d?$medium$&qlt=80&fit=constrain');
GO

INSERT INTO UserRatings (UserID, ClothingID, Rating, [Description]) VALUES
	(1,1,5,'Love it!'),
	(2,1,7,'Is this for sale by chance?'),
	(2,3, 9, 'This is such a great color.'),
	(3,4,10,'Where can I get this?'),
	(4,2,7,'This is one of my favorite items you own.');
GO

--###################################### Stored Procedures ####################################################

--This allows us to add new users to the database
--Returns 1 if the user is successfully added, 0 if there is an error
CREATE PROCEDURE [dbo].[spAddUser]   
	@Fname       NVARCHAR (50),
	@Lname       NVARCHAR (50), 
	@PhoneNumber VARCHAR (30),  
	@Email       NVARCHAR (320),
	@Username    VARCHAR (50),  
	@Password    VARCHAR (50)
AS
	IF NOT EXISTS(SELECT NULL FROM Users WHERE Email = @Email OR Username = @Username) BEGIN
		INSERT INTO Users ([Fname], [Lname], [PhoneNumber],	[Email], [Username], [Password]) VALUES
			(@Fname, @Lname, @PhoneNumber, @Email, @Username, @Password)
		SELECT [UserID] = @@IDENTITY;
		RETURN 1
	END ELSE BEGIN
		RETURN 0
	END
GO

--This allows us (users really) to add new articles of clothes into the database
--Returns true (1) if the article is successfully added (which should be always)
CREATE PROCEDURE [dbo].[spAddClothingItem]
	@SubCatID    INT,          
	@UserID      INT,           
	@Name        VARCHAR(50),  
	@Description VARCHAR(MAX), 
	@Color       VARCHAR(50),  
	@Size        VARCHAR(50),  
	@Condition   VARCHAR(50),
	@Picture     NVARCHAR(100)
AS
	INSERT INTO ClothingItems([SubCatID], [UserID], [Name], [Description], [Color], [Size], [Condition], [Picture])
	VALUES (@SubCatID, @UserID, @Name, @Description, @Color, @Size, @Condition, @Picture)
RETURN 1
GO

-- This allows us to get a userID for a specific username, which will allow us to
-- use it for other procedures later
CREATE PROCEDURE [dbo].[spGetUserID]
	@Username	VARCHAR(50)
AS
	SELECT UserID
	FROM Users
	WHERE Username = @Username
RETURN 0

GO

CREATE PROCEDURE [dbo].[spLogin]
	@Username    VARCHAR (50),  
	@Password    VARCHAR (50)
AS
	SELECT UserID
	FROM Users
	WHERE Username = @Username AND Password = @Password
RETURN 0

GO

--This is what is called when we want to delete an article of clothing from the 
--database. Returns 1 (true) if successfully deleted, 0 otherwise
CREATE PROCEDURE [dbo].[spDeleteClothingItem]
	@ClothingID	 INT,
	@UserID		 INT
AS
	IF EXISTS (SELECT NULL FROM ClothingItems WHERE ClothingID = @ClothingID) 
	AND EXISTS (SELECT NULL FROM Users WHERE UserID = @UserID) BEGIN
	
	DELETE FROM UserRatings WHERE ClothingID = @ClothingID
	DELETE FROM ClothingItems WHERE ClothingID = @ClothingID
	return 1
	END ELSE return 0

GO 



--This procedure will allow for the adding of a rating on an article of clothing
CREATE PROCEDURE [dbo].[spAddRating]
    @UserID         INT,
    @ClothingID     INT,
    @Rating         INT,
    @Description    VARCHAR(200)
AS
	IF NOT EXISTS ( SELECT NULL
					FROM UserRatings
					WHERE	UserID = @UserID AND
							ClothingID = @ClothingID
					) BEGIN
        INSERT INTO UserRatings (UserID, ClothingID, Rating, [Description])
        VALUES (@UserID, @ClothingID, @Rating, @Description)
	END ELSE BEGIN
		RETURN 0;
	END
RETURN 1

GO
-- This procedure will return rating info for one clothing item
CREATE PROCEDURE [dbo].[spGetRating]
	@ClothingID INT
AS
	SELECT u.Fname,u.Lname, ur.Rating, ur.Description
	FROM UserRatings ur 
		 JOIN ClothingItems ci ON ur.ClothingID = ci.ClothingID 
		 JOIN Users u ON u.UserID = ur.UserID
	WHERE ur.ClothingID = @ClothingID
GO

--This will return all categories
CREATE PROCEDURE [dbo].[spGetCategories]
AS
    SELECT CategoryID, Name
    FROM ClothingCategories
RETURN 1
GO

--This will return all subcategories within a category
CREATE PROCEDURE [dbo].[spGetSubCategories]
    @CategoryID INT
AS
    SELECT SubCatID, Name
    FROM ClothingSubCategories
    WHERE CategoryID = @CategoryID
RETURN 1
GO
    
-- get all clothing items
CREATE PROCEDURE [dbo].[spGetAllClothing]
AS
    SELECT  i.ClothingID,
			[subCat] = c.Name,
			[cat] = ct.Name,
            i.Name,
            i.Description,
            i.Picture
    FROM ClothingItems i
        JOIN ClothingSubCategories c
			ON (c.SubCatID = i.SubCatID)
		JOIN ClothingCategories ct
			ON (ct.CategoryID = c.CategoryID)
GO

-- get user's clothing items
CREATE PROCEDURE [dbo].[spGetUserClothing]
	@UserID INT
AS
    SELECT  i.ClothingID,
			c.CategoryID,
			i.SubCatID,
            i.UserID,
			i.Name,
            i.Description,
            i.Picture
    FROM ClothingItems i
		JOIN ClothingSubCategories c
			ON (c.SubCatID = i.SubCatID)
	WHERE i.UserID = @UserID
GO

-- get clothing item
CREATE PROCEDURE [dbo].[spGetSpecificClothing]
	@ClothingID INT
AS
    SELECT  i.ClothingID,
			u.Fname,
			u.Lname,
			[subCat] = c.Name,
			[cat] = ct.Name,
            i.UserID,
			i.Name,
            i.Description,
			i.Color,
			i.Size,
			i.Condition,
            i.Picture
    FROM ClothingItems i
		JOIN ClothingSubCategories c
			ON (c.SubCatID = i.SubCatID)
		JOIN ClothingCategories ct
			ON (ct.CategoryID = c.CategoryID)
		JOIN Users u
			ON (u.userID = i.UserID)
	WHERE i.ClothingID = @ClothingID
GO