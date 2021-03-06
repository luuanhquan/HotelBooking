USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 18/10/2020 5:22:33 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'HotelBooking')
BEGIN
CREATE DATABASE [HotelBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HotelBooking.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HotelBooking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [HotelBooking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBooking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBooking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBooking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HotelBooking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HotelBooking]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 18/10/2020 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(100000,1) NOT NULL,
	[GuestID] [int] NOT NULL,
	[RoomCount] [int] NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CheckIn] [date] NOT NULL,
	[CheckOut] [date] NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 18/10/2020 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guest]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Guest](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [bit] NULL CONSTRAINT [DF_Guest_Gender]  DEFAULT ((1)),
	[Address] [nvarchar](max) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 18/10/2020 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoomType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoomType](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[RoomType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Pictures] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RoomType_IsActive]  DEFAULT ((1)),
	[Rate] [int] NOT NULL CONSTRAINT [DF_RoomType_Rate]  DEFAULT ((0)),
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 18/10/2020 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [GuestID], [RoomCount], [RoomTypeID], [Remark], [Status], [CheckIn], [CheckOut]) VALUES (100001, 1000, 1, 101, NULL, 1, CAST(N'2020-02-10' AS Date), CAST(N'2020-04-12' AS Date))
INSERT [dbo].[Booking] ([Id], [GuestID], [RoomCount], [RoomTypeID], [Remark], [Status], [CheckIn], [CheckOut]) VALUES (100002, 1001, 3, 102, NULL, 1, CAST(N'2020-02-10' AS Date), CAST(N'2020-04-12' AS Date))
INSERT [dbo].[Booking] ([Id], [GuestID], [RoomCount], [RoomTypeID], [Remark], [Status], [CheckIn], [CheckOut]) VALUES (100004, 1000, 3, 103, NULL, 0, CAST(N'2020-02-10' AS Date), CAST(N'2020-04-12' AS Date))
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([Id], [FirstName], [LastName], [Gender], [Address], [Email], [Phone], [Password]) VALUES (1000, N'Vân Anh', N'Nguyễn', 0, N'123 Kim Mã', N'vananh@gmail.com', N'02731267479', N'123456')
INSERT [dbo].[Guest] ([Id], [FirstName], [LastName], [Gender], [Address], [Email], [Phone], [Password]) VALUES (1001, N'Phúc Trụ', N'Đào', 1, N'123 Văn Cao', N'trudao@gmail.com', N'0982387542', N'123456')
SET IDENTITY_INSERT [dbo].[Guest] OFF
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([Id], [RoomType], [Description], [Pictures], [IsActive], [Rate]) VALUES (100, N'Standard', NULL, N'null', 1, 800000)
INSERT [dbo].[RoomType] ([Id], [RoomType], [Description], [Pictures], [IsActive], [Rate]) VALUES (101, N'Superior', NULL, N'null', 1, 1000000)
INSERT [dbo].[RoomType] ([Id], [RoomType], [Description], [Pictures], [IsActive], [Rate]) VALUES (102, N'Deluxe', NULL, NULL, 1, 1200000)
INSERT [dbo].[RoomType] ([Id], [RoomType], [Description], [Pictures], [IsActive], [Rate]) VALUES (103, N'Deluxe City View', NULL, NULL, 1, 1500000)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [UserName], [Password], [IsActive]) VALUES (100, N'Lưu Anh Quân', N'LAQ', N'123456', 1)
INSERT [dbo].[User] ([Id], [Name], [UserName], [Password], [IsActive]) VALUES (101, N'Nguyễn Thành Đồng', N'NTD', N'123456', 1)
INSERT [dbo].[User] ([Id], [Name], [UserName], [Password], [IsActive]) VALUES (102, N'Đỗ Hoàng Long', N'DHL', N'123456', 1)
INSERT [dbo].[User] ([Id], [Name], [UserName], [Password], [IsActive]) VALUES (103, N'Nguyễn Văn Đại', N'NVD', N'123456', 1)
INSERT [dbo].[User] ([Id], [Name], [UserName], [Password], [IsActive]) VALUES (104, N'Nguyễn Huy Hoàng', N'NHH', N'123456', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
