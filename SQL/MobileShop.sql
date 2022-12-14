USE [master]
GO
/****** Object:  Database [PRJ301]    Script Date: 4/21/2022 4:41:29 PM ******/
CREATE DATABASE [PRJ301]
GO 
 /* CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.INSTANCE2007\MSSQL\DATA\PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.INSTANCE2007\MSSQL\DATA\PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
*/

ALTER DATABASE [PRJ301] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301', N'ON'
GO
ALTER DATABASE [PRJ301] SET QUERY_STORE = OFF
GO
USE [PRJ301]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Amount] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](200) NULL,
	[product_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[product_image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[User_id] [int] NOT NULL,
	[Paydate] [datetime] NOT NULL,
	[PaymentMethod] [nvarchar](200) NULL,
	[Payee] [nvarchar](200) NULL,
	[Amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[image] [nvarchar](25) NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](200) NOT NULL,
	[brand] [nvarchar](100) NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[cateID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/21/2022 4:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[roleId] [int] NULL,
	[phone] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[password] [varchar](40) NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Phone')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Charging cord')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Ear phone')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [ProductID], [Amount]) VALUES (1, 1, 40000000)
INSERT [dbo].[Order] ([Id], [ProductID], [Amount]) VALUES (2, 1, 80000000)
INSERT [dbo].[Order] ([Id], [ProductID], [Amount]) VALUES (3, 5, 2000000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1, 1, 1, N'IphoneXS', CAST(20000000 AS Decimal(18, 0)), 2, NULL)
INSERT [dbo].[Order_Detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2, 2, 1, N'IphoneXS', CAST(20000000 AS Decimal(18, 0)), 4, NULL)
INSERT [dbo].[Order_Detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (3, 3, 5, N'AirPod 3', CAST(1000000 AS Decimal(18, 0)), 2, NULL)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([id], [order_id], [User_id], [Paydate], [PaymentMethod], [Payee], [Amount]) VALUES (1, 1, 2, CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'paypal', N'paypal', 40000000)
INSERT [dbo].[Payment] ([id], [order_id], [User_id], [Paydate], [PaymentMethod], [Payee], [Amount]) VALUES (2, 2, 2, CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'paypal', N'paypal', 80000000)
INSERT [dbo].[Payment] ([id], [order_id], [User_id], [Paydate], [PaymentMethod], [Payee], [Amount]) VALUES (3, 3, 3, CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'paypal', N'paypal', 2000000)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [price], [quantity], [description], [brand], [size], [model], [cateID]) VALUES (1, N'IphoneXS', NULL, 20000000, 100, N'Nice', N'Apple', N'6.5inch', N'2020', 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [quantity], [description], [brand], [size], [model], [cateID]) VALUES (2, N'SamSungJ5', NULL, 7000000, 100, N'Nice', N'Samsung', N'5 inch', N'2016', 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [quantity], [description], [brand], [size], [model], [cateID]) VALUES (3, N'Oppo a95', NULL, 6500000, 100, N'Nice', N'Oppo', N'6.5inch', N'2018', 1)
INSERT [dbo].[Product] ([id], [name], [image], [price], [quantity], [description], [brand], [size], [model], [cateID]) VALUES (4, N'Iphone XS cord', NULL, 550000, 100, N'Nice', N'Apple', N'30 cm', N'2020', 2)
INSERT [dbo].[Product] ([id], [name], [image], [price], [quantity], [description], [brand], [size], [model], [cateID]) VALUES (5, N'AirPod 3', NULL, 1000000, 100, N'Nice', N'Apple', N'3 cm', N'2020', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [roleId], [phone], [email], [address], [password]) VALUES (1, N'Dung', 1, N'985066089', N'ntd113663@gmail.com', N'Hai Phong', N'123456')
INSERT [dbo].[User] ([id], [name], [roleId], [phone], [email], [address], [password]) VALUES (2, N'Quan', 2, N'985066088', N'naq113663@gmail.com', N'Hai Phong', N'abcdefg1')
INSERT [dbo].[User] ([id], [name], [roleId], [phone], [email], [address], [password]) VALUES (3, N'Trung', 2, N'985066087', N'tdt113663@gmail.com', N'Hai Phong', N'overlord')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [PRJ301] SET  READ_WRITE 
GO
