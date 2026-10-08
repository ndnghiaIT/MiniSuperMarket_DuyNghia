/* INSTANT FOOD - SQL database generated from the Visual Studio project */
/* Target SQL Server: the project is configured for the user's SQL Server login (sa). */
USE [master];
GO
IF DB_ID(N'InstantFoodDb') IS NOT NULL
BEGIN
    ALTER DATABASE [InstantFoodDb] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [InstantFoodDb];
END
GO
CREATE DATABASE [InstantFoodDb];
GO
USE [InstantFoodDb];
GO

CREATE TABLE [dbo].[Categories](
    [CategoryId] INT IDENTITY(1,1) NOT NULL,
    [CategoryName] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(255) NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([CategoryId])
);
GO

CREATE TABLE [dbo].[Products](
    [ProductId] INT IDENTITY(1,1) NOT NULL,
    [Barcode] NVARCHAR(50) NOT NULL,
    [ProductName] NVARCHAR(200) NOT NULL,
    [Price] DECIMAL(18,2) NOT NULL,
    [StockQuantity] INT NOT NULL,
    [CategoryId] INT NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY ([ProductId]),
    CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories]([CategoryId]) ON DELETE CASCADE
);
GO
CREATE INDEX [IX_Products_CategoryId] ON [dbo].[Products]([CategoryId]);
GO

CREATE TABLE [dbo].[Customers](
    [CustomerId] INT IDENTITY(1,1) NOT NULL,
    [CustomerName] NVARCHAR(100) NOT NULL,
    [PhoneNumber] VARCHAR(15) NOT NULL,
    [Address] NVARCHAR(200) NULL,
    [RewardPoints] INT NOT NULL CONSTRAINT [DF_Customers_RewardPoints] DEFAULT(0),
    [MembershipRank] NVARCHAR(50) NOT NULL CONSTRAINT [DF_Customers_MembershipRank] DEFAULT(N'Chuẩn'),
    CONSTRAINT [PK_Customers] PRIMARY KEY ([CustomerId])
);
GO

