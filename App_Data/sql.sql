USE [master]
GO
/****** Object:  Database [lizishopping]    Script Date: 2020/6/8 12:03:20 ******/
CREATE DATABASE [lizishopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lizishopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\lizishopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'lizishopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\lizishopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lizishopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lizishopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lizishopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lizishopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lizishopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lizishopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [lizishopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lizishopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lizishopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lizishopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lizishopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lizishopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lizishopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lizishopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lizishopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lizishopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lizishopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lizishopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lizishopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lizishopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lizishopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lizishopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lizishopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lizishopping] SET RECOVERY FULL 
GO
ALTER DATABASE [lizishopping] SET  MULTI_USER 
GO
ALTER DATABASE [lizishopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lizishopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lizishopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lizishopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [lizishopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'lizishopping', N'ON'
GO
ALTER DATABASE [lizishopping] SET QUERY_STORE = OFF
GO
USE [lizishopping]
GO
/****** Object:  Table [dbo].[GoodsPhotoTable]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsPhotoTable](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[Photo_one] [nvarchar](150) NULL,
	[Photo_two] [nvarchar](150) NULL,
	[Photo_three] [nvarchar](150) NULL,
	[Photo_four] [nvarchar](150) NULL,
	[Photo_five] [nvarchar](150) NULL,
	[SKUId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goodsSKUTables]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodsSKUTables](
	[SKUId] [int] IDENTITY(1,1) NOT NULL,
	[SKUGoodName] [nvarchar](50) NULL,
	[Goods_Description] [nvarchar](300) NULL,
	[GoodPrice] [money] NULL,
	[inventory] [int] NULL,
	[GoodPhoto] [nvarchar](100) NULL,
	[SPUID] [int] NULL,
	[BusinName] [nvarchar](20) NULL,
	[onclicknum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SKUId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goodsSPUTables]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goodsSPUTables](
	[SPUID] [int] IDENTITY(1,1) NOT NULL,
	[SPUGoodName] [nvarchar](50) NULL,
	[GoodInfo] [nvarchar](500) NULL,
	[ShopID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SPUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MangeAdmin]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MangeAdmin](
	[MangeAdminID] [int] IDENTITY(1,1) NOT NULL,
	[Admins] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MangeAdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderGoodslist]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderGoodslist](
	[OGid] [int] IDENTITY(1,1) NOT NULL,
	[SKUId] [int] NULL,
	[GoodNum] [int] NULL,
	[GoodPrice] [int] NULL,
	[OrderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OGid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInfo](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AddressId] [int] NULL,
	[Total] [money] NULL,
	[TranMoney] [money] NULL,
	[PayState] [nvarchar](20) NULL,
	[CreateTime] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopCategory]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCategory](
	[ShopID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppCar]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppCar](
	[ShopCardID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SKUId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_addressTable]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_addressTable](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[consigneeName] [nvarchar](50) NULL,
	[Adress] [nvarchar](50) NULL,
	[postal_code] [nvarchar](50) NULL,
	[contact_way] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[default_Address] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassWord] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[limits] [nvarchar](50) NULL,
	[Userstatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GoodsPhotoTable] ON 

INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (1, N'huawei1.jpg', N'44809c27b8b55532461a1da10678bd290c6195df.jpg', N'38dbb6fd5266d01623801865972bd40734fa35e5.jpg', N'9cf15413150d8f67.jpg', N'1.jpg', 11)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (2, N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', N'huawei5.jpg', NULL, 12)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (3, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 13)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (4, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 14)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (5, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 15)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (6, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 16)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (7, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 17)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (8, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 7)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (9, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 8)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (10, N'59ef075d89484.png', N'huawei1.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 9)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (11, N'59ef075d89484.png', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 10)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (12, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 18)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (13, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 19)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (14, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 20)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (15, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 21)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (16, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 22)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (17, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 23)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (18, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 24)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (19, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 25)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (20, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 26)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (21, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 27)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (22, N'59ef075d89484.png', N'huawei2.jpg', N'product3.jpg', N'59ef075d89484.png', N'1.jpg', 32)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (23, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 31)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (24, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 30)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (25, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 29)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (26, N'huawei1.jpg', N'huawei2.jpg', N'huawei3.jpg', N'huawei4.jpg', NULL, 28)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (28, N'slider1.png', N'slider1.png', N'slider1.png', N'huawei4.jpg', NULL, 33)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (29, N'slider2.png', N'slider2.png', N'slider2.png', N'huawei4.jpg', NULL, 34)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (30, N'Lenovo3.jpg', N'Lenovo1.jpg', N'Lenovo5.jpg', N'Lenovo1.jpg', N'Lenovo3.jpg', 35)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (31, N'Lenovo2.jpg', N'Lenovo3.jpg', N'Lenovo2.jpg', N'Lenovo8.jpg', N'Lenovo5.jpg', 36)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (32, N'Lenovo3.jpg', N'Lenovo4.jpg', N'Lenovo5.jpg', N'Lenovo6.jpg', N'Lenovo7.jpg', 37)
INSERT [dbo].[GoodsPhotoTable] ([PhotoID], [Photo_one], [Photo_two], [Photo_three], [Photo_four], [Photo_five], [SKUId]) VALUES (33, N'Lenovo5.jpg', N'Lenovo4.jpg', N'Lenovo1.jpg', N'Lenovo1.jpg', N'Lenovo3.jpg', 38)
SET IDENTITY_INSERT [dbo].[GoodsPhotoTable] OFF
SET IDENTITY_INSERT [dbo].[goodsSKUTables] ON 

INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (7, N'
阿里夸·洛伯蒂斯', N'暂无介绍', 123.0000, 123, N'product4.jpg', 29, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (8, N'艾尼安·特里斯蒂克', N'暂无介绍', 3333.0000, 2123, N'product5.jpg', 29, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (9, N'埃尼安射手座', N'暂无介绍', 423.0000, 123, N'product2.jpg', 29, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (10, N'手机', N'暂无介绍', 123.0000, 12312, N'product7.jpg', 29, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (11, N'华为nova 7 Pro', N'华为 nova 7 Pro搭载麒麟985 5G SoC芯片，配备6.57英寸OLED挖孔曲面屏，后置64MP像素50倍变焦四摄，前置32MP双摄。4000mAh大容量电池，支持40W有线快充。', 3999.0000, 99, N'huawei1.jpg', 32, N'是', 5)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (12, N'华为nova 7 SE 5G', N'华为 nova 7 SE搭载麒麟820芯片，后置64MP高清四摄，前置16MP单摄。配备6.5英寸极点屏，4000mAh大容量电池，支持40W有线快充，侧边指纹解锁。', 3599.0000, 100, N'huawei2.jpg', 32, N'是', 4)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (14, N'华为 P40', N'P40搭载麒麟990 5G SoC芯片，配备6.1英寸60Hz挖空屏，3800mAh电池，支持22.5W有线快充。后置50MP+16MP+8MP，前置32MP挖孔镜头。', 4000.0000, 100, N'huawei3.jpg', 31, N'是', 1)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (15, N'华为P40 Pro', N'华为 P40 Pro，后置50MP+40MP+16MP+3F深感四摄，1/1.28英寸RYYB超感知传感器，支持5倍光学变焦，10倍混合变焦，50倍数字变焦。配备4200mAh电池，支持40W有线27W无线快充。', 3699.0000, 100, N'huawei4.jpg', 31, N'是', 1)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (16, N'华为P40 Pro+', N'为P40 Pro+是一款性价比极高的产品。由华为制造，制造工艺精良保证质量和使用寿命，外观设计时尚简洁且有质感，最为吸引人的是它物超所值的价格，总的来说是性价比较高的一款选择。', 2999.0000, 100, N'huawei5.jpg', 31, N'是', 1)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (17, N'华为Mate30 Pro 5G', N'华为Mate30 Pro 5G搭载麒麟990 5G芯片，并采用全新ISP5.0，实现了单反级硬件降噪技术，暗光场景拍照会更加明亮清晰（除了支持全网通5G，性能和拍照效果也会略优于4G版的麒麟990）。', 6999.0000, 100, N'huawei6.jpg', 30, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (18, N'华为Mate30 5G', N'Mate30 5G版，搭载麒麟990 5G芯片，后置4000W+1600W+800W三摄，前置2400W单摄。配备6.62英寸刘海屏。4200mAh大容量电池，支持40W有线快充。', 3999.0000, 100, N'huawei7.jpg', 30, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (19, N'华为Mate30 Pro', N'麒麟990旗舰芯片，搭载88°超曲面OLED环幕屏，取消了物理音量键（可滑动侧边操控），徕卡双4000万像素电影、超感光摄像头，加上800万像素长焦和3D景深摄像头方案，可带来超高清暗光拍摄，7680帧超高速摄影。', 3999.0000, 100, N'huawei8.jpg', 30, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (20, N'苹果iPhone11ProMax', N'iPhone 11 Pro屏幕尺寸6.5英寸,采用Super Retina XDR OLED显示，采用A13 Bionic芯片，iPhone 11 Pro较iPhone XS续航多四小时。', 2999.0000, 100, N'ipone.jpg', 33, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (21, N'苹果iPhone11Pro', N'iPhone 11 Pro屏幕尺寸5.8英寸。采用Super Retina XDR OLED显示，采用A13 Bionic芯片，iPhone 11 Pro较iPhone XS续航多四小时。', 8999.0000, 100, N'ipone.jpg', 33, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (22, N'魅族16th', N'魅族16th配备6英寸Super AMOLED屏，分辨率为2160x1080像素；骁龙845处理器，6GB运行内存起跳；前置2000W，后置2000W+1200W像素摄像头，索尼IMX380传感器；支持屏下指纹解锁，双立体声扬声器，快充等。', 5900.0000, 100, N'huawei10.jpg', 34, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (23, N' 魅族16th Plus', N'暂无介绍', 8777.0000, 100, N'huawei9.jpg', 34, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (24, N'魅族16X', N'魅族16X配备6英寸AMOLED屏，分辨率为2160x1080像素，屏占比高达90.62%；搭载骁龙710处理器，6GB+64/128GB存储组合；前置2000W，后置1200W+2000W像素双摄像头，支持4轴光学防抖，3倍无损变焦等。', 5999.0000, 100, N'huawei2.jpg', 34, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (25, N'黑鲨游戏手机3', N'黑鲨3手机，搭载骁龙865处理器，双模5G+WiFi6。UFS3.0+LPDDR5。配备6.67英寸90Hz刷新率270Hz采样率屏幕。4270mAh大容量电池，支持65W极速闪充。', 6999.0000, 100, N'huawei7.jpg', 35, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (26, N'黑鲨游戏手机3pro', N'黑鲨3pro，搭载骁龙865处理器。配备2K分辨率90Hz刷新率270Hz采样率屏幕，5000mAh大容量双电池，最高65W优先闪充，配备升降式游戏按键。', 4999.0000, 100, N'huawei6.jpg', 35, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (27, N' 黑鲨游戏手机2', N'黑鲨2配备6.39英寸AMOLED屏，分辨率为2340x1080像素，支持DC调光；骁龙855处理器，液冷3.0散热；4000mAh电池，支持27W快充；Magic Press立体操控，定义新玩法。', 1999.0000, 100, N'huawei5.jpg', 35, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (28, N'三星S20', N'三星S20采用6.2英寸20:9双曲面Dynamic AMOLED中置打孔屏，搭载高通骁龙865，LPDDR5内存+UFS3.0闪存，电池容量4000mAh，支持WiFi6，IP68级别防尘防水。[展开]
', 3999.0000, 100, N'huawei2.jpg', 38, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (29, N' 三星S20Ultra ', N'三星 Galaxy S20 Ultra，搭载高通骁龙865处理器，外挂X55 5G基带。后置1亿+48MP+12MP+TOF四摄，前置40MP单摄。配备5000mAh超大容量电池，4.9英寸双曲面Dynamic AMOLED 2X屏幕。', 2999.0000, 100, N'huawei8.jpg', 38, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (30, N'小米10Pro', N'小米10Pro配置1亿像素8K电影相机（50倍数字变焦，10倍混合光学变焦），对称式立体声，支持50W极速闪充+30W无线闪充+10W无线反充，以及6.67英寸90Hz刷新率+180Hz采样率定制双曲面屏。', 4999.0000, 100, N'huawei3.jpg', 39, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (31, N'小米10', N'小米10搭载骁龙865处理器，外挂X55 5G基带。配备6.67英寸90Hz双曲面AMOLED屏幕。4780mAh大容量电池，支持30W快充。后置一亿像素四摄，支持8K视频拍摄。', 6999.0000, 100, N'huawei8.jpg', 39, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (32, N'联想拯救者', N'性能怪兽', 6999.0000, 100, N'product5.jpg', 37, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (33, N'红色连衣裙', N'红色长款雪纺连衣裙女2020新款夏显瘦大摆长裙海边度假沙滩裙超仙', 299.0000, 100, N'slider1.png', 40, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (34, N'利迈办公椅', N'利迈办公椅家用电脑椅职员椅会议椅学生宿舍座椅现代简约靠背椅子', 128.0000, 100, N'slider2.png', 41, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (35, N'小新Air14 2020', N'AMD Ryzen 5 4600U/Windows 10 家庭中文版/14.0英寸/16G/512G SSD/集成显卡/深空灰', 7999.0000, 100, N'Lenovo1.jpg', 37, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (36, N'拯救者 Y9000K', N'十代英特尔酷睿i7-10875H/Windows 10 家庭中文版/15.6英寸/16G/1T SSD/GeForce RTX™ 2060 6G独显/耀石灰', 10999.0000, 100, N'Lenovo2.jpg', 37, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (37, N'ThinkPad X1Carbon', N'全新十代英特尔酷睿i7-10710U/Windows 10家庭中文版/16GB/512GB SSD/英特尔® UHD 显示芯片/14英寸WQHD IPS LED背光显示屏/LTE版/沉浸黑
', 13999.0000, 200, N'Lenovo3.jpg', 37, N'是', 0)
INSERT [dbo].[goodsSKUTables] ([SKUId], [SKUGoodName], [Goods_Description], [GoodPrice], [inventory], [GoodPhoto], [SPUID], [BusinName], [onclicknum]) VALUES (38, N'小米游戏本', N'让你在游戏的世界里恣意闯荡，亦可在游戏之外更加专注极致地创作，这是我们的初衷。为此，
我们邀请多领域的业内专家，从配置、散热，到键盘、屏幕、音效等进行了系统级的重塑，
历经两年，终于将这款小米游戏本呈现给你。', 8999.0000, 500, N'Lenovo8.jpg', 36, N'是', 0)
SET IDENTITY_INSERT [dbo].[goodsSKUTables] OFF
SET IDENTITY_INSERT [dbo].[goodsSPUTables] ON 

INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (13, N'小米手机', N'高端大气上档次', 3)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (14, N'小米手机', N'111', 3)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (29, N'酸辣粉', N'暂无介绍', 2)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (30, N'华为 Mate30', N'华为Mate30搭载7mm麒麟990旗舰芯片，徕卡4000万像素超感光+1600万像素超广角+800万像素长焦摄像头，支持40W有线和27W无线快充，以及新一代屏内指纹和人脸解锁。', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (31, N'华为 P40', N'P40搭载麒麟990 5G SoC芯片，配备6.1英寸60Hz挖空屏，3800mAh电池，支持22.5W有线快充。后置50MP+16MP+8MP，前置32MP挖孔镜头。', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (32, N'华为nova 7', N'华为 nova 7搭载麒麟985 5G SoC芯片，后置64MP变焦四摄，前置32MP单摄。配备6.53英寸OLED极点屏，4000mAh大容量电池，支持40W有线快充。', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (33, N'苹果 iPhone 11', N'iPhone11（苹果11）采用了6.1英寸LCD屏幕，1200万像素超广角摄像头和1200万像素广角摄像头，支持两倍光学变焦，前置1200万像素的TrueDepth摄像头，支持4K@60和慢动作拍摄。', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (34, N'魅族16th', N'魅族16th配备6英寸Super AMOLED屏，分辨率为2160x1080像素；骁龙845处理器，6GB运行内存起跳；前置2000W，后置2000W+1200W像素摄像头，索尼IMX380传感器；支持屏下指纹解锁，双立体声扬声器，快充等。', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (35, N'黑鲨游戏手机', N'暂无介绍', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (36, N'战神电脑', N'战神，一款你值得拥有的电脑', 1)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (37, N'联想', N'联想，一款你值得拥有的商品', 1)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (38, N'三星', N'暂无介绍', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (39, N'小米10', N'暂无介绍', 8)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (40, N'连衣裙', N'暂无介绍', 7)
INSERT [dbo].[goodsSPUTables] ([SPUID], [SPUGoodName], [GoodInfo], [ShopID]) VALUES (41, N'椅子', N'暂无介绍', 11)
SET IDENTITY_INSERT [dbo].[goodsSPUTables] OFF
SET IDENTITY_INSERT [dbo].[OrderGoodslist] ON 

INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (3, 11, 1, 4019, 4)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (4, 14, 1, 4020, 5)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (5, 7, 1, 143, 6)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (6, NULL, NULL, NULL, 7)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (7, NULL, NULL, NULL, 8)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (8, NULL, NULL, NULL, 9)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (9, 11, 1, 4019, 10)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (10, 10, NULL, NULL, 11)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (11, 12, NULL, NULL, 12)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (14, 14, 1, 4020, 15)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (15, 12, 1, 3619, 16)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (16, 12, 1, 3619, 17)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (17, 11, 1, 4019, 18)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (18, 11, 1, 4019, 19)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (19, 10, 1, 143, 20)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (20, 11, 1, 4019, 21)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (21, 11, 1, 4019, 22)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (22, 11, 1, 4019, 23)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (23, 11, 0, 4019, 24)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (24, 11, 1, 4019, 25)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (25, 11, 0, 4019, 26)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (26, 11, 0, 4019, 27)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (27, 11, 1, 4019, 28)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (28, 11, 1, 4019, 29)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (29, 11, 1, 4019, 30)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (30, 11, 1, 4019, 31)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (31, 11, 1, 4019, 32)
INSERT [dbo].[OrderGoodslist] ([OGid], [SKUId], [GoodNum], [GoodPrice], [OrderID]) VALUES (32, 11, 1, 4019, 33)
SET IDENTITY_INSERT [dbo].[OrderGoodslist] OFF
SET IDENTITY_INSERT [dbo].[OrderInfo] ON 

INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (4, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/30 下午5:24:28')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (5, 1, 1, 4000.0000, 20.0000, N'已付款', N'2020/5/30 下午5:27:06')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (6, 1, 1, 123.0000, 20.0000, N'已付款', N'2020/5/30 下午5:29:45')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (10, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/30 下午8:00:36')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (15, 1, 1, 4000.0000, 20.0000, N'已付款', N'2020/5/30 下午8:46:16')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (16, 1, 1, 3599.0000, 20.0000, N'未付款', N'2020/5/30 下午8:47:00')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (17, 1, 1, 3599.0000, 20.0000, N'已付款', N'2020/5/30 下午8:47:06')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (18, 1, 1, 3999.0000, 20.0000, N'未付款', N'2020/5/31 上午11:34:16')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (19, 1, 1, 3999.0000, 20.0000, N'未付款', N'2020/5/31 下午2:18:23')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (20, 1, 1, 123.0000, 20.0000, N'已付款', N'2020/5/31 下午2:24:42')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (21, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午6:47:34')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (22, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午6:49:09')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (23, 1, 1, 3999.0000, 20.0000, N'未付款', N'2020/5/31 下午6:49:16')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (24, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午6:53:30')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (25, 1, 1, 3999.0000, 20.0000, N'未付款', N'2020/5/31 下午6:53:30')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (26, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午6:54:37')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (27, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午6:55:34')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (28, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午6:58:50')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (29, 1, 1, 3999.0000, 20.0000, N'未付款', N'2020/5/31 下午6:59:03')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (30, 1, 1, 3999.0000, 20.0000, N'未付款', N'2020/5/31 下午7:04:29')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (31, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午7:10:45')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (32, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午7:12:38')
INSERT [dbo].[OrderInfo] ([OrderID], [UserId], [AddressId], [Total], [TranMoney], [PayState], [CreateTime]) VALUES (33, 1, 1, 3999.0000, 20.0000, N'已付款', N'2020/5/31 下午7:14:48')
SET IDENTITY_INSERT [dbo].[OrderInfo] OFF
SET IDENTITY_INSERT [dbo].[ShopCategory] ON 

INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (1, N'电脑')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (2, N'家居')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (3, N'美食')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (4, N'美妆')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (5, N'母婴')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (6, N'男装')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (7, N'女装')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (8, N'手机')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (9, N'箱包')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (10, N'热门')
INSERT [dbo].[ShopCategory] ([ShopID], [TypeName]) VALUES (11, N'家具')
SET IDENTITY_INSERT [dbo].[ShopCategory] OFF
SET IDENTITY_INSERT [dbo].[ShoppCar] ON 

INSERT [dbo].[ShoppCar] ([ShopCardID], [UserID], [SKUId]) VALUES (9, 1, 10)
INSERT [dbo].[ShoppCar] ([ShopCardID], [UserID], [SKUId]) VALUES (10, 1, 10)
INSERT [dbo].[ShoppCar] ([ShopCardID], [UserID], [SKUId]) VALUES (11, 1, 11)
SET IDENTITY_INSERT [dbo].[ShoppCar] OFF
SET IDENTITY_INSERT [dbo].[User_addressTable] ON 

INSERT [dbo].[User_addressTable] ([AddressId], [consigneeName], [Adress], [postal_code], [contact_way], [UserId], [default_Address]) VALUES (1, N'栗子', N'平顶山', N'476000', N'17638416075', 1, N'1')
INSERT [dbo].[User_addressTable] ([AddressId], [consigneeName], [Adress], [postal_code], [contact_way], [UserId], [default_Address]) VALUES (2, N'栗子', N'河南省商丘市梁园区', N'476000', N'15224787219', 1, N'0')
SET IDENTITY_INSERT [dbo].[User_addressTable] OFF
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([UserId], [UserName], [UserPassWord], [Email], [limits], [Userstatus]) VALUES (1, N'1', N'1', N'2@qq.com', N'1', 0)
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserPassWord], [Email], [limits], [Userstatus]) VALUES (2, N'123', N'123', N'1@qq.com', N'1', 0)
SET IDENTITY_INSERT [dbo].[UserTable] OFF
ALTER TABLE [dbo].[goodsSKUTables] ADD  DEFAULT ((0)) FOR [onclicknum]
GO
ALTER TABLE [dbo].[UserTable] ADD  DEFAULT ('1') FOR [limits]
GO
ALTER TABLE [dbo].[UserTable] ADD  DEFAULT ((0)) FOR [Userstatus]
GO
/****** Object:  StoredProcedure [dbo].[add_order]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[add_order](
	@UserId int ,--外键参照用户信息表
	@AddressId int ,  --参照用户收货地址表
	@Total money,--金额
	@TranMoney money,--运费
	@PayState nvarchar(20),--支付状态
	@CreateTime nvarchar(50),  --订单创建时间

	@SKUId int ,--参照商品表
	@GoodNum int,--数量
	@GoodPrice int--实际支付价格
)
as
begin
	declare @id int 
	insert into OrderInfo values (@UserId,@AddressId,@Total,@TranMoney,@PayState,@CreateTime)
	set @id=@@identity --取到刚插入的id
	insert into OrderGoodslist values (@SKUId,@GoodNum,@GoodPrice,@id)
end 
GO
/****** Object:  StoredProcedure [dbo].[del_orders]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[del_orders](
@orderid int
)
as
    begin tran --开始执行事务
delete from OrderGoodslist where OrderID = @orderid
		delete from OrderInfo where OrderID = @orderid
if @@error<>0 --判断如果两条语句有任何一条出现错误
begin 
rollback --–开始执行事务的回滚，恢复的转账开始之前状态
end
else    --如何两条都执行成功
begin 
commit --执行这个事务的操作
end

GO
/****** Object:  StoredProcedure [dbo].[insertin]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertin](
    @SPUGoodName varchar(20),
    @GoodInfo varchar(20),
	@ShopID int
)
as
    --要求book_id和book_Auth列与输入参数相等
    insert into goodsSPUTables values(@SPUGoodName,@GoodInfo,@ShopID)
GO
/****** Object:  StoredProcedure [dbo].[selpro_detials_id]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selpro_detials_id](
@id int 
)
as
    select sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName ,tp.PhotoID,tp.Photo_one,tp.Photo_two,tp.Photo_three,tp.Photo_four,tp.Photo_five from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop,GoodsPhotoTable tp where 
	sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID and tp.SKUId = sku.SKUId and sku.SKUId = @id
GO
/****** Object:  StoredProcedure [dbo].[selpro_detials_SKUGoodName]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selpro_detials_SKUGoodName](
@SKUGoodName nvarchar(50) 
)
as
    select sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName ,tp.PhotoID,tp.Photo_one,tp.Photo_two,tp.Photo_three,tp.Photo_four,tp.Photo_five from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop,GoodsPhotoTable tp where 
	sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID and tp.SKUId = sku.SKUId and sku.SKUGoodName like @SKUGoodName
GO
/****** Object:  StoredProcedure [dbo].[selpro_zuixin]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selpro_zuixin]
as
--查询最后添加的三条数据

select TOP 3 sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName ,tp.PhotoID,tp.Photo_one,tp.Photo_two,tp.Photo_three,tp.Photo_four,tp.Photo_five from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop,GoodsPhotoTable tp where 
	sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID and tp.SKUId = sku.SKUId order by sku.SKUId desc
GO
/****** Object:  StoredProcedure [dbo].[selprocart_userid]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selprocart_userid](
@userid int
)
as
    --要求book_id和book_Auth列与输入参数相等
    select sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName,car.UserID,car.ShopCardID from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop,ShoppCar car where 
	sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID and sku.SKUId = car.SKUId and car.UserID = @userid
GO
/****** Object:  StoredProcedure [dbo].[selproorders_all]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selproorders_all]
as
    select distinct sku.SKUId,sku.SKUGoodName,sku.Goods_Description,sku.inventory,sku.GoodPhoto,sku.SPUID,u.UserName,ol.GoodPrice,ol.GoodNum,ol.OGid,oi.OrderID,oi.CreateTime,oi.PayState from 
	goodsSKUTables sku,UserTable u,OrderGoodslist ol,OrderInfo oi where 
 sku.SKUId = ol.SKUId and ol.OrderID = oi.OrderID and u.UserId = oi.UserId
GO
/****** Object:  StoredProcedure [dbo].[selproorders_zhuangtai]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selproorders_zhuangtai](
@userid int,
@zhuangtai nvarchar(20)
)
as
    select distinct sku.SKUId,sku.SKUGoodName,sku.Goods_Description,sku.inventory,sku.GoodPhoto,sku.SPUID,u.UserName,ol.GoodPrice,oi.OrderID,oi.CreateTime,oi.PayState from 
	goodsSKUTables sku,UserTable u,OrderGoodslist ol,OrderInfo oi where 
 sku.SKUId = ol.SKUId and ol.OrderID = oi.OrderID and u.UserId = oi.UserId and oi.PayState=@zhuangtai and u.UserId = @userid
GO
/****** Object:  StoredProcedure [dbo].[selproxaingqing]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selproxaingqing]
as
    --要求book_id和book_Auth列与输入参数相等
    select sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName from goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop where sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID

GO
/****** Object:  StoredProcedure [dbo].[selproxiangqing_rexiao]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selproxiangqing_rexiao]

as
    select top 5 sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop where 
	sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID order by onclicknum desc
GO
/****** Object:  StoredProcedure [dbo].[selspuandshoptype]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selspuandshoptype]
as
    --要求book_id和book_Auth列与输入参数相等
    select spu.*,shop.TypeName from goodsSPUTables spu,ShopCategory shop where spu.ShopID = shop.ShopID
GO
/****** Object:  StoredProcedure [dbo].[selspuandtype_id]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selspuandtype_id](
@id int
)
as
    select sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop 
	where sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID and shop.ShopID = @id
GO
/****** Object:  StoredProcedure [dbo].[selspuandtype_top]    Script Date: 2020/6/8 12:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selspuandtype_top]
as
    select top 8 sku.*,spu.SPUGoodName,spu.GoodInfo,shop.TypeName from 
	goodsSKUTables sku,goodsSPUTables spu,ShopCategory shop 
	where sku.SPUID = spu.SPUID and spu.ShopID = shop.ShopID and shop.ShopID = 8
GO
USE [master]
GO
ALTER DATABASE [lizishopping] SET  READ_WRITE 
GO
