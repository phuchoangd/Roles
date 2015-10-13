USE [master]
GO
/****** Object:  Database [RolesMVC]    Script Date: 10/13/2015 9:36:20 PM ******/
CREATE DATABASE [RolesMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RolesMVC', FILENAME = N'E:\learn\HocKy11\data\RolesMVC.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RolesMVC_log', FILENAME = N'E:\learn\HocKy11\data\RolesMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RolesMVC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RolesMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RolesMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RolesMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RolesMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RolesMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RolesMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [RolesMVC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RolesMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RolesMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RolesMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RolesMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RolesMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RolesMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RolesMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RolesMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RolesMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RolesMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RolesMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RolesMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RolesMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RolesMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RolesMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RolesMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RolesMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RolesMVC] SET  MULTI_USER 
GO
ALTER DATABASE [RolesMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RolesMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RolesMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RolesMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RolesMVC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RolesMVC]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/13/2015 9:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](56) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/13/2015 9:36:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](56) NULL,
	[Password] [nvarchar](128) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'users')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'anon')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (1, N'admin', N'111', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (2, N'user', N'111', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (3, N'anon', N'111', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (4, N'anon2', N'111', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [RoleID]) VALUES (5, N'admin2', N'111', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [RolesMVC] SET  READ_WRITE 
GO
