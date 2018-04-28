GO
CREATE PROCEDURE [dbo].[spAddUser]   
	@Fname       NVARCHAR (50),
	@Lname       NVARCHAR (50), 
	@PhoneNumber VARCHAR (30),  
	@Email       NVARCHAR (320),
	@Username    VARCHAR (50),  
	@Password    VARCHAR (50)
AS
	INSERT INTO Users(Fname, Lname, PhoneNumber, Email, Username, Password)
	VALUES (@Fname, @Lname,@PhoneNumber, @Email, @Username, @Password)
RETURN 0	

GO
CREATE PROCEDURE [dbo].[spAddClothingItem]
	@SubCatID    INT,          
	@UserID      INT,           
	@Name        VARCHAR(50),  
	@Description VARCHAR(MAX), 
	@Color       VARCHAR(50),  
	@Size        VARCHAR(50),  
	@Condition   VARCHAR(50),
	@Picture     NVARCHAR(MAX)
AS
	INSERT INTO ClothingItems(SubCatID, UserID, Name, Description, Color, Size, Condition, Picture)
	VALUES (@SubCatID, @UserID, @Name, @Description, @Color, @Size, @Condition, @Picture)
RETURN 0	

GO
CREATE PROCEDURE [dbo].[spGetUserID]
	@Username	VARCHAR(50)
AS
	SELECT UserID
	FROM Users
	WHERE Username = @Username
RETURN 0	