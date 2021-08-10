USE [master]
GO
/****** Object:  Database [PRJ301_Assignment_Group#3]    Script Date: 10/08/2021 10:53:26 CH ******/
CREATE DATABASE [PRJ301_Assignment_Group#3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment_Group#3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PRJ301_Assignment_Group#3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_Group#3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PRJ301_Assignment_Group#3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment_Group#3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment_Group#3]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PRJ301_Assignment_Group#3]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/08/2021 10:53:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [nvarchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/08/2021 10:53:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [nvarchar](10) NOT NULL,
	[orderID] [nvarchar](10) NOT NULL,
	[productID] [nvarchar](10) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/08/2021 10:53:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [nvarchar](10) NOT NULL,
	[userID] [nvarchar](10) NOT NULL,
	[date] [date] NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/08/2021 10:53:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [nvarchar](10) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[quantity] [int] NOT NULL,
	[shortDescription] [nvarchar](500) NULL,
	[productDescription] [nvarchar](100) NULL,
	[imageUrl] [nvarchar](100) NULL,
	[categoryID] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/08/2021 10:53:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/08/2021 10:53:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](10) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'AP', N'APPLE')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'OP', N'OPPO')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'SS', N'SAMSUNG')
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (N'XM', N'XIAOMI')
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD01', N'O01', N'XM04', 6990000, 2)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD02', N'O02', N'XM04', 32490000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD03', N'O03', N'XM04', 4490000, 2)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD04', N'O03', N'XM04', 32490000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD05', N'O04', N'XM04', 6690000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD06', N'O04', N'XM04', 21000000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD07', N'O04', N'XM04', 11490000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD08', N'O05', N'XM04', 29990000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD09', N'O05', N'XM04', 18290000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD10', N'O06', N'XM04', 26990000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD11', N'O07', N'XM04', 22990000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD12', N'O08', N'XM04', 8690000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD13', N'O09', N'XM04', 51000000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD14', N'O10', N'XM04', 7490000, 2)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD15', N'O11', N'XM04', 29990000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD16', N'O12', N'XM04', 6990000, 1)
GO
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (N'OD17', N'O13', N'XM04', 11490000, 1)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O01', N'U04', CAST(N'2021-01-01' AS Date), 13980000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O02', N'U05', CAST(N'2021-01-04' AS Date), 32490000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O03', N'U06', CAST(N'2021-01-06' AS Date), 41470000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O04', N'U07', CAST(N'2021-01-10' AS Date), 39180000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O05', N'U08', CAST(N'2021-01-12' AS Date), 48280000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O06', N'U09', CAST(N'2021-01-20' AS Date), 26990000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O07', N'U10', CAST(N'2021-01-21' AS Date), 22990000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O08', N'U11', CAST(N'2021-02-14' AS Date), 8690000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O09', N'U12', CAST(N'2021-02-19' AS Date), 51000000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O10', N'U13', CAST(N'2021-02-20' AS Date), 14980000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O11', N'U14', CAST(N'2021-02-24' AS Date), 29990000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O12', N'U15', CAST(N'2021-02-24' AS Date), 6990000)
GO
INSERT [dbo].[Orders] ([orderID], [userID], [date], [total]) VALUES (N'O13', N'U16', CAST(N'2021-02-25' AS Date), 11490000)
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'AP01', N'Điện thoại iPhone 12 Pro 256GB', CAST(33490000 AS Decimal(18, 0)), 18, N'Màn hình tai thỏ tràn viền. Màn hình OLED sắc nét, bền bỉ. Vật liệu gốm Ceramic cao cấp. Kết nối 5G tốc độ nhanh ấn tượng', N'AP01.txt', N'iphone-12-pro-xam-new-600x600-600x600.jpg', N'AP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'AP02', N'Điện thoại iPhone 12 128GB', CAST(24490000 AS Decimal(18, 0)), 12, N'Hiệu năng vượt trội, thách thức mọi giới hạn. Vẻ đẹp gợi nhớ và chuẩn màn hình OLED. Hệ thống camera kép chuyên nghiệp. Công nghệ sạc đa năng', N'AP02.txt', N'iphone-12-trang-new-600x600-600x600.jpg', N'AP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'AP03', N'Điện thoại iPhone 11 256GB', CAST(21490000 AS Decimal(18, 0)), 28, N'Hiệu năng vẫn tương đương phiên bản Pro Max. Camera cải tiến lớn. Màu sắc mới, thiết kế đẹp hơn. Thời lượng pin đã tốt nay còn tốt hơn', N'AP03.txt', N'iphone-11-256gb-black-600x600.jpg', N'AP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'AP04', N'Điện thoại iPhone SE 256GB (2020)', CAST(16990000 AS Decimal(18, 0)), 6, N'Gọn nhẹ chắc chắn thoải mái sử dụng. Cấu hình vô địch trong tầm giá. Một camera vẫn xóa phông mượt mà. Pin đủ dùng, hỗ trợ sạc nhanh', N'AP04.txt', N'iphone-se-128gb-2020-trang-600x600.jpg', N'AP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'AP06', N'Điện thoại iPhone 11 128GB', CAST(18990000 AS Decimal(18, 0)), 17, N'Nâng cấp mạnh mẽ về cụm camera. Camera trước cũng đã tốt hơn nhiều', N'AP06.txt', N'iphone-11.jpg', N'AP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'OP01', N'Điện thoại OPPO Reno5', CAST(8690000 AS Decimal(18, 0)), 17, N'Thiết kế đẹp đậm chất OPPO Reno Series. Bức phá hiệu năng với vi xử lý Snapdragon 720G mới. Màn hình lớn chuyển động 90 Hz mượt mà', N'OP01.txt', N'oppo-reno5-trang-600x600-1-600x600.jpg', N'OP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'OP02', N'Điện thoại OPPO Reno3 Pro', CAST(7990000 AS Decimal(18, 0)), 7, N'Màn hình Sunlight Super AMOLED cao cấp. Camera chất lượng hàng đầu. Pin dùng cả ngày, sạc siêu nhanh VOOC', N'OP02.txt', N'oppo-reno3-pro-den-new-600x600-600x600.jpg', N'OP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'OP03', N'Điện thoại OPPO Reno5 5G', CAST(11990000 AS Decimal(18, 0)), 5, N'Từng đường nét lấp lánh, tỏa sáng. Đem đến sự chân thật trong từng khung hình. Reno5 5G chiêu mộ mọi tính đồ chụp ảnh, checkin hay blogger', N'OP03.txt', N'oppo-reno5-5g-thumb-600x600.jpg', N'OP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'OP04', N'Điện thoại OPPO A93', CAST(6490000 AS Decimal(18, 0)), 3, N'Hiệu năng vượt trội cùng với Helio P95. Cụm camera selfie tích hợp AI. Thiết kế cảm hứng, khơi nguồn sáng tạo. Màn hình sống động, sắc nét', N'OP04.txt', N'oppo-a93-trang-14-600x600.jpg', N'OP')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'SS01', N'Điện thoại Samsung Galaxy S21 Ultra 5G 128GB', CAST(30990000 AS Decimal(18, 0)), 23, N'Đột phá trong thiết kế thời thượng. Thỏa mãn thị giác hơn bao giờ hết. Sức mạnh kinh khủng từ chip Exynos 2100. Sẵn sàng khám phá thế giới với camera đẳng cấp', N'SS01.txt', N'samsung-galaxy-s21-ultra-bac-600x600-1-600x600.jpg', N'SS')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'SS02', N'Điện thoại Samsung Galaxy A32', CAST(6690000 AS Decimal(18, 0)), 58, N'Thiết kế thời thượng cùng màu sắc bắt mắt. Màn hình giải trí sắc nét, đa chức năng. Bộ bốn camera sau đến 64 MP thỏa sức sáng tạo', N'SS02.txt', N'samsung-galaxy-a32-4g-thumb-xanh-600x600-600x600.jpg', N'SS')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'SS03', N'Điện thoại Samsung Galaxy Z Fold2 5G', CAST(50000000 AS Decimal(18, 0)), 10, N'Thiết kế cải tiến hướng đến sự hoàn thiện. Màn hình lớn và bền hơn thế hệ cũ. Bộ 5 camera kiến tạo tuyệt tác. Hiệu năng dẫn đầu với Snapdragon 865+', N'SS03.txt', N'samsung-galaxy-z-fold-2-vang-dong-600x600.jpg', N'SS')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'SS04', N'Điện thoại Samsung Galaxy Note 20 Ultra 5G Trắng', CAST(29990000 AS Decimal(18, 0)), 23, N'Thiết kế đẳng cấp xứng tầm siêu phẩm. Màn hình “không viền” vượt mọi giới hạn. S Pen thông minh đầy đủ tính năng đáng giá', N'SS04.txt', N'samsunggalaxynote20ultratrangnew-600x600-600x600.jpg', N'SS')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'XM01', N'Điện thoại Xiaomi Redmi 9T (6GB/128GB)', CAST(4690000 AS Decimal(18, 0)), 11, N'Trẻ trung với màu sắc nổi bật. Màn hình siêu lớn, trải nghiệm hoàn hảo. Chip “Rồng” 662 tốc độ nhanh, ổn định trong tầm giá', N'XM01.txt', N'xiaomi-redmi-9t-6gb-110621-080650-600x600.jpg', N'XM')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'XM02', N'Điện thoại Xiaomi Mi 11 5G', CAST(21990000 AS Decimal(18, 0)), 22, N'Thiết kế nổi bật với cụm camera độc nhất. Làm chủ mọi khung hình với bộ 3 camera 108 MP. Hiệu năng hàng khủng với Snapdragon 888', N'XM02.txt', N'xiaomi-mi-11-xanhduong-600x600-600x600.jpg', N'XM')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'XM03', N'Điện thoại Xiaomi Mi 10T Pro 5G', CAST(12990000 AS Decimal(18, 0)), 12, N'Mượt mà trong từng khung hình với tần số quét 144 Hz. Chơi game cực “mướt” với Snapdragon 865. Camera 108 MP sắc nét, thoả thích thu phóng', N'XM03.txt', N'xiaomi-mi-10t-pro-den-600x600.jpg', N'XM')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'XM04', N'Xiaomi Redmi Note 9 Pro 6GB-128GB', CAST(6990000 AS Decimal(18, 0)), 23, N'Thiết kế bóng bẩy, cao cấp. Cấu hình mạnh mẽ với chip rồng Snapdragon. Cụm bốn camera 64 MP ấn tượng. Dung lượng pin khủng 5020 mAh', N'XM04.txt', N'xiaomi-redmi-note-9-pro-white.jpg', N'XM')
GO
INSERT [dbo].[Products] ([productID], [productName], [price], [quantity], [shortDescription], [productDescription], [imageUrl], [categoryID]) VALUES (N'XM09', N'Điện thoại Xiaomi Redmi 9C', CAST(2490000 AS Decimal(18, 0)), 50, N'Màn hình giọt nước mang tính thời thượng. Hiệu năng mạnh mẽ với bộ vi xử lý MediaTek Helio G35. Viên pin khủng, trải nghiệm lâu dài', N'XM09.txt', N'xiaomi-redmi-9c-xanh-duong-600x600.jpg', N'XM')
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (1, N'admin')
GO
INSERT [dbo].[Roles] ([roleID], [roleName]) VALUES (2, N'user')
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U01', N'Vinh', N'123', N'TP.HCM', N'0878989189', 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U02', N'Tram', N'123', N'TP.HCM', N'0877833033', 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U03', N'Tai', N'123', N'TP.HCM', N'0877598298', 1)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U04', N'Quyen', N'Quyen123', N'Quang Ninh', N'0929877477', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U05', N'Phuc', N'Phuc123', N'Ha Noi', N'0929608555', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U06', N'Linh', N'Linh123', N'Hai Duong', N'0929643777', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U07', N'Hoan', N'Hoan123', N'Cam Giang', N'0929855055', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U08', N'Uan', N'Uan123', N'Kinh Mon', N'0843556600', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U09', N'Do', N'Do123', N'Ha Noi', N'0879520999', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U10', N'Canh', N'Canh123', N'Ha Noi', N'0877263789', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U11', N'Tuan', N'Tuan123', N'Hai Duong', N'0929799599', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U12', N'Toan', N'Toan123', N'Hai Duong', N'0846333342', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U13', N'Ly', N'Ly123', N'Ha Noi', N'0927041777', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U14', N'Trung', N'Trung123', N'Ha Noi', N'0879194555', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U15', N'Loi', N'Loi123', N'TP.HCM', N'0919300444', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U16', N'Thanh', N'Thanh123', N'TP.HCM', N'0877769269', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U2241', N'taipham', N'12345678', N'TPHCM', N'0384747102', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U541', N'tuan', N'23456789', N'TPHCM', N'0384747102', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U6871', N'Nguyen', N'12345678', N'TPHCM', N'0909876543', 2)
GO
INSERT [dbo].[Users] ([userID], [userName], [password], [address], [phone], [roleID]) VALUES (N'U7861', N'Dom', N'12345678', N'TPHCM', N'0384747102', 2)
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products1] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment_Group#3] SET  READ_WRITE 
GO
