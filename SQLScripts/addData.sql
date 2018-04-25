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
    
    INSERT INTO ClothingItems(SubCatID,UserID,Name,Description,Color,Size,Condition,Picture)
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
	  'https://images.urbanoutfitters.com/is/image/UrbanOutfitters/26847640_016_d?$medium$&qlt=80&fit=constrain')