SET IDENTITY_INSERT [dbo].[Categories] ON;
GO
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (1,N'Bánh quy tuổi thơ',N'Các loại bánh quy quen thuộc gắn liền với tuổi thơ');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (2,N'Snack',N'Snack khoai tây, snack bắp và các loại snack giòn');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (3,N'Kẹo',N'Kẹo dẻo, kẹo cứng và các loại kẹo tuổi thơ');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (4,N'Bánh xốp',N'Bánh xốp phủ kem và bánh xốp nhiều hương vị');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (5,N'Bánh que',N'Các loại bánh que và bánh que phủ socola');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (6,N'Bánh gạo',N'Bánh gạo giòn và các sản phẩm từ gạo');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (7,N'Bắp rang',N'Bắp rang bơ và bắp rang nhiều hương vị');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (8,N'Khô & Đồ sấy',N'Cá khô, bò khô, trái cây sấy và đồ ăn khô');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (9,N'Rong biển',N'Rong biển ăn liền và snack rong biển');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (10,N'Đậu phộng & Hạt',N'Đậu phộng, hạt hướng dương và các loại hạt');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (11,N'Mì ăn liền',N'Mì gói và mì ly ăn liền');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (12,N'Xúc xích',N'Xúc xích ăn liền và xúc xích tiệt trùng');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (13,N'Cá viên & Đồ chiên',N'Các món ăn vặt chế biến sẵn');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (14,N'Bánh mì',N'Bánh mì sandwich và bánh mì ăn sáng');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (15,N'Bánh ngọt',N'Bánh bông lan, bánh kem và bánh ngọt');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (16,N'Socola',N'Socola thanh, socola viên và kẹo socola');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (17,N'Kem',N'Kem cây và kem hộp');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (18,N'Nước ngọt',N'Coca Cola, Pepsi, 7Up và các loại nước ngọt');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (19,N'Trà đóng chai',N'Trà xanh, trà đào và trà trái cây');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (20,N'Nước trái cây',N'Nước cam, nước táo và các loại nước trái cây');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (21,N'Sữa',N'Sữa hộp và các sản phẩm từ sữa');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (22,N'Nước tăng lực',N'Các loại nước tăng lực');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (23,N'Combo Snack Box',N'Combo nhiều món ăn vặt dành cho khách hàng');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (24,N'Đồ ăn vặt tuổi thơ',N'Các món ăn vặt quen thuộc của thế hệ 8x, 9x');
INSERT INTO [dbo].[Categories] ([CategoryId],[CategoryName],[Description]) VALUES (25,N'Sản phẩm đặc biệt',N'Các sản phẩm mới và sản phẩm bán theo mùa');
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF;
GO
SET IDENTITY_INSERT [dbo].[Products] ON;
GO
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (1,N'893100100001',1,18000,N'Bánh Oreo vị socola 133g',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (2,N'893100100002',1,35000,N'Bánh quy Cosy Marie 300g',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (3,N'893100100003',2,15000,N'Snack khoai tây Lays 68g',80);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (4,N'893100100004',2,12000,N'Snack Oishi tôm cay 75g',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (5,N'893100100005',3,10000,N'Kẹo dẻo Chupa Chups',70);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (6,N'893100100006',3,8000,N'Kẹo Dynamite vị bạc hà',90);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (7,N'893100100007',4,12000,N'Bánh xốp kem socola',60);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (8,N'893100100008',4,12000,N'Bánh xốp kem dâu',60);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (9,N'893100100009',5,15000,N'Bánh que socola',70);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (10,N'893100100010',5,15000,N'Bánh que phô mai',60);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (11,N'893100100011',6,18000,N'Bánh gạo One One vị ngọt',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (12,N'893100100012',6,20000,N'Bánh gạo cay',45);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (13,N'893100100013',7,25000,N'Bắp rang bơ',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (14,N'893100100014',7,28000,N'Bắp rang caramel',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (15,N'893100100015',8,45000,N'Khô bò sợi 50g',35);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (16,N'893100100016',8,35000,N'Xoài sấy dẻo 100g',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (17,N'893100100017',9,25000,N'Rong biển ăn liền Tao Kae Noi',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (18,N'893100100018',9,18000,N'Snack rong biển vị truyền thống',60);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (19,N'893100100019',10,20000,N'Đậu phộng da cá 100g',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (20,N'893100100020',10,15000,N'Hạt hướng dương vị truyền thống',60);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (21,N'893100100021',11,5000,N'Mì Hảo Hảo tôm chua cay',200);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (22,N'893100100022',11,10000,N'Mì Omachi sườn hầm ngũ quả',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (23,N'893100100023',12,32000,N'Xúc xích tiệt trùng Vissan',70);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (24,N'893100100024',12,35000,N'Xúc xích phô mai',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (25,N'893100100025',13,45000,N'Cá viên chiên 500g',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (26,N'893100100026',13,55000,N'Bò viên 500g',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (27,N'893100100027',14,28000,N'Bánh mì sandwich 400g',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (28,N'893100100028',14,15000,N'Bánh mì ngọt nhân kem',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (29,N'893100100029',15,45000,N'Bánh bông lan kem 300g',35);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (30,N'893100100030',15,30000,N'Bánh bông lan cuộn',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (31,N'893100100031',16,25000,N'Socola thanh KitKat',50);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (32,N'893100100032',16,35000,N'Socola thanh Hershey''s',40);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (33,N'893100100033',17,12000,N'Kem Merino socola',80);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (34,N'893100100034',17,15000,N'Kem Celano vani',70);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (35,N'893100100035',18,10000,N'Coca Cola lon 330ml',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (36,N'893100100036',18,10000,N'Pepsi lon 330ml',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (37,N'893100100037',19,10000,N'Trà xanh C2 455ml',90);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (38,N'893100100038',19,12000,N'Trà đào Tea+ 455ml',80);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (39,N'893100100039',20,12000,N'Nước cam Twister 455ml',80);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (40,N'893100100040',20,12000,N'Nước táo 455ml',70);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (41,N'893100100041',21,8000,N'Sữa tươi Vinamilk 180ml',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (42,N'893100100042',21,9000,N'Sữa chocolate hộp 180ml',90);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (43,N'893100100043',22,12000,N'Red Bull 250ml',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (44,N'893100100044',22,10000,N'Sting dâu 330ml',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (45,N'893100100045',23,50000,N'Combo Snack Box Mini',30);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (46,N'893100100046',23,100000,N'Combo Snack Box Tuổi Thơ',25);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (47,N'893100100047',24,5000,N'Kẹo kéo tuổi thơ',100);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (48,N'893100100048',24,10000,N'Bánh đồng tiền tuổi thơ',80);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (49,N'893100100049',25,150000,N'Hộp quà Snack Box đặc biệt',20);
INSERT INTO [dbo].[Products] ([ProductId],[Barcode],[CategoryId],[Price],[ProductName],[StockQuantity]) VALUES (50,N'893100100050',25,200000,N'Combo Party Snack Box',15);
GO
SET IDENTITY_INSERT [dbo].[Products] OFF;
GO
SET IDENTITY_INSERT [dbo].[Customers] ON;
GO
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (1,N'Nguyễn Văn An','0901234567',N'12 Lê Lợi, Q.1, TP.HCM',150,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (2,N'Trần Thị Bình','0912345678',N'45 Nguyễn Trãi, Q.5, TP.HCM',40,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (3,N'Lê Hoàng Cường','0987654321',N'78 CMT8, Q.3, TP.HCM',0,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (4,N'Phạm Minh Đức','0901122334',N'23 Hai Bà Trưng, Q.1, TP.HCM',85,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (5,N'Võ Thị Hạnh','0912233445',N'56 Phan Văn Trị, Q.5, TP.HCM',210,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (6,N'Đặng Quốc Huy','0983344556',N'89 Điện Biên Phủ, Q. Bình Thạnh, TP.HCM',25,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (7,N'Bùi Ngọc Lan','0904455667',N'34 Võ Văn Tần, Q.3, TP.HCM',120,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (8,N'Huỳnh Thanh Nam','0915566778',N'67 Lý Thường Kiệt, Q.10, TP.HCM',60,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (9,N'Ngô Thị Mai','0986677889',N'91 Nguyễn Văn Cừ, Q.5, TP.HCM',15,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (10,N'Đỗ Minh Quân','0907788990',N'15 Trường Chinh, Q. Tân Bình, TP.HCM',175,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (11,N'Phan Thị Thảo','0918899001',N'42 Nguyễn Đình Chiểu, Q.3, TP.HCM',95,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (12,N'Trương Hoàng Long','0989900112',N'76 Cộng Hòa, Q. Tân Bình, TP.HCM',5,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (13,N'Lý Mỹ Linh','0901011223',N'28 Nam Kỳ Khởi Nghĩa, Q.1, TP.HCM',250,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (14,N'Mai Văn Khoa','0912122334',N'53 Hoàng Văn Thụ, Q. Phú Nhuận, TP.HCM',70,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (15,N'Nguyễn Thị Yến','0983233445',N'84 Nguyễn Kiệm, Q. Gò Vấp, TP.HCM',35,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (16,N'Phạm Tuấn Anh','0904344556',N'19 Xô Viết Nghệ Tĩnh, Q. Bình Thạnh, TP.HCM',135,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (17,N'Trần Ngọc Diệp','0915455667',N'62 Nguyễn Oanh, Q. Gò Vấp, TP.HCM',55,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (18,N'Lê Minh Tâm','0986566778',N'37 Lạc Long Quân, Q.11, TP.HCM',10,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (19,N'Võ Quốc Thắng','0907677889',N'48 Nguyễn Thị Minh Khai, Q.1, TP.HCM',190,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (20,N'Đặng Thị Kim','0918788990',N'72 Tô Hiến Thành, Q.10, TP.HCM',80,N'Bạc');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (21,N'Bùi Thanh Tùng','0989899001',N'16 Quang Trung, Q. Gò Vấp, TP.HCM',20,N'Chuẩn');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (22,N'Huỳnh Ngọc Anh','0900900112',N'39 Pasteur, Q.1, TP.HCM',160,N'Vàng');
INSERT INTO [dbo].[Customers] ([CustomerId],[CustomerName],[PhoneNumber],[Address],[RewardPoints],[MembershipRank]) VALUES (23,N'Ngô Minh Châu','0911011223',N'55 Lê Văn Sỹ, Q.3, TP.HCM',45,N'Bạc');
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF;
GO

/* EF Core migration history: the project already contains migrations. */
CREATE TABLE [dbo].[__EFMigrationsHistory](
    [MigrationId] NVARCHAR(150) NOT NULL,
    [ProductVersion] NVARCHAR(32) NOT NULL,
    CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
);
GO
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId],[ProductVersion]) VALUES
(N'20260926121519_MiniSupermarket',N'8.0.31'),
(N'20260926121715_MiniSupermarkt',N'8.0.31'),
(N'20260926123009_NguyenLeChiCong_212410094',N'8.0.31'),
(N'20261003064642_AddCustomersTable',N'8.0.31'),
(N'20261003111631_j',N'8.0.31'),
(N'20261003112237_n',N'8.0.31'),
(N'20261003112435_a',N'8.0.31'),
(N'20261003113351_h',N'8.0.31'),
(N'20261003113935_q',N'8.0.31'),
(N'20261003114255_f',N'8.0.31'),
(N'20261003114303_s',N'8.0.31');
GO

/* Kiểm tra */
SELECT COUNT(*) AS SoDanhMuc FROM dbo.Categories;
SELECT COUNT(*) AS SoSanPham FROM dbo.Products;
SELECT COUNT(*) AS SoKhachHang FROM dbo.Customers;
SELECT TOP 10 p.ProductId,p.ProductName,p.Price,p.StockQuantity,c.CategoryName
FROM dbo.Products p INNER JOIN dbo.Categories c ON p.CategoryId=c.CategoryId
ORDER BY p.ProductId;
GO

