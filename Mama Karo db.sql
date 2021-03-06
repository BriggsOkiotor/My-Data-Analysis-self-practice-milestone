USE [master]
GO
/****** Object:  Database [MKdb]    Script Date: 09/07/2022 1:31:20 am ******/
CREATE DATABASE [MKdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MKdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MKdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MKdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MKdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MKdb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MKdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MKdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MKdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MKdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MKdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MKdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [MKdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MKdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MKdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MKdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MKdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MKdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MKdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MKdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MKdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MKdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MKdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MKdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MKdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MKdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MKdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MKdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MKdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MKdb] SET RECOVERY FULL 
GO
ALTER DATABASE [MKdb] SET  MULTI_USER 
GO
ALTER DATABASE [MKdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MKdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MKdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MKdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MKdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MKdb', N'ON'
GO
ALTER DATABASE [MKdb] SET QUERY_STORE = OFF
GO
USE [MKdb]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](11) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Gender] [char](9) NOT NULL,
	[DateofBirth] [date] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK__Customer__A4AE64B871A31546] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[DeptPhoneNo] [varchar](11) NOT NULL,
	[DeptNo] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[SalesAmount] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[OderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[OtherStatus] [varchar](50) NOT NULL,
	[OrderNo] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priviledge]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priviledge](
	[PriviledgeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PriviledgeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](255) NOT NULL,
	[Product ] [varchar](50) NOT NULL,
	[Category] [char](6) NOT NULL,
	[Size] [char](10) NOT NULL,
	[Available] [bit] NOT NULL,
	[Instuck] [bit] NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleDescription] [varchar](255) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[PriviledgeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](11) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Gender] [char](9) NOT NULL,
	[DateofBirth] [date] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[AccountNumber] [varchar](10) NOT NULL,
	[Salary] [bigint] NOT NULL,
	[EndDate] [date] NOT NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleMapper]    Script Date: 09/07/2022 1:31:20 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleMapper](
	[UserRoleMapperID] [int] IDENTITY(1,1) NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBY] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleMapperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Create__1332DBDC]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Modifi__14270015]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Active__151B244E]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Delete__160F4887]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Priviledge] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Priviledge] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Priviledge] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Instuck]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[UserRoleMapper] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[UserRoleMapper] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[UserRoleMapper] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserRoleMapper] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__CustomerI__2BFE89A6] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__CustomerI__2BFE89A6]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD FOREIGN KEY([PriviledgeID])
REFERENCES [dbo].[Priviledge] ([PriviledgeID])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[UserRoleMapper]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[UserRoleMapper]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoleMapper]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
USE [master]
GO
ALTER DATABASE [MKdb] SET  READ_WRITE 
GO
