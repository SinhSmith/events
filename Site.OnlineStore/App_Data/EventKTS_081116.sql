USE [master]
GO
/****** Object:  Database [PortalDB.Event]    Script Date: 11/8/2016 11:52:31 PM ******/
CREATE DATABASE [PortalDB.Event]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PortalDB.Event', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PortalDB.Event.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PortalDB.Event_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PortalDB.Event_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PortalDB.Event] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PortalDB.Event].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PortalDB.Event] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PortalDB.Event] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PortalDB.Event] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PortalDB.Event] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PortalDB.Event] SET ARITHABORT OFF 
GO
ALTER DATABASE [PortalDB.Event] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PortalDB.Event] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PortalDB.Event] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PortalDB.Event] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PortalDB.Event] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PortalDB.Event] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PortalDB.Event] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PortalDB.Event] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PortalDB.Event] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PortalDB.Event] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PortalDB.Event] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PortalDB.Event] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PortalDB.Event] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PortalDB.Event] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PortalDB.Event] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PortalDB.Event] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PortalDB.Event] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PortalDB.Event] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PortalDB.Event] SET RECOVERY FULL 
GO
ALTER DATABASE [PortalDB.Event] SET  MULTI_USER 
GO
ALTER DATABASE [PortalDB.Event] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PortalDB.Event] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PortalDB.Event] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PortalDB.Event] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PortalDB.Event]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/8/2016 11:52:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_Categories]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_News]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CoverImageId] [int] NULL,
	[Title] [nvarchar](200) NOT NULL,
	[SubTitle] [nvarchar](200) NOT NULL,
	[ContentNews] [nvarchar](max) NOT NULL,
	[Authors] [nvarchar](200) NULL,
	[Tags] [nvarchar](200) NULL,
	[TotalView] [int] NULL,
	[DisplayHomePage] [bit] NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_Event]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_Event](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[OwnerId] [nvarchar](128) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[OrganizationName] [nvarchar](100) NULL,
	[OrganizationDescription] [nvarchar](300) NULL,
	[CoverImageId] [int] NULL,
	[PaymentEmail] [nvarchar](50) NULL,
	[EventType] [int] NOT NULL,
	[EventTopic] [int] NOT NULL,
	[IsShowRemainingNumberTicket] [bit] NOT NULL,
	[Location_StreetName] [nvarchar](500) NULL,
	[Location_Address] [nvarchar](500) NULL,
	[Location_Address2] [nvarchar](500) NULL,
	[Location_City] [nvarchar](100) NULL,
	[Location_State] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Country] [nvarchar](100) NULL,
	[Status] [int] NOT NULL,
	[SortOrder] [int] NULL,
	[IsVerified] [bit] NOT NULL,
 CONSTRAINT [PK_event_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_EventSchedule]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_EventSchedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_event_EventSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_Order]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[EventId] [int] NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[EmailAddress] [nchar](200) NULL,
	[Status] [int] NULL,
	[OrderTime] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_Ticket]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_Ticket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Quantity] [int] NOT NULL,
	[AvailableTicketQuantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsShowDescription] [bit] NOT NULL,
	[SaleChanel] [int] NOT NULL,
	[SaleEndOption] [int] NULL,
	[IsHide] [bit] NOT NULL,
	[MinimunTicketOrder] [int] NOT NULL,
	[MaximunTicketOrder] [int] NOT NULL,
	[TicketCode] [nvarchar](200) NOT NULL,
	[Status] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[StartSaleDateTime] [datetime] NOT NULL,
	[EndSaleDateTime] [datetime] NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_event_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_TicketOrder]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_TicketOrder](
	[TicketId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_event_TicketOrder] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[portal_News_Projects]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portal_News_Projects](
	[NewId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_portal_News_Projects] PRIMARY KEY CLUSTERED 
(
	[NewId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[portal_Projects]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portal_Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Region] [int] NOT NULL,
	[Address] [nchar](500) NOT NULL,
	[Investor] [nchar](200) NULL,
	[ProjectPackage] [nchar](500) NULL,
	[TotalInvestment] [nchar](100) NULL,
	[Duration] [nchar](200) NOT NULL,
	[ProgressStatus] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CoverImageId] [int] NULL,
	[Name] [nchar](200) NOT NULL,
	[Description] [nchar](500) NULL,
	[Description2] [nvarchar](max) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[portal_Projects_Images]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portal_Projects_Images](
	[ProjectId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_portal_Projects_Images] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Categories]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Images]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](300) NOT NULL,
	[ImagePath] [nvarchar](700) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Banners]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Banners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Type] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Banners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Config]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Value] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_system_tracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Menu]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Url] [nvarchar](500) NULL,
	[SortOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Icon] [nvarchar](250) NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Organisers]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Organisers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[AvatarId] [int] NULL,
	[OrganiserName] [nvarchar](250) NOT NULL,
	[About] [ntext] NULL,
	[Website] [nvarchar](255) NULL,
	[Facebook] [nvarchar](255) NULL,
	[Twitter] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Organisers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Profiles]    Script Date: 11/8/2016 11:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[system_Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Emaill] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Status] [int] NULL,
	[Prefix] [char](1) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](250) NULL,
	[Company] [nvarchar](250) NULL,
	[Website] [nvarchar](255) NULL,
	[Blog] [nvarchar](255) NULL,
	[Home_Address] [nvarchar](250) NULL,
	[Home_Address2] [nvarchar](250) NULL,
	[Home_City] [nvarchar](250) NULL,
	[Billing_Address] [nvarchar](250) NULL,
	[Billing_Address2] [nvarchar](250) NULL,
	[Billing_City] [nvarchar](250) NULL,
	[Shipping_Address] [nvarchar](250) NULL,
	[Shipping_Address2] [nvarchar](250) NULL,
	[Shipping_City] [nvarchar](250) NULL,
	[Work_Address] [nvarchar](250) NULL,
	[Work_Address2] [nvarchar](250) NULL,
	[Work_City] [nvarchar](250) NULL,
	[Gender] [char](1) NULL,
	[BirthDate] [datetime] NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_system_profiles_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'admin', N'Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'user', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@admin.com', 0, N'ALTLD2XQj20rF1Dv707/hCYZsfjBC3sJeg9b44xGovSfBU7nTcjh/G4ZiYApydqCzQ==', N'26696055-fdf6-4204-a4a5-12ac33f5c991', NULL, 0, 0, NULL, 1, 0, N'admin@admin.com')
SET IDENTITY_INSERT [dbo].[cms_Categories] ON 

INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, NULL, N'Tin tức', N'Tin tức', N'/tin-tuc', 1, 1, NULL, CAST(0x0000A631015E8660 AS DateTime), NULL, CAST(0x0000A64801768E06 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 1, N'Tin khuyến mãi', N'Tin khuyến mãi', N'/tin-khuyen-mai', 2, 1, NULL, CAST(0x0000A6330167D922 AS DateTime), NULL, CAST(0x0000A648017709FE AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 1, N'Tin tức hằng ngày', N'Tin tức hằng ngày', NULL, 1, 1, NULL, CAST(0x0000A63301688862 AS DateTime), NULL, CAST(0x0000A6480176F035 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, NULL, N'Blog', N'Blog', N'/blog', 2, 1, NULL, CAST(0x0000A6330168924C AS DateTime), NULL, CAST(0x0000A64801769A53 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, 5, N'Tư vấn nội thất', N'Tư vấn nội thất', N'/tu-van-noi-that', 1, 1, NULL, CAST(0x0000A6330170F3D1 AS DateTime), NULL, CAST(0x0000A6480177289A AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, 5, N'Thiết kế nội thất', N'Thiết kế nội thất', N'/thiet-ke-noi-that', 2, 1, NULL, CAST(0x0000A64801775692 AS DateTime), NULL, CAST(0x0000A64801775692 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, 5, N'Trang trí nội thất', N'Trang trí nội thất', N'/trang-tri-noi-that', 3, 1, NULL, CAST(0x0000A64801777251 AS DateTime), NULL, CAST(0x0000A64801777251 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, 5, N'Phong thủy nội thất', N'Phong thủy nội thất', N'/phong-thuy-noi-that', 4, 1, NULL, CAST(0x0000A64801778EDF AS DateTime), NULL, CAST(0x0000A64801778EDF AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, 5, N'Phong cách hiện đại', N'Các bài viết về thiết kế, trang trí nhà cửa theo phong cách hiện đại', N'/phong-cach-hien-dai', 1, 1, NULL, CAST(0x0000A66E0170100D AS DateTime), NULL, CAST(0x0000A6710186114E AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 5, N'Phong cách cổ điển', N'Các bài viết về thiết kế, trang trí nhà cửa theo phong cách cổ điển', N'/phong-cach-co-dien', 1, 1, NULL, CAST(0x0000A66E01707844 AS DateTime), NULL, CAST(0x0000A67101861FFD AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, 11, N'Gam màu tím', N'Các bài viết về cách trang trí nhà cửa theo phong cách hiện đại với gam màu tím', N'/phong-cach-hien-dai/tim', 3, 1, NULL, CAST(0x0000A66E0171E26B AS DateTime), NULL, CAST(0x0000A6710186E47F AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, 11, N'Gam màu trắng', N'Các bài viết về trang trí nhà cửa theo phong cách hiện đại với gam màu trắng', N'/phong-cach-hien-dai/trang', 4, 1, NULL, CAST(0x0000A66E01723947 AS DateTime), NULL, CAST(0x0000A67101866851 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, 11, N'Gam màu xám', N'Các bài viết về trang trí nhà cửa theo phong cách hiện đại với gam màu xám', N'/phong-cach-hien-dai/xam', 4, 1, NULL, CAST(0x0000A66E017292A8 AS DateTime), NULL, CAST(0x0000A67101867C2A AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, NULL, N'Giới thiệu', N'Giới thiệu', N'/gioi-thieu', 0, 1, NULL, CAST(0x0000A67101840E56 AS DateTime), NULL, CAST(0x0000A67101840E56 AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_Categories] OFF
SET IDENTITY_INSERT [dbo].[cms_News] ON 

INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, 6, 108, N'Sử dụng nội thất để biến căn hộ nhỏ thành lớn khó tin', N'Sử dụng nội thất để biến căn hộ nhỏ thành lớn khó tin', N'<p><strong>Vừa qua, tại tuần lễ Milan Design Week 2016, ch&uacute;ng t&ocirc;i đ&atilde; thu thập được những mẫu thết kế nội thất cực k&igrave; s&aacute;ng tạo v&agrave; nổi bật. Đặc biệt, ch&uacute;ng c&ograve;n sở hữu những t&iacute;nh năng ph&ugrave; hợp với kh&ocirc;ng gian nhỏ.</strong></p>

<p>Bộ sưu tập đầu ti&ecirc;n mang t&ecirc;n&nbsp;&nbsp;PLAY collection của nh&agrave; thiết kế&nbsp;Lanzavecchia &amp; Wai d&agrave;nh cho t&iacute;n đồ y&ecirc;u th&iacute;ch m&agrave;u t&iacute;m l&atilde;ng mạn. Tr&ocirc;ng c&oacute; vẻ đơn giản nhưng sự kết hợp giữa kệ s&aacute;ch với b&agrave;n c&ograve;n&nbsp;mang&nbsp;th&ocirc;ng điệp l&agrave; sự kết nối.</p>

<p><img alt="noi that nha rong (6)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26417/noi-that-nha-rong-6.jpg" style="height:500px; width:750px" /></p>

<p><em>M&agrave;u t&iacute;m l&atilde;ng mạn v&agrave; n&acirc;u trầm l&agrave; một sự kết hợp ho&agrave;n hảo.</em></p>

<p>Mẫu tiếp theo kh&aacute; quen thuộc, v&igrave; n&oacute; đ&atilde; từng xuất hiện v&agrave;o năm 1950.</p>

<p><img alt="noi that nha rong (1)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26417/noi-that-nha-rong-1.jpg" style="height:1000px; width:750px" /></p>

<p><em>Một phần ba b&agrave;n được thiết kế c&oacute; thể gập lại để căn ph&ograve;ng gọn g&agrave;ng hơn v&agrave; mở rộng ra đủ để phục vụ cho nhiều người.</em></p>

<p>Lấy cảm hứng từ kiểu d&aacute;ng của chiếc tủ lạnh, kệ bếp trở n&ecirc;n k&iacute;n đ&aacute;o hơn. Khi sử dụng, bạn chỉ cần mở c&aacute;nh cửa tủ l&agrave; sẽ c&oacute; ngay một kh&ocirc;ng gian bếp đầy đủ tiện nghi.</p>

<p><img alt="noi that nha rong (2)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26417/noi-that-nha-rong-2.jpg" style="height:711px; width:750px" /></p>

<p><em>C&ograve;n g&igrave; tuyệt vời hơn khi sở hữu một tủ bếp th&ocirc;ng minh thế n&agrave;y!</em></p>

<p>Bộ sưu tập thứ tư l&agrave; mẫu ghế kh&aacute; bắt mắt v&agrave; độc đ&aacute;o bởi những đường n&eacute;t uốn lượn c&ugrave;ng m&agrave;u sắc cổ điển.</p>

<p><img alt="noi that nha rong (3)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26417/noi-that-nha-rong-3.jpg" style="height:964px; width:750px" /></p>

<p><em>Chất liệu nhựa tổng hợp tạo độ b&oacute;ng cho ghế.</em></p>

<p>Bạn sẽ hối tiếc nếu bỏ qua mẫu kệ h&igrave;nh chữ nhật được l&agrave;m từ sắt vừa nhỏ nhắn vừa tiện lợi. Đ&acirc;y l&agrave; &yacute; tưởng gi&uacute;p bạn qu&ecirc;n đi những chiếc tủ đồ cồng kềnh v&agrave; c&oacute; được một kh&ocirc;ng gian gọn g&agrave;ng với chức năng treo đồ, t&uacute;i x&aacute;ch, quần &aacute;o&hellip;</p>

<p><img alt="noi that nha rong (4)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26417/noi-that-nha-rong-4.jpg" style="height:498px; width:750px" /></p>

<p>B&ecirc;n cạnh đ&oacute;, c&ograve;n c&oacute; những chiếc gương treo với nhiều k&iacute;ch thước kh&aacute;c nhau, c&oacute; thể di chuyển đi bất cứ vị tr&iacute; n&agrave;o trong nh&agrave;. Bạn ho&agrave;n to&agrave;n c&oacute; thể treo l&ecirc;n để trang tr&iacute; t&ugrave;y &yacute; th&iacute;ch. Thật tiện dụng phải kh&ocirc;ng n&agrave;o?</p>

<p><img alt="noi that nha rong (5)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26417/noi-that-nha-rong-5.jpg" style="height:500px; width:750px" /></p>
', N'Admin', N'nội thất cá tính;nội thất đẹp;nội thất độc đáo', 16, 1, NULL, 1, NULL, CAST(0x0000A645017B1245 AS DateTime), NULL, CAST(0x0000A64801784E06 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, 6, 109, N'Ngẩn ngơ trước vẻ đẹp tươi sáng của căn hộ 38 m2', N'Ngẩn ngơ trước vẻ đẹp tươi sáng của căn hộ 38 m2', N'<p><strong>Với diện t&iacute;ch 38 m2, căn hộ sau đ&acirc;y sẽ khiến bạn kh&ocirc;ng khỏi ngạc nhi&ecirc;n trước vẻ tươi s&aacute;ng v&agrave; sự b&agrave;i tr&iacute; nội thất hết sức tinh tế. Qua đ&oacute;, c&oacute; thể gi&uacute;p bạn tăng nguồn cảm hứng để trang tr&iacute; ng&ocirc;i nh&agrave; nhỏ b&eacute; của m&igrave;nh th&ecirc;m xinh xắn v&agrave; hiện đại.</strong></p>

<p><img alt="can ho 38m2 (11)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-11.jpg" style="height:400px; width:600px" /></p>

<p><em>Bởi sự hạn chế về diện t&iacute;ch n&ecirc;n căn hộ n&agrave;y chỉ đủ chỗ cho những thứ thiết yếu. Đặc biệt l&agrave; những m&oacute;n đồ g&oacute;p phần tiết kiệm kh&ocirc;ng gian.</em></p>

<p><em><img alt="can ho 38m2 (12)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-12.jpg" style="height:400px; width:600px" /></em></p>

<p><em>M&agrave;u trắng tinh kh&ocirc;i v&agrave; s&agrave;n gỗ mộc mạc l&agrave; điểm thu h&uacute;t của căn nh&agrave;.</em></p>

<p><em><img alt="can ho 38m2 (13)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-13.jpg" style="height:407px; width:600px" /></em></p>

<p><em>Giường ngủ đước đặt cạnh cửa sổ, th&iacute;ch hợp để đ&oacute;n &aacute;nh s&aacute;ng v&agrave;o buổi sớm mai.</em></p>

<p><em><img alt="can ho 38m2 (4)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-4.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Nh&agrave; bếp đầy đủ tiện nghi với tủ, kệ nhiều ngăn, đảm bảo kh&ocirc;ng gian lưu trữ hiệu quả.</em></p>

<p><em><img alt="can ho 38m2 (1)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-1.jpg" style="height:400px; width:600px" /></em></p>

<p><em>&nbsp;Thiết kế hai cửa sổ hứng &aacute;nh s&aacute;ng từ ngo&agrave;i v&agrave;o, cho kh&ocirc;ng gian nội thật th&ecirc;m nổi bật.</em></p>

<p><em><img alt="can ho 38m2 (2)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-2.jpg" style="height:400px; width:600px" /></em></p>

<p><em>&nbsp;Bố tr&iacute; một chiếc tivi trong ph&ograve;ng gi&uacute;p gia đ&igrave;nh bạn thư gi&atilde;n sau ng&agrave;y l&agrave;m việc vất vả.</em></p>

<p><em><img alt="can ho 38m2 (5)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-5.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Trần nh&agrave; cao, sơn trắng gi&uacute;p ph&ograve;ng bếp như rộng hơn, mang lại cảm gi&aacute;c thoải m&aacute;i.</em></p>

<p><em><img alt="can ho 38m2 (3)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-3.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Ph&ograve;ng ngủ c&oacute; g&aacute;c lửng nhỏ, được sử dụng như một chiếc giường thứ hai nếu bạn muốn thay đổi kh&ocirc;ng kh&iacute;.</em></p>

<p><em><img alt="can ho 38m2 (7)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-7.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Ph&iacute;a sau ph&ograve;ng tắm l&agrave; một kh&ocirc;ng gian cho bạn phơi quần &aacute;o hoặc để những vật dụng kh&aacute;c.</em></p>

<p><em><img alt="can ho 38m2 (6)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-6.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Hệ thống nội thất ph&ograve;ng tắm được tối giản h&oacute;a.</em></p>

<p><em><img alt="can ho 38m2 (9)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-9.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Ph&iacute;a ngo&agrave;i s&acirc;n l&agrave; nơi bạn c&oacute; thể đặt những chậu hoa nhiều m&agrave;u sắc để c&oacute; được một kh&ocirc;ng gian gần gũi với thi&ecirc;n nhi&ecirc;n.</em></p>

<p><em><img alt="can ho 38m2 (10)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-10.jpg" style="height:400px; width:600px" /></em></p>

<p><em>Đặt th&ecirc;m bộ b&agrave;n ghế để c&oacute; một kh&ocirc;ng gian ăn uống ngo&agrave;i trời.</em></p>

<p><img alt="can ho 38m2 (8)" src="http://thegioinoithat.com/images/post/2016/07/17/18/26414/can-ho-38m2-8.jpg" style="height:339px; width:600px" /></p>

<p><em>Sơ đồ mặt bằng căn hộ 38 m2.</em></p>
', N'Admin', N'bài trí nội thất;bài trí phòng khách;bài trí phòng ngủ', 20, 1, NULL, 1, NULL, CAST(0x0000A6480178D019 AS DateTime), NULL, CAST(0x0000A6480178D019 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, 6, 110, N'3 xu hướng thiết kế nội thất nổi bật của mùa thu', N'3 xu hướng thiết kế nội thất nổi bật của mùa thu', N'<p><strong>Thay đổi nội thất trong căn nh&agrave; v&agrave;o những khoảnh khoắc giao m&ugrave;a cũng l&agrave; c&aacute;ch để cảm nhận sự chuyển biến của thời tiết. H&atilde;y c&ugrave;ng ch&uacute;ng t&ocirc;i t&igrave;m hiểu 3 xu hướng nội thất nổi bật trong m&ugrave;a thu năm nay.</strong></p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (20)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-20.jpg" style="height:396px; width:600px" /></p>

<p><strong>1. Tinh tế với s&agrave;n nh&agrave; m&agrave;u đen</strong></p>

<p>S&agrave;n nh&agrave; m&agrave;u đen cho thấy bạn l&agrave; một người y&ecirc;u th&iacute;ch sự đơn giản hoặc l&agrave; bạn kh&ocirc;ng th&iacute;ch qu&aacute; nhiều &yacute; tưởng. Mặc kh&aacute;c, v&igrave; n&oacute; l&agrave; m&agrave;u trung t&iacute;nh n&ecirc;n n&oacute; sẽ kh&ocirc;ng ảnh hưởng đến phần nội thất b&ecirc;n tr&ecirc;n. V&agrave; một đều hết sức quan trọng ch&iacute;nh l&agrave; kh&ocirc;ng thể phũ nhận sự tinh tế m&agrave; m&agrave;u đen đem đến cho căn ph&ograve;ng. Để thực hiện cho &yacute; tưởng s&agrave;n m&agrave;u đen th&igrave; c&oacute; rất nhiều lựa chọn v&agrave; chất liệu, đặc biệt nhất cho m&ugrave;a thu n&agrave;y l&agrave; gỗ hoặc đ&aacute; tự nhi&ecirc;n. Tuy nhi&ecirc;n, c&oacute; một v&agrave;i vấn đề nhỏ khi bạn quyết định lựa chọn m&agrave;u đen cho phần s&agrave;n: v&igrave; s&agrave;n nh&agrave; lu&ocirc;n l&agrave; yếu tố &iacute;t khi thay đổi nhiều trong một ng&ocirc;i nh&agrave;. Do đ&oacute;, phải c&acirc;n nhắc thận trọng khi chọn m&agrave;u đen trong thiết kế để gi&uacute;p đạt được hiệu quả tốt nhất.</p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (21)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-21.jpg" style="height:397px; width:600px" /></p>

<p><em>Ph&ograve;ng kh&aacute;ch tối giản với s&agrave;n gạch m&agrave;u đen.</em></p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (22)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-22.jpg" style="height:394px; width:600px" /></p>

<p><em>S&agrave;n gỗ m&agrave;u đen kết hợp tường sơn trắng trong ph&ograve;ng ngủ hiện đại.</em></p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (23)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-23.jpg" style="height:393px; width:600px" /></p>

<p><em>S&agrave;n gạch bếp m&agrave;u đen với sự kết hợp c&aacute;c mảng gạch b&oacute;ng v&agrave; mờ một c&aacute;ch độc đ&aacute;o.</em></p>

<p>Đ&aacute; tự nhi&ecirc;n mang đến sự nổi bật sang trọng v&agrave; c&oacute; sức quyến rũ k&igrave; lạ. Gạch m&agrave;u đen cũng mang lại hiệu ứng tương tự đậm chất Mid-century Modern của những năm 40 đến 70 của thế kỉ trước. Đ&oacute; l&agrave; một phong c&aacute;ch giao thoa giữa c&aacute;i tự nhi&ecirc;n v&agrave; hiện đại, c&aacute;i cũ v&agrave; c&aacute;i mới. S&agrave;n m&agrave;u đen được ưa chuộng nhanh ch&oacute;ng ở hầu khắp c&aacute;c nơi tr&ecirc;n thế giới do đ&oacute; n&oacute; l&agrave; một sự lựa chọn ho&agrave;n hảo cho ai muốn thay đổi diện mạo ng&ocirc;i nh&agrave; trong m&ugrave;a thu n&agrave;y.</p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (24)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-24.jpg" style="height:701px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (1)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-1.jpg" style="height:481px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (2)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-2.jpg" style="height:454px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (3)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-3.jpg" style="height:442px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (4)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-4.jpg" style="height:401px; width:600px" />&nbsp;<strong>2.&nbsp;R&egrave;m cửa vải sheer m&aacute;t mẻ, trang nh&atilde;</strong></p>

<p>Vải sheer &ndash; một loại vải c&oacute; chất liệu mỏng, xuy&ecirc;n thấu như voan, chiffon, silk mềm&hellip; xu hướng r&egrave;m cửa vải sheers đ&atilde; quay trở lại từ đầu năm 2004. Việc lựa chọn r&egrave;m cửa chứng tỏ bạn l&agrave; một người biết nắm bắt xu hướng. R&egrave;m cửa n&agrave;y c&oacute; khả năng lọc đủ &aacute;nh s&aacute;ng để mang đến sự kh&aacute;c biệt trong phong c&aacute;ch trang tr&iacute; nội thất. R&egrave;m cửa sheers kh&ocirc;ng chỉ đẹp, sang trọng trong kh&ocirc;ng gian ph&ograve;ng ăn m&agrave; c&ograve;n tạo sự ấm &aacute;p trong ph&ograve;ng ngủ.</p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (5)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-5.jpg" style="height:403px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (6)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-6.jpg" style="height:417px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (7)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-7.jpg" style="height:446px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (8)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-8.jpg" style="height:396px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (10)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-10.jpg" style="height:409px; width:600px" /></p>

<p>Một cửa sổ ho&agrave;n hảo l&agrave; phải cần sự c&acirc;n bằng giữa h&igrave;nh thức v&agrave; chức năng. Khi lớp vải mỏng kh&ocirc;ng ph&ugrave; hợp cho việc tạo t&iacute;nh ri&ecirc;ng biệt nhất định th&igrave; c&oacute; thể sử dụng th&ecirc;m một lớp r&egrave;m, n&oacute; vừa đẹp lại vừa đ&oacute;ng vai tr&ograve; giảm thiểu ảnh hưởng từ những thứ b&ecirc;n ngo&agrave;i với căn ph&ograve;ng.</p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (9)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-9.jpg" style="height:395px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (11)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-11.jpg" style="height:445px; width:600px" /></p>

<p><strong>3. Tone m&agrave;u x&aacute;m, v&agrave;ng v&agrave; m&agrave;u ngọc</strong></p>

<p>H&atilde;y lựa chọn cho m&igrave;nh một m&agrave;u sắc ph&ugrave; hợp để tạo một vẻ tươi mới cho nội thất của căn ph&ograve;ng m&igrave;nh v&agrave;o thời điểm khi thế giới b&ecirc;n ngo&agrave;i bắt đầu đổi m&agrave;u trong những th&aacute;ng tiếp theo. M&agrave;u x&aacute;m, m&agrave;u trung t&iacute;nh vẫn tiếp tục đứng đ&agrave;u danh s&aacute;ch lựa chọn của hầu hết những chủ nh&agrave;. Điểm nhấn m&agrave;u kim loại được ưa chuộng nhất v&agrave;o m&ugrave;a thu năm nay, đồ nội thất v&agrave; đặt biệt l&agrave; phụ kiện m&agrave;u v&agrave;ng. Tone m&agrave;u ngọc, một m&agrave;u sắc kh&ocirc;ng chỉ hứa hẹn mang lại sự lộng lẫy v&agrave; ấm &aacute;p cho ng&ocirc;i nh&agrave; m&agrave; c&ograve;n l&agrave;m t&ocirc;n th&ecirc;m vẻ đẹp cho c&aacute;c m&agrave;u sắc kh&aacute;c.</p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (12)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-12.jpg" style="height:395px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (13)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-13.jpg" style="height:506px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (14)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-14.jpg" style="height:710px; width:600px" /></p>

<p>Trong khi tone pastel được phổ biến tr&ecirc;n to&agrave;n thế giới v&agrave;o m&ugrave;a h&egrave; n&agrave;y, th&igrave; m&ugrave;a thu l&agrave; khoảng thời gian để bạn quyết định thay đổi căn ph&ograve;ng của m&igrave;nh theo hướng mạnh mẽ hơn, t&aacute;o bạo hơn với một bảng m&agrave;u đầy sự đa dạng. Xanh ngọc lục bảo, ngọc lam, ngọc b&iacute;ch hay ruby l&agrave; những m&agrave;u sắc m&agrave; c&oacute; sức truyền tải đặc biệt những sắc th&aacute;i k&igrave; diệu trong c&aacute;c th&aacute;ng tới.</p>

<p><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (15)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-15.jpg" style="height:398px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (16)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-16.jpg" style="height:397px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (17)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-17.jpg" style="height:432px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (18)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-18.jpg" style="height:347px; width:600px" /><img alt="3 xu huong thiet ke noi that noi bat cua mua thu (19)" src="http://thegioinoithat.com/images/post/2016/06/30/09/11346/3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-19.jpg" style="height:449px; width:600px" /></p>

<p>Nội thất kh&ocirc;ng giống như quần &aacute;o v&agrave; gi&agrave;y d&eacute;p, tuy nhi&ecirc;n n&oacute; cũng c&oacute; những xu hướng nhất định theo thời gian. Thay đổi diện mạo nội thất trong căn nh&agrave; của m&igrave;nh v&agrave;o những khoảnh khắc giao m&ugrave;a cũng l&agrave; c&aacute;ch để cảm nhận sự chuyển biến thi&ecirc;n nhi&ecirc;n v&agrave; tạo cho bản th&acirc;n một cảm gi&aacute;c tươi mới.</p>
', N'Admin', N'bài trí phòng phòng bếp;căn hộ ấn tượng;', 13, 1, NULL, 1, NULL, CAST(0x0000A648017931F2 AS DateTime), NULL, CAST(0x0000A648017931F2 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, 8, 111, N'Thiết kế nhà theo phong cách thôn dã', N'Thiết kế nhà theo phong cách thôn dã', N'<p><strong>Khi c&oacute; &yacute; định tự m&igrave;nh thiết kế một căn nh&agrave;, chắc hẳn việc t&igrave;m &yacute; tưởng sẽ rất kh&oacute; khăn. L&agrave;m thế n&agrave;o để b&agrave;i tr&iacute; nội thất một c&aacute;ch khoa học v&agrave; kết hợp m&agrave;u sắc thật h&agrave;i h&ograve;a l&agrave; những băn khoăn thường gặp nhất. Tổ ấm của nh&agrave; thiết kế nội thất Thụy Điển Olsson Nylander dưới đ&acirc;y sẽ cho bạn th&ecirc;m nhiều gợi &yacute; để thiết kế căn nh&agrave; của m&igrave;nh theo ti&ecirc;u ch&iacute; vừa đơn giản vừa đẹp mắt lại gần gũi với thi&ecirc;n nhi&ecirc;n.</strong></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-14" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-14-1.jpg" style="height:731px; width:500px" /><em>Với tấm thảm trải mang họa tiết ngựa vằn v&agrave; bộ b&agrave;n ghế m&agrave;u c&aacute;nh gi&aacute;n c&ugrave;ng căn ph&ograve;ng t&ocirc;ng trắng chủ đạo đ&atilde; biến đổi kh&ocirc;ng gian trở n&ecirc;n tinh tế v&agrave; mới lạ hơn, điểm cộng tiếp theo của thiết kế n&agrave;y ch&iacute;nh l&agrave; lựa chọn cửa k&iacute;nh thay v&igrave; những c&aacute;nh cửa k&iacute;n đ&aacute;o kh&aacute;c. Điểm n&agrave;y l&agrave;m cho căn ph&ograve;ng như rộng hơn, gần gũi hơn với thi&ecirc;n nhi&ecirc;n.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-7" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-7.jpg" style="height:237px; width:500px" /><br />
<em>Phong c&aacute;ch đồng qu&ecirc; kh&ocirc;ng chỉ đan xen v&agrave;o thiết kế n&agrave;y như một yếu tố chủ đạo m&agrave; n&oacute; c&ograve;n gi&uacute;p kiến tạo kh&ocirc;ng gian mới lạ hơn bao giờ hết. Từ chiếc cầu thang mang phong c&aacute;ch xưa cũ cho tới chiếc sofa ở kh&ocirc;ng gian ph&ograve;ng kh&aacute;ch&hellip;Tất cả như c&ugrave;ng kết hợp để l&agrave;m kiến tr&uacute;c n&agrave;y th&ecirc;m khỏe khoắn v&agrave; tr&agrave;n đầy sức sống.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-1" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-1.jpg" style="height:709px; width:500px" /><br />
<em>Một g&aacute;c x&eacute;p lung linh trong buổi s&aacute;ng ngập nắng, với những nội thất cổ điển, đồng qu&ecirc; nhưng v&ocirc; c&ugrave;ng mộc mạc, xinh xắn.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-12" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-12.jpg" style="height:640px; width:500px" /><br />
<em>G&aacute;c x&eacute;p c&oacute; một n&eacute;t mới lạ, kh&ocirc;ng chỉ kh&aacute;c với những thiết kế trước đ&oacute; m&agrave; với t&ocirc;ng m&agrave;u trắng s&aacute;ng tạo v&agrave; chiếc b&agrave;n gỗ mộc mạc, kh&ocirc;ng gian n&agrave;y như được tăng th&ecirc;m sức sống . Một trong những chi tiết kiến tr&uacute;c được đ&aacute;nh gi&aacute; cao ở đ&acirc;y nữa ch&iacute;nh l&agrave; những g&oacute;c tường được trang tr&iacute; bằng những bức tranh mang m&agrave;u sắc v&agrave; đường n&eacute;t cổ điển, vừa c&oacute; chức năng khơi gợi những suy nghĩ vừa l&agrave;m kh&ocirc;ng gian trở về thời t&acirc;n cổ, rất đỗi giản dị nhưng thật sống động.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-8" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-8.jpg" style="height:731px; width:500px" /><br />
<em>G&oacute;c l&agrave;m việc t&ocirc;ng m&agrave;u trắng đen ch&iacute;nh l&agrave; khung nền để khơi gợi sự s&aacute;ng tạo, kh&ocirc;ng phải ở g&aacute;c x&eacute;p l&agrave; g&oacute;c l&agrave;m việc sẽ bị thu nhỏ v&agrave; trở n&ecirc;n g&ograve; b&oacute;. Sự tinh tế v&agrave; th&ocirc;ng minh đ&atilde; pha trộn kh&eacute;o l&eacute;o giữa m&agrave;u s&agrave;n v&agrave; chiếc b&agrave;n đầy chất mộc, l&agrave;m kh&ocirc;ng gian kh&ocirc;ng chỉ thu h&uacute;t m&agrave; c&ograve;n trở n&ecirc;n v&ocirc; c&ugrave;ng h&agrave;i h&ograve;a.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-2" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-2.jpg" style="height:732px; width:500px" /><br />
<em>Chiếc ghế sang trọng được kết hợp duy&ecirc;n d&aacute;ng với c&aacute;nh cửa đ&atilde; phai m&agrave;u sơn, kh&ocirc;ng chỉ l&agrave; một kh&ocirc;ng gian thư gi&atilde;n độc lạ m&agrave; c&ograve;n v&ocirc; c&ugrave;ng h&agrave;i h&ograve;a, trang nh&atilde;.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-11" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-11.jpg" style="height:750px; width:500px" /><br />
<em>Một g&oacute;c l&agrave;m việc kh&ocirc;ng chỉ tạo hứng khởi để s&aacute;ng tạo m&agrave; c&ograve;n kiến tạo kh&ocirc;ng gian th&ecirc;m phần nghệ thuật v&agrave; mới lạ nhờ sự kết hợp của chiếc ghế m&agrave;u pha l&ecirc; v&agrave; chiếc b&agrave;n gỗ gắn liền với tường nh&agrave;..</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-3" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-3.jpg" style="height:678px; width:500px" /><br />
<em>Kh&ocirc;ng cần trang tr&iacute; bằng nhiều chi tiết nội thất, g&oacute;c tường n&agrave;y vẫn hội tụ đầy đủ sự tươi trẻ, s&aacute;ng tạo v&agrave; tinh tế chỉ qua một bức tranh sống động.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-13" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-13.jpg" style="height:742px; width:500px" /><br />
<em>Nội thất ph&ograve;ng ngủ v&ocirc; c&ugrave;ng đơn giản, nhưng m&oacute;n n&agrave;o ra m&oacute;n đấy, kh&ocirc;ng qu&aacute; rực rỡ cũng chẳng nh&agrave;m ch&aacute;n. Tất cả kết hợp với nhau tạo th&agrave;nh một kh&ocirc;ng gian ho&agrave;n hảo.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-4" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-4.jpg" style="height:731px; width:500px" /><br />
<em>Nh&agrave; kho chưa bao giờ được đưa v&agrave;o kiến tr&uacute;c to&agrave;n bộ căn nh&agrave; một c&aacute;ch kh&eacute;o l&eacute;o hơn thế, chiếc kệ c&ugrave;ng ton m&agrave;u với tường v&agrave; s&agrave;n l&agrave; nơi chứa đồ ho&agrave;n hảo v&agrave; th&ocirc;ng minh nhất.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-6" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-6.jpg" style="height:751px; width:500px" /><br />
<em>Dường như chưa bao giờ n&eacute;t đồng qu&ecirc; bị qu&ecirc;n l&atilde;ng trong bất k&igrave; thiết kế n&agrave;o. Kh&ocirc;ng gian l&atilde;ng mạn n&agrave;y với sự trợ gi&uacute;p của những c&aacute;nh cửa đằng sau chiếc ghế sofa hiện đại v&agrave; chiếc b&agrave;n mang phong c&aacute;ch tinh nghịch đ&atilde; phai m&agrave;u sơn đ&atilde; gi&uacute;p căn ph&ograve;ng n&agrave;y kh&ocirc;ng thể tr&agrave;n trề sức sống hơn nữa.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-10" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-10.jpg" style="height:751px; width:500px" /><br />
<em>Những nội thất sử dụng m&agrave;u sơn sờn cũ kh&ocirc;ng hề khiến căn nh&agrave; trở n&ecirc;n qu&ecirc; m&ugrave;a, cũ kĩ m&agrave; n&oacute; đ&atilde; biến kh&ocirc;ng gian th&ecirc;m ho&agrave;n hảo v&agrave; độc đ&aacute;o v&ocirc; c&ugrave;ng.</em></p>

<p><img alt="thiet-ke-nha-o-theo-phong-cach-thon-da-5" src="http://thegioinoithat.com/wp-content/uploads/2016/07/thiet-ke-nha-o-theo-phong-cach-thon-da-5.jpg" style="height:750px; width:500px" /><br />
<em>Vẻ ngo&agrave;i cổ k&iacute;nh g&oacute;p phần n&oacute;i l&ecirc;n &yacute; nghĩa kiến tr&uacute;c của cả căn nh&agrave;.</em></p>
', N'Admin', N'bài trí nội thất;', 4, 0, NULL, 1, NULL, CAST(0x0000A6480179C53F AS DateTime), NULL, CAST(0x0000A6480179C53F AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 8, 112, N'Những lưu ý khi thiết kế hành lang', N'Những lưu ý khi thiết kế hành lang', N'<p><strong>Khi thiết kế nh&agrave;, ch&uacute;ng ta thường ch&uacute; trọng đến mặt tiền v&agrave; đồ nội thất m&agrave; l&atilde;ng qu&ecirc;n đi lối h&agrave;nh lang, v&ocirc; t&igrave;nh n&oacute; trở th&agrave;nh khoảng kh&ocirc;ng bỏ đi. Tuy nhi&ecirc;n, nếu kh&eacute;o bố tr&iacute;, n&oacute; kh&ocirc;ng chỉ l&agrave; lối đi lại m&agrave; c&ograve;n l&agrave; nơi nghỉ ngơi của gia đ&igrave;nh bạn, gi&uacute;p tiết kiệm một khoảng diện t&iacute;ch đ&aacute;ng kể. V&agrave; sau đ&acirc;y l&agrave; những lưu &yacute; để gia đ&igrave;nh bạn c&oacute; dược c&aacute;ch sử dụng d&atilde;y h&agrave;nh lang hiệu quả nhất.</strong><br />
<br />
<strong>Kh&ocirc;ng n&ecirc;n l&agrave; ng&otilde; cụt</strong></p>

<p><img alt="hanh-lang-9" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-9.jpg" style="height:588px; width:442px" /></p>

<p><em>N&ecirc;n bố tr&iacute; một chiếc ghế nhỏ, đ&egrave;n trang tr&iacute;, một chậu hoa hoặc l&agrave; một tấm gương lớn ngay ph&iacute;a cuối h&agrave;nh lang. Điều đ&oacute; gi&uacute;p bạn c&oacute; một kh&ocirc;ng gian tho&aacute;ng đ&atilde;ng hơn đồng thời tạo cảm gi&aacute;c gần gũi.</em></p>

<p><strong>Lời mời ch&agrave;o ấm &aacute;p</strong></p>

<p><img alt="hanh-lang-6" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-6.jpg" style="height:650px; width:433px" /><em>Thay v&igrave; để lối đi của bạn k&iacute;n m&iacute;t đồ đạc hoặc qu&aacute; tho&aacute;ng khi kh&ocirc;ng đặt bất cứ thứ g&igrave;, h&atilde;y cải thiện bằng c&aacute;ch sử dụng đồ nội thất c&oacute; gam m&agrave;u trầm gi&uacute;p kh&ocirc;ng gian nh&agrave; ấm &aacute;p hơn. Ngo&agrave;i ra, việc thiết kế nhiều cửa sổ bằng k&iacute;nh để &aacute;nh s&aacute;ng tự nhi&ecirc;n tr&agrave;n v&agrave;o sẽ gi&uacute;p cảm thấy kh&ocirc;ng gian cởi mở v&agrave; tươi s&aacute;ng hơn.</em></p>

<p><strong>Tăng cảm gi&aacute;c th&uacute; vị</strong></p>

<p><img alt="hanh-lang-5" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-5.jpg" style="height:453px; width:672px" /><br />
<em>Treo một tấm gương c&oacute; kiểu d&aacute;ng độc đ&aacute;o, lạ mắt cũng gi&uacute;p cho lối h&agrave;nh lang trở n&ecirc;n thu h&uacute;t hơn</em>.</p>

<p><strong>L&agrave;m mềm nội thất kh&ocirc; cứng</strong></p>

<p><img alt="hanh-lang-11" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-11.jpg" style="height:672px; width:500px" /><br />
<em>Sử dụng thảm c&oacute; họa tiết c&acirc;y cỏ để dung h&ograve;a vẻ cứng c&aacute;p của bức tường, s&agrave;n nh&agrave; bằng gỗ, l&aacute;t đ&aacute;&hellip;</em></p>

<p><strong>Tận dụng khoảng trống</strong></p>

<p><img alt="hanh-lang-3" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-3.jpg" style="height:597px; width:538px" /><br />
<em>Tận dụng c&aacute;c g&oacute;c v&agrave; hốc tường để biến th&agrave;nh nơi tr&ograve; chuyện, t&acirc;m sự l&yacute; tưởng nhờ v&agrave;o c&aacute;c m&oacute;n nội thất như gối &ocirc;m, tấm đệm&hellip;</em></p>

<p><strong>V&agrave; cả chiều cao</strong></p>

<p><img alt="hanh-lang-4" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-4.jpg" style="height:592px; width:532px" /><br />
<em>Ch&uacute;ng ta c&oacute; thể đặt một chiếc tủ đứng, kệ gi&agrave;y&hellip; song song đ&oacute; l&agrave; những b&igrave;nh hoa đặt tr&ecirc;n kệ, vừa c&oacute; t&aacute;c dụng trang tr&iacute;, vừa tạo cảm gi&aacute;c ng&ocirc;i nh&agrave; cao hơn b&igrave;nh thường.</em></p>

<p><strong>T&iacute;nh c&aacute; nh&acirc;n của bạn</strong></p>

<p><img alt="hanh-lang-7" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-7.jpg" style="height:666px; width:800px" /><br />
<em>Chọn gương treo tường nhiều k&iacute;ch cỡ, thảm trải nền hoặc một chiếc ghế kiểu d&aacute;ng độc đ&aacute;o sẽ cho thấy chủ nh&acirc;n ngồi nh&agrave; l&agrave; một người c&oacute; gu thẩm ri&ecirc;ng biệt.</em></p>

<p><strong>Nơi thư gi&atilde;n</strong></p>

<p><img alt="hanh-lang-8" src="http://thegioinoithat.com/wp-content/uploads/2016/07/hanh-lang-8.jpg" style="height:680px; width:800px" /><br />
<em>H&agrave;nh lang gần ph&ograve;ng ngủ v&agrave; cạnh cửa sổ c&oacute; thể bố tr&iacute; th&ecirc;m gối &ocirc;m để c&oacute; được một kh&ocirc;ng gian đọc s&aacute;ch v&agrave; nghỉ ngơi.</em></p>
', N'Admin', N'căn hộ ấn tượng;', 6, 0, NULL, 1, NULL, CAST(0x0000A648017A1B80 AS DateTime), NULL, CAST(0x0000A648017A1B80 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, 9, 113, N'Yêu từ cái nhìn đầu tiên với mẫu bàn gấp phong cách', N'Yêu từ cái nhìn đầu tiên với mẫu bàn gấp phong cách', N'<p><strong>Một trong những giải ph&aacute;p gi&uacute;p bạn tiết kiệm kh&ocirc;ng gian, đ&oacute; l&agrave; sử dụng b&agrave;n gấp. Với thiết kế t&ugrave;y chỉnh tiện dụng, cho ph&eacute;p bạn c&oacute; ngay một g&oacute;c l&agrave;m việc v&agrave; thư gi&atilde;n th&uacute; vị. Bắt đầu đi t&igrave;m những mẫu b&agrave;n gấp th&ocirc;ng minh th&ocirc;i n&agrave;o!</strong></p>

<p><img alt="ban-gap-6" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-6-1.jpg" style="height:1069px; width:800px" />Một mẫu b&agrave;n l&agrave;m việc phổ biến mang phong c&aacute;ch cổ điển, đồng thời được gh&eacute;p với một chiếc ghế bằng kim loại &aacute;nh bạc sang trọng, rất thuận tiện để lưu trữ những đ&ocirc; d&ugrave;ng văn ph&ograve;ng.<img alt="ban-gap-7" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-7-1.jpg" style="height:710px; width:710px" />Diện t&iacute;ch nh&agrave; bạn kh&aacute; khi&ecirc;m tốn th&igrave; lựa chọn b&agrave;n gấp l&agrave; giải ph&aacute;p ho&agrave;n hảo nhất.<img alt="ban-gap-8" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-8-1.jpg" style="height:534px; width:800px" />B&agrave;n gấp gắn liền với tường gi&uacute;p tận dụng tối đa diện t&iacute;ch cho căn ph&ograve;ng.<img alt="ban-gap-9" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-9-1.jpg" style="height:1136px; width:1136px" />Một chiếc b&agrave;n được gắn tr&ecirc;n tường gần cửa sổ, dễ d&agrave;ng đ&oacute;n &aacute;nh s&aacute;ng ngo&agrave;i trời v&agrave;o nh&agrave;, mặt kh&aacute;c, kh&ocirc;ng kh&iacute; cũng dễ chịu hơn nhờ những chậu c&acirc;y xanh.<img alt="ban-gap-10" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-10-1.jpg" style="height:678px; width:864px" />Ngo&agrave;i tiết kiệm kh&ocirc;ng gian, bạn c&ograve;n c&oacute; thể sử dụng t&iacute;ch hợp b&agrave;n gấp với một chiếc giường.<img alt="ban-gap-11" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-11-1.jpg" style="height:533px; width:800px" />Hoặc kết hợp với kệ s&aacute;ch v&agrave; được x&acirc;y trong &acirc;m tường để tối đa h&oacute;a kh&ocirc;ng gian nh&agrave; bạn.<img alt="ban-gap-12" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-12-1.jpg" style="height:573px; width:800px" />&hellip; v&agrave; cũng c&oacute; thể l&agrave; một kệ s&aacute;ch lớn.<img alt="ban-gap-2" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-2-1.jpg" style="height:1071px; width:800px" />Chắc hẳn b&eacute; y&ecirc;u nh&agrave; bạn sẽ cực k&igrave; th&iacute;ch th&uacute; với mẫu b&agrave;n như thế n&agrave;y, kh&ocirc;ng những thế, n&oacute; c&ograve;n gi&uacute;p b&eacute; tự gi&aacute;c gọn g&agrave;ng, ngăn nắp ngay trong khu vực học tập của m&igrave;nh.<img alt="ban-gap-3" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-3-1.jpg" style="height:913px; width:913px" /><br />
B&agrave;n gấp xuống l&agrave; lựa chọn ho&agrave;n hảo cho bất k&igrave; kh&ocirc;ng gian n&agrave;o.<img alt="ban-gap-4" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-4-1.jpg" style="height:533px; width:800px" />Để tiện lợi cho việc nghỉ ngơi, bạn ho&agrave;n to&agrave;n c&oacute; thể thiết kế một chiếc b&agrave;n gấp ngay cạnh gh&eacute; sofa.<img alt="ban-gap-5" src="http://thegioinoithat.com/wp-content/uploads/2016/07/ban-gap-5-1.jpg" style="height:1139px; width:751px" />Mẫu thiết kế n&agrave;y c&oacute; phần b&agrave;n kh&aacute; d&agrave;i v&agrave; rộng, rất th&iacute;ch hợp cho gia đ&igrave;nh c&oacute; 2 trẻ.</p>
', N'Admin', N'bài trí nội thất;bài trí phòng khách;', 5, 0, NULL, 1, NULL, CAST(0x0000A648017AAB2A AS DateTime), NULL, CAST(0x0000A648017AAB2A AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, 9, 114, N'Lựa chọn nội thất cho căn hộ 20m2', N'Lựa chọn nội thất cho căn hộ 20m2', N'<p><strong>Khi bạn sở hữu một căn hộ c&oacute; diện t&iacute;ch khi&ecirc;m tốn, ngo&agrave;i việc đầu tư cho kết cấu b&ecirc;n ngo&agrave;i của căn hộ th&igrave; nội thất b&ecirc;n trong l&agrave; yếu tố then chốt ch&iacute;nh ảnh hưởng đến mỹ cảm v&agrave; cảm gi&aacute;c về kh&ocirc;ng gian của một căn hộ.</strong><br />
<br />
Việc sử dụng nội thất kh&ocirc;ng ph&ugrave; hợp, sơn tường qu&aacute; s&aacute;ng hay qu&aacute; tối, lắp đặt &aacute;nh s&aacute;ng kh&ocirc;ng hợp l&yacute; đều ảnh hưởng mạnh đến t&acirc;m trạng cũng như cảm gi&aacute;c những ai ở b&ecirc;n trong căn hộ. Căn hộ dưới đ&acirc;y c&oacute; cấu tr&uacute;c kh&aacute; &ldquo;lạ&rdquo; với khu vực sinh hoạt vu&ocirc;ng vức nhưng lại c&oacute; ph&ograve;ng ngủ t&aacute;ch biệt với kiến tr&uacute;c h&igrave;nh tr&ograve;n. Thế nhưng, nhờ sự sắp đặt t&agrave;i t&igrave;nh của gia chủ m&agrave; căn hộ vẫn hết sức tiện nghi v&agrave; th&ocirc;ng tho&aacute;ng. C&ugrave;ng điểm qua những n&eacute;t &ldquo;t&agrave;i t&igrave;nh&rdquo; trong căn hộ n&agrave;y để lựa chọn nội thất ph&ugrave; hợp cho kh&ocirc;ng gian sống của m&igrave;nh nh&eacute;.</p>

<p><img alt="nha20m2-2" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-2.jpg" style="height:768px; width:1024px" /><br />
<em>Kh&ocirc;ng gian ph&ograve;ng kh&aacute;ch ấm &aacute;p, l&agrave; sự kết hợp h&agrave;i h&ograve;a giữa c&aacute;c gam m&agrave;u s&aacute;ng v&agrave; tối.</em></p>

<p><img alt="nha20m2-4" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-4.jpg" style="height:768px; width:1024px" /><br />
<em>Cửa ra v&agrave;o hiện đại với c&aacute;c họa tiết h&igrave;nh học độc đ&aacute;o h&agrave;i h&ograve;a với kh&ocirc;ng gian b&ecirc;n ngo&agrave;i căn hộ.</em></p>

<p><img alt="nha20m2-10" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-10.jpg" style="height:768px; width:1024px" /><br />
<em>Tường được sơn trắng kết hợp với s&agrave;n gỗ ấm &aacute;p đ&uacute;ng &ldquo;chuẩn&rdquo; thiết kế hiện đại.</em></p>

<p><img alt="nha20m2-3" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-3.jpg" style="height:768px; width:1024px" /><br />
<em>Với một căn hộ b&igrave;nh thường, việc tr&acirc;n nh&agrave; kh&ocirc;ng &ldquo;phẳng&rdquo; m&agrave; c&oacute; qu&aacute; nhiều x&agrave; ngang l&agrave; một điểm trừ lớn. Gia chủ đ&atilde; kh&eacute;o l&eacute;o đặt đ&egrave;n s&aacute;t trần, kết hợp th&ecirc;m &aacute;nh s&aacute;ng tự nhi&ecirc;n từ &ocirc; cửa sổ lớn; gi&uacute;p giải quyết ho&agrave;n to&agrave;n nhược điểm của trần nh&agrave; v&agrave; tạo ra hiệu ứng thị gi&aacute;c về một kh&ocirc;ng gian rộng r&atilde;i.</em></p>

<p><img alt="nha20m2-8" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-8.jpg" style="height:768px; width:1024px" /><br />
<em>Ph&ograve;ng ngủ với t&ocirc;ng m&agrave;u đồng bộ với kiến tr&uacute;c căn hộ.. Với cấu tr&uacute;c h&igrave;nh tr&ograve;n, việc sắp đặt nội thất trong ph&ograve;ng ngủ kh&aacute; bất tiện thế n&ecirc;n gia chủ chỉ đặt một giường đ&ocirc;i. Với c&aacute;c họa tiết kẻ sọc của drap, gối, mền kết hợp ho&agrave;n hảo với &aacute;nh s&aacute;ng tự nhi&ecirc;n v&agrave; cảm gi&aacute;c kh&ocirc;ng gian từ hai &ocirc; cửa sổ nhỏ &ndash; căn ph&ograve;ng tạo ra cảm gi&aacute;c rộng r&atilde;i hơn nhiều so với k&iacute;ch thước thực tế.</em></p>

<p><img alt="nha20m2-6" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-6.jpg" style="height:768px; width:1024px" /><br />
<em>Khu vực bếp được sắp đặt tại một g&oacute;c ri&ecirc;ng của căn hộ. C&aacute;c ngăn tủ k&eacute;o được thiết kế đồng m&agrave;u với tường kh&ocirc;ng chỉ gi&uacute;p tiết kiện diện t&iacute;ch v&agrave; tăng khả năng lưu trữ m&agrave; c&ograve;n tạo cảm gi&aacute;c th&ocirc;ng tho&aacute;ng v&agrave; sạch sẽ khi kết hợp với &aacute;nh s&aacute;ng tự nhi&ecirc;n đến từ &ocirc; cửa sổ lớn.</em></p>

<p><img alt="nha20m2-1" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-1.jpg" style="height:768px; width:1024px" /><br />
<em>Khu vực ăn uống l&agrave; một chiếc b&agrave;n xếp &aacute;p tường ở ngay gian bếp, tuy kh&aacute; nhỏ nhưng vừa đủ cho một gia đ&igrave;nh c&oacute; từ 2 &ndash; 3 người.</em></p>

<p><img alt="nha20m2-7" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-7.jpg" style="height:768px; width:1024px" /><br />
<em>Khu vực ăn uống d&ugrave; nhỏ nhưng vẫn đẹp ng&acirc;y ngất với hơi thở tự nhi&ecirc;n đền từ &ocirc; cửa sổ lớn.</em></p>

<p><img alt="nha20m2-5" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-5.jpg" style="height:768px; width:1024px" /><br />
<em>Những thiết bị ph&ograve;ng tắm đều c&oacute; m&agrave;u s&aacute;ng, hoặc kim loại b&oacute;ng để tạo cảm gi&aacute;c rộng r&atilde;i hơn cho kh&ocirc;ng gian. Việc lắp đặt kệ, tủ v&agrave; c&aacute;c gi&aacute; đỡ tr&ecirc;n tường gi&uacute;p kh&ocirc;ng gian ph&ograve;ng tắm gọn g&agrave;ng v&agrave; dễ dọn rửa hơn.</em></p>

<p><img alt="Imprimir" src="http://thegioinoithat.com/wp-content/uploads/2016/07/nha20m2-9.jpg" style="height:609px; width:1024px" /><br />
<em>Sơ đồ thiết kế 2D của căn hộ</em></p>
', N'Admin', N'bài trí nội thất;bài trí phòng khách;', 5, 0, NULL, 1, NULL, CAST(0x0000A648017AF2D2 AS DateTime), NULL, CAST(0x0000A648017AF2D2 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, 10, 115, N'Tìm kiếm giải pháp cho giường ngủ gần cửa ra vào', N'Tìm kiếm giải pháp cho giường ngủ gần cửa ra vào', N'<p>Giường ngủ gần cửa ra v&agrave;o sẽ phải đ&oacute;n nhận nguồn năng lượng qu&aacute; đột ngột, qu&aacute; năng động g&acirc;y ảnh hưởng ti&ecirc;u cực&nbsp;cho ph&ograve;ng ngủ.</p>

<p><strong>V&igrave; sao giường ngủ gần cửa ra v&agrave;o ph&ograve;ng ngủ lại được xem l&agrave; phong thủy xấu?</strong></p>

<p>V&igrave; cửa ra v&agrave;o thường c&oacute; d&ograve;ng chảy năng lượng mạnh mẽ hoặc &ugrave;a v&agrave;o đột ngột. Nguồn năng lượng n&agrave;y rất đ&aacute;ng lo ngại, qu&aacute; năng động so với kh&ocirc;ng gian cần sự tĩnh lặng, ri&ecirc;ng tư&nbsp;như ph&ograve;ng ngủ. Để tạo ra phong thủy tốt cho ph&ograve;ng ngủ, bạn cần phải c&oacute; năng lượng &ldquo;bổ dưỡng&rdquo;,&nbsp;gợi cảm v&agrave; thư gi&atilde;n xung quanh giường ngủ.</p>

<p><strong>Thế n&agrave;o l&agrave; giường ngủ gần cửa ra v&agrave;o ph&ograve;ng ngủ?</strong></p>

<p>Giường ngủ gần cửa ra v&agrave;o l&agrave; trường hợp&nbsp;chiếc giường được k&ecirc; dựa v&agrave;o bức tường c&oacute; cửa ra v&agrave;o, hoặc dựa v&agrave;o bức tường gần cửa ra v&agrave;o.</p>

<p><strong>Giải ph&aacute;p:</strong></p>

<p>Nếu c&aacute;ch sắp xếp trong ph&ograve;ng ngủ của bạn kh&ocirc;ng cho ph&eacute;p bố tr&iacute;&nbsp;giường sang một vị tr&iacute; kh&aacute;c th&igrave; bạn cần phải tạo ra năng lượng bảo vệ mạnh mẽ xung quanh giường ngủ. N&oacute;i c&aacute;ch kh&aacute;c, bạn cần phải tạo ra v&aacute;ch ngăn mềm mại nhưng r&otilde; r&agrave;ng giữa năng lượng đi v&agrave;o qua cửa ph&ograve;ng ngủ v&agrave; năng lượng của giường ngủ.</p>

<p>Bạn c&oacute; thể thực hiện&nbsp;điều n&agrave;y với những giải ph&aacute;p trang tr&iacute; đơn giản giữa giường ngủ v&agrave; cửa ra v&agrave;o. Ch&uacute;ng t&ocirc;i sẽ đưa ra 3 gợi &yacute;&nbsp;d&agrave;nh cho bạn:</p>

<p><em>&ndash; Một chiếc b&agrave;n đầu giường với hiệu ứng thị gi&aacute;c mạnh mẽ:&nbsp;</em>Th&ecirc;m v&agrave;o đ&oacute; l&agrave; một chiếc đ&egrave;n ngủ với &aacute;nh s&aacute;ng c&oacute; khả năng khuếch t&aacute;n rộng v&agrave; một v&agrave;i phụ kiện trang tr&iacute; kh&aacute;c tr&ecirc;n b&agrave;n gi&uacute;p bảo vệ năng lượng xung quanh giường ngủ của bạn.</p>

<p><img alt="giuong ngu gan cua ra vao (2)" src="http://thegioinoithat.com/images/post/2016/06/30/08/11268/giuong-ngu-gan-cua-ra-vao-2.jpg" style="height:339px; width:500px" /></p>

<p>&nbsp;<em>&ndash; Một chiếc kệ hoặc&nbsp;tủ đồ thấp:</em>&nbsp;Giải ph&aacute;p phong thủy n&agrave;y rất hữu &iacute;ch&nbsp;v&igrave; n&oacute; gi&uacute;p bạn tạo ra nguồn năng lượng tựa như&nbsp;một&nbsp;c&aacute;i k&eacute;n, bao bọc lấy giường ngủ, bảo vệ n&oacute; một c&aacute;ch tuyệt đối khỏi cửa ra v&agrave;o. Tuy nhi&ecirc;n, bạn cần&nbsp;phải lựa chọn thật kh&eacute;o l&eacute;o&nbsp;để h&igrave;nh d&aacute;ng v&agrave; phong c&aacute;ch của kệ, tủ đồ phối hợp&nbsp;h&agrave;i h&ograve;a với phong c&aacute;ch nội thất ph&ograve;ng ngủ.</p>

<p><img alt="giuong ngu gan cua ra vao (1)" src="http://thegioinoithat.com/images/post/2016/06/30/08/11268/giuong-ngu-gan-cua-ra-vao-1.jpg" style="height:753px; width:500px" /></p>

<p>&nbsp;<em>&ndash; Một v&aacute;ch ngăn di động:</em>&nbsp;Nếu kh&ocirc;ng gian ph&ograve;ng ngủ của bạn kh&ocirc;ng ph&ugrave; hợp với&nbsp;c&aacute;c giải ph&aacute;p tr&ecirc;n, bạn c&oacute; thể t&igrave;m đến một v&aacute;ch ngăn di động. Ưu điểm lớn nhất&nbsp;của giải ph&aacute;p n&agrave;y đ&oacute; ch&iacute;nh l&agrave; bạn c&oacute; thể t&ugrave;y chỉnh v&aacute;ch ngăn ở vị tr&iacute; mong muốn v&agrave; xếp v&agrave;o gọn g&agrave;ng sau khi đ&atilde; sử dụng.</p>

<p><img alt="giuong ngu gan cua ra vao (3)" src="http://thegioinoithat.com/images/post/2016/06/30/08/11268/giuong-ngu-gan-cua-ra-vao-3.jpg" style="height:333px; width:500px" /></p>
', N'Admin', N'bài trí nội thất;căn hộ ấn tượng;', 6, 0, NULL, 1, NULL, CAST(0x0000A648017B6E2B AS DateTime), NULL, CAST(0x0000A648017B6E2B AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, 10, 116, N'Phong thủy vật liệu xây dựng theo ngũ hành', N'Phong thủy vật liệu xây dựng theo ngũ hành', N'<p><strong>Vật liệu x&acirc;y dựng c&oacute; khả năng ảnh hưởng rất lớn đến con người qua c&aacute;c gi&aacute;c quan. Do đ&oacute;, sự an l&agrave;nh của gia chủ v&agrave; c&aacute;c th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh cũng phụ thuộc v&agrave;o vật liệu x&acirc;y dựng.</strong></p>

<p>Chắc chắn trước khi x&acirc;y nh&agrave;, chủ nh&agrave; sẽ rất ph&acirc;n v&acirc;n v&agrave; thắc mắc n&ecirc;n chọn loại vật liệu vừa đảm bảo yếu tố thẩm mỹ vừa đảm bảo chất lượng để hợp với &yacute; th&iacute;ch của gia đ&igrave;nh v&agrave; hợp với phong thủy. Nếu biết th&ecirc;m về đặc t&iacute;nh ngũ h&agrave;nh của vật liệu th&igrave; bạn sẽ kh&ocirc;ng c&ograve;n kh&oacute; khăn trong qu&aacute; tr&igrave;nh chọn lựa v&agrave; bố tr&iacute; nội thất ph&ugrave; hợp.</p>

<p>Kh&ocirc;ng c&oacute; ng&ocirc;i nh&agrave; n&agrave;o chỉ thuần tu&yacute; một h&agrave;nh m&agrave; lu&ocirc;n c&oacute; sự phối hợp nhiều h&agrave;nh trong qu&aacute; tr&igrave;nh chế t&aacute;c, tạo n&ecirc;n sự ho&agrave;n thiện. Phong thủy cũng ph&acirc;n ra những vật liệu mang t&iacute;nh Kim như th&eacute;p, sắt, inox&hellip;, vật liệu mang t&iacute;nh Mộc l&agrave; tre, gỗ, giấy&hellip; vật liệu mang t&iacute;nh Thủy như k&iacute;nh, thủy tinh, vật liệu mang t&iacute;nh Hỏa l&agrave; nhựa, mika&hellip; hay vật liệu mang t&iacute;nh Thổ đ&aacute;, gạch, gốm.</p>

<p><a href="http://thegioinoithat.com/images/post/2016/06/29/05/10406/21-3.jpg"><img alt="21" src="http://thegioinoithat.com/images/post/2016/06/29/05/10406/21-3.jpg" style="height:415px; width:660px" /></a></p>

<p><strong>Những vật liệu mang t&iacute;nh Kim</strong>&nbsp;như sắt, th&eacute;p, inox v&agrave; đ&aacute; hoa cương,&hellip; đ&acirc;y l&agrave; những vật liệu phổ biến trong c&aacute;c c&ocirc;ng tr&igrave;nh kiến tr&uacute;c. Những vật liệu n&agrave;y c&oacute; bề mặt s&aacute;ng b&oacute;ng mang t&iacute;nh dương, sẽ gi&uacute;p kh&iacute; di chuyển nhanh hơn. Theo đ&oacute;, những chất liệu n&agrave;y l&agrave; sự lựa chọn ph&ugrave; hợp đối với những khu vực cần sự năng động như văn ph&ograve;ng c&ocirc;ng sở, ph&ograve;ng kh&aacute;ch&hellip;</p>

<p>Tuy nhi&ecirc;n, cần lưu &yacute; kh&ocirc;ng n&ecirc;n lạm dụng vật liệu mang t&iacute;nh Kim. Những nơi kh&ocirc;ng cần đến t&iacute;nh Kim chẳng hạn như giường bằng kim loại hoặc trang tr&iacute; cầu thang Inox v&igrave; điều n&agrave;y dễ g&acirc;y cảm gi&aacute;c lạnh lẽo, thậm ch&iacute; l&agrave; c&ocirc; đơn, kh&ocirc;ng lợi cho đời sống. V&igrave; gia đ&igrave;nh cần tới sự ấm &aacute;p, chia sẻ.</p>

<p>Vật liệu thuộc h&agrave;nh kim sẽ hợp với gia chủ mệnh kim, mệnh thủy th&igrave; tương sinh, khắc với người mệnh mộc v&agrave; vượng bởi người mệnh thổ.</p>

<p><strong>Gỗ, vải, m&acirc;y tre l&agrave; những vật liệu x&acirc;y dựng thuộc mệnh mộc</strong>. Nếu trong nh&agrave; c&oacute; nhiều h&agrave;nh Mộc hoặc c&acirc;y cối sẽ tạo cho mọi th&agrave;nh vi&ecirc;n trong nh&agrave; c&oacute; cảm thấy thư th&aacute;i v&agrave; dễ chịu. Ch&uacute;ng mang một vẻ đẹp b&igrave;nh dị tạo được n&eacute;t d&acirc;n d&atilde;, mộc mac. Những vật liệu thuộc h&agrave;nh n&agrave;y ph&ugrave; hợp cho những căn ph&ograve;ng cần sự thư th&aacute;i, y&ecirc;n tĩnh.</p>

<p>Vật liệu thuộc mộc sẽ hợp với gia chủ mệnh mộc sự b&igrave;nh ho&agrave;, mệnh hoả th&igrave; tương sinh, tuy nhi&ecirc;n khắc với người mệnh thổ v&agrave; vượng với người mệnh thuỷ.</p>

<p><strong>Thuỷ tinh, k&iacute;nh c&aacute;c loại thuộc h&agrave;nh thủy</strong>&nbsp;l&agrave; vật liệu lung linh dẫn truyền &aacute;nh s&aacute;ng của h&agrave;nh thuỷ v&agrave; c&oacute; đặc t&iacute;nh s&aacute;ng b&oacute;ng, sắc b&eacute;n của h&agrave;nh kim. Đặc t&iacute;nh dễ thấy của k&iacute;nh l&agrave; nhẵn b&oacute;ng v&agrave; cứng. K&iacute;nh trong suốt gi&uacute;p sinh kh&iacute; x&acirc;m nhập từ ngo&agrave;i v&agrave;o trong bởi &aacute;nh s&aacute;ng c&oacute; thể dễ d&agrave;ng xuy&ecirc;n qua. V&igrave; thế, c&aacute;c gia chủ c&oacute; thể d&ugrave;ng k&iacute;nh m&agrave;u trong thiết kế b&agrave;n tr&agrave;, b&agrave;n ăn, hay b&agrave;n l&agrave;m việc. Hiện nay, c&oacute; nhiều người lại sử dụng những tấm k&iacute;nh l&agrave;m bậc cầu thang, tuy nhi&ecirc;n c&aacute;c gia chủ n&ecirc;n tr&aacute;nh điều n&agrave;y v&igrave; k&iacute;nh kh&ocirc;ng c&oacute; t&aacute;c dụng giữ v&agrave; dẫn kh&iacute;.</p>

<p>Vật liệu thuộc h&agrave;nh thuỷ sẽ hợp với gia chủ mệnh thuỷ sự b&igrave;nh ho&agrave;, mộc th&igrave; tương sinh, nhưng khắc với người mệnh hoả v&agrave; vượng với người mệnh kim.</p>

<p><strong>Đa số c&aacute;c vật liệu x&acirc;y dựng</strong>&nbsp;đ&aacute; ốp l&aacute;t, gốm, sứ, gạch đều thuộc h&agrave;nh thổ. Nh&oacute;m vật liệu thuộc h&agrave;nh thổ đem lại cảm gi&aacute;c ổn định, vững bền v&agrave; nguy&ecirc;n sơ&hellip;Đ&acirc;y cũng l&agrave; loại vật liệu được sử dụng nhiều nhất trong x&acirc;y dựng hiện nay.</p>

<p>Vật liệu thuộc h&agrave;nh thổ sẽ hợp với gia chủ mệnh thổ sự b&igrave;nh ho&agrave; hay mệnh kim th&igrave; tương sinh, nhưng khắc với người mệnh thuỷ v&agrave; vượng với người mệnh hoả.</p>

<p><strong>Những vật liệu nh&acirc;n tạo như nhựa v&agrave; c&aacute;c loại vật liệu</strong>&nbsp;nh&acirc;n tạo thuộc về h&agrave;nh Hỏa v&igrave; ch&uacute;ng thường được l&agrave;m ra bằng c&aacute;c phương ph&aacute;p xử l&yacute; nhiệt. Nhựa c&oacute; thể ngăn cản kh&iacute; v&agrave; tỏa ra hơi v&agrave; h&oacute;a chất độc hại c&oacute; thể ảnh hưởng đến sức khỏe, do đ&oacute; n&ecirc;n sử dụng ch&uacute;ng c&agrave;ng &iacute;t c&agrave;ng tốt. B&ecirc;n cạnh đ&oacute;, bề mặt vật liệu c&oacute; m&agrave;u đỏ, cam cũng được xem l&agrave; h&agrave;nh hoả. V&iacute; dụ một bức tường sơn m&agrave;u đỏ hay lan can sơn đỏ th&igrave; t&iacute;nh hoả l&agrave; tr&ecirc;n bề mặt, t&iacute;nh thổ hoặc kim nằm trong kết cấu, c&oacute; t&aacute;c động đến thị gi&aacute;c, t&acirc;m l&yacute; người sử dụng.</p>

<p>Vật liệu thuộc h&agrave;nh hoả sẽ hợp với gia chủ mệnh hoả (b&igrave;nh ho&agrave;), thổ (tương sinh), khắc với người mệnh kim v&agrave; vượng bởi người mệnh mộc.</p>

<p>Như vậy, c&oacute; thể thấy mỗi gia chủ với một t&iacute;nh chất theo ngũ h&agrave;nh của m&igrave;nh sẽ c&oacute; rất nhiều khả năng phối kết, gia giảm c&aacute;c chủng loại vật liệu kh&aacute;c nhau, chứ kh&ocirc;ng chỉ đơn điệu v&agrave;i loại n&agrave;o đ&oacute;.</p>
', N'Admin', N'bài trí nội thất;căn hộ ấn tượng;', 10, 0, NULL, 1, NULL, CAST(0x0000A648017BA676 AS DateTime), NULL, CAST(0x0000A648017BA676 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, 2, 138, N'Ra mắt sản phẩm mới, ưu đãi ngay 30%', N'Sự kiện ra mắt sản phẩm mới vào ngày 1.8.2016 đánh dấu bước chuyển mình trong phong cách nội thất của Xavia.', N'<h3><strong><em>Sự kiện ra mắt sản phẩm mới v&agrave;o ng&agrave;y 1.8.2016&nbsp;đ&aacute;nh dấu bước chuyển m&igrave;nh trong phong c&aacute;ch nội thất của Xavia. Ngo&agrave;i những sản phẩm đẳng cấp, sang trọng vốn l&agrave;m l&ecirc;n thương hiệu Xavia, ch&uacute;ng t&ocirc;i c&ograve;n mang đến những sản phẩm mới trẻ trung- hiện đại &ndash; đa năng&hellip;đ&aacute;p ứng nhu cầu của mọi đối tượng kh&aacute;ch h&agrave;ng. C&ugrave;ng với sự kiện ra mắt sản phẩm l&agrave; chương tr&igrave;nh khuyến mại hấp dẫn,giảm gi&aacute; 30% từ 1.7 &ndash; 17.7.2016 cho rất nhiều sản phẩm của Xavia.</em></strong></h3>

<p>Kh&ocirc;ng chỉ cung cấp những sản phẩm sang trọng, đẳng cấp, m&agrave; hiện nay, để đ&aacute;p ứng nhu cấu của nhiều kh&aacute;ch h&agrave;ng trẻ, c&oacute; xu hướng lựa chọn c&aacute;c sản phẩm thực tế, đa năng, <strong><em>Xavia</em></strong> đ&atilde; cho ra mắt rất nhiều mặt h&agrave;ng mới đ&uacute;ng nhu cầu thực tế về mặt tiện &iacute;ch, phong c&aacute;ch đơn giản, nhỏ gọn, ph&ugrave; hợp với nội thất của chung cư, căn hộ nhỏ.</p>

<h2><strong>Nội thất ph&ograve;ng kh&aacute;ch</strong></h2>

<ol>
	<li><strong>Sofa vải</strong></li>
</ol>

<p><strong>&nbsp;</strong></p>

<p><a href="http://nhadep.com.vn/wp-content/uploads/S6071-2.jpg"><img alt="S6071 (2)" src="http://nhadep.com.vn/wp-content/uploads/S6071-2.jpg" style="height:324px; width:486px" /></a></p>

<p><em>Sofa Flex</em></p>

<p>Sự xuất hiện của d&ograve;ng sofa vải Flex l&agrave; một thay đổi mới mẻ trong hệ thống sản phẩm của Nh&agrave; Đẹp, ngo&agrave;i d&ograve;ng sofa da sang trọng, d&agrave;i rộng cho ph&ograve;ng lớn trước đ&acirc;y. Sofa vải Flex với k&iacute;ch thước nhỏ gọn, chỉ từ 1m8 với cơ chế linh hoạt c&oacute; thể th&aacute;o lắp, đối g&oacute;c, thay vỏ, ph&ugrave; hợp cho ph&ograve;ng kh&aacute;ch c&oacute; diện t&iacute;ch khi&ecirc;m tốn hoặc đơn giản l&agrave; đ&aacute;p ứng nhu cầu th&iacute;ch thay đổi, sắp xếp lại ph&ograve;ng kh&aacute;ch của nhiều gia đ&igrave;nh. Sofa vải Flex c&oacute; thể biến h&oacute;a từ một chiếc sofa g&oacute;c phải th&agrave;nh sofa g&oacute;c tr&aacute;i hoặc sofa đơn 3 chỗ k&egrave;m đ&ocirc;n t&ugrave;y theo nhu cầu sử dụng, b&ecirc;n cạnh đ&oacute;, với ưu điểm kiểu d&aacute;ng đơn giản, hiện đại, m&agrave;u sắc tươi s&aacute;ng, sofa Flex l&agrave; lựa chọn h&agrave;ng đầu của nhiều hộ gia đ&igrave;nh trẻ.</p>

<ol>
	<li><strong>B&agrave;n tr&agrave;, kệ, tủ ti vi</strong></li>
</ol>

<p><strong><a href="http://nhadep.com.vn/wp-content/uploads/2016/06/jpg4A740CE89930257CB82ED8E5DE36FD076FBC39C267350910B%5Epimgpsh_fullsize_distr1.jpg"><img alt="jpg4A740CE89930257CB82ED8E5DE36FD076FBC39C267350910B^pimgpsh_fullsize_distr(1)" src="http://nhadep.com.vn/wp-content/uploads/2016/06/jpg4A740CE89930257CB82ED8E5DE36FD076FBC39C267350910B%5Epimgpsh_fullsize_distr1.jpg" style="height:353px; width:492px" /></a>&nbsp;</strong></p>

<p><em>Bộ b&agrave;n tr&agrave;, kệ, tủ ti vi</em></p>

<p><em>&nbsp;</em>Một bộ sofa sẽ ăn &yacute; hơn nếu c&oacute; sự phối hợp của chiếc b&agrave;n tr&agrave;, mẫu b&agrave;n tr&agrave; đơn giản, m&agrave;u sắc nhẹ nh&agrave;ng m&agrave; Nh&agrave; Đẹp giới thiệu c&oacute; thể ph&ugrave; hợp với nhiều phong c&aacute;ch ph&ograve;ng kh&aacute;ch kh&aacute;c nhau..Ngo&agrave;i b&agrave;n tr&agrave; c&oacute; ngăn k&eacute;o, Nh&agrave; Đẹp cũng c&oacute; c&aacute;c loại b&agrave;n tr&agrave; mở rộng mặt dạng hộp c&oacute; thể mở rộng v&agrave; lưu giữ đồ b&ecirc;n trong. Đi k&egrave;m với b&agrave;n tr&agrave; l&agrave; kệ, tủ ti vi đồng bộ, phong c&aacute;ch trẻ trung, tươi mới.</p>

<h2><strong>Nội thất ph&ograve;ng ăn</strong></h2>

<ol>
	<li><strong>B&agrave;n ăn gỗ</strong></li>
</ol>

<p><a href="http://nhadep.com.vn/wp-content/uploads/Silvano.jpg"><img alt="Silvano" src="http://nhadep.com.vn/wp-content/uploads/Silvano.jpg" style="height:363px; width:508px" /></a></p>

<p><em>B&agrave;n ăn gỗ m&agrave;u walnut cổ điển, trang nh&atilde;</em></p>

<p>B&agrave;n ăn gỗ của Nh&agrave; Đẹp theo hai phong c&aacute;ch đối lập l&agrave; cổ điển, sang trọng v&agrave; hiện đại, trẻ trung. Với những căn nh&agrave; sơn v&agrave; sử dụng nhiều đồ nội thất t&ocirc;ng trầm, ấm, b&agrave;n ăn m&agrave;u gỗ walnut, n&acirc;u v&acirc;n gỗ, thiết kế cứng c&aacute;p sẽ đem đến cảm gi&aacute;c h&ograve;a hợp, trang nh&atilde; m&agrave; ấm &aacute;p.</p>

<p><a href="http://nhadep.com.vn/wp-content/uploads/Bruno.jpg"><img alt="Bruno" src="http://nhadep.com.vn/wp-content/uploads/Bruno.jpg" style="height:382px; width:535px" /></a></p>

<p><em>B&agrave;n ăn s&aacute;ng m&agrave;u trẻ trung, hiện đại</em></p>

<p>Với căn nh&agrave; m&agrave; chủ nh&acirc;n th&iacute;ch sự hiện đại, nội thất tươi s&aacute;ng, trẻ trung th&igrave; những chiếc b&agrave;n ăn gỗ m&agrave;u tự nhi&ecirc;n, m&agrave;u s&aacute;ng, thiết kế thanh tho&aacute;t, đơn giản sẽ l&agrave; một sự lựa chọn tuyệt vời.</p>

<p>B&agrave;n ăn gỗ của Nh&agrave; Đẹp c&oacute; khung v&agrave; ch&acirc;n l&agrave; gỗ tự nhi&ecirc;n tr&ecirc;n 10 năm tuổi, mặt b&agrave;n l&agrave; gỗ c&ocirc;ng nghiệp phủ veneer.&nbsp;</p>

<ol>
	<li><strong>B&agrave;n ăn mở rộng v&agrave; ghế ăn bọc PVC</strong></li>
</ol>

<p><a href="http://nhadep.com.vn/wp-content/uploads/2016/06/71304002.jpg"><img alt="71304002" src="http://nhadep.com.vn/wp-content/uploads/2016/06/71304002.jpg" style="height:380px; width:530px" /></a></p>

<p><em>B&agrave;n ăn mở rộng</em></p>

<p>B&agrave;n ăn mở rộng khung kim loại, mặt k&iacute;nh cường lực l&agrave; sản phẩm mới, hiện đại, trẻ trung v&agrave; c&oacute; t&iacute;nh cơ động cao, rất tiện dụng n&ecirc;n được rất nhiều kh&aacute;ch h&agrave;ng trẻ, c&oacute; cuộc sống năng động v&agrave; s&aacute;ng tạo, y&ecirc;u th&iacute;ch. B&agrave;n mở rộng c&oacute; thể biến h&oacute;a từ một chiếc b&agrave;n ăn nhỏ 1m2 th&agrave;nh chiếc b&agrave;n d&agrave;i 1m8 c&oacute; sức chứa nhiều hơn chỉ bằng thao t&aacute;c k&eacute;o trượt đơn giản, linh hoạt theo từng nhu cầu của người d&ugrave;ng, khi kh&ocirc;ng cần một chiếc b&agrave;n qu&aacute; lớn v&agrave; chiếm diện t&iacute;ch căn ph&ograve;ng, bạn chỉ cần thu lại, n&oacute; sẽ trở về l&agrave; chiếc b&agrave;n nhỏ gọn ban đầu.</p>

<p><img alt="Ghe-an-PVC-mau-xanh-la-82127113" src="http://nhadep.com.vn/wp-content/uploads/Ghe-an-PVC-mau-xanh-la-82127113.jpg" style="height:248px; width:347px" /></p>

<p><img alt="DF60-1C" src="http://nhadep.com.vn/wp-content/uploads/DF60-1C.jpg" style="height:275px; width:383px" /></p>

<p>&nbsp;</p>

<p><img alt="DF60C" src="http://nhadep.com.vn/wp-content/uploads/DF60C1.jpg" style="height:268px; width:375px" /><br />
<a href="http://nhadep.com.vn/wp-content/uploads/DF60-1C.jpg"><img alt="DF90C." src="http://nhadep.com.vn/wp-content/uploads/DF90C..jpg" style="height:234px; width:327px" /></a></p>

<p><em>&nbsp;</em></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><em>Ghế ăn bọc PVC</em></p>
', N'Admin', N'khuyến mãi', 19, NULL, NULL, 1, NULL, CAST(0x0000A64A01146296 AS DateTime), NULL, CAST(0x0000A64A01146296 AS DateTime))
INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [DisplayHomePage], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, 16, 404, N'Giới thiệu chung', N'Giới thiệu chung', N'<h1>About</h1>

<h3>Catering to your requirements, handling your needs with care</h3>

<p>Our store is more than just another average online retailer. We sell not only top quality products, but give our customers a positive online shopping experience. Forget about struggling to do everything at once: taking care of the family, running your business, walking your dog, cleaning the house, doing the shopping, etc. Purchase the goods you need every day or just like in a few clicks or taps, depending on the device you use to access the Internet. We work to make your life more enjoyable.</p>
', N'Admin', N'giới thiệu', 102, 0, NULL, 1, NULL, CAST(0x0000A67101849B9F AS DateTime), NULL, CAST(0x0000A67101849B9F AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_News] OFF
SET IDENTITY_INSERT [dbo].[event_Event] ON 

INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (3, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'asdasdasd                                                                                                                                                                                               ', CAST(0x0000A69D000A4CB8 AS DateTime), CAST(0x0000A6A7000A4DE4 AS DateTime), N'<p>asdasasdasd</p>
', N'asdasd                                                                                              ', N'<p>asdasd</p>
                                                                                                                                                                                                                                                                                             ', NULL, N'zxczxc                                            ', 11, 105, 0, N'asda                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'sdas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'dasd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'asda                                                                                                ', N'sdasd                                                                                               ', NULL, N'BA                                                                                                  ', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (4, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'trungkienkaka3                                                                                                                                                                                          ', CAST(0x0000A69601477164 AS DateTime), CAST(0x0000A6AE01477290 AS DateTime), N'<p>trungkienkaka</p>
', N'trungkienkaka                                                                                       ', N'<p>trungkienkaka</p>
                                                                                                                                                                                                                                                                                      ', NULL, N'trungkienkaka                                     ', 15, 105, 0, N'trungkienkaka                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'trungkienkaka                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'trungkienkaka                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'trungkienkaka                                                                                       ', N'trungkienkaka                                                                                       ', NULL, N'AU                                                                                                  ', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (5, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'year end party3', CAST(0x0000A695016AB7DC AS DateTime), CAST(0x0000A6AE01505FB8 AS DateTime), N'<p>enclave</p>
', N'enclave', N'<p>enclave</p>
', 434, N'trungkien3289@gmail.com', 19, 114, 1, N'hoang dieu', N'235 - 237 hoang dieu', N'235 - 237 hoang dieu', N'da nang', N'da nang', N'kaka', N'DZ', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (6, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'trunkienasdas                                                                                                                                                                                           ', CAST(0x0000A69601776270 AS DateTime), CAST(0x0000A6AB0177639C AS DateTime), N'<p>trunkienasdas</p>
', N'trunkienasdas                                                                                       ', N'<p>trunkienasdas</p>
                                                                                                                                                                                                                                                                                      ', NULL, N'trunkienasdas                                     ', 7, 105, 1, N'trunkienasdas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'trunkienasdas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'trunkienasdas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', N'trunkienasdas                                                                                       ', N'trunkienasdas                                                                                       ', NULL, N'AT                                                                                                  ', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (7, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'fan meeting', CAST(0x0000A6B40074CFE8 AS DateTime), CAST(0x0000A6BF0074D114 AS DateTime), N'<p>kaka</p>
', N'KTS', N'<p>KTS</p>
', 436, N'trungkien3289@gmail.com', 7, 103, 0, N'tieu la', N'36 tieu la', N'36 tieu la', N'Hải Châu', N'Đà Nẵng', N'kaka', N'VN', 1, NULL, 1)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (8, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'kienkaka', CAST(0x0000A69600770E20 AS DateTime), CAST(0x0000A6A600770F4C AS DateTime), N'<p>kienkaka</p>
', N'kienkaka', N'<p>kienkaka</p>
', NULL, N'kienkaka', 6, 199, 1, N'kienkaka', N'kienkaka', N'kienkaka', N'kienkaka', N'kienkaka', NULL, N'AZ', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (9, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'kienakka', CAST(0x0000A696007829B8 AS DateTime), CAST(0x0000A6AD00782AE4 AS DateTime), N'<p>kienakka</p>
', N'kienakka', N'<p>kienakka</p>
', 438, N'kienakka', 11, 199, 0, N'kienakka', N'kienakka', N'kienakka', N'kienakka', N'kienakka', N'kaka', N'AT', 1, NULL, 1)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (10, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'lalala', CAST(0x0000A697007B85E0 AS DateTime), CAST(0x0000A696007B8838 AS DateTime), N'<p>lalala</p>
', N'lalala', N'<p>lalala</p>
', NULL, N'lalala', 8, 111, 0, N'lalala', N'lalala', N'lalala', N'lalala', N'lalala', N'undefined', N'AT', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (11, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'hehekien', CAST(0x0000A6A5007C1D0C AS DateTime), CAST(0x0000A6B3007C1E38 AS DateTime), N'<p>hehekien</p>
', N'hehekien', N'<p>hehekien</p>
', NULL, N'hehekien', 7, 105, 0, N'hehekien', N'hehekien', N'hehekien', N'hehekien', N'hehekien', N'undefined', N'AT', 2, NULL, 1)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (12, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'lalalakien', CAST(0x0000A69E007C87B0 AS DateTime), CAST(0x0000A6A6007C8A08 AS DateTime), N'<p>lalalakien</p>
', N'lalalakien', N'<p>lalalakien</p>
', 442, N'lalalakien', 15, 199, 0, N'lalalakien', N'lalalakien', N'lalalakien', N'lalalakien', N'lalalakien', N'lalalakien', N'AZ', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (13, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'kaka2', CAST(0x0000A6B4015E0514 AS DateTime), CAST(0x0000A6B1015E076C AS DateTime), N'<p>kaka2</p>
', N'kaka2', N'<p>kaka2</p>
', 445, N'kaka2', 15, 103, 0, N'kaka2', N'kaka2', N'kaka2', N'Đà Nẵng', N'Đà Nẵng', N'43', N'VN', 1, NULL, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (14, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'semina IOT', CAST(0x0000A6B301644BB8 AS DateTime), CAST(0x0000A6C201645194 AS DateTime), N'<h3>Event Details</h3>

<p><img alt="" src="https://cdn.evbuc.com/eventlogos/22328802/img4853.jpg" style="height:600px; width:600px" />&nbsp;</p>

<p>&nbsp;<img alt="" src="https://cdn.evbuc.com/eventlogos/22328802/saturdays22415copy.jpg" style="height:600px; width:600px" /></p>

<p>KAPTURE&nbsp;&nbsp;</p>

<p>THIS SATURDAY</p>

<p>75 PEACHTREE PLACE NW&nbsp;</p>

<p>MIDTOWN ATLANTA&nbsp;</p>

<p>(LOCATED DIRECTLY BEHIND PRIVE)</p>

<p>10PM TO 3AM&nbsp;</p>

<p>&nbsp;</p>

<p>DRESS CODE: FASHIONABLY COMPETITIVE&nbsp;</p>

<p>FOR MORE INFO AND VIP SECTIONS&nbsp;</p>

<p>CALL 404 932 7624&nbsp;</p>

<p>Sections Non Refundable&nbsp;</p>

<p>&nbsp;</p>

<p><a href="http://KaptureAtlanta.smugmug.com"><strong>CLICK HERE FOR KAPTURE SATURDAYS&nbsp;</strong></a></p>

<p><a href="KaptureAtlanta.smugmug.com"><strong>WEEKLY PICTURE GALLERY !!!!!</strong></a></p>

<p>&nbsp;</p>

<p><a href="http://KAPTUREATLANTA.SMUGMUG.COM"><img alt="" src="https://cdn.evbuc.com/eventlogos/22328802/img6596.jpg" style="height:600px; width:600px" /></a>&nbsp;</p>
<!-- end panel_body -->

<p>Have questions about Kapture Saturdays this Saturday @Kapture Ladies Free Til 1AM? <a href="#lightbox_contact"> Contact #PRVLGD=FOE DIDDY,MR.DORSEY AND @CHRISSTAINLESS </a></p>
', N'KTS', N'<p>KTS coporation</p>
', 446, N'trungkien3289@gmail.com', 1, 102, 0, N'karl', N'123  Tiểu La', N'123  Tiểu La', N'Đà Nẵng', N'Đà Nẵng', N'12', N'VN', 1, NULL, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (15, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'abc2', CAST(0x0000A6BB0179F88C AS DateTime), CAST(0x0000A6C30179F9B8 AS DateTime), N'<p style="text-align: center;"><strong><em><span style="font-size: medium;"><br></span></em></strong></p>
<p style="text-align: center;"><strong><em><span style="font-size: medium;"><img alt="" src="https://cdn.evbuc.com/eventlogos/6673079/takemarta02.png" height="54" width="261"></span></em></strong></p>
<p style="text-align: center;"><img alt="" src="https://cdn.evbuc.com/eventlogos/6673079/atlhiphopdaybillboard.jpg" height="149" width="715"></p>', N'KTS', N'<p>KTS</p>
', 449, N'trungkien3289@gmail.com', 5, 110, 1, N'kaka', N'kaka', N'kaka', N'Hải Châu', N'Đà Nẵng', N'kaka', N'VN', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[event_Event] OFF
SET IDENTITY_INSERT [dbo].[event_Order] ON 

INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime]) VALUES (1, N'8b21a030-ad44-45fc-bb7e-d1ade59c8ac6', 15, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime]) VALUES (2, N'7748d514-5b36-41f0-b555-99c0df02d1cc', 15, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime]) VALUES (3, N'5d27ff95-d2b5-4ecc-a8ac-e34471fbbcbd', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B80185819D AS DateTime))
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime]) VALUES (4, N'781f84a8-06c9-453d-835c-3fc72cf9d624', 15, NULL, NULL, NULL, NULL, 1, CAST(0x0000A6B80188DC09 AS DateTime))
SET IDENTITY_INSERT [dbo].[event_Order] OFF
SET IDENTITY_INSERT [dbo].[event_Ticket] ON 

INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (1, 4, N'00000000-0000-0000-0000-000000000000', N'trungkienkaka                                                                                                                                                                                           ', 23, 23, N'                            trungkienkaka
                        ', 1, 1, 0, 0, 1, 10, N'abc                                                                                                                                                                                                     ', 1, 1, 0.0000, CAST(0x0000A69601477164 AS DateTime), CAST(0x0000A69601477164 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (2, 5, N'00000000-0000-0000-0000-000000000000', N'Vip2', 12, 12, N'kaka', 1, 0, 0, 0, 1, 10, N'abc                                                                                                                                                                                                     ', 1, 1, 20.0000, CAST(0x0000A69601518258 AS DateTime), CAST(0x0000A6AE015184B0 AS DateTime), 1)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (3, 6, N'00000000-0000-0000-0000-000000000000', N'trunkienasdas                                                                                                                                                                                           ', 12, 12, N'trunkienasdas', 1, 1, 0, 0, 1, 10, N'abc                                                                                                                                                                                                     ', 1, 1, 0.0000, CAST(0x0000A6A501777788 AS DateTime), CAST(0x0000A6AD017778B4 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (4, 7, N'00000000-0000-0000-0000-000000000000', N'VIP', 20, 20, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    kaka
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        ', 1, 1, 0, 0, 1, 10, N'abc', 1, 1, 20.0000, CAST(0x0000A69C0074FD9C AS DateTime), CAST(0x0000A6AD0074FEC8 AS DateTime), 1)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (5, 7, N'00000000-0000-0000-0000-000000000000', N'Normal', 50, 50, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    kaka
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        ', 1, 2, 0, 0, 1, 10, N'abc', 1, 1, 10.0000, CAST(0x0000A696007527CC AS DateTime), CAST(0x0000A6A6007528F8 AS DateTime), 1)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (6, 8, N'00000000-0000-0000-0000-000000000000', N'kienkaka', 12, 12, N'kienkaka', 1, 2, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A6AC00772464 AS DateTime), CAST(0x0000A69F00772590 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (7, 9, N'00000000-0000-0000-0000-000000000000', N'kienakka', 12, 12, N'                                                        kienakka
                        
                        ', 1, 0, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A69E00783DA4 AS DateTime), CAST(0x0000A6A600783ED0 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (8, 12, N'00000000-0000-0000-0000-000000000000', N'lalalakien', 12, 12, N'                            lalalakien
                        ', 1, 0, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A6A6007C9DF4 AS DateTime), CAST(0x0000A69E007C9F20 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (9, 13, N'00000000-0000-0000-0000-000000000000', N'kaka2', 12, 12, N'                                                                                    kaka2
                        
                        
                        ', 1, 0, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A69D015E1B58 AS DateTime), CAST(0x0000A69C015E1C84 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (10, 14, N'00000000-0000-0000-0000-000000000000', N'VIP', 20, 20, N'                                                        for VIP
                        
                        ', 1, 2, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A6B30164F220 AS DateTime), CAST(0x0000A6C20164F5A4 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (11, 15, N'00000000-0000-0000-0000-000000000000', N'VIP', 12, 12, N'ki', 1, 0, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A6BB017A36A8 AS DateTime), CAST(0x0000A6C2017A3900 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[event_Ticket] OFF
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [Quantity]) VALUES (11, 1, 5)
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [Quantity]) VALUES (11, 2, 7)
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [Quantity]) VALUES (11, 3, 3)
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [Quantity]) VALUES (11, 4, 5)
SET IDENTITY_INSERT [dbo].[portal_Projects] ON 

INSERT [dbo].[portal_Projects] ([Id], [Region], [Address], [Investor], [ProjectPackage], [TotalInvestment], [Duration], [ProgressStatus], [Type], [SortOrder], [Status], [CoverImageId], [Name], [Description], [Description2]) VALUES (1, 0, N'asd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'asd                                                                                                                                                                                                     ', N'asd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'asd                                                                                                 ', N'12                                                                                                                                                                                                      ', 1, 0, 1, 2, NULL, N'asd2                                                                                                                                                                                                    ', NULL, NULL)
INSERT [dbo].[portal_Projects] ([Id], [Region], [Address], [Investor], [ProjectPackage], [TotalInvestment], [Duration], [ProgressStatus], [Type], [SortOrder], [Status], [CoverImageId], [Name], [Description], [Description2]) VALUES (2, 0, N'asd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'asd                                                                                                                                                                                                     ', N'asd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'asd                                                                                                 ', N'asd                                                                                                                                                                                                     ', 0, 0, 1, 1, 408, N'asdasd                                                                                                                                                                                                  ', NULL, NULL)
INSERT [dbo].[portal_Projects] ([Id], [Region], [Address], [Investor], [ProjectPackage], [TotalInvestment], [Duration], [ProgressStatus], [Type], [SortOrder], [Status], [CoverImageId], [Name], [Description], [Description2]) VALUES (3, 0, N'czxcz                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'xczx                                                                                                                                                                                                    ', N'asdasd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ', N'asdasd                                                                                              ', N'asdasd                                                                                                                                                                                                  ', 0, 0, 1, 1, 409, N'zxczx                                                                                                                                                                                                   ', N'asdas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'<p>cvbcvbcvb</p>
')
SET IDENTITY_INSERT [dbo].[portal_Projects] OFF
INSERT [dbo].[portal_Projects_Images] ([ProjectId], [ImageId]) VALUES (1, 405)
INSERT [dbo].[portal_Projects_Images] ([ProjectId], [ImageId]) VALUES (2, 408)
INSERT [dbo].[portal_Projects_Images] ([ProjectId], [ImageId]) VALUES (3, 409)
SET IDENTITY_INSERT [dbo].[share_Categories] ON 

INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'An Giang', NULL, 6, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Bà Rịa - Vũng Tàu', NULL, 7, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Bắc Giang', NULL, 8, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Bắc Cạn', NULL, 9, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Bạc Liêu', NULL, 10, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Bắc Ninh', NULL, 11, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Bến Tre', NULL, 12, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Bình Định', NULL, 13, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Bình Dương', NULL, 14, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Bình Phước', NULL, 15, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Bình Thuận', NULL, 16, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Cà Mau', NULL, 17, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Cao Bằng', NULL, 18, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Đắc Lắc', NULL, 19, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Đắk Nông', NULL, 20, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Điện Biên', NULL, 21, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Đồng Nai', NULL, 22, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Đồng Tháp', NULL, 23, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Gia Lai', NULL, 24, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Hà Giang', NULL, 25, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Hà Nam', NULL, 26, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Hà Tĩnh', NULL, 27, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Hải Dương', NULL, 28, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Hậu Giang', NULL, 29, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Hòa Bình', NULL, 30, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Hưng Yên', NULL, 31, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Khánh Hòa', NULL, 32, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Kiên Giang', NULL, 33, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Kon Tum', NULL, 34, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Lai Châu', NULL, 35, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Lâm Đồng', NULL, 36, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Lạng Sơn', NULL, 37, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Lào Cai', NULL, 38, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Long An', NULL, 39, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'Nam Định', NULL, 40, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'Nghệ An', NULL, 41, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'Ninh Bình', NULL, 42, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (38, N'Ninh Thuận', NULL, 43, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (39, N'Phú Thọ', NULL, 44, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'Quảng Bình', NULL, 45, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'Quảng Nam', NULL, 46, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'Quảng Ngãi', NULL, 47, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'Quảng Ninh', NULL, 48, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (44, N'Quảng Trị', NULL, 49, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (45, N'Sóc Trăng', NULL, 50, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (46, N'Sơn La', NULL, 51, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (47, N'Tây Ninh', NULL, 52, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (48, N'Thái Bình', NULL, 53, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (49, N'Thái Nguyên', NULL, 54, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (50, N'Thanh Hóa', NULL, 55, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (51, N'Thừa Thiên Huế', NULL, 56, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (52, N'Tiền Giang', NULL, 57, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (53, N'Trà Vinh', NULL, 58, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, N'Tuyên Quang', NULL, 59, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, N'Vĩnh Long', NULL, 60, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, N'Vĩnh Phúc', NULL, 61, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (57, N'Yên Bái', NULL, 62, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, N'Phú Yên', NULL, 63, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (59, N'Cần Thơ', NULL, 3, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, N'Đà Nẵng', NULL, 4, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (61, N'Hải Phòng', NULL, 5, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (62, N'Hà Nội', NULL, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (63, N'Hồ Chí Minh', NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (64, N'Quận Ba Đình', 62, 1, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (65, N'Quận Hoàn Kiếm', 62, 2, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (66, N'Quận Hai Bà Trưng', 62, 3, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (67, N'Quận Đống Đa', 62, 4, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (68, N'Quận Tây Hồ', 62, 5, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (69, N'Quận Cầu Giấy', 62, 6, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (70, N'Quận Thanh Xuân', 62, 7, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (71, N'Quận Hoàng Mai', 62, 8, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (72, N'Quận Long Biên', 62, 9, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (73, N'Huyện Từ Liêm', 62, 10, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (74, N'Huyện Thanh Trì', 62, 11, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (75, N'Huyện Gia Lâm', 62, 12, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (76, N'Huyện Đông Anh', 62, 13, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (77, N'Huyện Sóc Sơn', 62, 14, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (78, N'TP Hà Đông', 62, 15, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (79, N'TP Sơn Tây', 62, 16, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (80, N'Huyện Ba Vì', 62, 17, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (81, N'Huyện Phúc Thọ', 62, 18, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (82, N'Huyện Thạch Thất', 62, 19, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (83, N'Huyện Quốc Oai', 62, 20, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (84, N'Huyện Chương Mỹ', 62, 21, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (85, N'Huyện Đan Phượng', 62, 22, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (86, N'Huyện Hoài Đức', 62, 23, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (87, N'Huyện Thanh Oai', 62, 24, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (88, N'Huyện Mỹ Đức', 62, 25, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (89, N'Huyện Ứng Hoà', 62, 26, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (90, N'Huyện Thường Tín', 62, 27, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (91, N'Huyện Phú Xuyên', 62, 28, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (92, N'Huyện Mê Linh', 62, 29, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (93, N'Quận Một', 63, 30, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (94, N'Quận Hai', 63, 31, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (95, N'Quận Ba  ', 63, 32, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (96, N'Quận Bốn', 63, 33, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (97, N'Quận Năm', 63, 34, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (98, N'Quận Sáu', 63, 35, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (99, N'Quận Bảy', 63, 36, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (100, N'Quận Tám', 63, 37, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (101, N'Quận Chín', 63, 38, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (102, N'Quận Mười', 63, 39, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (103, N'Quận Mười một', 63, 40, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (104, N'Quận Mười hai', 63, 41, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (105, N'Quận Gò Vấp', 63, 42, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (106, N'Quận Tân Bình', 63, 43, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (107, N'Quận Tân Phú', 63, 44, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, N'Quận Bình Thạnh', 63, 45, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, N'Quận Phú Nhuận', 63, 46, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, N'Quận Thủ Đức', 63, 47, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, N'Quận Bình Tân', 63, 48, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, N'Huyện Bình Chánh', 63, 49, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, N'Huyện Củ Chi', 63, 50, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, N'Huyện Hóc Môn', 63, 51, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, N'Huyện Nhà Bè', 63, 52, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, N'Huyện Cần Giờ', 63, 53, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (117, N'Quận Hồng Bàng', 61, 54, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (118, N'Quận Lê Chân', 61, 55, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (119, N'Quận Ngô Quyền', 61, 56, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (120, N'Quận Kiến An', 61, 57, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (121, N'Quận Hải An  ', 61, 58, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (122, N'Quận Đồ Sơn', 61, 59, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (123, N'Huyện An Lão', 61, 60, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (124, N'Huyện Kiến Thụy', 61, 61, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (125, N'Huyện Thủy Nguyên', 61, 62, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (126, N'Huyện An Dương', 61, 63, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (127, N'Huyện Tiên Lãng', 61, 64, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (128, N'Huyện Vĩnh Bảo', 61, 65, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (129, N'Huyện Cát Hải', 61, 66, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (130, N'Huyện Bạch Long Vĩ', 61, 67, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (131, N'Quận Dương Kinh', 61, 68, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (132, N'Quận Hải Châu', 60, 69, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (133, N'Quận Thanh Khê', 60, 70, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (134, N'Quận Sơn Trà', 60, 71, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (135, N'Quận Ngũ Hành Sơn', 60, 72, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (136, N'Quận Liên Chiểu', 60, 73, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (137, N'Huyện Hoà Vang', 60, 74, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (138, N'Quận Cẩm Lệ', 60, 75, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (139, N'Thị xã Hà Giang', 20, 76, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (140, N'Huyện Đồng Văn', 20, 77, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (141, N'Huyện Mèo Vạc', 20, 78, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (142, N'Huyện Yên Minh', 20, 79, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (143, N'Huyện Quản Bạ', 20, 80, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (144, N'Huyện Vị Xuyên', 20, 81, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (145, N'Huyện Bắc Mê', 20, 82, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (146, N'Huyện Hoàng Su Phì', 20, 83, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (147, N'Huyện Xín Mần', 20, 84, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (148, N'Huyện Bắc Quang', 20, 85, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (149, N'Huyện Quang Bình', 20, 86, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (150, N'Thị xã Cao Bằng', 13, 87, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (151, N'Huyện Bảo Lạc', 13, 88, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (152, N'Huyện Thông Nông', 13, 89, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (153, N'Huyện Hà Quảng', 13, 90, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (154, N'Huyện Trà Lĩnh', 13, 91, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (155, N'Huyện Trùng Khánh', 13, 92, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (156, N'Huyện Nguyên Bình', 13, 93, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (157, N'Huyện Hòa An', 13, 94, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (158, N'Huyện Quảng Uyên', 13, 95, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (159, N'Huyện Thạch An', 13, 96, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (160, N'Huyện Hạ Lang', 13, 97, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (161, N'Huyện Bảo Lâm', 13, 98, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (162, N'Huyện Phục Hòa', 13, 99, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (163, N'Thị xã Lai Châu', 30, 100, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (164, N'Huyện Tam Đường', 30, 101, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (165, N'Huyện Phong Thổ', 30, 102, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (166, N'Huyện Sìn Hồ', 30, 103, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (167, N'Huyện Mường Tè', 30, 104, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (168, N'Huyện Than Uyên', 30, 105, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (169, N'Huyện Tân Uyên', 30, 106, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (170, N'TP Lào Cai', 33, 107, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (171, N' Huyện Xi Ma Cai', 33, 108, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (172, N'Huyện Bát Xát', 33, 109, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (173, N'Huyện Bảo Thắng', 33, 110, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (174, N'Huyện Sa Pa', 33, 111, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (175, N'Huyện Văn Bàn', 33, 112, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (176, N'Huyện Bảo Yên', 33, 113, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (177, N'Huyện Bắc Hà', 33, 114, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (178, N'Huyện Mường Khương', 33, 115, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (179, N'Thị xã Tuyên Quang', 54, 116, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (180, N'Huyện Na Hang', 54, 117, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (181, N'Huyện Chiêm Hóa', 54, 118, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (182, N'Huyện  Hàm Yên', 54, 119, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (183, N'Huyện Yên Sơn  ', 54, 120, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (184, N'Huyện Sơn Dương', 54, 121, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (185, N'TP Lạng Sơn', 32, 122, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (186, N'Huyện  Tràng Định', 32, 123, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (187, N'Huyện Bình Gia', 32, 124, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (188, N'Huyện  Văn Lãng', 32, 125, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (189, N'Huyện Bắc Sơn', 32, 126, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (190, N'Huyện Văn Quan', 32, 127, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (191, N'Huyện Cao Lộc', 32, 128, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (192, N'Huyện Lộc Bình', 32, 129, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (193, N'Huyện Chi Lăng', 32, 130, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (194, N'Huyện  Đình Lập', 32, 131, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (195, N'Huyện Hữu Lũng', 32, 132, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (196, N'Thị xã Bắc Kạn', 4, 133, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (197, N'Huyện Chợ Đồn', 4, 134, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (198, N'Huyện Bạch Thông', 4, 135, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (199, N'Huyện Na Rì', 4, 136, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (200, N'Huyện Ngân Sơn', 4, 137, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (201, N'Huyện Ba Bể', 4, 138, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (202, N'Huyện Chợ Mới', 4, 139, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (203, N'Huyện Pác Nặm', 4, 140, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (204, N'TP Thái Nguyên', 49, 141, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (205, N'Thị xã Sông Công', 49, 142, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (206, N'Huyện Định Hóa', 49, 143, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (207, N'Huyện Phú Lương', 49, 144, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (208, N'Huyện Võ Nhai', 49, 145, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (209, N'Huyện Đại Từ', 49, 146, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (210, N'Huyện Đồng Hỷ', 49, 147, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (211, N'Huyện Phú Bình', 49, 148, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (212, N'Huyện Phổ Yên', 49, 149, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (213, N'TP Yên Bái', 57, 150, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (214, N'Thị xã Nghĩa Lộ', 57, 151, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (215, N'Huyện Văn Yên', 57, 152, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (216, N'Huyện Yên Bình', 57, 153, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (217, N'Huyện Mù Cang Chải', 57, 154, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (218, N'Huyện Văn Chấn', 57, 155, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (219, N'Huyện Trấn Yên', 57, 156, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (220, N'Huyện Trạm Tấu', 57, 157, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (221, N'Huyện Lục Yên', 57, 158, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (222, N'Thị xã Sơn La', 46, 159, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (223, N'Huyện Quỳnh Nhai', 46, 160, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (224, N'Huyện Mường La', 46, 161, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (225, N'Huyện Thuận Châu', 46, 162, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (226, N'Huyện Bắc Yên', 46, 163, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (227, N'Huyện Phù Yên', 46, 164, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (228, N'Huyện Mai Sơn', 46, 165, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (229, N'Huyện Yên Châu', 46, 166, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (230, N'Huyện Sông Mã', 46, 167, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (231, N'Huyện Mộc Châu', 46, 168, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (232, N'Huyện Sốp Cộp', 46, 169, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (233, N'TP Việt Trì', 39, 170, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (234, N'Thị xã Phú Thọ', 39, 171, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (235, N'Huyện Đoan Hùng', 39, 172, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (236, N'Huyện Thanh Ba', 39, 173, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (237, N'Huyện Hạ Hòa', 39, 174, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (238, N'Huyện Cẩm Khê', 39, 175, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (239, N'Huyện Yên Lập', 39, 176, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (240, N'Huyện Thanh Sơn', 39, 177, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (241, N'Huyện Phù Ninh', 39, 178, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (242, N'Huyện Lâm Thao', 39, 179, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (243, N'Huyện Tam Nông', 39, 180, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (244, N'Huyện Thanh Thủy', 39, 181, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (245, N'Huyện Tân Sơn', 39, 182, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (246, N'TP Vĩnh Yên', 56, 183, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (247, N'Huyện Tam Dương', 56, 184, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (248, N'Huyện Lập Thạch', 56, 185, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (249, N'Huyện Vĩnh Tường', 56, 186, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (250, N'Huyện Yên Lạc', 56, 187, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (251, N'Huyện Bình Xuyên', 56, 188, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (252, N'Thị xã Phúc Yên', 56, 189, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (253, N'Huyện Tam Đảo', 56, 190, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (254, N'TP Hạ Long', 43, 191, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (255, N'Thị xã Cẩm Phả', 43, 192, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (256, N'Thị xã Uông Bí', 43, 193, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (257, N'TP Móng Cái', 43, 194, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (258, N'Huyện Bình Liêu', 43, 195, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (259, N'Huyện Đầm Hà', 43, 196, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (260, N'Huyện Hải Hà', 43, 197, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (261, N'Huyện Tiên Yên', 43, 198, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (262, N'Huyện Ba Chẽ', 43, 199, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (263, N'Huyện Đông Triều', 43, 200, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (264, N'Huyện Yên Hưng', 43, 201, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (265, N'Huyện Hoành Bồ', 43, 202, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (266, N'Huyện Vân Đồn', 43, 203, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (267, N'Huyện Cô Tô', 43, 204, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (268, N'TP Bắc Giang  ', 3, 205, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (269, N'Huyện Yên Thế', 3, 206, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (270, N'Huyện Lục Ngạn', 3, 207, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (271, N'Huyện Sơn Động  ', 3, 208, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (272, N'Huyện Lục Nam', 3, 209, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (273, N'Huyện Tân Yên', 3, 210, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (274, N'Huyện Hiệp Hoà', 3, 211, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (275, N'Huyện Lạng Giang', 3, 212, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (276, N'Huyện Việt Yên', 3, 213, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (277, N'Huyện Yên Dũng', 3, 214, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (278, N'TP Bắc Ninh                               ', 3, 215, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (279, N'Huyện Yên Phong', 3, 216, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (280, N'Huyện Quế Võ.', 3, 217, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (281, N'Huyện Tiên Du', 3, 218, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (282, N'Huyện Từ  Sơn', 3, 219, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (283, N'Huyện Thuận Thành', 3, 220, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (284, N'Huyện Gia Bình        ', 3, 221, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (285, N'Huyện Lương Tài', 3, 222, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (286, N'TP Hải Dương', 23, 223, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (287, N'Huyện Chí Linh', 23, 224, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (288, N'Huyện Nam Sách', 23, 225, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (289, N'Huyện Kinh Môn', 23, 226, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (290, N'Huyện Gia Lộc', 23, 227, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (291, N'Huyện Tứ Kỳ', 23, 228, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (292, N'Huyện Thanh Miện', 23, 229, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (293, N'Huyện Ninh Giang', 23, 230, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (294, N'Huyện Cẩm Giàng', 23, 231, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (295, N'Huyện Thanh Hà', 23, 232, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (296, N'Huyện Kim Thành', 23, 233, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (297, N'Huyện Bình Giang', 23, 234, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (298, N'Thị xã Hưng Yên', 26, 235, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (299, N'Huyện Kim Động', 26, 236, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (300, N'Huyện Ân Thi', 26, 237, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (301, N'Huyện Khoái Châu', 26, 238, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (302, N'Huyện Yên Mỹ', 26, 239, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (303, N'Huyện Tiên Lữ', 26, 240, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (304, N'Huyện Phù Cừ', 26, 241, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (305, N'Huyện Mỹ Hào', 26, 242, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (306, N'Huyện Văn Lâm', 26, 243, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (307, N'Huyện Văn Giang', 26, 244, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (308, N'TP Hòa Bình', 25, 245, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (309, N'Huyện Đà Bắc', 25, 246, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (310, N'Huyện Mai Châu', 25, 247, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (311, N'Huyện Tân Lạc', 25, 248, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (312, N'Huyện Lạc Sơn', 25, 249, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (313, N'Huyện Kỳ Sơn', 25, 250, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (314, N'Huyện Lư¬ơng Sơn', 25, 251, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (315, N'Huyện Kim Bôi', 25, 252, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (316, N'Huyện Lạc Thủy', 25, 253, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (317, N'Huyện Yên Thủy', 25, 254, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (318, N'Huyện Cao Phong', 25, 255, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (319, N'TP Phủ Lý', 21, 256, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (320, N'Huyện Duy Tiên', 21, 257, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (321, N'Huyện Kim Bảng', 21, 258, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (322, N'Huyện Lý Nhân', 21, 259, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (323, N'Huỵện Thanh Liêm', 21, 260, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (324, N'Huyện Bình Lục', 21, 261, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (325, N'TP Nam Định', 35, 262, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (326, N'Huyện Mỹ Lộc', 35, 263, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (327, N'Huyện Xuân Trường', 35, 264, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (328, N'Huyện Giao Thủy', 35, 265, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (329, N'Huyện Ý Yên', 35, 266, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (330, N'Huyện Vụ Bản', 35, 267, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (331, N'Huyện Nam Trực', 35, 268, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (332, N'Huyện Trực Ninh', 35, 269, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (333, N'Huyện Nghĩa Hưng', 35, 270, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (334, N'Huyện Hải Hậu', 35, 271, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (335, N'TP Thái Bình', 48, 272, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (336, N'Huyện Quỳnh Phụ', 48, 273, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (337, N'Huyện Hưng Hà', 48, 274, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (338, N'Huyện Đông Hưng', 48, 275, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (339, N'Huyện Vũ Thư', 48, 276, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (340, N'Huyện Kiến Xương', 48, 277, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (341, N'Huyện Tiền Hải', 48, 278, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (342, N'Huyện Thái Thuỵ', 48, 279, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (343, N'TP Ninh Bình', 37, 280, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (344, N'Thị xã Tam Điệp', 37, 281, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (345, N'Huyện Nho Quan', 37, 282, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (346, N'Huyện Gia Viễn', 37, 283, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (347, N'Huyện Hoa Lư', 37, 284, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (348, N'Huyện Yên Mô', 37, 285, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (349, N'Huyện Kim Sơn', 37, 286, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (350, N'Huyện Yên Khánh', 37, 287, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (351, N'TP Thanh Hóa', 50, 288, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (352, N'Thị xã Bỉm Sơn', 50, 289, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (353, N'Thị xã Sầm Sơn', 50, 290, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (354, N'Huyện Quan Hóa', 50, 291, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (355, N'Huyện Quan Sơn', 50, 292, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (356, N'Huyện Mường Lát', 50, 293, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (357, N'Huyện Bá Thước', 50, 294, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (358, N'Huyện Thường Xuân', 50, 295, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (359, N'Huyện Như Xuân', 50, 296, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (360, N'Huyện Như Thanh', 50, 297, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (361, N'Huyện Lang Chánh', 50, 298, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (362, N'Huyện Ngọc Lặc', 50, 299, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (363, N'Huyện Thạch Thành', 50, 300, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (364, N'Huyện Cẩm Thủy', 50, 301, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (365, N'Huyện Thọ Xuân', 50, 302, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (366, N'Huyện Vĩnh Lộc', 50, 303, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (367, N'Huyện Thiệu Hóa', 50, 304, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (368, N'Huyện Triệu Sơn', 50, 305, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (369, N'Huyện Nông Cống', 50, 306, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (370, N'Huyện Đông Sơn  ', 50, 307, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (371, N'Huyện Hà Trung', 50, 308, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (372, N'Huyện Hoằng Hóa', 50, 309, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (373, N'Huyện Nga Sơn', 50, 310, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (374, N'Huyện Hậu Lộc', 50, 311, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (375, N'Huyện Quảng Xương', 50, 312, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (376, N'Huyện Tĩnh Gia', 50, 313, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (377, N'Huyện Yên Định', 50, 314, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (378, N'TP Vinh', 36, 315, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (379, N'Thị xã Cửa Lò', 36, 316, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (380, N'Huyện Quỳ Châu', 36, 317, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (381, N'Huyện Quỳ Hợp', 36, 318, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (382, N'Huyện Nghĩa Đàn  ', 36, 319, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (383, N'Huyện Quỳnh Lưu', 36, 320, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (384, N'Huyện Kỳ Sơn', 36, 321, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (385, N'Huyện Tương Dương', 36, 322, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (386, N'Huyện Con Cuông', 36, 323, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (387, N'Huyện Tân Kỳ', 36, 324, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (388, N'Huyện Yên Thành  ', 36, 325, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (389, N'Huyện Diễn Châu', 36, 326, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (390, N'Huyện Anh Sơn', 36, 327, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (391, N'Huyện Đô Lương  ', 36, 328, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (392, N'Huyện Thanh Chương', 36, 329, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (393, N'Huyện Nghi Lộc', 36, 330, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (394, N'Huyện Nam Đàn', 36, 331, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (395, N'Huyện Hưng Nguyên', 36, 332, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (396, N'Huyện Quế Phong', 36, 333, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (397, N'TP Hà Tĩnh', 22, 334, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (398, N'Thị xã Hồng Lĩnh', 22, 335, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (399, N'Huyện Hương Sơn', 22, 336, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (400, N'Huyện Đức Thọ', 22, 337, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (401, N'Huyện Nghi Xuân', 22, 338, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (402, N'Huyện Can Lộc', 22, 339, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (403, N'Huyện Hương Khê', 22, 340, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (404, N'Huyện Thạch Hà', 22, 341, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (405, N'Huyện Cẩm Xuyên', 22, 342, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (406, N'Huyện Kỳ Anh', 22, 343, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (407, N'Huyện Vũ Quang', 22, 344, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (408, N'Huyện Lộc Hà', 22, 345, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (409, N'TP Đồng Hới', 40, 346, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (410, N'Huyện Tuyên Hóa', 40, 347, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (411, N'Huyện Minh Hóa', 40, 348, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (412, N'Huyện Quảng Trạch  ', 40, 349, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (413, N'Huyện Bố Trạch', 40, 350, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (414, N'Huyện Quảng Ninh', 40, 351, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (415, N'Huyện Lệ Thủy', 40, 352, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (416, N'Thị xã Đông Hà', 44, 353, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (417, N'Thị xã Quảng Trị', 44, 354, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (418, N'Huyện Vĩnh Linh', 44, 355, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (419, N'Huyện Gio Linh', 44, 356, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (420, N'Huyện Cam Lộ', 44, 357, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (421, N'Huyện Triệu Phong', 44, 358, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (422, N'Huyện Hải Lăng', 44, 359, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (423, N'Huyện Hướng Hóa', 44, 360, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (424, N'Huyện Đăk Rông', 44, 361, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (425, N'Huyện đảo Cồn Cỏ', 44, 362, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (426, N'TP Huế', 51, 363, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (427, N'Huyện Phong Điền', 51, 364, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (428, N'Huyện Quảng Điền', 51, 365, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (429, N'Huyện Hương Trà', 51, 366, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (430, N'Huyện Phú Vang  ', 51, 367, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (431, N'Huyện Hương Thuỷ', 51, 368, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (432, N'Huyện Phú Lộc', 51, 369, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (433, N'Huyện Nam Đông', 51, 370, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (434, N'Huyện A Lưới', 51, 371, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (435, N'TP Tam Kỳ', 41, 372, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (436, N'TP Hội An', 41, 373, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (437, N'Huyện Duy Xuyên', 41, 374, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (438, N'Huyện Điện Bàn', 41, 375, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (439, N'Huyện Đại Lộc', 41, 376, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (440, N'Huyện Quế Sơn', 41, 377, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (441, N'Huyện Hiệp Đức', 41, 378, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (442, N'Huyện Thăng Bình', 41, 379, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (443, N'Huyện Núi Thành', 41, 380, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (444, N'Huyện Tiên Phước', 41, 381, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (445, N'Huyện Bắc Trà My', 41, 382, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (446, N'Huyện Đông Giang', 41, 383, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (447, N'Huyện Nam Giang', 41, 384, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (448, N'Huyện Phước Sơn', 41, 385, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (449, N'Huyện Nam Trà My', 41, 386, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (450, N'Huyện Tây Giang', 41, 387, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (451, N'Huyện Phú Ninh', 41, 388, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (452, N'Huyện Nông Sơn', 41, 389, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (453, N'TP Quảng Ngãi', 42, 390, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (454, N'Huyện Lý Sơn  ', 42, 391, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (455, N'Huyện Bình Sơn', 42, 392, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (456, N'Huyện Trà Bồng', 42, 393, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (457, N'Huyện Sơn Tịnh  ', 42, 394, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (458, N'Huyện Sơn Hà', 42, 395, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (459, N'Huyện Tư Nghĩa', 42, 396, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (460, N'Huyện Nghĩa Hành', 42, 397, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (461, N'Huyện Minh Long', 42, 398, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (462, N'Huyện Mộ Đức', 42, 399, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (463, N'Huyện Đức Phổ', 42, 400, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (464, N'Huyện Ba Tơ', 42, 401, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (465, N'Huyện Sơn Tây', 42, 402, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (466, N'Huyện Tây Trà', 42, 403, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (467, N'Thị xã KonTum', 29, 404, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (468, N'Huyện Đắk Glei', 29, 405, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (469, N'Huyện Ngọc Hồi', 29, 406, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (470, N'Huyện Đắk Tô', 29, 407, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (471, N'Huyện Sa Thầy', 29, 408, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (472, N'Huyện Kon Plong', 29, 409, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (473, N'Huyện Đắk Hà', 29, 410, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (474, N'Huyện Kon Rẫy', 29, 411, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (475, N'Huyện Tu Mơ Rông', 29, 412, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (476, N'TP Quy Nhơn', 8, 413, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (477, N'Huyện An Lão  ', 8, 414, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (478, N'Huyện Hoài Ân', 8, 415, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (479, N'Huyện Hoài Nhơn', 8, 416, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (480, N'Huyện Phù Mỹ', 8, 417, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (481, N'Huyện Phù Cát', 8, 418, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (482, N'Huyện Vĩnh Thạnh', 8, 419, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (483, N'Huyện Tây Sơn', 8, 420, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (484, N'Huyện Vân Canh', 8, 421, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (485, N'Huyện An Nhơn', 8, 422, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (486, N'Huyện Tuy Phước', 8, 423, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (487, N'TP Pleiku', 19, 424, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (488, N'Huyện Chư Păh', 19, 425, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (489, N'Huyện Mang Yang', 19, 426, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (490, N'Huyện Kbang', 19, 427, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (491, N'Thị xã An Khê  ', 19, 428, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (492, N'Huyện Kông Chro', 19, 429, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (493, N'Huyện Đức Cơ', 19, 430, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (494, N'Huyện Chưprông', 19, 431, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (495, N'Huyện Chư Sê', 19, 432, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (496, N'Huyện Ayunpa', 19, 433, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (497, N'Huyện Krông Pa', 19, 434, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (498, N'Huyện Ia Grai', 19, 435, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (499, N'Huyện Đăk Đoa', 19, 436, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (500, N'Huyện Ia Pa', 19, 437, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (501, N'Huyện Đăk Pơ', 19, 438, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (502, N'Huyện Phú Thiện', 19, 439, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (503, N'TP Tuy Hòa', 58, 440, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (504, N'Huyện Đồng Xuân', 58, 441, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (505, N'Huyện Sông Cầu', 58, 442, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (506, N'Huyện Tuy An', 58, 443, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (507, N'Huyện Sơn Hòa', 58, 444, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (508, N'Huyện Sông Hinh', 58, 445, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (509, N'Huyện Đông Hòa', 58, 446, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (510, N'Huyện Phú Hoà', 58, 447, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (511, N'Huyện Tây Hòa', 58, 448, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (512, N'TP Buôn Ma Thuột', 14, 449, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (513, N'Huyện Ea H Leo', 14, 450, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (514, N'Huyện Krông Buk', 14, 451, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (515, N'Huyện Krông Năng', 14, 452, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (516, N'Huyện Ea Súp', 14, 453, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (517, N'Huyện Cư M gar', 14, 454, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (518, N'Huyện Krông Pắc', 14, 455, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (519, N'Huyện Ea Kar', 14, 456, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (520, N'Huyện M''Đrăk', 14, 457, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (521, N'Huyện Krông Ana', 14, 458, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (522, N'Huyện Krông Bông', 14, 459, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (523, N'Huyện Lăk', 14, 460, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (524, N'Huyện Buôn Đôn', 14, 461, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (525, N'Huyện Cư Kuin', 14, 462, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (526, N'TP Nha Trang', 27, 463, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (527, N'Huyện Vạn Ninh', 27, 464, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (528, N'Huyện Ninh Hòa', 27, 465, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (529, N'Huyện Diên Khánh', 27, 466, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (530, N'Huyện Khánh Vĩnh', 27, 467, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (531, N'Thị xã Cam Ranh', 27, 468, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (532, N'Huyện Khánh Sơn', 27, 469, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (533, N'Huyện Trường Sa', 27, 470, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (534, N'Huyện Cam Lâm', 27, 471, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (535, N'TP Đà Lạt', 31, 472, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (536, N'Thị xã Bảo Lộc', 31, 473, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (537, N'Huyện Đức Trọng', 31, 474, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (538, N'Huyện Di Linh', 31, 475, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (539, N'Huyện Đơn Dương', 31, 476, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (540, N'Huyện Lạc Dương', 31, 477, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (541, N'Huyện Đạ Huoai', 31, 478, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (542, N'Huyện Đạ Tẻh', 31, 479, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (543, N'Huyện Cát Tiên', 31, 480, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (544, N'Huyện Lâm Hà', 31, 481, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (545, N'Huyện Bảo Lâm', 31, 482, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (546, N'Huyện Đam Rông', 31, 483, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (547, N'Thị xã Đồng Xoài', 10, 484, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (548, N'Huyện Đồng Phú', 10, 485, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (549, N'Huyện Chơn Thành', 10, 486, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (550, N'Huyện Bình Long', 10, 487, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (551, N'Huyện Lộc Ninh', 10, 488, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (552, N'Huyện Bù Đốp', 10, 489, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (553, N'Huyện Phước Long', 10, 490, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (554, N'Huyện Bù Đăng', 10, 491, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (555, N'Thị xã Thủ Dầu Một', 9, 492, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (556, N'Huyện Bến Cát', 9, 493, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (557, N'Huyện Tân Uyên', 9, 494, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (558, N'Huyện Thuận An', 9, 495, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (559, N'Huyện Dĩ An', 9, 496, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (560, N'Huyện Phú Giáo', 9, 497, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (561, N'Huyện Dầu Tiếng', 9, 498, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (562, N'TP Phan Rang - Tháp Chàm', 38, 499, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (563, N'Huyện Ninh Sơn', 38, 500, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (564, N'Huyện Ninh Hải', 38, 501, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (565, N'Huyện Ninh Phước', 38, 502, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (566, N'Huyện Bác Ái', 38, 503, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (567, N'Huyện Thuận Bắc', 38, 504, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (568, N'Thị xã Tây Ninh', 47, 505, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (569, N'Huyện Tân Biên', 47, 506, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (570, N'Huyện Tân Châu', 47, 507, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (571, N'Huyện Dương Minh Châu', 47, 508, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (572, N'Huyện Châu Thành', 47, 509, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (573, N'Huyện Hoà Thành', 47, 510, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (574, N'Huyện Bến Cầu', 47, 511, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (575, N'Huyện Gò Dầu', 47, 512, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (576, N'Huyện Trảng Bàng', 47, 513, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (577, N'TP Phan Thiết', 11, 514, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (578, N'Huyện Tuy Phong', 11, 515, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (579, N'Huyện Bắc Bình', 11, 516, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (580, N'Huyện Hàm Thuận Bắc', 11, 517, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (581, N'Huyện Hàm Thuận Nam', 11, 518, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (582, N'Huyện Hàm Tân', 11, 519, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (583, N'Huyện Đức Linh', 11, 520, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (584, N'Huyện Tánh Linh', 11, 521, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (585, N'Huyện đảo Phú Quý', 11, 522, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (586, N'Thị xã LaGi', 11, 523, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (587, N'TP Biên Hòa', 17, 524, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (588, N'Huyện Vĩnh Cửu  ', 17, 525, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (589, N'Huyện Tân Phú', 17, 526, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (590, N'Huyện Định Quán', 17, 527, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (591, N'Huyện Thống Nhất', 17, 528, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (592, N'Thị xã Long Khánh', 17, 529, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (593, N'Huyện Xuân Lộc', 17, 530, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (594, N'Huyện Long Thành', 17, 531, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (595, N'Huyện Nhơn Trạch', 17, 532, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (596, N'Huyện Trảng Bom', 17, 533, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (597, N'Huyện Cẩm Mỹ', 17, 534, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (598, N'Thị xã Tân An', 34, 535, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (599, N'Huyện Vĩnh Hưng', 34, 536, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (600, N'Huyện Mộc Hoá', 34, 537, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (601, N'Huyện Tân Thạnh', 34, 538, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (602, N'Huyện Thạnh Hoá', 34, 539, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (603, N'Huyện Đức Huệ', 34, 540, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (604, N'Huyện Đức Hoà', 34, 541, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (605, N'Huyện Bến Lức', 34, 542, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (606, N'Huyện Thủ Thừa', 34, 543, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (607, N'Huyện Châu Thành', 34, 544, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (608, N'Huyện Tân Trụ', 34, 545, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (609, N'Huyện Cần Đước', 34, 546, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (610, N'Huyện Cần Giuộc', 34, 547, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (611, N'Huyện Tân Hưng', 34, 548, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (612, N'TP Cao Lãnh', 18, 549, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (613, N'Thị xã Sa Đéc', 18, 550, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (614, N'Huyện Tân Hồng', 18, 551, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (615, N'Huyện Hồng Ngự', 18, 552, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (616, N'Huyện Tam Nông', 18, 553, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (617, N'Huyện Thanh Bình', 18, 554, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (618, N'Huyện Cao Lãnh', 18, 555, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (619, N'Huyện Lấp Vò', 18, 556, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (620, N'Huyện Tháp Mười', 18, 557, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (621, N'Huyện Lai Vung', 18, 558, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (622, N'Huyện Châu Thành', 18, 559, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (623, N'TP Long Xuyên', 1, 560, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (624, N'Thị xã Châu Đốc', 1, 561, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (625, N'Huyện An Phú', 1, 562, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (626, N'Huyện Tân Châu', 1, 563, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (627, N'Huyện Phú Tân', 1, 564, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (628, N'Huyện Tịnh Biên', 1, 565, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (629, N'Huyện Tri Tôn', 1, 566, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (630, N'Huyện Châu Phú', 1, 567, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (631, N'Huyện Chợ Mới', 1, 568, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (632, N'Huyện Châu Thành', 1, 569, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (633, N'Huyện Thoại Sơn', 1, 570, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (634, N'TP Vũng Tàu', 2, 571, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (635, N'Thị xã Bà Rịa', 2, 572, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (636, N'Huyện Xuyên Mộc', 2, 573, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (637, N'Huyện Long Điền', 2, 574, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (638, N'Huyện Côn Đảo', 2, 575, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (639, N'Huyện Tân Thành', 2, 576, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (640, N'Huyện Châu Đức', 2, 577, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (641, N'Huyện Đất Đỏ', 2, 578, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (642, N'TP Mỹ Tho', 52, 579, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (643, N'Thị xã Gò Công', 52, 580, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (644, N'Huyện Cái Bè', 52, 581, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (645, N'Huyện Cai Lậy', 52, 582, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (646, N'Huyện Châu Thành', 52, 583, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (647, N'Huyện Chợ Gạo', 52, 584, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (648, N'Huyện Gò Công Tây', 52, 585, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (649, N'Huyện Gò Công Đông', 52, 586, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (650, N'Huyện Tân Phước', 52, 587, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (651, N'Huyện Tân Phú Đông', 52, 588, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (652, N'TP Rạch Giá', 28, 589, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (653, N'Thị xã Hà Tiên', 28, 590, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (654, N'Huyện Kiên Lương', 28, 591, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (655, N'Huyện Hòn Đất', 28, 592, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (656, N'Huyện Tân Hiệp', 28, 593, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (657, N'Huyện Châu Thành', 28, 594, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (658, N'Huyện Giồng Riềng', 28, 595, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (659, N'Huyện Gò Quao', 28, 596, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (660, N'Huyện An Biên', 28, 597, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (661, N'Huyện An Minh', 28, 598, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (662, N'Huyện Vĩnh Thuận', 28, 599, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (663, N'Huyện Phú Quốc', 28, 600, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (664, N'Huyện Kiên Hải', 28, 601, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (665, N'Huyện U Minh Thượng', 28, 602, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (666, N'Quận Ninh Kiều', 59, 603, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (667, N'Quận Bình Thủy', 59, 604, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (668, N'Quận Cái Răng', 59, 605, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (669, N'Quận Ô Môn', 59, 606, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (670, N'Huyện Phong Điền', 59, 607, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (671, N'Huyện Cờ Đỏ', 59, 608, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (672, N'Huyện Vĩnh Thạnh', 59, 609, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (673, N'Huỵện Thốt Nốt', 59, 610, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (674, N'Thị xã Bến Tre', 7, 611, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (675, N'Huyện Châu Thành', 7, 612, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (676, N'Huyện Chợ Lách', 7, 613, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (677, N'Huyện Mỏ Cày', 7, 614, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (678, N'Huyện Giồng Trôm', 7, 615, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (679, N'Huyện Bình Đại', 7, 616, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (680, N'Huyện Ba Tri', 7, 617, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (681, N'Huyện Thạnh Phú', 7, 618, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (682, N'Thị xã Vĩnh Long', 55, 619, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (683, N'Huyện Long Hồ', 55, 620, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (684, N'Huyện Mang Thít', 55, 621, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (685, N'Huyện Bình Minh', 55, 622, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (686, N'Huyện Tam Bình', 55, 623, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (687, N'Huyện Trà Ôn', 55, 624, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (688, N'Huyện Vũng Liêm', 55, 625, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (689, N' huyện Bình Tân', 55, 626, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (690, N'Thị xã Trà Vinh', 53, 627, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (691, N'Huyện Càng Long', 53, 628, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (692, N'Huyện Cầu Kè', 53, 629, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (693, N'Huyện Tiểu Cần', 53, 630, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (694, N'Huyện Châu Thành', 53, 631, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (695, N'Huyện Trà Cú', 53, 632, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (696, N'Huyện Cầu Ngang', 53, 633, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (697, N'Huyện Duyên Hải', 53, 634, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (698, N'TP Sóc Trăng', 45, 635, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (699, N'Huyện Kế Sách', 45, 636, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (700, N'Huyện Mỹ Tú', 45, 637, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (701, N'Huyện Mỹ Xuyên', 45, 638, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (702, N'Huyện Thạnh Trị', 45, 639, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (703, N'Huyện Long Phú', 45, 640, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (704, N'Huyện Vĩnh Châu', 45, 641, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (705, N'Huyện Cù Lao Dung', 45, 642, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (706, N'Huyện Ngã Năm', 45, 643, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (707, N'Huyện Châu Thành', 45, 644, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (708, N'Thị xã Bạc Liêu', 5, 645, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (709, N'Huyện Vĩnh Lợi', 5, 646, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (710, N'Huyện Hồng Dân', 5, 647, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (711, N'Huyện Giá Rai', 5, 648, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (712, N'Huyện Phước Long', 5, 649, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (713, N'Huyện Đông Hải', 5, 650, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (714, N'Huyện Hoà Bình', 5, 651, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (715, N'TP Cà Mau', 12, 652, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (716, N'Huyện Thới Bình', 12, 653, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (717, N'Huyện U Minh', 12, 654, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (718, N'Huyện Trần Văn Thời', 12, 655, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (719, N'Huyện Cái Nước', 12, 656, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (720, N'Huyện Đầm Dơi', 12, 657, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (721, N'Huyện Ngọc Hiển', 12, 658, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (722, N'Huyện Năm Căn', 12, 659, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (723, N'Huyện Phú Tân', 12, 660, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (724, N'TP Điện Biên Phủ', 16, 661, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (725, N'Thị xã Mường Lay', 16, 662, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (726, N'Huyện Điện Biên', 16, 663, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (727, N'Huyện Tuần Giáo', 16, 664, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (728, N'Huyện Mường Chà', 16, 665, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (729, N'Huyện Tủa Chùa', 16, 666, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (730, N'Huyện Điện Biên Đông', 16, 667, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (731, N'Huyện Mường Nhé', 16, 668, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (732, N'Huyện Mường Ảng', 16, 669, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (733, N'Thị xã Gia Nghĩa', 15, 670, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (734, N'Huyện Đắk RLấp', 15, 671, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (735, N'Huyện Đắk Mil', 15, 672, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (736, N'Huyện Cư Jút', 15, 673, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (737, N'Huyện Đắk Song', 15, 674, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (738, N'Huyện Krông Nô', 15, 675, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (739, N'Huyện Đắk GLong', 15, 676, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (740, N'Huyện Tuy Đức', 15, 677, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (741, N'Thị xã Vị Thanh', 24, 678, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (742, N'Huyện Vị Thủy', 24, 679, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (743, N'Huyện Long Mỹ', 24, 680, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (744, N'Huyện Phụng Hiệp', 24, 681, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (745, N'Huyện Châu Thành', 24, 682, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (746, N'Huyện Châu Thành A', 24, 683, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (747, N'Thị xã Ngã Bảy', 24, 684, 2, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Categories] OFF
SET IDENTITY_INSERT [dbo].[share_Images] ON 

INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'item_1_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', N'/Content/Images/ProductImages/item_1_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'item_0_bea785a5af97581f4004230d1c05cb97f8c7b61b_slide2.jpg', N'/Content/Images/ProductImages/item_0_bea785a5af97581f4004230d1c05cb97f8c7b61b_slide2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'item_0_20310f766be96a80b0b5cbe6c22e0b99881d361d_slide3.jpg', N'/Content/Images/ProductImages/item_0_20310f766be96a80b0b5cbe6c22e0b99881d361d_slide3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'item_1_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', N'/Content/Images/ProductImages/item_1_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, N'item_0_KE-TIVI-GIA-RE-09.jpg', N'/Content/Images/ProductImages/item_0_KE-TIVI-GIA-RE-09.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, N'item_0_NTO1_192.jpg', N'/Content/Images/ProductImages/item_0_NTO1_192.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, N'item_1_2a-1415000287_660x0.jpg', N'/Content/Images/ProductImages/item_1_2a-1415000287_660x0.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, N'item_1_72.jpg', N'/Content/Images/ProductImages/item_1_72.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, N'item_0_DSC_9504.jpg', N'/Content/Images/ProductImages/item_0_DSC_9504.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, N'item_0_noi-that-nha-rong-6-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_noi-that-nha-rong-6-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, N'item_0_can-ho-38m2-11-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_can-ho-38m2-11-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, N'item_0_3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-1.jpg', N'/Content/Images/CMSNewsImages/item_0_3-xu-huong-thiet-ke-noi-that-noi-bat-cua-mua-thu-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, N'item_0_thiet-ke-nha-o-theo-phong-cach-thon-da-3-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_thiet-ke-nha-o-theo-phong-cach-thon-da-3-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, N'item_0_hanh-lang-5-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_hanh-lang-5-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, N'item_0_ban-gap-12-1-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_ban-gap-12-1-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, N'item_0_nha20m2-2-356x220.jpg', N'/Content/Images/CMSNewsImages/item_0_nha20m2-2-356x220.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, N'item_0_giuong-ngu-gan-cua-ra-vao-1.jpg', N'/Content/Images/CMSNewsImages/item_0_giuong-ngu-gan-cua-ra-vao-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, N'item_0_21-3.jpg', N'/Content/Images/CMSNewsImages/item_0_21-3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (138, N'item_0_XaviaLogo.png', N'/Content/Images/CMSNewsImages/item_0_XaviaLogo.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (139, N'item_0_de8f87bc1e4da3ee068cc6c6c076b2b7c8184e0a_banner4.jpg', N'/Content/Images/Banners/item_0_de8f87bc1e4da3ee068cc6c6c076b2b7c8184e0a_banner4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (156, N'ProductImage_0_xaviadecordanang15.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang15.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (166, N'ProductImage_0_DSC_9904.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9904.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (170, N'ProductImage_0_13435681_1759371291000117_441719261_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13435681_1759371291000117_441719261_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (171, N'ProductImage_0_13435994_1759371354333444_1263461117_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13435994_1759371354333444_1263461117_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (172, N'ProductImage_0_13444386_1759371357666777_1224751771_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13444386_1759371357666777_1224751771_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (173, N'ProductImage_0_13318493_1755331161404130_1419943251_n.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13318493_1755331161404130_1419943251_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (174, N'ProductImage_0_13334459_566987986795881_1324135279_o (2).jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13334459_566987986795881_1324135279_o (2).jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (175, N'ProductImage_0_13334849_566987930129220_861185595_o.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_13334849_566987930129220_861185595_o.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (176, N'ProductImage_0_xaviadecornoithatdanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (177, N'ProductImage_0_xaviadecornoithatdanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (178, N'ProductImage_0_xaviadecornoithatdanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (179, N'ProductImage_0_DSC_9741.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9741.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (180, N'ProductImage_0_DSC_9770.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9770.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (181, N'ProductImage_0_DSC_9771.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9771.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (185, N'ProductImage_1_xaviadecornoithatdanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (186, N'ProductImage_1_xaviadecornoithatdanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (187, N'ProductImage_1_xaviadecornoithatdanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (188, N'ProductImage_0_DSC_9776.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9776.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (190, N'ProductImage_2_xaviadecornoithatdanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecornoithatdanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (191, N'ProductImage_2_xaviadecornoithatdanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecornoithatdanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (194, N'ProductImage_1_DSC_9904.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_DSC_9904.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (204, N'ProductImage_0_72.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_72.jpg', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (210, N'ProductImage_2_xaviadecordanang3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (230, N'item_0_xaviadecornoithatdanang16.jpg', N'/Content/Images/Banners/item_0_xaviadecornoithatdanang16.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (231, N'item_0_xaviadecornoithatdanang27.jpg', N'/Content/Images/Banners/item_0_xaviadecornoithatdanang27.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (232, N'item_0_xaviadecornoithatdanang2-1.jpg', N'/Content/Images/Banners/item_0_xaviadecornoithatdanang2-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (233, N'item_0_xaviadecornoithatdanang10.jpg', N'/Content/Images/Banners/item_0_xaviadecornoithatdanang10.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (234, N'ProductImage_0_xaviadecordanang3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (235, N'ProductImage_1_xaviadecordanang4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (236, N'ProductImage_1_xaviadecordanang14.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang14.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (237, N'ProductImage_1_xaviadecordanang5.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (238, N'ProductImage_2_xaviadecordanang6.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang6.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (239, N'ProductImage_2_xaviadecordanang7.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang7.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (241, N'ProductImage_0_xaviadecordanang8-1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang8-1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (242, N'ProductImage_1_xaviadecordanang10.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang10.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (243, N'ProductImage_1_xaviadecordanang9.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang9.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (244, N'ProductImage_1_xaviadecordanang11.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang11.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (245, N'ProductImage_1_xaviadecordanang12.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang12.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (246, N'ProductImage_1_xaviadecordanang13.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang13.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (248, N'ProductImage_2_xaviadecordanang4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (249, N'ProductImage_0_xaviadecordanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (250, N'ProductImage_2_xaviadecordanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (251, N'ProductImage_1_xaviadecordanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (252, N'ProductImage_0_xaviadecordanang16.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang16.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (253, N'ProductImage_0_xaviadecordanang17.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang17.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (254, N'ProductImage_0_xaviadecordanang18.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang18.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (255, N'ProductImage_0_xaviadecordanang19.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang19.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (256, N'ProductImage_0_xaviadecordanang20.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang20.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (258, N'ProductImage_0_xaviadecordanang21.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang21.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (259, N'ProductImage_0_xaviadecordanang23.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang23.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (260, N'ProductImage_0_xaviadecordanang22.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang22.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (261, N'ProductImage_0_xaviadecornoithat1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (262, N'ProductImage_0_xaviadecornoithat2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (263, N'ProductImage_2_xaviadecordanang.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (264, N'ProductImage_3_xaviadecordanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_3_xaviadecordanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (267, N'ProductImage_2_xaviadecordanang5.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_2_xaviadecordanang5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (268, N'item_0_78.jpg', N'/Content/Images/Banners/item_0_78.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (269, N'item_0_xaviadecordanang4.jpg', N'/Content/Images/ProductImages/SmallImages/item_0_xaviadecordanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (272, N'item_1_xaviadecornoithatdanang4.jpg', N'/Content/Images/ProductImages/SmallImages/item_1_xaviadecornoithatdanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (278, N'ProductImage_0_xaviadecordananghoa.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordananghoa.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (281, N'ProductImage_0_xaviadecordanang5.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (282, N'ProductImage_0_xaviadecornoithatdanang3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (283, N'ProductImage_0_xaviadecornoithatdanang4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (284, N'ProductImage_1_xaviadecordanang1.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (285, N'ProductImage_1_xaviadecordanang2.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (286, N'ProductImage_1_xaviadecordanang3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (287, N'ProductImage_0_xaviadecordanang4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (289, N'item_1_xaviadecordanang6.jpg', N'/Content/Images/ProductImages/SmallImages/item_1_xaviadecordanang6.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (290, N'ProductImage_1_xaviadecordanang6.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang6.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (292, N'ProductImage_1_xaviadecordanang7.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang7.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (294, N'ProductImage_0_xaviadecordanang8.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang8.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (296, N'ProductImage_1_xaviadecordanang18.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecordanang18.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (298, N'item_1_xaviadecordanang29.jpg', N'/Content/Images/ProductImages/SmallImages/item_1_xaviadecordanang29.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (299, N'ProductImage_0_xaviadecordanang29.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang29.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (301, N'ProductImage_0_xaviadecordanang30.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang30.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (303, N'ProductImage_0_xaviadecordanang31.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang31.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (305, N'ProductImage_0_xaviadecordanang32.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang32.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (307, N'ProductImage_0_xaviadecordanang33.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang33.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (309, N'ProductImage_0_xaviadecordanang34.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang34.jpg', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (311, N'ProductImage_0_xaviadecordanang35.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang35.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (313, N'ProductImage_0_xaviadecordanang36.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang36.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (315, N'ProductImage_0_xaviadecordanang37.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang37.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (317, N'ProductImage_0_xaviadecordanang38.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang38.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (319, N'ProductImage_0_xaviadecordanang39.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang39.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (321, N'ProductImage_0_xaviadecordanang40.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang40.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (323, N'ProductImage_0_xaviadecordanang41.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang41.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (325, N'ProductImage_0_xaviadecordanang42.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang42.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (327, N'ProductImage_0_xaviadecordanang43.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang43.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (329, N'ProductImage_0_xaviadecordanang44.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang44.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (330, N'item_0_xaviadecordanang45.jpg', N'/Content/Images/ProductImages/SmallImages/item_0_xaviadecordanang45.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (332, N'ProductImage_0_xaviadecordanang46.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang46.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (334, N'ProductImage_0_xaviadecordanang47.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang47.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (336, N'ProductImage_0_xaviadecordanang48.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecordanang48.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (338, N'ProductImage_1_xaviadecornoithatdanang3.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (340, N'ProductImage_1_xaviadecornoithatdanang4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_1_xaviadecornoithatdanang4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (342, N'ProductImage_0_xaviadecornoithatdanang5.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (344, N'ProductImage_0_xaviadecornoithatdanang6.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang6.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (346, N'ProductImage_0_xaviadecornoithatdanang7.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang7.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (348, N'ProductImage_0_xaviadecornoithatdanang8.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang8.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (350, N'ProductImage_0_xaviadecornoithatdanang9.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang9.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (352, N'ProductImage_0_xaviadecornoithatdanang10.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang10.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (354, N'ProductImage_0_xaviadecornoithatdanang11.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang11.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (356, N'ProductImage_0_xaviadecornoithatdanang12.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang12.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (358, N'ProductImage_0_xaviadecornoithatdanang13.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang13.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (360, N'ProductImage_0_xaviadecornoithatdanang14.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang14.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (362, N'ProductImage_0_xaviadecornoithatdanang15.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang15.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (364, N'ProductImage_0_xaviadecornoithatdanang16.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithatdanang16.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (382, N'ProductImage_0_DSC_9459.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9459.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (384, N'ProductImage_0_DSC_9460.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9460.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (386, N'ProductImage_0_DSC_9461.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9461.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (387, N'item_0_DSC_9462.jpg', N'/Content/Images/ProductImages/SmallImages/item_0_DSC_9462.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (389, N'ProductImage_0_DSC_9503.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_DSC_9503.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (391, N'ProductImage_0_xaviadecornoithat4.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (393, N'ProductImage_0_xaviadecornoithat5.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat5.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (395, N'ProductImage_0_xaviadecornoithat10.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat10.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (396, N'ProductImage_0_xaviadecornoithat6.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat6.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (397, N'ProductImage_0_xaviadecornoithat7.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat7.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (398, N'ProductImage_0_xaviadecornoithat8.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat8.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (399, N'ProductImage_0_xaviadecornoithat9.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat9.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (400, N'ProductImage_0_xaviadecornoithat11.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat11.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (401, N'ProductImage_0_xaviadecornoithat12.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat12.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (402, N'ProductImage_0_xaviadecornoithat13.jpg', N'/Content/Images/ProductImages/SmallImages/ProductImage_0_xaviadecornoithat13.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (403, N'item_0_xaviadecornoithat14.jpg', N'/Content/Images/ProductImages/SmallImages/item_0_xaviadecornoithat14.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (404, N'item_0_faviorIcon.jpg', N'/Content/Images/CMSNewsImages/item_0_faviorIcon.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (405, N'item_0_thiet-ke-noi-that-phong-cach-co-dien.png', N'/Content/Images/UploadImages/ProjectImages/item_0_thiet-ke-noi-that-phong-cach-co-dien.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (407, N'item_0_item_0_de8f87bc1e4da3ee068cc6c6c076b2b7c8184e0a_banner4.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_item_0_de8f87bc1e4da3ee068cc6c6c076b2b7c8184e0a_banner4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (408, N'item_0_item_0_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_item_0_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (409, N'item_0_3dd8c7443cc774ec714eb69a49ffb01369b9be1c_banner2.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_3dd8c7443cc774ec714eb69a49ffb01369b9be1c_banner2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (410, N'item_0_1-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_1-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (411, N'item_0_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (412, N'item_0_4-1464573362_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_4-1464573362_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (413, N'item_1_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (414, N'item_2_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_2_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (415, N'item_0_12495123_1257789804250537_1911359817479181999_n.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_12495123_1257789804250537_1911359817479181999_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (416, N'item_0_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (417, N'item_0_anh6-1463628200722.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_anh6-1463628200722.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (418, N'item_3_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_3_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (419, N'item_4_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_4_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (420, N'item_5_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_5_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (421, N'item_6_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_6_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (422, N'item_7_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_7_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (423, N'item_1_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (424, N'item_0_3-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_3-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (425, N'item_8_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_8_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (426, N'item_0_8-1464573369_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_8-1464573369_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (427, N'item_2_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_2_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (428, N'item_0_2-1415000287_1200x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_2-1415000287_1200x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (429, N'item_0_9-1464573371_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_9-1464573371_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (430, N'item_3_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_3_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (431, N'item_9_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_9_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (434, N'item_1_2-1415000287_1200x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_2-1415000287_1200x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (435, N'item_0_12495128_1556300754667989_1369270554342065089_n.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_12495128_1556300754667989_1369270554342065089_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (436, N'item_0_NTO1_208.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_NTO1_208.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (437, N'item_4_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_4_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (438, N'item_5_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_5_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (439, N'item_1_9-1464573371_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_9-1464573371_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (440, N'item_0_7-1464573367_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_7-1464573367_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (441, N'item_1_7-1464573367_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_7-1464573367_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (442, N'item_2_7-1464573367_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_2_7-1464573367_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (443, N'item_0_NTO1_192.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_NTO1_192.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (444, N'item_0_1919615_1556300758001322_1429483925028301625_n.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_1919615_1556300758001322_1429483925028301625_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (445, N'item_1_8-1464573369_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_8-1464573369_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (446, N'item_0_3-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_3-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (447, N'item_0_anh7-1463628200755.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_anh7-1463628200755.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (448, N'item_0_12472786_1257789970917187_2098543852772925355_n.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_12472786_1257789970917187_2098543852772925355_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (449, N'item_10_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_10_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Images] OFF
SET IDENTITY_INSERT [dbo].[system_Banners] ON 

INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 231, N'TRANH2', 1, NULL, NULL, 4, 1, NULL, CAST(0x0000A645011DA9AE AS DateTime), NULL, CAST(0x0000A66801182413 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 232, N'TRANH3 ', 1, NULL, NULL, 3, 1, NULL, CAST(0x0000A645011F1BBE AS DateTime), NULL, CAST(0x0000A66801181F9B AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 233, N'TRANH4', 1, NULL, NULL, 2, 1, NULL, CAST(0x0000A6450125B094 AS DateTime), NULL, CAST(0x0000A66801181BC7 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 268, N'Banner  4', 1, NULL, NULL, 1, 1, NULL, CAST(0x0000A6450125CBFA AS DateTime), NULL, CAST(0x0000A668011816ED AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 230, N'TRANH', 4, NULL, NULL, NULL, 1, NULL, CAST(0x0000A64E016BDF0B AS DateTime), NULL, CAST(0x0000A66801179C5B AS DateTime))
SET IDENTITY_INSERT [dbo].[system_Banners] OFF
SET IDENTITY_INSERT [dbo].[system_Config] ON 

INSERT [dbo].[system_Config] ([Id], [Name], [Value], [Status]) VALUES (1, N'TotalVisitors', N'1728', 1)
SET IDENTITY_INSERT [dbo].[system_Config] OFF
SET IDENTITY_INSERT [dbo].[system_Menu] ON 

INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'QUẢN TRỊ', N'/admin', 1, NULL, 1, N'fa-dashboard', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'THÀNH VIÊN', N'/admin/nguoi-dung', 2, NULL, 1, N'fa-user', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'SẢN PHẨM', N'/admin/san-pham', 3, NULL, 1, N'fa-barcode', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'NHÀ CUNG CẤP', N'/admin/thuong-hieu', 4, NULL, 1, N'fa-certificate', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'DANH MỤC TIN TỨC', N'/admin/danh-muc-tin-tuc', 7, NULL, 1, N'fa-server', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'DANH MỤC SẢN PHẨM', N'/admin/danh-muc-san-pham', 6, NULL, 1, N'fa-list', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'TIN TỨC', N'/admin/tin-tuc', 8, NULL, 1, N'fa-file', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'BANNER', N'/admin/banner', 9, NULL, 1, N'fa-camera', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'DỰ ÁN', N'/admin/du-an', 10, NULL, 1, N'fa-server', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'EVENT', N'/admin/event', 11, NULL, 1, N'fa-file', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[system_Menu] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_cms_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[cms_Categories] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_cms_Categories]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_share_Images] FOREIGN KEY([CoverImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_share_Images]
GO
ALTER TABLE [dbo].[event_Event]  WITH CHECK ADD  CONSTRAINT [FK_event_Event_AspNetUsers] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[event_Event] CHECK CONSTRAINT [FK_event_Event_AspNetUsers]
GO
ALTER TABLE [dbo].[event_Event]  WITH CHECK ADD  CONSTRAINT [FK_event_Event_share_Images] FOREIGN KEY([CoverImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[event_Event] CHECK CONSTRAINT [FK_event_Event_share_Images]
GO
ALTER TABLE [dbo].[event_EventSchedule]  WITH CHECK ADD  CONSTRAINT [FK_event_EventSchedule_event_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[event_Event] ([Id])
GO
ALTER TABLE [dbo].[event_EventSchedule] CHECK CONSTRAINT [FK_event_EventSchedule_event_Event]
GO
ALTER TABLE [dbo].[event_Order]  WITH CHECK ADD  CONSTRAINT [FK_event_Order_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[event_Order] CHECK CONSTRAINT [FK_event_Order_AspNetUsers]
GO
ALTER TABLE [dbo].[event_Order]  WITH CHECK ADD  CONSTRAINT [FK_event_Order_event_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[event_Event] ([Id])
GO
ALTER TABLE [dbo].[event_Order] CHECK CONSTRAINT [FK_event_Order_event_Event]
GO
ALTER TABLE [dbo].[event_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_event_Ticket_event_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[event_Event] ([Id])
GO
ALTER TABLE [dbo].[event_Ticket] CHECK CONSTRAINT [FK_event_Ticket_event_Event]
GO
ALTER TABLE [dbo].[event_TicketOrder]  WITH CHECK ADD  CONSTRAINT [FK_event_TicketOrder_event_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[event_Order] ([Id])
GO
ALTER TABLE [dbo].[event_TicketOrder] CHECK CONSTRAINT [FK_event_TicketOrder_event_Order]
GO
ALTER TABLE [dbo].[event_TicketOrder]  WITH CHECK ADD  CONSTRAINT [FK_event_TicketOrder_event_Ticket] FOREIGN KEY([TicketId])
REFERENCES [dbo].[event_Ticket] ([Id])
GO
ALTER TABLE [dbo].[event_TicketOrder] CHECK CONSTRAINT [FK_event_TicketOrder_event_Ticket]
GO
ALTER TABLE [dbo].[portal_News_Projects]  WITH CHECK ADD  CONSTRAINT [FK_portal_News_Projects_cms_News] FOREIGN KEY([NewId])
REFERENCES [dbo].[cms_News] ([Id])
GO
ALTER TABLE [dbo].[portal_News_Projects] CHECK CONSTRAINT [FK_portal_News_Projects_cms_News]
GO
ALTER TABLE [dbo].[portal_News_Projects]  WITH CHECK ADD  CONSTRAINT [FK_portal_News_Projects_portal_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[portal_Projects] ([Id])
GO
ALTER TABLE [dbo].[portal_News_Projects] CHECK CONSTRAINT [FK_portal_News_Projects_portal_Projects]
GO
ALTER TABLE [dbo].[portal_Projects]  WITH CHECK ADD  CONSTRAINT [FK_portal_Projects_share_Images] FOREIGN KEY([CoverImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[portal_Projects] CHECK CONSTRAINT [FK_portal_Projects_share_Images]
GO
ALTER TABLE [dbo].[portal_Projects_Images]  WITH CHECK ADD  CONSTRAINT [FK_portal_Projects_Images_portal_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[portal_Projects] ([Id])
GO
ALTER TABLE [dbo].[portal_Projects_Images] CHECK CONSTRAINT [FK_portal_Projects_Images_portal_Projects]
GO
ALTER TABLE [dbo].[portal_Projects_Images]  WITH CHECK ADD  CONSTRAINT [FK_portal_Projects_Images_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[portal_Projects_Images] CHECK CONSTRAINT [FK_portal_Projects_Images_share_Images]
GO
ALTER TABLE [dbo].[system_Banners]  WITH CHECK ADD  CONSTRAINT [FK_system_Banners_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[system_Banners] CHECK CONSTRAINT [FK_system_Banners_share_Images]
GO
ALTER TABLE [dbo].[system_Organisers]  WITH CHECK ADD  CONSTRAINT [FK_system_Organisers_share_Images] FOREIGN KEY([AvatarId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[system_Organisers] CHECK CONSTRAINT [FK_system_Organisers_share_Images]
GO
USE [master]
GO
ALTER DATABASE [PortalDB.Event] SET  READ_WRITE 
GO
