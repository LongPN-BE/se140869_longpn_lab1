USE [master]
GO
/****** Object:  Database [YellowMoonShop]    Script Date: 12/1/2021 10:30:45 PM ******/
CREATE DATABASE [YellowMoonShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoonShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER\MSSQL\DATA\YellowMoonShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YellowMoonShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER\MSSQL\DATA\YellowMoonShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [YellowMoonShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoonShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoonShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoonShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoonShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoonShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [YellowMoonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoonShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoonShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoonShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoonShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoonShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoonShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YellowMoonShop] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoonShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoonShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoonShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoonShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YellowMoonShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YellowMoonShop] SET QUERY_STORE = OFF
GO
USE [YellowMoonShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [YellowMoonShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/1/2021 10:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LastUpdate]    Script Date: 12/1/2021 10:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastUpdate](
	[username] [nvarchar](50) NULL,
	[action] [nvarchar](50) NULL,
	[lastDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/1/2021 10:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[orderID] [nvarchar](50) NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/1/2021 10:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [varchar](10) NULL,
	[email] [varchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[dateOrder] [date] NULL,
	[total] [float] NULL,
	[userID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/1/2021 10:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[imageProduct] [varchar](1000) NULL,
	[nameProduct] [nvarchar](50) NULL,
	[description] [nvarchar](1000) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[createDate] [date] NULL,
	[expirationDate] [date] NULL,
	[categoryID] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/1/2021 10:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phoneNo] [varchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
	[address] [nvarchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (1, N'mot')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (2, N'hai')

INSERT [dbo].[LastUpdate] ([username], [action], [lastDate]) VALUES (N'admin ne', N'Update', CAST(N'2021-12-01T10:45:51.900' AS DateTime))
INSERT [dbo].[LastUpdate] ([username], [action], [lastDate]) VALUES (N'admin ne', N'Update', CAST(N'2021-12-01T10:48:47.743' AS DateTime))
INSERT [dbo].[LastUpdate] ([username], [action], [lastDate]) VALUES (N'admin ne', N'Update', CAST(N'2021-12-01T22:03:44.780' AS DateTime))
GO
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'jLF4TBVBRW', 5, 67, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'WpWfEB7Ap9', 6, 15, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'1aN2D78fMh', 7, 7, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'jHOrnhYxKB', 5, 1, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'5sIQ9tGXgK', 5, 1, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'l1FUU8cHgq', 6, 10, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'eZhnHQlo3s', 5, 2, 100000)
INSERT [dbo].[OrderDetails] ([orderID], [productID], [quantity], [price]) VALUES (N'VhKqKAtSNW', 5, 1, 100000)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (2, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810183225_Main-product-detail.png', N'Green bean mooncake 1', N'Good', 100000, 10, CAST(N'2021-09-10' AS Date), CAST(N'2021-09-20' AS Date), 2, 0)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (5, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810183334_Main-product-detail.png', N'Green bean mooncake 2', N'Good', 100000, 5, CAST(N'2021-09-11' AS Date), CAST(N'2021-09-20' AS Date), 1, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (6, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/321456987xadghlorksghrflgh.png', N'Green bean mooncake 3', N'Good', 100000, 0, CAST(N'2021-09-12' AS Date), CAST(N'2021-09-20' AS Date), 1, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (7, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810183504_Main-product-detail.png', N'Green bean mooncake 4', N'Good', 100000, 10, CAST(N'2021-09-13' AS Date), CAST(N'2021-09-20' AS Date), 1, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (14, N'https://ytuongvietnam.com/wp-content/uploads/2019/07/banh-deo-trung-thu-nhan-dau-xanh.jpg', N'Red bean mooncake 1', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 1, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (15, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810151730_Main-product-detail_banh.png', N'Red bean mooncake 2', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (16, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20190710042245_banhlon_nuong-comhatde.png', N'Red bean mooncake 3', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (17, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810173612_Main-product-detail_banh.png', N'Red bean mooncake 4', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (18, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810174202_Main-product-detail_banh.png', N'Red bean mooncake 5', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (19, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810173830_Main-product-detail_banh.png', N'Red bean mooncake 6', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (20, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810151730_Main-product-detail_banh.png', N'Red bean mooncake 7', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (21, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810183114_Main-product-detail.png', N'Red bean mooncake 8', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (22, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810182955_Main-product-detail.png', N'Red bean mooncake 9', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (23, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810175419_Main-product-detail_banh.png', N'Red bean mooncake 10', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (24, N'https://www.banhngoncaocap.com/cache/resized/6e5b6f791fced97c97b304342ee5e545.png', N'Black bean mooncake 1', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (25, N'https://www.banhngoncaocap.com/cache/resized/a7472ba8afe653615e27b78f47a45efa.png', N'Black bean mooncake 2', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (26, N'https://www.banhngoncaocap.com/cache/resized/7aea3c7568a2964070933b55c2052210.png', N'Black bean mooncake 3', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (27, N'https://www.banhngoncaocap.com/cache/resized/eeee853a99da58178eccb8c9ac56cc2d.png', N'Black bean mooncake 4', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (28, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/20180810201644_Main-product-detail.png', N'Black bean mooncake 5', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (29, N'https://bizweb.dktcdn.net/100/004/714/articles/banh-trung-thu-tai-thong-hat-thap-cam.jpg?v=1562073140493', N'Black bean mooncake 6', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (30, N'https://bizweb.dktcdn.net/100/004/714/articles/banh-trung-thu-tai-thong-hat-thap-cam.jpg?v=1562073140493', N'Black bean mooncake 7', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (31, N'https://bizweb.dktcdn.net/100/004/714/articles/banh-trung-thu-tai-thong-hat-thap-cam.jpg?v=1562073140493', N'Black bean mooncake 8', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (32, N'https://bizweb.dktcdn.net/100/004/714/articles/banh-trung-thu-tai-thong-hat-thap-cam.jpg?v=1562073140493', N'Black bean mooncake 9', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (33, N'https://bizweb.dktcdn.net/100/004/714/articles/banh-trung-thu-tai-thong-hat-thap-cam.jpg?v=1562073140493', N'Black bean mooncake 10', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (34, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/H%E1%BB%98P-THU-3-B%C3%81NH-%E2%80%93-H%E1%BB%92NG.png', N'Lotus seed mooncake 1', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (35, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/H%E1%BB%98P-THU-3-B%C3%81NH-%E2%80%93-XANH.png', N'Lotus seed mooncake 2', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (36, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/H%E1%BB%98P-THU-5-B%C3%81NH-%E2%80%93-H%E1%BB%92NG.png', N'Lotus seed mooncake 3', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (37, N'https://www.banhngoncaocap.com/images/stories/virtuemart/product/H%E1%BB%98P-THU-6-B%C3%81NH-%E2%80%93-XANH.png', N'Lotus seed mooncake 4', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (38, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 5', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (39, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 6', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (40, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 7', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (41, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 8', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (42, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 9', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (43, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 10', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (44, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 11', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (45, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 12', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (46, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 13', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (47, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 14', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (48, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 15', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (49, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 16', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (50, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 17', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (51, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 18', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (52, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 19', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (53, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 20', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (54, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 21', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (55, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 22', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (56, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 23', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (57, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 24', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (58, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 25', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (59, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 26', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (60, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 27', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (61, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 28', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (62, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 29', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (63, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 30', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (64, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 31', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (65, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 32', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (66, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 33', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (67, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 34', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (68, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 35', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (69, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 36', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (70, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 37', N'Good', 100000, 10, CAST(N'2021-09-20' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (71, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 38', N'Good', 100000, 10, CAST(N'2021-09-03' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (72, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 39', N'Good', 100000, 10, CAST(N'2021-09-02' AS Date), CAST(N'2021-09-20' AS Date), 2, 1)
INSERT [dbo].[Products] ([productID], [imageProduct], [nameProduct], [description], [price], [quantity], [createDate], [expirationDate], [categoryID], [status]) VALUES (73, N'https://giaonhanh.vn/assets/uploads/2014/07/banh-trung-thu-hat-sen-kinh-do-1-trung.jpg', N'Lotus seed mooncake 40', N'Weel', 100000, 10, CAST(N'2021-09-01' AS Date), CAST(N'2021-09-20' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Users] ([userID], [fullname], [password], [phoneNo], [email], [isAdmin], [address]) VALUES (N'admin', N'Admin', N'1', NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([userID], [fullname], [password], [phoneNo], [email], [isAdmin], [address]) VALUES (N'customer', N'Customer', N'1', N'090909', N'customer@gmail.com', 0, N'khu cach ly')
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([productID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
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
USE [master]
GO
ALTER DATABASE [YellowMoonShop] SET  READ_WRITE 
GO
