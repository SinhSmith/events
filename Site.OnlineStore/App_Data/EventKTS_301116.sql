USE [master]
GO
/****** Object:  Database [PortalDB.Event]    Script Date: 11/30/2016 7:46:50 AM ******/
CREATE DATABASE [PortalDB.Event]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PortalDB.Event', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PortalDB.Event.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PortalDB.Event_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PortalDB.Event_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[cms_Categories]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[cms_News]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[event_Event]    Script Date: 11/30/2016 7:46:50 AM ******/
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
	[OrganizationDescription] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[event_EventBookMark]    Script Date: 11/30/2016 7:46:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_EventBookMark](
	[EventId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_event_EventBookMark] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_EventSchedule]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[event_Order]    Script Date: 11/30/2016 7:46:50 AM ******/
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
	[PhoneNumber] [nvarchar](50) NULL,
	[Billing_Address] [nvarchar](250) NULL,
	[Billing_Address2] [nvarchar](250) NULL,
	[Billing_City] [nvarchar](250) NULL,
	[Billing_Country] [nvarchar](250) NULL,
	[Shipping_Address] [nvarchar](250) NULL,
	[Shipping_Address2] [nvarchar](250) NULL,
	[Shipping_City] [nvarchar](250) NULL,
	[Shipping_Country] [nvarchar](250) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[event_Ticket]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[event_TicketOrder]    Script Date: 11/30/2016 7:46:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event_TicketOrder](
	[TicketId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[TicketCode] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_event_TicketOrder] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC,
	[OrderId] ASC,
	[TicketCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[portal_News_Projects]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[portal_Projects]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[portal_Projects_Images]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[share_Categories]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[share_Images]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[system_Banners]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[system_Config]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[system_Menu]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[system_Organisers]    Script Date: 11/30/2016 7:46:50 AM ******/
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
/****** Object:  Table [dbo].[system_Profiles]    Script Date: 11/30/2016 7:46:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[system_Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NOT NULL,
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dd9f9430-b789-4037-8770-bd67e0945ed7', N'crusorobinson@gmail.com', 0, N'AH9PTqrEenhBfhehBvuOvmDP6v/8ftAID2jvlpoi5Lnb0rnOSVHxoye0mZrH/ejGTA==', N'269254f0-2a88-4419-af49-cdaefea99881', NULL, 0, 0, NULL, 1, 0, N'crusorobinson@gmail.com')
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
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (13, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'kaka2', CAST(0x0000A6CB0128BC74 AS DateTime), CAST(0x0000A6CE015E076C AS DateTime), N'<p>kaka2</p>
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
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (15, N'00000000-0000-0000-0000-000000000000', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Technical soup', CAST(0x0000A6C30179F88C AS DateTime), CAST(0x0000A6C90179F9B8 AS DateTime), N'<p>&nbsp;</p>

<p><strong><em><img alt="" src="https://cdn.evbuc.com/eventlogos/6673079/takemarta02.png" style="height:54px; width:261px" /></em></strong></p>

<p><img alt="" src="https://cdn.evbuc.com/eventlogos/6673079/atlhiphopdaybillboard.jpg" style="height:149px; width:715px" /></p>
', N'KTS', N'<p>KTS</p>
', 449, N'trungkien3289@gmail.com', 5, 110, 0, N'Hoang Dieu', N'235 Hoang Dieu', NULL, N'Hải Châu', N'Đà Nẵng', N'kaka', N'VN', 1, NULL, 1)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (16, N'2a9792d5-7d38-4558-946a-62463681731b', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'freinds mettings', CAST(0x0000A6C100E5E5E8 AS DateTime), CAST(0x0000A6CA00E5E714 AS DateTime), N'<p><strong><img alt="" src="https://cdn.evbuc.com/eventlogos/177070356/facebookbanner.jpg" style="height:205px; width:590px" /></strong></p>

<p><strong>*CHƯƠNG TR&Igrave;NH D&Agrave;NH TẶNG HỌC VI&Ecirc;N NH&Acirc;N TH&Aacute;NG CHĂM S&Oacute;C KH&Aacute;CH H&Agrave;NG*</strong></p>

<p>&nbsp;</p>

<p><strong>Facebook - C&ocirc;ng cụ tiếp cận kh&aacute;ch h&agrave;ng số 1 hiện nay</strong></p>

<p>&nbsp;</p>

<p><strong><strong>AI SẼ HUẤN LUYỆN</strong></strong></p>

<p>&nbsp;</p>

<p><img alt="" src="https://lh3.googleusercontent.com/C9NyWXbHHIEvEHVqoY_7cRWuSRsEiKbip-RIz77kRELbYmRUFB_7oEM-5Kt4dtJGxfZEnWvF05_XhdtFl8pDShk=s0" style="height:210px" /><strong>Đ&agrave;o Ho&agrave;ng Cường</strong>&nbsp;hiện tại l&agrave; một chuy&ecirc;n gia, diễn giả đặc biệt về Facebook Marketing. Anh đ&atilde; kh&aacute;i qu&aacute;t h&oacute;a những kiến thức kĩ thuật hết sức phức tạp vốn kh&oacute; hiểu trở n&ecirc;n dễ hiểu cho hơn 4000 học vi&ecirc;n trong 3 năm qua.</p>

<p>Hơn 300 học vi&ecirc;n được anh đ&agrave;o tạo chuy&ecirc;n s&acirc;u v&agrave; cầm tay chỉ việc đ&atilde; tạo ra những kết quả đang kinh ngạc. C&oacute; những doanh nghiệp tăng hơn 400% doanh số chỉ sau 3 th&aacute;ng. Nhiều c&aacute; nh&acirc;n l&agrave;m c&ocirc;ng ăn lương đ&atilde; bỏ hẳn c&ocirc;ng việc để kinh doanh tr&ecirc;n facebook, tạo ra nguồn thu nhập ổn định 60 triệu/ th&aacute;ng.</p>

<p>Những kh&aacute;ch h&agrave;ng anh đ&atilde; từng đ&agrave;o tạo, triển khai chiến dịch v&agrave; tư vấn chuy&ecirc;n s&acirc;u: Ng&acirc;n h&agrave;ng BIDV, Ng&acirc;n h&agrave;ng Sacombank, Thương hiệu Mỹ phẩm Menard Nhật bản, Mỹ phẩm Ohui, Thực phẩm chức năng Tảo Mặt Trời, Men vi sinh Bifina, Dầu Đ&ocirc;ng Y Thu Hương, H&atilde;ng xe Mazda Việt Nam, Bất động sản Trường Ph&uacute;c, Cengroup,&hellip; cũng như nhiều c&aacute; nh&acirc;n kh&aacute;c.</p>

<p>Hiện tại anh đang l&agrave; Social Media Manager của ONNET JSC, cũng như đảm nhận nhiều vai tr&ograve; tư vấn chiến lược cho c&aacute;c c&ocirc;ng ty đa ng&agrave;nh. V&agrave; đặc biệt l&agrave; vai tr&ograve; dẫn dắt học vi&ecirc;n kinh doanh sau c&aacute;c kh&oacute;a học.</p>

<p>&nbsp;</p>

<p><strong>Bạn sẽ học được g&igrave;?</strong></p>

<p>✔&nbsp;4 c&aacute;ch&nbsp;<strong>tối ưu h&oacute;a quảng c&aacute;o triệt để</strong>, tạo doanh số hơn 400 triệu chỉ với 10 triệu tiền vốn</p>

<p>✔&nbsp;5 b&iacute; quyết khi&nbsp;<strong>chọn sản phẩm để b&aacute;n tr&ecirc;n Facebook</strong>&nbsp;cho người mới bắt đầu (Lưu &yacute; l&agrave;: Kh&ocirc;ng phải sản phẩm n&agrave;o cũng b&aacute;n th&agrave;nh c&ocirc;ng). Chọn đ&uacute;ng sản phẩm l&agrave; bạn đ&atilde; thắng 50%</p>

<p>✔&nbsp;M&ocirc; h&igrave;nh&nbsp;<strong>6 bước kinh doanh tr&ecirc;n facebook</strong>&nbsp;cho người mới bắt đầu.</p>

<p>✔&nbsp;2 c&aacute;ch sử dụng&nbsp;<strong>video để quảng b&aacute; cho sản phẩm</strong>&nbsp;của bạn.</p>

<p>✔&nbsp;4 c&aacute;i&nbsp;<strong>bẫy của doanh nghiệp</strong>&nbsp;khi d&ugrave;ng facebook để kinh doanh</p>

<p>✔&nbsp;B&iacute; quyết sử dụng&nbsp;<strong>h&igrave;nh ảnh quảng c&aacute;o ấn tượng</strong>&nbsp;v&agrave; chuy&ecirc;n nghiệp.</p>

<p>✔&nbsp;Chia sẻ b&iacute; quyết ri&ecirc;ng về&nbsp;<strong>chu tr&igrave;nh tối ưu quảng c&aacute;o&nbsp;</strong>lần đầu ti&ecirc;n tiết lộ</p>

<p>✔&nbsp;2 case study thực tế lần đầu được bật m&iacute; chia sẻ. Giải th&iacute;ch tại sao sản phẩm tốt m&agrave; kh&ocirc;ng b&aacute;n được!</p>

<p>✔&nbsp;Giải th&iacute;ch tại sao bạn b&aacute;n h&agrave;ng m&atilde;i tr&ecirc;n facebook m&agrave; kh&ocirc;ng th&agrave;nh c&ocirc;ng!</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>Tại sao bạn n&ecirc;n tham gia?</strong></p>

<p>&ldquo;Đ&Acirc;Y KH&Ocirc;NG CHỈ L&Agrave; MỘT BUỔI CHIA SẺ 3H, m&agrave; n&oacute; đ&uacute;c kết kinh nghiệm kinh doanh tr&ecirc;n Facebook trong 4 năm qua của t&ocirc;i. T&ocirc;i tự tin rằng n&oacute; sẽ ảnh hưởng S&Acirc;U SẮC tới Thương hiệu, c&ocirc;ng việc kinh doanh, thu nhập v&agrave; sự hạnh ph&uacute;c của bạn tr&ecirc;n Facebook.&rdquo;</p>

<p>&nbsp;</p>

<p><a href="https://docs.google.com/forms/d/e/1FAIpQLSfQv2unr7VakXLeoA8qH-qDVxmuhhtsieycQV81LuL_kYWG8Q/viewform"><img alt="" src="http://deveerich.com/nmd/images/dang-ky-ngay.png" style="width:200px" /></a></p>

<p><strong>Lắng nghe Cảm nhận của kh&aacute;ch h&agrave;ng về Đ&agrave;o Ho&agrave;ng Cường:</strong></p>

<p>&nbsp;</p>

<p><img alt="" src="https://lh3.googleusercontent.com/m0bFmRRQ0BJrkpzBrmd0x6mukRjSnA_NGqeTK4XblmkrR2T3ywDRyMR1kQHZXqiQ80ZMST6jxh6w19af0uixkw=s0" /></p>

<p><strong>Chị Ho&agrave;ng Lan - Giảng vi&ecirc;n kế to&aacute;n - Đại học B&aacute;ch Khoa H&agrave; Nội</strong></p>

<p>T&ocirc;i thật bất ngờ về kết quả sau kh&oacute;a học của thấy Cường. Th&aacute;ng đầu ti&ecirc;n sau khi học v&agrave; được giới thiệu nguồn h&agrave;ng, t&ocirc;i đ&atilde; kiếm được hơn 30 triệu. V&agrave; sau 3 th&aacute;ng, tới th&aacute;ng 12/2015, lợi nhuận ri&ecirc;ng từ Facebook của t&ocirc;i l&agrave; 135 triệu/ th&aacute;ng.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://lh3.googleusercontent.com/yOZHwsLir-yh3m2FvEVahMHWkhUF6E7hwBnVBxp5Ny1d1h5tWi--oJj8-W6w4HjQg3quCzGs0qaCSLiudAjPbg=s0" style="height:121px" /></p>

<p><strong>Chị Thu Hương, Chủ tịch đ&ocirc;ng Y Thu Hương, H&agrave; Nội</strong></p>

<p>Từ khi tham dự hội thảo Facebook Marketing v&agrave; đăng k&iacute; kh&oacute;a học chuy&ecirc;n s&acirc;u, Doanh nghiệp t&ocirc;i đ&atilde; ph&aacute;t triển vượt bậc hơn 600% sau 5 th&aacute;ng học tập. Doanh thu trung b&igrave;nh Online h&agrave;ng th&aacute;ng đ&atilde; c&aacute;n mốc 800 triệu/ th&aacute;ng.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://lh3.googleusercontent.com/U1JJNezRrZjOWKi2nN5424vvinbzFH1FgBlRso1OB96kYQIizsJRpFawRAp4fYtgUw8jiaO7CnYh9F5QZM_wyw=s0" style="height:127px" /></p>

<p><strong>Em Huyền - Gi&aacute;o vi&ecirc;n cấp 1, H&agrave; Đ&ocirc;ng, H&agrave; Nội</strong></p>

<p>Thầy Cường đ&atilde; dạy em đ&atilde; kiếm được rất nhiều thứ, th&aacute;ng đầu ti&ecirc;n lợi nhuận của em cũng được khoảng 40 triệu (Th&aacute;ng 10/2015) so với mức lương gi&aacute;o vi&ecirc;n 5 triệu h&agrave;ng th&aacute;ng. V&agrave; đang tăng dần c&aacute;c th&aacute;ng. Em đang d&agrave;nh 90% cho Facebook. Cảm ơn thầy.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>Bạn đ&atilde; sẵn s&agrave;ng tham dự?</strong></p>

<p><strong>Thời gian:&nbsp;</strong>18h00 - 21h00, thứ 4, ng&agrave;y 16/11/2016</p>

<p><strong>Địa điểm:</strong>&nbsp;P.203 T&ograve;a nh&agrave; Itaxa 126 Nguyễn Thị Minh Khai, P.6, Q.3</p>

<p>&nbsp;</p>

<p><strong>GI&Aacute; TH&Ocirc;NG THƯỜNG:&nbsp;950.000 ĐỒNG</strong></p>

<p><strong>DEVEERICH TẶNG</strong><strong>&nbsp;V&Eacute; MIỄN PH&Iacute;&nbsp;</strong><strong>NH&Acirc;N TH&Aacute;NG TRI &Acirc;N KH&Aacute;CH H&Agrave;NG</strong></p>

<p><a href="https://docs.google.com/forms/d/e/1FAIpQLSfQv2unr7VakXLeoA8qH-qDVxmuhhtsieycQV81LuL_kYWG8Q/viewform"><img alt="" src="http://deveerich.com/nmd/images/dang-ky-ngay.png" style="width:200px" /></a></p>

<p><strong>HOTLINE: 0909 571 799</strong></p>
', N'KTS', N'<p>KTS</p>
', 454, N'trungkien3289@gmail.com', 15, 105, 0, N'cach mang thang 8', NULL, NULL, NULL, N'Hồ Chí Minh', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (17, N'09ba23a8-c6f2-4973-a35b-393f8c0ac258', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Study Abroad At Home, Open The Door To The World', CAST(0x0000A6C40128C82C AS DateTime), CAST(0x0000A6C4017B3170 AS DateTime), N'<p>Ng&agrave;y hội th&ocirc;ng tin về Edcata đầu ti&ecirc;n đ&atilde; được diễn ra th&agrave;nh c&ocirc;ng v&agrave;o th&aacute;ng 7 vừa qua. Tiếp nối sự th&agrave;nh c&ocirc;ng n&agrave;y, nh&acirc;n sự kiện &ocirc;ng Shai Reshef, người s&aacute;ng lập University of the People - trường học online d&agrave;nh cho mọi người tr&ecirc;n khắp thế giới - đến Việt Nam, ng&agrave;y hội th&ocirc;ng tin lần thứ 2 sẽ diễn ra v&agrave;o ng&agrave;y 20/11/2016.</p>

<p>Đến với ng&agrave;y hội, kh&aacute;ch tham dự kh&ocirc;ng chỉ c&oacute; cơ hội tiếp x&uacute;c v&agrave; đặt c&acirc;u hỏi trực tiếp với &ocirc;ng Shai Reshef, c&aacute;c đại diện của trường UoPeople m&agrave; c&ograve;n được lắng nghe những chia sẻ của c&aacute;c cựu sinh vi&ecirc;n UoPeople v&agrave; cựu du học sinh Mỹ.</p>

<p>Timeline chương tr&igrave;nh sẽ gồm hai phần ch&iacute;nh:</p>

<p>✎ Phần 1: B&agrave;i chia sẻ truyền cảm hứng của anh Trương Phạm Ho&agrave;i Chung - cựu sinh vi&ecirc;n Harvard - về gi&aacute;o dục trực tuyến v&agrave; gi&aacute;o dục truyền thống, g&oacute;c nh&igrave;n của anh về sự ph&aacute;t triển của m&ocirc; h&igrave;nh n&agrave;y trong tương lai v&agrave; những yếu tố quan trọng trong qu&aacute; tr&igrave;nh chuẩn bị du học.</p>

<p><img src="https://cdn.evbuc.com/eventlogos/191824727/11bbb81480a529077b7bf1532025795686a2db7d2400x1800.jpg" /></p>

<p>✎ Phần 2: Chia sẻ của &ocirc;ng Shai Reshef về trường đại học trực tuyến do ch&iacute;nh &ocirc;ng s&aacute;ng lập ra - University of the People c&ugrave;ng quan điểm tất cả mọi người đều xứng đ&aacute;ng được tiếp cận với nền gi&aacute;o dục hiện đại nhất.</p>

<p>H&atilde;y cũng xem chia sẻ của &ocirc;ng Shai tại TedTalks nh&eacute;:&nbsp;<a href="https://www.youtube.com/watch?v=6kH-uYwt0qs" target="_blank">https://www.youtube.com/watch?v=6kH-uYwt0qs</a></p>

<p>--------------------------------------------------</p>

<p>INFO SESSION DAY 2 - &quot;STUDY ABROAD AT HOME, OPEN THE DOOR TO THE WORLD&quot;</p>

<p>Thời gian: 18h - 21h Chủ nhật (20/11/2016)</p>

<p>Địa điểm:&nbsp;Dale Carnegie -&nbsp;94,96 Nguyễn Du, phường Bến Ngh&eacute;, quận 1</p>

<p>Mọi thắc mắc xin vui l&ograve;ng li&ecirc;n hệ:</p>

<p>➤&nbsp;<a href="http://www.facebook.com/educatavn" target="_blank">www.facebook.com/educatavn</a></p>

<p>➤&nbsp;<a href="http://l.facebook.com/l.php?u=http%3A%2F%2Fwww.edcata.vn%2F&amp;h=MAQFOI_no&amp;enc=AZNQFTVLSj4EnnNwtk-O282AVDSP-pCIsiQ46-BYFmt-B-B1sb0Q6LZRUKP3738NBjs&amp;s=1" target="_blank">www.edcata.vn</a></p>

<p>➤ edcatavietnam@gmail.com</p>
', N'Edcata Vietnam', N'<h3>EDCATA was founded by students/alumni from MIT, Harvard, and NUS (Singapore). Our mission is to enable young Vietnamese to gain access to international English tertiary education by various means, such as free English training, supplementary coursework-related activities, and career referrals. Admitted students to EDCATA will receive one-to-one mentoring from Vietnamese alumni who are working abroad.</h3>
', 459, N'trungkien3289@gmail.com', 10, 115, 0, N'94  Nguyễn Du', N'94  Nguyễn Du', N'96  Nguyễn Du', N'Quận 1', N'Hồ Chí Minh', N'123', N'VN', 1, NULL, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (18, N'd2a3cf30-fec8-40ce-af18-b8c8c678b3b1', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'QUẢN TRỊ CUỘC ĐỜI- CHUYÊN GIA LÊ THẨM DƯƠNG', CAST(0x0000A6C60128B56C AS DateTime), CAST(0x0000A6C7015A33BC AS DateTime), N'<p>Mỗi con người is one of the kỳ quan tạo h&oacute;a, lu&ocirc;n tiềm ẩn nguồn năng lực and sức mạnh ri&ecirc;ng.&nbsp;Tuy nhi&ecirc;n, phần đ&ocirc;ng con người lu&ocirc;n nh&igrave;n ra b&ecirc;n ngo&agrave;i for those conflict and cạnh tranh nhau h&agrave;ng ng&agrave;y and ch&iacute;nh điều then đang tước dần sức mạnh b&ecirc;n trong them.&nbsp;&Iacute;t ai biết that Augmented cường sức mạnh nội tại of ch&iacute;nh m&igrave;nh l&agrave; yếu tố quyết định th&agrave;nh c&ocirc;ng cho cuộc đời.</p>

<p>Từ bao đời nay, khỉ n&oacute;i to quản trị, người ta thường n&oacute;i to quản trị quốc gia hay quản trị doanh nghiệp, &iacute;t chứ ai to n&oacute;i &quot;&nbsp;<strong>quản trị cuộc đời</strong>&nbsp;&quot;.&nbsp;Quản trị cuộc đời is c&aacute;ch thức us l&atilde;nh đạo,&nbsp;<em>quản l&yacute; ch&iacute;nh m&igrave;nh</em>&nbsp;like thế n&agrave;o to have been cuộc đời such as expected.Which is which điều đặc biệt required for cuộc đời but lại chưa or much less is dạy out trường lớp.&nbsp;Peter Drucker, người been coi l&agrave; &quot;cha đẻ&quot; của quản trị kinh doanh hiện đại, no n&oacute;i: &quot;Một đất nước you want ph&aacute;t triển, đất nước which needs to be quản trị tốt;&nbsp;one doanh nghiệp wants to lớn mạnh, doanh nghiệp then needs to be quản trị tốt;&nbsp;one gia đ&igrave;nh you want hạnh ph&uacute;c, gia đ&igrave;nh it be quản trị tốt;&nbsp;and also vậy, one cuộc đời wants to th&agrave;nh c&ocirc;ng, th&agrave;nh đạt, cuộc đời which must be quản trị tốt &quot;.</p>

<p>As expected chia sẻ those kiến thức, kinh nghiệm gi&uacute;p all doanh nh&acirc;n relocs ch&iacute;nh m&igrave;nh and cuộc đời m&igrave;nh, biết tr&acirc;n trọng and y&ecirc;u qu&yacute; than those gi&aacute; trị ri&ecirc;ng of bản th&acirc;n to tự tin quản trị cuộc đời, quản trị doanh nghiệp, Trường&nbsp;<a href="http://pti.edu.vn/vi/to-chuc-giao-duc-pti-truong-doanh-nhan-pti/" target="_blank">đ&agrave;o tạo doanh nh&acirc;n</a>&nbsp;PTI tổ chức chương tr&igrave;nh đ&agrave;o tạo&nbsp;<strong>&quot;Quản trị cuộc đời&quot;.</strong></p>

<p>&nbsp;</p>

<h3>MỤC TI&Ecirc;U CHƯƠNG TR&Igrave;NH</h3>

<p>- Nắm vững kh&aacute;i niệm cơ bản về cuộc đời, con người v&agrave; th&agrave;nh c&ocirc;ng, hạnh ph&uacute;c ...</p>

<p>- Kiểm so&aacute;t m&ocirc; h&igrave;nh &quot;quản trị cuộc đời&quot;, &quot;l&atilde;nh đạo bản th&acirc;n&quot; để &quot;l&agrave;m mới bản th&acirc;n&quot;.</p>

<p>- Trang bị &amp; bổ sung one hệ thống l&yacute; luận nền tảng về cuộc đời and con người nham help for each of người become one &quot;triết gia&quot; cho ch&iacute;nh cuộc đời of m&igrave;nh.</p>

<p><strong>NỘI DUNG CHƯƠNG TR&Igrave;NH</strong></p>

<p>&nbsp;</p>

<p>TT</p>

<p>học phần</p>

<p>ph&acirc;n Nội chi tiết</p>

<p>1</p>

<p>Một số kh&aacute;i niệm nền tảng</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; &quot;con người&quot;?&nbsp;Thế n&agrave;o l&agrave; &quot;khai s&aacute;ng&quot;?</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; &quot;tự do&quot;?&nbsp;Thế n&agrave;o l&agrave; &quot;văn h&oacute;a&quot;?</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; &quot;th&agrave;nh c&ocirc;ng, thế n&agrave;o l&agrave;&quot; hạnh ph&uacute;c &quot;?</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; Cuộc đời &quot;đ&aacute;ng sống&quot;?</p>

<p>2</p>

<p>M&ocirc; h&igrave;nh Quản Trị Cuộc Đời</p>

<p>-&nbsp;Thấu hiểu bản th&acirc;n</p>

<p>-&nbsp;Chiến lược cuộc đời</p>

<p>-&nbsp;Ho&agrave;i b&atilde;o and might sống</p>

<p>-&nbsp;Năng lực cốt l&otilde;i</p>

<p>-&nbsp;Gi&aacute; trị nền tảng</p>

<p>3</p>

<p>h&agrave;nh động</p>

<p>-&nbsp;&Yacute; ch&iacute;</p>

<p>-&nbsp;Th&aacute;i độ lao động</p>

<p>-&nbsp;Phương ph&aacute;p luận</p>

<p>-&nbsp;C&aacute;c ch&uacute; &yacute; trong h&agrave;nh động</p>

<p>4</p>

<p>Một số kỹ năng sống</p>

<p>-&nbsp;Kỹ năng giải quyết vấn đề;&nbsp;Tư duy t&iacute;ch cực v&agrave; nguy&ecirc;n tắc 1/99;Kỹ năng beyond nghịch cảnh</p>

<p>-&nbsp;Tư duy v&agrave; kỹ năng phản biện</p>

<p>-&nbsp;Kỹ năng s&aacute;ng tạo;&nbsp;Kỹ năng quản trị thời gian</p>

<p>&nbsp;</p>

<p>BAN GIẢNG HUẤN</p>

<p>Chuy&ecirc;n gia&nbsp;L&ecirc; Thẩm Dương</p>

<p>Giảng vi&ecirc;n cao cấp</p>

<p>Chuy&ecirc;n gia t&acirc;m l&yacute; ứng dụng - chuy&ecirc;n gia ph&acirc;n t&iacute;ch kinh tế nổi tiếng tại Việt Nam</p>

<p>Trưởng khoa Quản trị kinh doanh trường ĐH Ng&acirc;n h&agrave;ng TP HCM</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>TH&Ocirc;NG TIN KH&Oacute;A HỌC</p>

<p>THỜI GIAN&nbsp;- Khai giảng:&nbsp;22-11-2016&nbsp;- Lịch học:&nbsp;Thứ 3 &amp; Thứ 4&nbsp;- Thời gian:&nbsp;18h00 - 21h00&nbsp;- Thời lượng:&nbsp;2 buổi&nbsp;- Kết th&uacute;c:&nbsp;23-11-2016&nbsp;ĐỊA ĐIỂM:&nbsp;điểm: T&ograve;a nh&agrave; PTI số 218 Nam Kỳ Khởi Nghĩa - Phường 6 - Quận 3 - TP HCM&nbsp;HỌC PH&Iacute;:&nbsp;<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
2.000.000 / Kh&oacute;a&nbsp;(Bao gồm cả Tea Break, chi ph&iacute; t&agrave;i liệu, in ấn, giảng vi&ecirc;n, chứng nhận)&nbsp;</p>

<p><br />
ĐỂ NHẬN PH&Iacute; UU Đại TỐT NHẤT, XIN VUI L&Ograve;NG LI&Ecirc;N HỆ THEO SỐ 0969 479 862 _ MS HO&Agrave;NG TH&Uacute;Y</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>TT</p>

<p>học phần</p>

<p>ph&acirc;n Nội chi tiết</p>

<p>1</p>

<p>Một số kh&aacute;i niệm nền tảng</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; &quot;con người&quot;?&nbsp;Thế n&agrave;o l&agrave; &quot;khai s&aacute;ng&quot;?</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; &quot;tự do&quot;?&nbsp;Thế n&agrave;o l&agrave; &quot;văn h&oacute;a&quot;?</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; &quot;th&agrave;nh c&ocirc;ng, thế n&agrave;o l&agrave;&quot; hạnh ph&uacute;c &quot;?</p>

<p>-&nbsp;Thế n&agrave;o l&agrave; Cuộc đời &quot;đ&aacute;ng sống&quot;?</p>

<p>2</p>

<p>M&ocirc; h&igrave;nh Quản Trị Cuộc Đời</p>

<p>-&nbsp;Thấu hiểu bản th&acirc;n</p>

<p>-&nbsp;Chiến lược cuộc đời</p>

<p>-&nbsp;Ho&agrave;i b&atilde;o and might sống</p>

<p>-&nbsp;Năng lực cốt l&otilde;i</p>

<p>-&nbsp;Gi&aacute; trị nền tảng</p>

<p>3</p>

<p>h&agrave;nh động</p>

<p>-&nbsp;&Yacute; ch&iacute;</p>

<p>-&nbsp;Th&aacute;i độ lao động</p>

<p>-&nbsp;Phương ph&aacute;p luận</p>

<p>-&nbsp;C&aacute;c ch&uacute; &yacute; trong h&agrave;nh động</p>

<p>4</p>

<p>Một số kỹ năng sống</p>

<p>-&nbsp;Kỹ năng giải quyết vấn đề;&nbsp;Tư duy t&iacute;ch cực v&agrave; nguy&ecirc;n tắc 1/99;Kỹ năng beyond nghịch cảnh</p>

<p>-&nbsp;Tư duy v&agrave; kỹ năng phản biện</p>

<p>-&nbsp;Kỹ năng s&aacute;ng tạo;&nbsp;Kỹ năng quản trị thời gian</p>

<p>&nbsp;</p>

<p>BAN GIẢNG HUẤN</p>

<p>Chuy&ecirc;n gia&nbsp;L&ecirc; Thẩm Dương</p>

<p>Giảng vi&ecirc;n cao cấp</p>

<p>Chuy&ecirc;n gia t&acirc;m l&yacute; ứng dụng - chuy&ecirc;n gia ph&acirc;n t&iacute;ch kinh tế nổi tiếng tại Việt Nam</p>

<p>Trưởng khoa Quản trị kinh doanh trường ĐH Ng&acirc;n h&agrave;ng TP HCM</p>
', N'TRƯỜNG ĐÀO TẠO DOANH NHÂN PTI', N'<p>Trường đ&agrave;o tạo doanh nh&acirc;n PTI l&agrave; th&agrave;nh vi&ecirc;n thuộc Tổ Chức Gi&aacute;o Dục chất lượng cao PTI, v&agrave; l&agrave; trường đ&agrave;o tạo doanh nh&acirc;n h&agrave;ng đầu tại Việt Nam hiện nay. PTI chuy&ecirc;n tổ chức &amp; cung cấp c&aacute;c chương tr&igrave;nh đ&agrave;o tạo chuy&ecirc;n nghiệp nhằm củng cố, n&acirc;ng cao, ph&aacute;t triển chuy&ecirc;n m&ocirc;n &amp; năng lực điều h&agrave;nh quản l&yacute; d&agrave;nh cho c&aacute;c doanh nh&acirc;n v&agrave; c&aacute;c chuy&ecirc;n vi&ecirc;n trong lĩnh vực kinh tế.Với kinh nghiệm đ&agrave;o tạo v&agrave; kiến thức chuy&ecirc;n m&ocirc;n s&acirc;u của đội ngũ giảng huấn &amp; c&aacute;c chuy&ecirc;n gia h&agrave;ng đầu trong nước, quốc tế, kết hợp với năng lực tổ chức dịch vụ gi&aacute;o dục chuy&ecirc;n nghiệp của m&igrave;nh, PTI cung cấp chương tr&igrave;nh đ&agrave;o tạo mang t&iacute;nh thực tiễn cao ph&ugrave; hợp với ph&aacute;t triển của x&atilde; hội. Sự kh&aacute;c biệt của PTI tạo ra m&ocirc;i trường học tập c&oacute; chất lượng vượt trội so với tất cả những trường đ&agrave;o tạo kh&aacute;c - nơi chủ yếu cung cấp c&aacute;c kh&oacute;a đ&agrave;o tạo ngắn hạn mang nặng t&iacute;nh nghi&ecirc;n cứu &amp; học thuật, kh&ocirc;ng đ&aacute;p ứng được nhu cầu thực tế của học vi&ecirc;n.</p>
', 460, N'trungkien3289@gmail.com', 10, 101, 0, N'Tổ Chức Giáo Dục PIT', N'218  Nam Kỳ Khởi Nghĩa', NULL, N'Quận 3', N'Hồ Chí Minh', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (19, N'ef827544-cb17-4cc7-9d6c-d8fe914d8e79', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'METALEX Vietnam 207', CAST(0x0000A80A009451EC AS DateTime), CAST(0x0000A80C01184B14 AS DateTime), N'<p>Vietnam&#39;s International Exhibition on Machine Tools &amp; Metalworking Solutions for Production upgrade&nbsp;</p>

<p>Taking metalworking production to the next level involves in exploring new machining and tooling technologies to earn long-term competitive advantages in the era of AEC. Manufacturers who act now will strive, while those who fail to shift will rapidly fall behind. It is time for you and 500 brands from 25 countries, to once again provide technology they need, and build partnerships in the international trade fair of 10,000 machinery and technology buyers.</p>
', N'REED TRADEX', N'<p>Organizer of Industrial Components &amp; Subcontracting Vietnam 2017</p>
', 461, N'trungkien3289@gmail.com', 1, 101, 0, N'Saigon Exhibition & Convention Center (SECC) ', N'799  Nguyễn Văn Linh', NULL, N'Quận 7', N'Hồ Chí Minh', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (20, N'af930c39-ff81-46c7-9a62-e7043485e25d', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Industrial Components & Subcontracting Vietnam 2017', CAST(0x0000A75F00945570 AS DateTime), CAST(0x0000A76301184664 AS DateTime), N'<p>Vietnam&#39;s Most Comprehensive Sourcing Platform for Industrial Parts and Components</p>

<p>The easiest and most effective way to meet buyers of your parts and components or your future subcontractors in Vietnam is this. &quot;Industrial Components &amp; Subcontracting Vietnam&quot;. Organized in Hanoi and HCMC, in co-location with manufacturing technology exhibitions that are popular among Vietnamese industrialists, each ICSV show in each city will bring 10,000+ quality buyers to you.</p>
', N'REED TRADEX', N'<p>Organizer of Industrial Components &amp; Subcontracting Vietnam 2017</p>
', 462, N'trungkien3289@gmail.com', 6, 117, 0, N'Cung Van Hoa Viet Xo (I.C.E.) Culture Palace', N'91  Trần Hưng Đạo', NULL, N'Hoàn Kiếm', N'Hà Nội', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (21, N'f0c335bf-3023-4104-bd0f-48c2cc7cb396', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'QUẢN ĐỐC SẢN XUẤT', CAST(0x0000A6C300840288 AS DateTime), CAST(0x0000A6CB0107B0B0 AS DateTime), N'<p>Hiệu quả trong hoạt động kinh doanh của doanh nghiệp t&ugrave;y thuộc phần lớn v&agrave;o hiệu quả trong sản xuất, trong đ&oacute; người<em>Quản đốc Ph&acirc;n xưởng</em>&nbsp;đ&oacute;ng một vai tr&ograve; rất quan trọng. L&agrave; cầu nối của l&atilde;nh đạo doanh nghiệp v&agrave; bộ phận trực tiếp l&agrave;m ra sản phẩm. Việc thực hiện kế hoạch c&aacute;c vấn đề về ch&acirc;t lượng, năng suất v&agrave; chi ph&iacute; sản xuất trong qu&aacute; tr&igrave;nh, t&ugrave;y thuộc phần lớn v&agrave;o c&aacute;c kỹ năng chuy&ecirc;n m&ocirc;n, quản l&yacute; cũng như kỹ năng ph&aacute;t huy nh&acirc;n vi&ecirc;n thuộc quyền của Quản đốc Ph&acirc;n xưởng.&nbsp;<strong>Quản đốc sản xuất</strong>&nbsp;c&oacute; thể đảm nhiệm cả việc huấn luyện c&ocirc;ng nh&acirc;n v&agrave; điều h&agrave;nh kế hoạch sản xuất với năng suất lao động cao nhất v&agrave; chi ph&iacute; thấp nhất để đạt gi&aacute; th&agrave;nh cạnh tranh trong điều kiện chất lượng sản phẩm thỏa m&atilde;n nhu cầu v&agrave; mong đợi của kh&aacute;ch h&agrave;ng l&agrave; mục ti&ecirc;u của chương tr&igrave;nh đ&agrave;o tạo &ldquo;<strong>Quản l&yacute; sản xuất Chuy&ecirc;n nghiệp</strong>&rdquo; do Trường đ&agrave;o tạo Doanh nh&acirc;n PTI x&acirc;y dựng. Chương tr&igrave;nh gi&uacute;p học vi&ecirc;n c&oacute; cơ hội n&acirc;ng cao nghiệp vụ Quản đốc th&ocirc;ng qua việc thiết lập v&agrave; kiểm so&aacute;t c&aacute;c quy tr&igrave;nh sản xuất v&agrave; c&aacute;c quy tr&igrave;nh hỗ trợ cho sản xuất. Hơn nữa họ c&oacute; đủ năng lực để huấn luyện v&agrave; tổ chức k&egrave;m cặp c&ocirc;ng nh&acirc;n trong ph&acirc;n xưởng.</p>

<h3>MỤC TI&Ecirc;U CHƯƠNG TR&Igrave;NH</h3>

<p><em>Sau khi ho&agrave;n tất th&agrave;nh c&ocirc;ng chương tr&igrave;nh n&agrave;y, bạn c&oacute; thể:</em></p>

<p>- Đủ năng lực để thể hiện được vai tr&ograve; của m&igrave;nh, th&ocirc;ng qua việc quản l&yacute; hiệu quả to&agrave;n bộ qu&aacute; tr&igrave;nh sản xuất, với khả năng ứng dụng được c&aacute;c c&ocirc;ng cụ, phương ph&aacute;p, v&agrave; c&aacute;c kỹ năng đ&atilde; được chuyển giao từ kho&aacute; học</p>

<p>- Đủ tự tin để đề xuất c&aacute;c giải ph&aacute;p khả thi, ứng dụng v&agrave;o thực tế quản l&yacute; nhằm n&acirc;ng cao hiệu quả sản xuất.</p>

<p><strong>NỘI DUNG CHƯƠNG TR&Igrave;NH</strong></p>

<p>HỌC PHẦN</p>

<p>&nbsp;</p>

<p>N&Ocirc;I DUNG CHI TIẾT</p>

<p>THỜI LƯỢNG</p>

<p>Phần 1:</p>

<p>Vị tr&iacute;, vai tr&ograve; của người Quản đốc Ph&acirc;n xưởng trong hoạt động của Doanh nghiệp</p>

<p>- Thế n&agrave;o l&agrave; một tổ chức sản xuất ?</p>

<p>- Mối quan hệ giữa Ph&acirc;n xưởng sản xuất v&agrave; c&aacute;c bộ phận trong DN</p>

<p>- Vai tr&ograve;, nhiệm vụ của Quản đốc ph&acirc;n xưởng (QĐPX)</p>

<p>- C&aacute;c phẩm chất v&agrave; kỹ năng cần c&oacute; để l&agrave; một người QĐPX th&agrave;nh c&ocirc;ng</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>1</p>

<p>Phần 2:</p>

<p>C&aacute;c kỹ năng l&agrave;m việc với nh&acirc;n vi&ecirc;n</p>

<p>- Kỹ năng trao đổi th&ocirc;ng tin</p>

<p>Kỹ năng giao tiếp</p>

<p>Kỹ năng lắng nghe</p>

<p>Kỹ năng cho v&agrave; nhận phản hồi</p>

<p>Kỹ năng đặt c&acirc;u hỏi</p>

<p>- Kỹ năng tạo động lực cho nh&acirc;n vi&ecirc;n</p>

<p>C&ocirc;ng cụ ph&acirc;n t&iacute;ch</p>

<p>C&aacute;c yếu tố tạo động lực</p>

<p>Vai tr&ograve; của người quản l&yacute;</p>

<p>- Kỹ năng đ&aacute;nh gi&aacute; hiệu quả c&ocirc;ng việc</p>

<p>X&aacute;c định c&aacute;c ti&ecirc;u ch&iacute;</p>

<p>Qui tr&igrave;nh đ&aacute;nh gi&aacute; hiệu quả</p>

<p>C&aacute;c phương ph&aacute;p</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>3</p>

<p>Phần 3:</p>

<p>C&ocirc;ng t&aacute;c lập v&agrave; kiểm so&aacute;t thực hiện kế hoạch sản xuất</p>

<p>&nbsp;</p>

<p>- Kh&aacute;i niệm về hoạch định tổng hợp v&agrave; lịch tr&igrave;nh sản xuất ch&iacute;nh</p>

<p>- Lập kế hoạch sản xuất v&agrave; kế hoạch kiểm tra</p>

<p>Sự cần thiết của c&ocirc;ng t&aacute;c kế hoạch</p>

<p>Phương ph&aacute;p lập kế hoạch sản xuất</p>

<p>Kế hoạch kiểm tra</p>

<p>Điều độ v&agrave; lập lịch tr&igrave;nh sản xuất &ndash; c&aacute;c c&ocirc;ng cụ</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>1</p>

<p>Phần 4:</p>

<p>Quản l&yacute; hiệu quả qu&aacute; tr&igrave;nh sản xuất</p>

<p>&nbsp;</p>

<p>- Quản l&yacute; năng suất</p>

<p>Năng suất l&agrave; g&igrave; ?</p>

<p>C&aacute;c quan điểm mới về năng suất</p>

<p>Qui tr&igrave;nh quản l&yacute; năng suất</p>

<p>- Quản l&yacute; chất lượng (QLCL)</p>

<p>C&aacute;c nguy&ecirc;n l&yacute; cơ bản trong QLCL</p>

<p>C&aacute;c quan điểm về QLCL</p>

<p>Chi ph&iacute; chất lượng: c&aacute;c quan điểm</p>

<p>Vai tr&ograve; c&aacute;c bộ phận trong c&ocirc;ng t&aacute;c QLCL</p>

<p>Năng suất v&agrave; chất lượng</p>

<p>Sử dụng c&aacute;c c&ocirc;ng cụ v&agrave; phương ph&aacute;p quản l&yacute; trong QLCL</p>

<p>- Quản l&yacute;, giảm l&atilde;ng ph&iacute; trong sản xuất</p>

<p>Chi ph&iacute; sản xuất: c&aacute;c yếu tố cấu th&agrave;nh</p>

<p>Vấn đề l&atilde;ng ph&iacute; trong sản xuất</p>

<p>Nhận diện, loại trừ l&atilde;ng ph&iacute;</p>

<p>C&aacute;c giải ph&aacute;p n&acirc;ng cao hiệu quả trong quản l&yacute; sản xuất</p>

<p>- C&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t, kiểm tra trong sản xuất</p>

<p>Ph&ograve;ng ngừa hay khắc phục?</p>

<p>Gi&aacute;m s&aacute;t v&agrave; kiểm tra</p>

<p>Gi&aacute;m s&aacute;t sản xuất với 4M</p>

<p>Sử dụng check list trong c&ocirc;ng t&aacute;c kiểm tra, gi&aacute;m s&aacute;t</p>

<p>- Kaizen &ndash; 5S với năng suất, chất lượng</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>3</p>

<p>Phần 5:&nbsp;Đ&uacute;c kết</p>

<p>&nbsp;</p>

<p>- C&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t, kiểm tra trong sản xuất</p>

<p>&nbsp;</p>

<p>*</p>

<p>&nbsp;</p>

<p>TỔNG CỘNG</p>

<p>&nbsp;</p>

<p>8</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>TH&Ocirc;NG TIN KH&Oacute;A HỌC</p>

<p>THỜI GIAN<br />
- Khai giảng:&nbsp;19-11-2016<br />
- Lịch học:&nbsp;Thứ 7 &amp; Chủ nhật<br />
- Thời gian:&nbsp;<br />
+ S&aacute;ng:&nbsp;8h30 - 11h30<br />
+ Chiều:&nbsp;13h30 - 16h30<br />
- Thời lượng:&nbsp;08 buổi<br />
- Kết th&uacute;c:&nbsp;27-11-2016<br />
<br />
ĐỊA ĐIỂM:&nbsp;Kh&oacute;a học được tổ chức tại ph&ograve;ng học V.I.P. Tầng 14, Sảnh B, T&ograve;a nh&agrave; S&ocirc;ng Đ&agrave; &ndash; Đường Phạm H&ugrave;ng &ndash; Nam Từ Li&ecirc;m &ndash; H&agrave; Nội<br />
<br />
HỌC PH&Iacute;:&nbsp;5.200.000 / Kh&oacute;a<br />
(Bao gồm cả Tea Break, chi ph&iacute; t&agrave;i liệu, in ấn, giảng vi&ecirc;n, chứng nhận)</p>

<p><br />
ĐỂ NHẬN PH&Iacute; ƯU Đ&Atilde;I TỐT NHẤT XIN VUI L&Ograve;NG LI&Ecirc;N HỆ THEO SỐ 0969 479 862_MS HO&Agrave;NG TH&Uacute;Y</p>

<p>HỌC PHẦN</p>

<p>&nbsp;</p>

<p>N&Ocirc;I DUNG CHI TIẾT</p>

<p>THỜI LƯỢNG</p>

<p>Phần 1:</p>

<p>Vị tr&iacute;, vai tr&ograve; của người Quản đốc Ph&acirc;n xưởng trong hoạt động của Doanh nghiệp</p>

<p>- Thế n&agrave;o l&agrave; một tổ chức sản xuất ?</p>

<p>- Mối quan hệ giữa Ph&acirc;n xưởng sản xuất v&agrave; c&aacute;c bộ phận trong DN</p>

<p>- Vai tr&ograve;, nhiệm vụ của Quản đốc ph&acirc;n xưởng (QĐPX)</p>

<p>- C&aacute;c phẩm chất v&agrave; kỹ năng cần c&oacute; để l&agrave; một người QĐPX th&agrave;nh c&ocirc;ng</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>1</p>

<p>Phần 2:</p>

<p>C&aacute;c kỹ năng l&agrave;m việc với nh&acirc;n vi&ecirc;n</p>

<p>- Kỹ năng trao đổi th&ocirc;ng tin</p>

<p>&sect;&nbsp;Kỹ năng giao tiếp</p>

<p>&sect;&nbsp;Kỹ năng lắng nghe</p>

<p>&sect;&nbsp;Kỹ năng cho v&agrave; nhận phản hồi</p>

<p>&sect;&nbsp;Kỹ năng đặt c&acirc;u hỏi</p>

<p>- Kỹ năng tạo động lực cho nh&acirc;n vi&ecirc;n</p>

<p>&sect;&nbsp;C&ocirc;ng cụ ph&acirc;n t&iacute;ch</p>

<p>&sect;&nbsp;C&aacute;c yếu tố tạo động lực</p>

<p>&sect;&nbsp;Vai tr&ograve; của người quản l&yacute;</p>

<p>- Kỹ năng đ&aacute;nh gi&aacute; hiệu quả c&ocirc;ng việc</p>

<p>&sect;&nbsp;X&aacute;c định c&aacute;c ti&ecirc;u ch&iacute;</p>

<p>&sect;&nbsp;Qui tr&igrave;nh đ&aacute;nh gi&aacute; hiệu quả</p>

<p>&sect;&nbsp;C&aacute;c phương ph&aacute;p</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>3</p>

<p>Phần 3:</p>

<p>C&ocirc;ng t&aacute;c lập v&agrave; kiểm so&aacute;t thực hiện kế hoạch sản xuất</p>

<p>&nbsp;</p>

<p>- Kh&aacute;i niệm về hoạch định tổng hợp v&agrave; lịch tr&igrave;nh sản xuất ch&iacute;nh</p>

<p>- Lập kế hoạch sản xuất v&agrave; kế hoạch kiểm tra</p>

<p>&sect;&nbsp;Sự cần thiết của c&ocirc;ng t&aacute;c kế hoạch</p>

<p>&sect;&nbsp;Phương ph&aacute;p lập kế hoạch sản xuất</p>

<p>&sect;&nbsp;Kế hoạch kiểm tra</p>

<p>&sect;&nbsp;Điều độ v&agrave; lập lịch tr&igrave;nh sản xuất &ndash; c&aacute;c c&ocirc;ng cụ</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>1</p>

<p>Phần 4:</p>

<p>Quản l&yacute; hiệu quả qu&aacute; tr&igrave;nh sản xuất</p>

<p>&nbsp;</p>

<p>- Quản l&yacute; năng suất</p>

<p>&sect;&nbsp;Năng suất l&agrave; g&igrave; ?</p>

<p>&sect;&nbsp;C&aacute;c quan điểm mới về năng suất</p>

<p>&sect;&nbsp;Qui tr&igrave;nh quản l&yacute; năng suất</p>

<p>- Quản l&yacute; chất lượng (QLCL)</p>

<p>&sect;&nbsp;C&aacute;c nguy&ecirc;n l&yacute; cơ bản trong QLCL</p>

<p>&sect;&nbsp;C&aacute;c quan điểm về QLCL</p>

<p>&sect;&nbsp;Chi ph&iacute; chất lượng: c&aacute;c quan điểm</p>

<p>&sect;&nbsp;Vai tr&ograve; c&aacute;c bộ phận trong c&ocirc;ng t&aacute;c QLCL</p>

<p>&sect;&nbsp;Năng suất v&agrave; chất lượng</p>

<p>&sect;&nbsp;Sử dụng c&aacute;c c&ocirc;ng cụ v&agrave; phương ph&aacute;p quản l&yacute; trong QLCL</p>

<p>- Quản l&yacute;, giảm l&atilde;ng ph&iacute; trong sản xuất</p>

<p>&sect;&nbsp;Chi ph&iacute; sản xuất: c&aacute;c yếu tố cấu th&agrave;nh</p>

<p>&sect;&nbsp;Vấn đề l&atilde;ng ph&iacute; trong sản xuất</p>

<p>&sect;&nbsp;Nhận diện, loại trừ l&atilde;ng ph&iacute;</p>

<p>&sect;&nbsp;C&aacute;c giải ph&aacute;p n&acirc;ng cao hiệu quả trong quản l&yacute; sản xuất</p>

<p>- C&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t, kiểm tra trong sản xuất</p>

<p>&sect;&nbsp;Ph&ograve;ng ngừa hay khắc phục?</p>

<p>&sect;&nbsp;Gi&aacute;m s&aacute;t v&agrave; kiểm tra</p>

<p>&sect;&nbsp;Gi&aacute;m s&aacute;t sản xuất với 4M</p>

<p>&sect;&nbsp;Sử dụng check list trong c&ocirc;ng t&aacute;c kiểm tra, gi&aacute;m s&aacute;t</p>

<p>- Kaizen &ndash; 5S với năng suất, chất lượng</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>3</p>

<p>Phần 5:&nbsp;Đ&uacute;c kết</p>

<p>&nbsp;</p>

<p>- C&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t, kiểm tra trong sản xuất</p>

<p>&nbsp;</p>

<p>*</p>

<p>&nbsp;</p>

<p>TỔNG CỘNG</p>

<p>&nbsp;</p>

<p>8</p>
', N'TRƯỜNG ĐÀO TẠO DOANH NHÂN PTI', N'<p>Trường đ&agrave;o tạo doanh nh&acirc;n PTI l&agrave; th&agrave;nh vi&ecirc;n thuộc Tổ Chức Gi&aacute;o Dục chất lượng cao PTI, v&agrave; l&agrave; trường đ&agrave;o tạo doanh nh&acirc;n h&agrave;ng đầu tại Việt Nam hiện nay. PTI chuy&ecirc;n tổ chức &amp; cung cấp c&aacute;c chương tr&igrave;nh đ&agrave;o tạo chuy&ecirc;n nghiệp nhằm củng cố, n&acirc;ng cao, ph&aacute;t triển chuy&ecirc;n m&ocirc;n &amp; năng lực điều h&agrave;nh quản l&yacute; d&agrave;nh cho c&aacute;c doanh nh&acirc;n v&agrave; c&aacute;c chuy&ecirc;n vi&ecirc;n trong lĩnh vực kinh tế.Với kinh nghiệm đ&agrave;o tạo v&agrave; kiến thức chuy&ecirc;n m&ocirc;n s&acirc;u của đội ngũ giảng huấn &amp; c&aacute;c chuy&ecirc;n gia h&agrave;ng đầu trong nước, quốc tế, kết hợp với năng lực tổ chức dịch vụ gi&aacute;o dục chuy&ecirc;n nghiệp của m&igrave;nh, PTI cung cấp chương tr&igrave;nh đ&agrave;o tạo mang t&iacute;nh thực tiễn cao ph&ugrave; hợp với ph&aacute;t triển của x&atilde; hội. Sự kh&aacute;c biệt của PTI tạo ra m&ocirc;i trường học tập c&oacute; chất lượng vượt trội so với tất cả những trường đ&agrave;o tạo kh&aacute;c - nơi chủ yếu cung cấp c&aacute;c kh&oacute;a đ&agrave;o tạo ngắn hạn mang nặng t&iacute;nh nghi&ecirc;n cứu &amp; học thuật, kh&ocirc;ng đ&aacute;p ứng được nhu cầu thực tế của học vi&ecirc;n.</p>
', 463, N'trungkien3289@gmail.com', 9, 101, 0, N'Tòa Nhà Sông Đà', NULL, NULL, N'Từ Liêm', N'Hà Nội', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (22, N'40166ed9-257d-43f4-8ed0-a31b82ffe6be', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'(SEP) KHỞI TẠO DOANH NGHIỆP', CAST(0x0000A6D1016A8DAC AS DateTime), CAST(0x0000A6FD0107BC68 AS DateTime), N'<p>Theo thống k&ecirc; của c&aacute;c nh&agrave; nghi&ecirc;n cứu thị trường, nhiều doanh nghiệp kh&ocirc;ng c&oacute; cơ hội kỷ niệm sinh nhật lần thứ 2 của m&igrave;nh v&agrave; bị&nbsp;<em>&ldquo;khai tử&rdquo;</em>&nbsp;ngay trong năm đầu hoạt động. Thương trường với luật chơi khắc nghiệt của n&oacute; kh&ocirc;ng bao giờ nương tay với những người chơi&nbsp;<em>&ldquo;ng&acirc;y thơ&rdquo;.</em>&nbsp;Để c&oacute; thể tồn tại l&acirc;u hơn v&agrave; ph&aacute;t triển bền vững trong m&ocirc;i trường cạnh tranh ng&agrave;y một gay gắt, c&aacute;c doanh nghiệp trẻ cần c&oacute; những người chỉ đường để tr&aacute;nh sa v&agrave;o những<em>&ldquo;c&aacute;i bẫy&rdquo;</em>&nbsp;dẫn đến sai lầm trong chiến lược hoạt động v&agrave; ph&aacute;t triển.</p>

<p>Một doanh nh&acirc;n trẻ khi khởi nghiệp c&oacute; thể c&oacute; nhiều c&aacute;ch kinh doanh kh&aacute;c nhau để l&agrave;m cho doanh nghiệp m&igrave;nh ph&aacute;t triển m&agrave; kh&ocirc;ng gặp phải những&nbsp;<em>&ldquo;r&agrave;o cản bất an&rdquo;</em>&nbsp;của thương trường. Mỗi doanh nh&acirc;n đều c&oacute; một thế mạnh ri&ecirc;ng, l&agrave;m thế n&agrave;o để nắm bắt v&agrave; ph&aacute;t huy thế mạnh của m&igrave;nh trong c&ocirc;ng việc kinh doanh để tạo n&ecirc;n sự kh&aacute;c biệt giữa doanh nghiệp m&igrave;nh v&agrave; doanh nghiệp kh&aacute;c? T&igrave;m kiếm được gi&aacute; trị của bản th&acirc;n th&ocirc;ng qua sự trau dồi tri thức thường xuy&ecirc;n v&agrave; được định hướng lu&ocirc;n l&agrave; con đường s&aacute;ng nhất, &iacute;t rủi ro nhất v&agrave; vinh quang nhất.</p>

<p>Từ việc nghi&ecirc;n cứu, khảo s&aacute;t kỹ lưỡng sự ph&aacute;t triển của c&aacute;c doanh nghiệp Việt Nam v&agrave; thế giới trong qu&aacute; tr&igrave;nh khởi tạo đến th&agrave;nh c&ocirc;ng hiện tại; Từ những nghi&ecirc;n cứu thực tế sự ph&aacute;t triển nền kinh tế Việt Nam hiện nay v&agrave; những kh&oacute; khăn m&agrave; một doanh nghiệp dễ gặp phải khi khởi tạo; Từ việc ph&acirc;n t&iacute;ch nhu cầu cần thiết của việc học đối với c&aacute;c doanh nh&acirc;n khởi nghiệp&hellip; Trường Doanh nh&acirc;n PTI tổ chức Chương tr&igrave;nh đ&agrave;o tạo &ldquo;<strong>Khởi tạo Doanh nghiệp</strong>&rdquo;&nbsp;<em>(SEP - Sustainable Entrepreneurship Practice)</em>&nbsp;d&agrave;nh cho doanh nh&acirc;n trẻ, những nh&agrave; l&atilde;nh đạo v&agrave; quản l&yacute; trẻ của c&aacute;c doanh nghiệp nhằm g&oacute;p phần đ&agrave;o tạo một thế hệ doanh nh&acirc;n mới cho đất nước.</p>

<p>MỤC TI&Ecirc;U CHƯƠNG TR&Igrave;NH</p>

<p><em>Sau khi ho&agrave;n tất th&agrave;nh c&ocirc;ng chương tr&igrave;nh n&agrave;y, bạn c&oacute; thể:</em></p>

<p>&sect;&nbsp;Trang bị cho m&igrave;nh những tư duy v&agrave; nhận thức cốt l&otilde;i m&agrave; một doanh nh&acirc;n khởi nghiệp cần phải c&oacute; trong m&ocirc;i trường kinh doanh to&agrave;n cầu hiện nay;</p>

<p>&sect;&nbsp;C&oacute; những kiến thức nền tảng cần thiết tương ứng với c&aacute;c lĩnh vực then chốt li&ecirc;n quan đến việc khởi tạo th&agrave;nh c&ocirc;ng, tạo tiền đề bền vững cho một c&ocirc;ng ty lớn mạnh trong tương lai;</p>

<p>&sect;&nbsp;Lựa chọn chiến lược v&agrave; lộ tr&igrave;nh để kiến tạo hoặc t&aacute;i tạo một doanh nghiệp th&agrave;nh c&ocirc;ng, tạo tiền đề bền vững cho một c&ocirc;ng ty lớn mạnh v&agrave; trường tồn.</p>

<p><br />
NỘI DUNG CHƯƠNG TR&Igrave;NH</p>

<p>TT</p>

<p>Chuy&ecirc;n đề / SUBJECTS</p>

<p>Thời lượng</p>

<p>Buổi</p>

<p>Tiết</p>

<p>1</p>

<p>Ch&acirc;n dung Doanh nh&acirc;n khởi nghiệp</p>

<p>- Những phẩm chất v&agrave; năng lực cần c&oacute; của một Doanh nh&acirc;n khởi nghiệp;</p>

<p>- Sự kh&aacute;c biệt giữa doanh nh&acirc;n khởi nghiệp v&agrave; doanh nh&acirc;n d&agrave;y dạn</p>

<p>- Những thuận lợi v&agrave; th&aacute;ch thức của một Doanh nh&acirc;n khởi nghiệp</p>

<p>1</p>

<p>4</p>

<p>2</p>

<p>&Yacute; tưởng kinh doanh v&agrave; Đối t&aacute;c khởi nghiệp</p>

<p>- &Yacute; tưởng kinh doanh &amp; Giải ph&aacute;p kinh doanh</p>

<p>- Nguy&ecirc;n tắc hợp t&aacute;c &amp; C&aacute;ch thức hợp t&aacute;c khi khởi nghiệp</p>

<p>1</p>

<p>4</p>

<p><em>3</em></p>

<p>Đổi mới s&aacute;ng tạo</p>

<p>- Tư duy về đổi mới s&aacute;ng tạo, tạo ra gi&aacute; trị cho kh&aacute;ch h&agrave;ng</p>

<p>- Phương ph&aacute;p luận s&aacute;ng tạo</p>

<p>- M&ocirc; h&igrave;nh SCAMPER</p>

<p>1</p>

<p>4</p>

<p>4</p>

<p>Nghi&ecirc;n cứu thị trường</p>

<p>- Nghi&ecirc;n cứu thị trường</p>

<p>- Nghi&ecirc;n cứu c&aacute;c chủ thể tr&ecirc;n thị trường</p>

<p>1</p>

<p>4</p>

<p>5</p>

<p>&nbsp;</p>

<p>Chiến lược C&ocirc;ng ty</p>

<p>- M&ocirc; h&igrave;nh khởi nghiệp th&ocirc;ng minh &ndash; Smartup</p>

<p>- H&igrave;nh th&agrave;nh Chiến lược C&ocirc;ng ty</p>

<p>2</p>

<p>8</p>

<p>6</p>

<p>Kế hoạch Kinh doanh</p>

<p>- Kế hoạch nguồn nh&acirc;n lực</p>

<p>- Kế hoạch sản phẩm</p>

<p>- Kế hoạch t&agrave;i ch&iacute;nh</p>

<p>- Kế hoạch b&aacute;n h&agrave;ng, tiếp thị, ph&acirc;n phối</p>

<p>2</p>

<p>8</p>

<p>7</p>

<p>Lựa chọn m&ocirc; h&igrave;nh doanh nghiệp</p>

<p>- C&aacute;c m&ocirc; h&igrave;nh doanh nghiệp phổ biến</p>

<p>- Vấn đề T&agrave;i ch&iacute;nh: độc lập / phụ thuộc</p>

<p>- Vấn đề ph&aacute;p l&yacute;: độc lập / phụ thuộc</p>

<p>- Vấn đề Thương hiệu: Cấu tr&uacute;c Thương hiệu của Doanh nghiệp</p>

<p>- Cơ cấu Tổ chức Quản l&yacute; của doanh nghiệp.</p>

<p>- Hệ thống quản l&yacute; doanh nghiệp (Quy chế Bộ phận, Quy tr&igrave;nh nghiệp vụ&hellip;)</p>

<p>1</p>

<p>4</p>

<p>8</p>

<p>Lựa chọn h&igrave;nh thức ph&aacute;p l&yacute;</p>

<p>- Những vấn đề ph&aacute;p l&yacute; c&oacute; li&ecirc;n quan đến Khởi tạo Doanh nghiệp</p>

<p>- Nguy&ecirc;n tắc lựa chọn h&igrave;nh thức ph&aacute;p l&yacute; cho doanh nghiệp</p>

<p>- C&aacute;c vấn đề li&ecirc;n quan đến thủ tục đăng k&yacute; kinh doanh</p>

<p>- C&aacute;c vấn đề li&ecirc;n quan đến đăng k&yacute; thuế, người đại diện theo ph&aacute;p luật.</p>

<p>1</p>

<p>4</p>

<p>9</p>

<p>Huy động vốn</p>

<p>- Nguồn vốn v&agrave; c&aacute;c k&ecirc;nh huy động vốn cho việc Khởi tạo Doanh nghiệp</p>

<p>- Nguy&ecirc;n tắc huy động v&agrave; sử dụng vốn hiệu quả</p>

<p>- Định gi&aacute; doanh nghiệp</p>

<p>2</p>

<p>4</p>

<p>10</p>

<p>Đối thoại v&agrave; chia sẻ kinh nghiệm với Doanh nh&acirc;n khởi nghiệp th&agrave;nh c&ocirc;ng - Gặp gỡ nh&agrave; đầu tư</p>

<p>&nbsp;</p>

<p>*</p>

<p>*</p>

<p>&nbsp;</p>

<p>Tổng cộng</p>

<p>12</p>

<p>48</p>

<p>&nbsp;</p>

<p>TH&Ocirc;NG TIN KH&Oacute;A HỌC</p>

<p>THỜI GIAN<br />
- Khai giảng:&nbsp;03-12-2016<br />
- Lịch học:&nbsp;Thứ 7, Chủ nhật (Tuần 1 + Tuần 3)<br />
- Thời gian:&nbsp;<br />
<em>+ S&aacute;ng:</em>&nbsp;<em>8h30 -11h30</em><br />
<em>+ Chiều:</em>&nbsp;<em>13h30 - 16h30</em><br />
- Thời lượng:&nbsp;12 buổi<br />
- Kết th&uacute;c:&nbsp;15-01-2017<br />
<br />
ĐỊA ĐIỂM:&nbsp;Ph&ograve;ng V.I.P. Tầng 14, Sảnh B, T&ograve;a nh&agrave; S&ocirc;ng Đ&agrave; &ndash; Đường Phạm H&ugrave;ng &ndash; Nam Từ Li&ecirc;m &ndash; H&agrave; Nội&nbsp;<br />
<br />
HỌC PH&Iacute;:&nbsp;7.200.000 / Kh&oacute;a<br />
(Bao gồm cả Tea Break, chi ph&iacute; t&agrave;i liệu, in ấn, giảng vi&ecirc;n, chứng nhận)&nbsp;<br />
PH&Iacute; ƯU Đ&Atilde;I:&nbsp;Li&ecirc;n hệ Ms Ho&agrave;ng Th&uacute;y_0969 479 862 để nhận mức ph&iacute; ưu đ&atilde;i nhất</p>

<p>Theo thống k&ecirc; của c&aacute;c nh&agrave; nghi&ecirc;n cứu thị trường, nhiều doanh nghiệp kh&ocirc;ng c&oacute; cơ hội kỷ niệm sinh nhật lần thứ 2 của m&igrave;nh v&agrave; bị&nbsp;<em>&ldquo;khai tử&rdquo;</em>&nbsp;ngay trong năm đầu hoạt động. Thương trường với luật chơi khắc nghiệt của n&oacute; kh&ocirc;ng bao giờ nương tay với những người chơi&nbsp;<em>&ldquo;ng&acirc;y thơ&rdquo;.</em>&nbsp;Để c&oacute; thể tồn tại l&acirc;u hơn v&agrave; ph&aacute;t triển bền vững trong m&ocirc;i trường cạnh tranh ng&agrave;y một gay gắt, c&aacute;c doanh nghiệp trẻ cần c&oacute; những người chỉ đường để tr&aacute;nh sa v&agrave;o những<em>&ldquo;c&aacute;i bẫy&rdquo;</em>&nbsp;dẫn đến sai lầm trong chiến lược hoạt động v&agrave; ph&aacute;t triển.</p>

<p>Một doanh nh&acirc;n trẻ khi khởi nghiệp c&oacute; thể c&oacute; nhiều c&aacute;ch kinh doanh kh&aacute;c nhau để l&agrave;m cho doanh nghiệp m&igrave;nh ph&aacute;t triển m&agrave; kh&ocirc;ng gặp phải những&nbsp;<em>&ldquo;r&agrave;o cản bất an&rdquo;</em>&nbsp;của thương trường. Mỗi doanh nh&acirc;n đều c&oacute; một thế mạnh ri&ecirc;ng, l&agrave;m thế n&agrave;o để nắm bắt v&agrave; ph&aacute;t huy thế mạnh của m&igrave;nh trong c&ocirc;ng việc kinh doanh để tạo n&ecirc;n sự kh&aacute;c biệt giữa doanh nghiệp m&igrave;nh v&agrave; doanh nghiệp kh&aacute;c? T&igrave;m kiếm được gi&aacute; trị của bản th&acirc;n th&ocirc;ng qua sự trau dồi tri thức thường xuy&ecirc;n v&agrave; được định hướng lu&ocirc;n l&agrave; con đường s&aacute;ng nhất, &iacute;t rủi ro nhất v&agrave; vinh quang nhất.</p>

<p>Từ việc nghi&ecirc;n cứu, khảo s&aacute;t kỹ lưỡng sự ph&aacute;t triển của c&aacute;c doanh nghiệp Việt Nam v&agrave; thế giới trong qu&aacute; tr&igrave;nh khởi tạo đến th&agrave;nh c&ocirc;ng hiện tại; Từ những nghi&ecirc;n cứu thực tế sự ph&aacute;t triển nền kinh tế Việt Nam hiện nay v&agrave; những kh&oacute; khăn m&agrave; một doanh nghiệp dễ gặp phải khi khởi tạo; Từ việc ph&acirc;n t&iacute;ch nhu cầu cần thiết của việc học đối với c&aacute;c doanh nh&acirc;n khởi nghiệp&hellip; Trường Doanh nh&acirc;n PTI tổ chức Chương tr&igrave;nh đ&agrave;o tạo &ldquo;<strong>Khởi tạo Doanh nghiệp</strong>&rdquo;&nbsp;<em>(SEP - Sustainable Entrepreneurship Practice)</em>&nbsp;d&agrave;nh cho doanh nh&acirc;n trẻ, những nh&agrave; l&atilde;nh đạo v&agrave; quản l&yacute; trẻ của c&aacute;c doanh nghiệp nhằm g&oacute;p phần đ&agrave;o tạo một thế hệ doanh nh&acirc;n mới cho đất nước.</p>

<p>MỤC TI&Ecirc;U CHƯƠNG TR&Igrave;NH</p>

<p><em>Sau khi ho&agrave;n tất th&agrave;nh c&ocirc;ng chương tr&igrave;nh n&agrave;y, bạn c&oacute; thể:</em></p>

<p>&sect;&nbsp;Trang bị cho m&igrave;nh những tư duy v&agrave; nhận thức cốt l&otilde;i m&agrave; một doanh nh&acirc;n khởi nghiệp cần phải c&oacute; trong m&ocirc;i trường kinh doanh to&agrave;n cầu hiện nay;</p>

<p>&sect;&nbsp;C&oacute; những kiến thức nền tảng cần thiết tương ứng với c&aacute;c lĩnh vực then chốt li&ecirc;n quan đến việc khởi tạo th&agrave;nh c&ocirc;ng, tạo tiền đề bền vững cho một c&ocirc;ng ty lớn mạnh trong tương lai;</p>

<p>&sect;&nbsp;Lựa chọn chiến lược v&agrave; lộ tr&igrave;nh để kiến tạo hoặc t&aacute;i tạo một doanh nghiệp th&agrave;nh c&ocirc;ng, tạo tiền đề bền vững cho một c&ocirc;ng ty lớn mạnh v&agrave; trường tồn.</p>

<p><br />
NỘI DUNG CHƯƠNG TR&Igrave;NH</p>

<p>TT</p>

<p>Chuy&ecirc;n đề / SUBJECTS</p>

<p>Thời lượng</p>

<p>Buổi</p>

<p>Tiết</p>

<p>1</p>

<p>Ch&acirc;n dung Doanh nh&acirc;n khởi nghiệp</p>

<p>- Những phẩm chất v&agrave; năng lực cần c&oacute; của một Doanh nh&acirc;n khởi nghiệp;</p>

<p>- Sự kh&aacute;c biệt giữa doanh nh&acirc;n khởi nghiệp v&agrave; doanh nh&acirc;n d&agrave;y dạn</p>

<p>- Những thuận lợi v&agrave; th&aacute;ch thức của một Doanh nh&acirc;n khởi nghiệp</p>

<p>1</p>

<p>4</p>

<p>2</p>

<p>&Yacute; tưởng kinh doanh v&agrave; Đối t&aacute;c khởi nghiệp</p>

<p>- &Yacute; tưởng kinh doanh &amp; Giải ph&aacute;p kinh doanh</p>

<p>- Nguy&ecirc;n tắc hợp t&aacute;c &amp; C&aacute;ch thức hợp t&aacute;c khi khởi nghiệp</p>

<p>1</p>

<p>4</p>

<p><em>3</em></p>

<p>Đổi mới s&aacute;ng tạo</p>

<p>- Tư duy về đổi mới s&aacute;ng tạo, tạo ra gi&aacute; trị cho kh&aacute;ch h&agrave;ng</p>

<p>- Phương ph&aacute;p luận s&aacute;ng tạo</p>

<p>- M&ocirc; h&igrave;nh SCAMPER</p>

<p>1</p>

<p>4</p>

<p>4</p>

<p>Nghi&ecirc;n cứu thị trường</p>

<p>- Nghi&ecirc;n cứu thị trường</p>

<p>- Nghi&ecirc;n cứu c&aacute;c chủ thể tr&ecirc;n thị trường</p>

<p>1</p>

<p>4</p>

<p>5</p>

<p>&nbsp;</p>

<p>Chiến lược C&ocirc;ng ty</p>

<p>- M&ocirc; h&igrave;nh khởi nghiệp th&ocirc;ng minh &ndash; Smartup</p>

<p>- H&igrave;nh th&agrave;nh Chiến lược C&ocirc;ng ty</p>

<p>2</p>

<p>8</p>

<p>6</p>

<p>Kế hoạch Kinh doanh</p>

<p>- Kế hoạch nguồn nh&acirc;n lực</p>

<p>- Kế hoạch sản phẩm</p>

<p>- Kế hoạch t&agrave;i ch&iacute;nh</p>

<p>- Kế hoạch b&aacute;n h&agrave;ng, tiếp thị, ph&acirc;n phối</p>

<p>2</p>

<p>8</p>

<p>7</p>

<p>Lựa chọn m&ocirc; h&igrave;nh doanh nghiệp</p>

<p>- C&aacute;c m&ocirc; h&igrave;nh doanh nghiệp phổ biến</p>

<p>- Vấn đề T&agrave;i ch&iacute;nh: độc lập / phụ thuộc</p>

<p>- Vấn đề ph&aacute;p l&yacute;: độc lập / phụ thuộc</p>

<p>- Vấn đề Thương hiệu: Cấu tr&uacute;c Thương hiệu của Doanh nghiệp</p>

<p>- Cơ cấu Tổ chức Quản l&yacute; của doanh nghiệp.</p>

<p>- Hệ thống quản l&yacute; doanh nghiệp (Quy chế Bộ phận, Quy tr&igrave;nh nghiệp vụ&hellip;)</p>

<p>1</p>

<p>4</p>

<p>8</p>

<p>Lựa chọn h&igrave;nh thức ph&aacute;p l&yacute;</p>

<p>- Những vấn đề ph&aacute;p l&yacute; c&oacute; li&ecirc;n quan đến Khởi tạo Doanh nghiệp</p>

<p>- Nguy&ecirc;n tắc lựa chọn h&igrave;nh thức ph&aacute;p l&yacute; cho doanh nghiệp</p>

<p>- C&aacute;c vấn đề li&ecirc;n quan đến thủ tục đăng k&yacute; kinh doanh</p>

<p>- C&aacute;c vấn đề li&ecirc;n quan đến đăng k&yacute; thuế, người đại diện theo ph&aacute;p luật.</p>

<p>1</p>

<p>4</p>

<p>9</p>

<p>Huy động vốn</p>

<p>- Nguồn vốn v&agrave; c&aacute;c k&ecirc;nh huy động vốn cho việc Khởi tạo Doanh nghiệp</p>

<p>- Nguy&ecirc;n tắc huy động v&agrave; sử dụng vốn hiệu quả</p>

<p>- Định gi&aacute; doanh nghiệp</p>

<p>2</p>

<p>4</p>

<p>10</p>

<p>Đối thoại v&agrave; chia sẻ kinh nghiệm với Doanh nh&acirc;n khởi nghiệp th&agrave;nh c&ocirc;ng - Gặp gỡ nh&agrave; đầu tư</p>

<p>&nbsp;</p>

<p>*</p>

<p>*</p>

<p>&nbsp;</p>

<p>Tổng cộng</p>

<p>12</p>

<p>48</p>
', N'TRƯỜNG ĐÀO TẠO DOANH NHÂN PTI', N'<p>Trường đ&agrave;o tạo doanh nh&acirc;n PTI l&agrave; th&agrave;nh vi&ecirc;n thuộc Tổ Chức Gi&aacute;o Dục chất lượng cao PTI, v&agrave; l&agrave; trường đ&agrave;o tạo doanh nh&acirc;n h&agrave;ng đầu tại Việt Nam hiện nay. PTI chuy&ecirc;n tổ chức &amp; cung cấp c&aacute;c chương tr&igrave;nh đ&agrave;o tạo chuy&ecirc;n nghiệp nhằm củng cố, n&acirc;ng cao, ph&aacute;t triển chuy&ecirc;n m&ocirc;n &amp; năng lực điều h&agrave;nh quản l&yacute; d&agrave;nh cho c&aacute;c doanh nh&acirc;n v&agrave; c&aacute;c chuy&ecirc;n vi&ecirc;n trong lĩnh vực kinh tế.Với kinh nghiệm đ&agrave;o tạo v&agrave; kiến thức chuy&ecirc;n m&ocirc;n s&acirc;u của đội ngũ giảng huấn &amp; c&aacute;c chuy&ecirc;n gia h&agrave;ng đầu trong nước, quốc tế, kết hợp với năng lực tổ chức dịch vụ gi&aacute;o dục chuy&ecirc;n nghiệp của m&igrave;nh, PTI cung cấp chương tr&igrave;nh đ&agrave;o tạo mang t&iacute;nh thực tiễn cao ph&ugrave; hợp với ph&aacute;t triển của x&atilde; hội. Sự kh&aacute;c biệt của PTI tạo ra m&ocirc;i trường học tập c&oacute; chất lượng vượt trội so với tất cả những trường đ&agrave;o tạo kh&aacute;c - nơi chủ yếu cung cấp c&aacute;c kh&oacute;a đ&agrave;o tạo ngắn hạn mang nặng t&iacute;nh nghi&ecirc;n cứu &amp; học thuật, kh&ocirc;ng đ&aacute;p ứng được nhu cầu thực tế của học vi&ecirc;n.</p>
', 464, N'trungkien3289@gmail.com', 9, 101, 0, N'Tòa Nhà Sông Đà', N' Phạm Hùng', NULL, N'Từ Liêm', N'Hà Nội', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (23, N'fd8a4656-a009-42bd-b02b-af2aa7b69cd6', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'CEO - GIÁM ĐỐC ĐIỀU HÀNH CHUYÊN NGHIỆP', CAST(0x0000A6E20128B8F0 AS DateTime), CAST(0x0000A73C013941C0 AS DateTime), N'<p><img alt="muc-tieu-dao-tao" src="https://s.evbuc.com/https_proxy?url=http%3A%2F%2Fpti.edu.vn%2Fwp-content%2Fuploads%2F2015%2F12%2Fceo-3.jpg&amp;sig=ADR2i7_1H4bocjh18LrRlISE_xCkibXvLQ" /></p>

<p><strong>Sau khi ho&agrave;n tất chương tr&igrave;nh n&agrave;y, bạn c&oacute; thể:</strong></p>

<ul>
	<li>Biết được ai, l&agrave;m thế n&agrave;o, trải nghiệm ra sao để c&oacute; thể trở th&agrave;nh một &ldquo;CEO&rdquo;- một &ldquo;nghề quản trị thực sự&rdquo;</li>
	<li>Nắm được những tư duy v&agrave; kiến thức cốt l&otilde;i m&agrave; một CEO cần phải c&oacute;</li>
	<li>Biết c&aacute;ch trang bị những năng lực quản trị cần thiết của một CEO</li>
	<li>Biết c&aacute;ch đạt được ho&agrave;i vọng của m&igrave;nh l&agrave; trở th&agrave;nh một CEO chuy&ecirc;n nghiệp</li>
</ul>

<p><img alt="muc-tieu-hoc-tap" src="https://s.evbuc.com/https_proxy?url=http%3A%2F%2Fpti.edu.vn%2Fwp-content%2Fuploads%2F2015%2F12%2Fceo-1-1.jpg&amp;sig=ADR2i79BHJWHt_spVn-FM4oZK6jNE38OOg" /></p>

<p><strong>Sau khi ho&agrave;n tất chương tr&igrave;nh n&agrave;y, bạn c&oacute; thể:</strong></p>

<ul>
	<li>Biết được ai, l&agrave;m thế n&agrave;o, trải nghiệm ra sao để c&oacute; thể trở th&agrave;nh một &ldquo;CEO&rdquo;- một &ldquo;nghề quản trị thực sự&rdquo;</li>
	<li>Nắm được những tư duy v&agrave; kiến thức cốt l&otilde;i m&agrave; một CEO cần phải c&oacute;</li>
	<li>Biết c&aacute;ch trang bị những năng lực quản trị cần thiết của một CEO</li>
	<li>Biết c&aacute;ch đạt được ho&agrave;i vọng của m&igrave;nh l&agrave; trở th&agrave;nh một CEO chuy&ecirc;n nghiệp</li>
</ul>

<p>&nbsp;</p>

<p>NỘI DUNG CHƯƠNG TR&Igrave;NH</p>

<p>&nbsp;</p>

<p>Chương tr&igrave;nh CEO &ndash; Gi&aacute;m đốc điều h&agrave;nh chuy&ecirc;n nghiệp Version 3.0 của PTI được thiết kế theo triết l&yacute; gi&aacute;o dục ri&ecirc;ng của PTI: PTI Educational Phylosophy &ndash; PEP. Trong đ&oacute;:&nbsp;Nội dung, mục ti&ecirc;u, t&iacute;nh chuẩn khoa học của m&ocirc;n học l&agrave; trung t&acirc;m, hướng tới một trọng t&acirc;m gi&aacute;o dục l&agrave;: Khiến học vi&ecirc;n muốn học, tự khuyến học, kh&aacute;t khao ứng dụng, tin tưởng v&agrave;o khoa học.</p>

<p>Tổ chức = (Cấu tr&uacute;c + C&ocirc;ng Nghệ + Chất Lượng)<br />
L&atilde;nh Đạo = (Cảm X&uacute;c + Tr&iacute; Tuệ + Tầm Nh&igrave;n)</p>

<p>Chương tr&igrave;nh đ&agrave;o tạo &ldquo; đặc biệt n&agrave;y &ldquo; được thiết kế theo cấu tr&uacute;c ph&acirc;n tầng.<br />
C&oacute; 3 ph&acirc;n tầng - hệ thống ch&iacute;nh th&ocirc;ng qua c&aacute;c m&ocirc;n đ&agrave;o tạo:<br />
Ph&acirc;n tầng tư tưởng | Ph&acirc;n tầng Căn bản | Phẩn tầng chuy&ecirc;n m&ocirc;n</p>

<p>&sect;&nbsp;Mỗi một ph&acirc;n tầng c&oacute; những chuy&ecirc;n đề đ&agrave;o tạo kh&aacute;c nhau được sắp xếp theo tr&igrave;nh tự để người học c&oacute; thể luận được &ldquo;c&aacute;i đạo của một CEO&rdquo; &amp; trả lời được c&acirc;u hỏi l&agrave; CEO l&agrave; phải l&agrave;m g&igrave; ?</p>

<p>&sect;&nbsp;Chương tr&igrave;nh c&oacute; thể được tổ chức v&agrave;o ban ng&agrave;y hoặc buổi tối. Thời lượng của c&aacute;c kh&oacute;a học l&agrave; như nhau, nhưng thời gian của mỗi kh&oacute;a c&oacute; thể k&eacute;o d&agrave;i 4 th&aacute;ng.</p>

<p>STT</p>

<p>CHUY&Ecirc;N ĐỀ/SUBJECT</p>

<p>THỜI LƯỢNG</p>

<p>Buổi</p>

<p>Tiết</p>

<p>01</p>

<p>B&agrave;n về sự học</p>

<p><em>Discussion on academic study</em></p>

<p>01</p>

<p>04</p>

<p>02</p>

<p>CEO - Nghề &amp; nghiệp</p>

<p><em>CEO - Job &amp; Career</em></p>

<p>01</p>

<p>04</p>

<p>03</p>

<p>Phương ph&aacute;p ph&aacute;t triển khả năng L&atilde;nh đạo</p>

<p><em>Leadership Development Program (LDP)</em></p>

<p>04</p>

<p>16</p>

<p>04</p>

<p>Chiến lược C&ocirc;ng ty</p>

<p><em>Corporate Strategy</em></p>

<p>04</p>

<p>16</p>

<p>05</p>

<p>X&acirc;y dựng hệ thống Quản l&yacute; C&ocirc;ng ty</p>

<p><em>Corporate Management System</em></p>

<p>04</p>

<p>16</p>

<p>06</p>

<p>X&acirc;y dựng Văn h&oacute;a C&ocirc;ng ty</p>

<p><em>Building Corporate Culture</em></p>

<p>02</p>

<p>08</p>

<p>07</p>

<p>Quản trị Nh&acirc;n lực d&agrave;nh cho L&atilde;nh đạo</p>

<p><em>Human Resourses Management for Leaders</em></p>

<p>04</p>

<p>16</p>

<p>08</p>

<p>Quản trị Marketing</p>

<p><em>Marketing Administration</em></p>

<p>02</p>

<p>08</p>

<p>09</p>

<p>Quản trị T&agrave;i ch&iacute;nh v&agrave; đầu tư d&agrave;nh cho L&atilde;nh đạo</p>

<p><em>Finance management and Investment for leaders</em></p>

<p>04</p>

<p>16</p>

<p>10</p>

<p>X&acirc;y dựng thương hiệu c&aacute; nh&acirc;n &amp; tổ chức</p>

<p><em>Personal branding &amp; Corporate branding</em></p>

<p>02</p>

<p>08</p>

<p>11</p>

<p>Chiến lược cạnh tranh</p>

<p><em>Competitive strategy</em></p>

<p>04</p>

<p>16</p>

<p>12</p>

<p>Hội thảo &amp; Chuy&ecirc;n đề</p>

<p><em>Đối thoại &amp; chia sẻ kinh nghiệm với Doanh nh&acirc;n,</em></p>

<p><em>chuy&ecirc;n gia h&agrave;ng đầu trong nước v&agrave; Quốc tế</em></p>

<p>01</p>

<p>04</p>

<p>13</p>

<p>Hội thảo kinh tế &amp; kinh doanh</p>

<p><em>Economic &amp; Business Seminars</em></p>

<p>02</p>

<p>08</p>

<p>14</p>

<p>&ldquo;Lễ t&ocirc;n vinh sự học của Doanh Nh&acirc;n&rdquo; &amp; Lễ trao &ldquo;chứng nhận tốt nghiệp&rdquo;</p>

<p><em>Convocation Ceremony</em></p>

<p>01</p>

<p>04</p>

<p>Tổng cộng</p>

<p>36</p>

<p>144</p>

<p>&nbsp;</p>

<p>TH&Ocirc;NG TIN KH&Oacute;A HỌC</p>

<p>THỜI GIAN<br />
- Khai giảng:&nbsp;20-11-2016<br />
- Lịch học:&nbsp;Ng&agrave;y Chủ Nhật<br />
- Thời gian:&nbsp;<br />
+ S&aacute;ng:&nbsp;8h30 -11h30<br />
+ Chiều:&nbsp;13h30 - 16h30<br />
- Thời lượng:&nbsp;4 th&aacute;ng<br />
- Kết th&uacute;c:&nbsp;20-03-2017<br />
<br />
ĐỊA ĐIỂM:&nbsp;Ph&ograve;ng học VIP, T&ograve;a nh&agrave; S&ocirc;ng Đ&agrave; - Đường Phạm H&ugrave;ng - Mễ Tr&igrave; - Mỹ Đ&igrave;nh - H&agrave; Nội&nbsp;<br />
<br />
HỌC PH&Iacute;:&nbsp;18.800.000 / Kh&oacute;a<br />
(Bao gồm cả Tea Break, chi ph&iacute; t&agrave;i liệu, in ấn, giảng vi&ecirc;n, chứng nhận)&nbsp;<br />
PH&Iacute; ƯU Đ&Atilde;I:&nbsp;Vui l&ograve;ng li&ecirc;n hệ<strong>&nbsp;Ms Ho&agrave;ng Th&uacute;y _ 0969 479 862</strong>&nbsp;để nhận được ph&iacute; tốt nhất</p>

<h3>NỘI DUNG CHƯƠNG TR&Igrave;NH</h3>

<p>Chương tr&igrave;nh CEO &ndash; Gi&aacute;m đốc điều h&agrave;nh chuy&ecirc;n nghiệp Version 3.0 của PTI được thiết kế theo triết l&yacute; gi&aacute;o dục ri&ecirc;ng của PTI: PTI Educational Phylosophy &ndash; PEP. Trong đ&oacute;:&nbsp;<strong>Nội dung, mục ti&ecirc;u, t&iacute;nh chuẩn khoa học của m&ocirc;n học l&agrave; trung t&acirc;m, hướng tới một trọng t&acirc;m gi&aacute;o dục l&agrave;: Khiến học vi&ecirc;n muốn học, tự khuyến học, kh&aacute;t khao ứng dụng, tin tưởng v&agrave;o khoa học.</strong></p>

<p><strong>Tổ chức = (Cấu tr&uacute;c + C&ocirc;ng Nghệ + Chất Lượng)</strong><br />
<strong>L&atilde;nh Đạo = (Cảm X&uacute;c + Tr&iacute; Tuệ + Tầm Nh&igrave;n)</strong></p>

<p>Chương tr&igrave;nh đ&agrave;o tạo &ldquo; đặc biệt n&agrave;y &ldquo; được thiết kế theo cấu tr&uacute;c ph&acirc;n tầng.<br />
C&oacute; 3 ph&acirc;n tầng - hệ thống ch&iacute;nh th&ocirc;ng qua c&aacute;c m&ocirc;n đ&agrave;o tạo:<br />
<strong>Ph&acirc;n tầng tư tưởng | Ph&acirc;n tầng Căn bản | Phẩn tầng chuy&ecirc;n m&ocirc;</strong>n</p>

<ul>
	<li>Mỗi một ph&acirc;n tầng c&oacute; những chuy&ecirc;n đề đ&agrave;o tạo kh&aacute;c nhau được sắp xếp theo tr&igrave;nh tự để người học c&oacute; thể luận được &ldquo;c&aacute;i đạo của một CEO&rdquo; &amp; trả lời được c&acirc;u hỏi l&agrave; CEO l&agrave; phải l&agrave;m g&igrave; ?</li>
	<li>Chương tr&igrave;nh c&oacute; thể được tổ chức v&agrave;o ban ng&agrave;y hoặc buổi tối. Thời lượng của c&aacute;c kh&oacute;a học l&agrave; như nhau, nhưng thời gian của mỗi kh&oacute;a c&oacute; thể k&eacute;o d&agrave;i 4 th&aacute;ng.</li>
</ul>

<p><strong>STT</strong><strong>CHUY&Ecirc;N ĐỀ/SUBJECT</strong><strong>THỜI LƯỢNG</strong><strong>Buổi</strong><strong>Tiết</strong><strong>01</strong><strong>B&agrave;n về sự học</strong></p>

<p>&nbsp;</p>

<p><em>Discussion on academic study</em></p>

<p><strong>01</strong><strong>04</strong><strong>02</strong><strong>CEO - Nghề &amp; nghiệp</strong></p>

<p>&nbsp;</p>

<p><em>CEO - Job &amp; Career</em></p>

<p><strong>01</strong><strong>04</strong><strong>03</strong><strong>Phương ph&aacute;p ph&aacute;t triển khả năng L&atilde;nh đạo</strong></p>

<p>&nbsp;</p>

<p><em>Leadership Development Program (LDP)</em></p>

<p><strong>04</strong><strong>16</strong><strong>04</strong><strong>Chiến lược C&ocirc;ng ty</strong></p>

<p>&nbsp;</p>

<p><em>Corporate Strategy</em></p>

<p><strong>04</strong><strong>16</strong><strong>05</strong><strong>X&acirc;y dựng hệ thống Quản l&yacute; C&ocirc;ng ty</strong></p>

<p>&nbsp;</p>

<p><em>Corporate Management System</em></p>

<p><strong>04</strong><strong>16</strong><strong>06</strong><strong>X&acirc;y dựng Văn h&oacute;a C&ocirc;ng ty</strong></p>

<p>&nbsp;</p>

<p><em>Building Corporate Culture</em></p>

<p><strong>02</strong><strong>08</strong><strong>07</strong><strong>Quản trị Nh&acirc;n lực d&agrave;nh cho L&atilde;nh đạo</strong></p>

<p>&nbsp;</p>

<p><em>Human Resourses Management for Leaders</em></p>

<p><strong>04</strong><strong>16</strong><strong>08</strong><strong>Quản trị Marketing</strong></p>

<p>&nbsp;</p>

<p><em>Marketing Administration</em></p>

<p><strong>02</strong><strong>08</strong><strong>09</strong><strong>Quản trị T&agrave;i ch&iacute;nh v&agrave; đầu tư d&agrave;nh cho L&atilde;nh đạo</strong></p>

<p>&nbsp;</p>

<p><em>Finance management and Investment for leaders</em></p>

<p><strong>04</strong><strong>16</strong><strong>10</strong><strong>X&acirc;y dựng thương hiệu c&aacute; nh&acirc;n &amp; tổ chức</strong></p>

<p>&nbsp;</p>

<p><em>Personal branding &amp; Corporate branding</em></p>

<p><strong>02</strong><strong>08</strong><strong>11</strong><strong>Chiến lược cạnh tranh</strong></p>

<p>&nbsp;</p>

<p><em>Competitive strategy</em></p>

<p><strong>04</strong><strong>16</strong><strong>12</strong><strong>Hội thảo &amp; Chuy&ecirc;n đề</strong></p>

<p>&nbsp;</p>

<p><em>Đối thoại &amp; chia sẻ kinh nghiệm với Doanh nh&acirc;n,</em></p>

<p><em>chuy&ecirc;n gia h&agrave;ng đầu trong nước v&agrave; Quốc tế</em></p>

<p><strong>01</strong><strong>04</strong><strong>13</strong><strong>Hội thảo kinh tế &amp; kinh doanh</strong></p>

<p>&nbsp;</p>

<p><em>Economic &amp; Business Seminars</em></p>

<p><strong>02</strong><strong>08</strong><strong>14</strong><strong>&ldquo;Lễ t&ocirc;n vinh sự học của Doanh Nh&acirc;n&rdquo; &amp; Lễ trao &ldquo;chứng nhận tốt nghiệp&rdquo;</strong></p>

<p>&nbsp;</p>

<p><em>Convocation Ceremony</em></p>

<p><strong>01</strong><strong>04</strong><strong>Tổng cộng</strong><strong>36</strong><strong>144</strong></p>
', N'TRƯỜNG ĐÀO TẠO DOANH NHÂN PTI', N'<p>Trường đ&agrave;o tạo doanh nh&acirc;n PTI l&agrave; th&agrave;nh vi&ecirc;n thuộc Tổ Chức Gi&aacute;o Dục chất lượng cao PTI, v&agrave; l&agrave; trường đ&agrave;o tạo doanh nh&acirc;n h&agrave;ng đầu tại Việt Nam hiện nay. PTI chuy&ecirc;n tổ chức &amp; cung cấp c&aacute;c chương tr&igrave;nh đ&agrave;o tạo chuy&ecirc;n nghiệp nhằm củng cố, n&acirc;ng cao, ph&aacute;t triển chuy&ecirc;n m&ocirc;n &amp; năng lực điều h&agrave;nh quản l&yacute; d&agrave;nh cho c&aacute;c doanh nh&acirc;n v&agrave; c&aacute;c chuy&ecirc;n vi&ecirc;n trong lĩnh vực kinh tế.Với kinh nghiệm đ&agrave;o tạo v&agrave; kiến thức chuy&ecirc;n m&ocirc;n s&acirc;u của đội ngũ giảng huấn &amp; c&aacute;c chuy&ecirc;n gia h&agrave;ng đầu trong nước, quốc tế, kết hợp với năng lực tổ chức dịch vụ gi&aacute;o dục chuy&ecirc;n nghiệp của m&igrave;nh, PTI cung cấp chương tr&igrave;nh đ&agrave;o tạo mang t&iacute;nh thực tiễn cao ph&ugrave; hợp với ph&aacute;t triển của x&atilde; hội. Sự kh&aacute;c biệt của PTI tạo ra m&ocirc;i trường học tập c&oacute; chất lượng vượt trội so với tất cả những trường đ&agrave;o tạo kh&aacute;c - nơi chủ yếu cung cấp c&aacute;c kh&oacute;a đ&agrave;o tạo ngắn hạn mang nặng t&iacute;nh nghi&ecirc;n cứu &amp; học thuật, kh&ocirc;ng đ&aacute;p ứng được nhu cầu thực tế của học vi&ecirc;n.</p>
', 465, N'trungkien3289@gmail.com', 1, 113, 0, N'Tòa Nhà Sông Đà', N' Phạm Hùng', NULL, N'Từ Liêm', N'Hà Nội', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (24, N'60cdafc8-7804-4a2d-8774-ce7e596787bb', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'WEB XONG TIỀN VỀ 5', CAST(0x0000A6C90083D858 AS DateTime), CAST(0x0000A6CB015A2480 AS DateTime), N'<p><strong>Quan trọng</strong>:&nbsp;<strong>D&agrave;nh cho những người muốn b&aacute;n h&agrave;ng v&agrave; kiếm tiền th&ocirc;ng qua Website theo c&aacute;ch ho&agrave;n to&agrave;n mới.</strong></p>

<p>Bạn kh&ocirc;ng cần l&agrave; chuy&ecirc;n gia mới c&oacute; thể đăng k&iacute; lớp học n&agrave;y của t&ocirc;i. Với ti&ecirc;u ch&iacute; đơn giản, dễ d&agrave;ng, hiệu quả, kh&oacute;a học 3 ng&agrave;y n&agrave;y sẽ gi&uacute;p bạn sở hữu một website của ri&ecirc;ng m&igrave;nh với những nội dung hấp dẫn người đọc.</p>

<p>Bạn sẽ phải đến kh&oacute;a học n&agrave;y của t&ocirc;i bởi v&igrave; n&oacute; chưa từng được tổ chức ở bất k&igrave; nơi n&agrave;o trước đ&acirc;y. Đ&iacute;ch th&acirc;n t&ocirc;i sẽ hướng dẫn bạn từng bước cụ thể để tạo ra một website v&agrave; x&acirc;y dựng nội dung để l&ocirc;i k&eacute;o kh&aacute;ch h&agrave;ng mục ti&ecirc;u bằng những giao diện đẹp mắt, tinh tế, ph&ugrave; hợp với sản phẩm, với những lời ch&agrave;o h&agrave;ng hoặc marketing sản phẩm hấp dẫn đến kh&oacute; cưỡng, gi&uacute;p bạn c&oacute; thể kiếm được h&agrave;ng triệu đ&ocirc;.</p>

<p><strong>Bạn sẽ học được:</strong></p>

<ul>
	<li>C&aacute;ch x&acirc;y dựng một website hấp dẫn kh&aacute;ch h&agrave;ng. Bạn sẽ kh&ocirc;ng phải mất 5 năm ngồi m&ograve;n ghế nh&agrave; trường m&agrave; vẫn c&oacute; được một trang web của ri&ecirc;ng m&igrave;nh.</li>
	<li>Tạo ra những nội dung mới, độc, lạ v&agrave; hấp dẫn cho website, gi&uacute;p bạn x&acirc;y dựng h&igrave;nh ảnh c&aacute; nh&acirc;n v&agrave; thương hiệu sản phẩm, biến website trở th&agrave;nh c&ocirc;ng cụ b&aacute;n h&agrave;ng v&agrave; Marketing tuyệt vời.</li>
	<li>L&agrave;m c&aacute;ch n&agrave;o để sống tại Việt Nam m&agrave; vẫn c&oacute; thể kiếm tiền từ bất k&igrave; nơi n&agrave;o tr&ecirc;n thế giới th&ocirc;ng qua&nbsp;by PhraseFinder&quot;&gt; by PhraseFinder&quot; rel=&quot;nofollow&quot;&gt; by PhraseFinder&quot;&gt; by PhraseFinder&quot; href=&quot;http://long.vn/khoa-hoc-web-xong-tien-ve/#&quot;&gt;CLICKBANK<img alt="" src="https://s.evbuc.com/https_proxy?url=http%3A%2F%2Fcdncache-a.akamaihd.net%2Fitems%2Fit%2Fimg%2Farrow-10x10.png&amp;sig=ADR2i7_IHnvZwcfHtf_NcObK5dC9SBvU0A" />.</li>
	<li>C&oacute; được lượng kh&aacute;ch h&agrave;ng mục ti&ecirc;u th&ocirc;ng qua mạng x&atilde; hội Facebook, Twitter hay Blogspot.</li>
	<li>Những b&iacute; quyết để việc c&ocirc;ng việc của bạn đơn giản h&oacute;a, tự động h&oacute;a</li>
	<li>V&agrave; c&ograve;n nhiều điều tuyệt vời hơn thế&hellip;</li>
</ul>

<p>Kh&ocirc;ng những trang bị cho bạn những chỉ dẫn để h&agrave;nh động, t&ocirc;i c&ograve;n gi&uacute;p bạn hiểu rằng bạn kh&ocirc;ng đơn thuần chỉ b&aacute;n một sản phẩm, dịch vụ m&agrave; ch&iacute;nh l&agrave; trao đi gi&aacute; trị, giải ph&aacute;p cho một vấn đề hay cung cấp sự thỏa m&atilde;n cho một nhu cầu thực tế.</p>

<h3><strong>Kh&oacute;a học WEB XONG TIỀN VỀ</strong></h3>

<h3><strong>Thực sự ĐI&Ecirc;N CUỒNG</strong></h3>

<p>&nbsp;</p>

<p>Thời gian: 08:00 &ndash; 20:00 ng&agrave;y 25,26,27/11/2016</p>

<p>Địa điểm: Trung t&acirc;m Phụ nữ v&agrave; Ph&aacute;t triển. Số 20 Thụy Khu&ecirc;, T&acirc;y Hồ, H&agrave; Nội</p>

<p><strong>Bởi v&igrave; n&oacute; l&agrave; kho&aacute; học cực kỳ đi&ecirc;n cuồng của t&ocirc;i n&ecirc;n mức gi&aacute; cũng đi&ecirc;n cuồng</strong></p>

<p>38.868.000 VND</p>

<p><strong>sẽ d&agrave;nh được d&agrave;nh tặng ri&ecirc;ng cho 20 người đăng k&yacute; đầu ti&ecirc;n</strong></p>

<p>Bạn sẽ chẳng học được ở đ&acirc;u tr&ecirc;n thế giới n&agrave;y, những<strong>&nbsp;B&Iacute; QUYẾT</strong>m&agrave; t&ocirc;i sẽ chia sẻ cho bạn trong lớp học&nbsp;<strong>KHỦNG</strong>&nbsp;cuối tuần n&agrave;y đ&acirc;u, bởi v&igrave; n&oacute; được t&ocirc;i luyện, r&egrave;n giũa v&agrave; được đ&uacute;c kết từ ch&iacute;nh trải nghiệm trong c&ocirc;ng việc của t&ocirc;i. V&agrave; việc của bạn l&agrave; đăng k&yacute; ngay tại đ&acirc;y để c&oacute; thể ph&aacute;t huy được hết tiềm năng của bạn v&agrave; bạn sẽ đạt được kết quả giống như t&ocirc;i.</p>

<p>Gọi Số Hotline: (04)3537.4748 &ndash; 094.742.8338 để đăng k&yacute; v&agrave; đặt v&eacute;.</p>
', N'Luật sư PHẠM THÀNH LONG', N'<p>Luật sư Phạm Th&agrave;nh Long l&agrave; người s&aacute;ng lập C&ocirc;ng ty Luật Gia Phạm. Với hơn 15 năm kinh nghiệm trong chuy&ecirc;n ng&agrave;nh luật Kinh doanh v&agrave; Luật Sở hữu tr&iacute; tuệ, &ocirc;ng đ&atilde; gi&uacute;p đỡ hơn 34.000 lượt doanh nh&acirc;n ph&aacute;t triển c&ocirc;ng việc kinh doanh của họ.</p>

<p>Trong thời gian gần đ&acirc;y, với vai tr&ograve; l&agrave; người n&oacute;i chuyện trước c&ocirc;ng ch&uacute;ng, luật sư Phạm Th&agrave;nh Long đang l&agrave; một &quot;hiện tượng&quot; thu h&uacute;t h&agrave;ng ng&agrave;n Doanh nh&acirc;n tham gia mỗi chương tr&igrave;nh của &ocirc;ng. C&aacute;c học vi&ecirc;n tham dự chương tr&igrave;nh đều tạo n&ecirc;n những đột ph&aacute; trong cuộc đời của họ.</p>

<p>Điều đặc biệt l&agrave;, mặc d&ugrave; tạo ra những thay đổi mạnh mẽ cho c&aacute;c doanh nh&acirc;n, nhưng hầu hết c&aacute;c chương tr&igrave;nh của &ocirc;ng đều Miễn Ph&iacute;.</p>
', 466, N'trungkien3289@gmail.com', 11, 108, 0, N'Trung tâm Phát triển và Phụ nữ', N'20  Thụy Khuê', NULL, N'Ba Đình', N'Hà Nội', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (25, N'5839a2a8-7e7d-4888-94be-2df8471e007b', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Free to play Cashflow 101 (In English)', CAST(0x0000A6C200E6E8E4 AS DateTime), CAST(0x0000A6C201185F00 AS DateTime), N'<p>CASHFLOW was created to teach you to be the master of money.</p>

<p>Robert kiyosaki wrote this book Rich Dad Poor Dad, the #1 Personal Finance book of all time, tells the story of Robert Kiyosaki and his two dads&mdash;his real father and the father of his best friend, his rich dad&mdash;and the ways in which both men shaped his thoughts about money and investing. The book explodes the myth that you need to earn a high income to be rich and explains the difference between working for money and having your money work for you.</p>

<p>In this game,you will learn about:</p>

<p>* Understanding of Assets vs. Liabilities&nbsp;<br />
* What the Rich teach their children&nbsp;<br />
* How to increase your financial intelligence etc</p>

<p>It is a good opportunity for those who want to improve your english and advice to have some basics in english to be able to have fun playing the game.</p>
', N'Vincent Lim', N'<p>A Singaporean student of Robert Kiyosaki and believes that everyone should be taught about financial education.Currently into business and forex trading as my asset classes.</p>
', 467, N'trungkien3289@gmail.com', 14, 119, 0, N'Sgarden Coworking Space Số 19 Ngõ 376', NULL, NULL, N'Thanh Xuân', N'Hà Nội', NULL, N'VN', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (26, N'7e004b4c-f57d-4fdb-8d25-e82f5522dae8', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 468, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (27, N'd396e4e5-3789-4890-abc5-6b66c733013c', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 469, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (28, N'78a9d87b-49ca-4851-89d5-9d403011a580', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 470, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (29, N'2ab821be-dd63-4473-b078-471778745030', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 471, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (30, N'3e562ce3-c48f-4b2d-ba55-9c53cf41a3a9', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 472, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (31, N'998bfbad-5ce2-4844-a8de-a79b7199de32', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 473, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (32, N'de64dd1e-3b27-4c88-9e23-2c9b16dc13e1', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 474, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (33, N'6e85b9de-2490-4a2b-ac04-4ca0589953f7', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 475, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (34, N'251f85b1-0cf0-42a5-8d05-74f002eb8035', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 476, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (35, N'61f2125b-72c9-47f0-bbfb-7eefe5fc098c', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 477, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (36, N'd1a21f78-5979-45d6-bd1c-d12c2e1ea049', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 478, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (37, N'01d79cfb-04e4-44d9-8be6-19dcdae536c9', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 479, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (38, N'd6ca76ed-1f15-4a0a-b1f2-6b91a7f760ad', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 480, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (39, N'a305651f-ba95-4650-847e-79272a9f6b3c', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD0083F34C AS DateTime), CAST(0x0000A6CD00B578A4 AS DateTime), N'<h3>&nbsp;</h3>

<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>

<p>Feel free to contact us with any questions: emeaevents@neotechnology.com</p>
', 481, N'emeaevents@neotechnology.com', 6, 105, 0, N'Haymarket Hotel', N'1  Suffolk Place', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (40, N'89f84e2e-8d7d-46c8-8d40-ee88ba0430f1', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'Neo4j GraphTalks - London', CAST(0x0000A6CD00737D3C AS DateTime), CAST(0x0000A6CD00B56F44 AS DateTime), N'<p><strong><img alt="GraphTalks" src="https://cdn.evbuc.com/eventlogos/129058261/graphtalksrgb.png" /></strong></p>

<p>&nbsp;</p>

<p><strong>GraphTalks - Customer 360</strong></p>

<p>Join us for a complimentary breakfast seminar that will unveil new business possibilities.</p>

<p>The Neo4j graph database is the fastest growing database engine in the market and has hundreds of customer references across Europe and globally, solving significant technology problems for large Enterprises in Finance, Telco, Retail, Utilities, Logistics and Internet sectors. Typical use cases are Recommendations, Fraud Detection, MDM, Network and Software Analysis and Optimization, Identity and Access Management.</p>

<p>This introductory event is to explore the possible usage of a graph database in your enterprise. We will explain at high-level the key concepts of Neo4j and some of the key use cases, along with case studies from partners and customers with a focus on how to get a better view of customers using graphs. We have the pleasure to have with us speakers from&nbsp;<strong>Cerved</strong>&nbsp;and&nbsp;<strong>GBG</strong>&nbsp;who will provide us with their insights into the world of Graphs.</p>

<p>&nbsp;</p>

<p><strong>This event is for IT Decision Makers, Project Managers, Architects, Head of Business Units, etc.</strong></p>

<p>&nbsp;</p>

<p><em>For any questions, please email:</em><a href="mailto:emeaevents@neotechnology.com" target="_blank"><em>emeaevents@neotechnology.com</em></a></p>

<p>&nbsp;</p>

<p><strong>AGENDA:</strong></p>

<p><strong>8:30 - 9:00 am -&nbsp;</strong>Breakfast Networking - Welcome</p>

<p><strong><strong>9:00 - 9:10 am -</strong></strong>&nbsp;Introduction -&nbsp;Anthony Flynn, Sales Manager UK - Neo4j</p>

<p><strong><strong>9:10 - 09:40 am -&nbsp;</strong></strong>Graph your business! Jes&uacute;s Barrasa, Senior Field Engineer - Neo4j</p>

<p><strong><strong>09:40 - 10:10 am -&nbsp;</strong></strong>Total Customer View - Scott Benson - Solution Architect - GBG</p>

<p><em>How we at GBG have evolved our customers from flat single dimension representations to multi-dimensional beings that represent our current highly interactive world.</em>&nbsp;</p>

<p><strong>10:10 - 10:40 am</strong>&nbsp;- The italian business graph: Fueling business innovation in Finance - Stefano Gatti - Innovation &amp; Data Sources Manager - Cerved</p>

<p><em>Starting from a real business case, Cerved will present how they improved their system to identify the &lsquo;real owner&rsquo; of a business in a faster and cheaper way. The Italian company has built up an infrastructure based on Neo4j that helps to deliver new business cases in a innovative and persuasive way as well as from an organizational perspective. A focus will be made on how Neo4j has been used as a data exploration tool for datascientists and business analysts at Cerved.</em></p>

<p><strong><strong>10:40 - 11:00 am -&nbsp;</strong></strong>Q&amp;A</p>

<p><strong><strong>11:00 am -&nbsp;</strong></strong>Closing &amp; Networking</p>
', N'Neo4j', N'<p>Organiser of Neo4j GraphTalks - London</p>
', 482, N'emeaevents@neotechnology.com', 19, 103, 0, N'Haymarket Hotel', N'1  Suffolk Street', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (41, N'80f06e11-c807-46d4-ab8e-4cfba6ac2040', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'GDG Hackathon 2 : Female v Male Developers', CAST(0x0000A6CA00A50AC8 AS DateTime), CAST(0x0000A6CA01499BB0 AS DateTime), N'<p>It is the time for the both women and men show the world they can code. GDG Hackathon 2!</p>

<p>We will still keep the essence of what you have come to appreciate with the hackathon. It will still be a hackathon for developers by developers without all the fluff! This time, however, we will split into two groups (female and male). The groups will subsequently form teams. And at the end of the day, groups select their strongest teams to present their projects for a code battle!</p>

<p>Competition aside, we will all informally share perspectives and continue to ensure GDG Hackathons continue to be welcoming for everyone.</p>

<p>Follow us on twitter: @GDGCloud @GDGHackathon</p>

<p>Join our community! https://www.meetup.com/gdgcloud/</p>
', N'GDG Hackathon', N'<p>Organizer of GDG Hackathon 2 : Female v Male Developers</p>
', 483, N'trungkien3289@gmail.com', 19, 106, 0, N'Campus London', N'4-5 Bonhill Street', NULL, N'Greater London', N'England', NULL, N'GB', 1, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (42, N'1a6e2dfd-087f-4046-bad9-d6cfee851e5e', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'GDG Hackathon 2 : Female v Male Developers', CAST(0x0000A6CA00A50AC8 AS DateTime), CAST(0x0000A6CA01499BB0 AS DateTime), N'<p>It is the time for the both women and men show the world they can code. GDG Hackathon 2!</p>

<p>We will still keep the essence of what you have come to appreciate with the hackathon. It will still be a hackathon for developers by developers without all the fluff! This time, however, we will split into two groups (female and male). The groups will subsequently form teams. And at the end of the day, groups select their strongest teams to present their projects for a code battle!</p>

<p>Competition aside, we will all informally share perspectives and continue to ensure GDG Hackathons continue to be welcoming for everyone.</p>

<p>Follow us on twitter: @GDGCloud @GDGHackathon</p>

<p>Join our community! https://www.meetup.com/gdgcloud/</p>
', N'GDG Hackathon', N'<p>Organizer of GDG Hackathon 2 : Female v Male Developers</p>
', 484, N'trungkien3289@gmail.com', 19, 106, 0, N'Campus London', N'4-5 Bonhill Street', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (43, N'2a94b4fa-9bd1-4e3e-9c85-2136bb5ad698', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'GDG Hackathon 2 : Female v Male Developers', CAST(0x0000A6CA00A50AC8 AS DateTime), CAST(0x0000A6CA01499BB0 AS DateTime), N'<p>It is the time for the both women and men show the world they can code. GDG Hackathon 2!</p>

<p>We will still keep the essence of what you have come to appreciate with the hackathon. It will still be a hackathon for developers by developers without all the fluff! This time, however, we will split into two groups (female and male). The groups will subsequently form teams. And at the end of the day, groups select their strongest teams to present their projects for a code battle!</p>

<p>Competition aside, we will all informally share perspectives and continue to ensure GDG Hackathons continue to be welcoming for everyone.</p>

<p>Follow us on twitter: @GDGCloud @GDGHackathon</p>

<p>Join our community! https://www.meetup.com/gdgcloud/</p>
', N'GDG Hackathon', N'<p>Organizer of GDG Hackathon 2 : Female v Male Developers</p>
', 485, N'trungkien3289@gmail.com', 19, 106, 0, N'Campus London', N'4-5 Bonhill Street', NULL, N'Greater London', N'England', NULL, N'GB', 2, 1, 0)
INSERT [dbo].[event_Event] ([Id], [Guid], [OwnerId], [Title], [StartDate], [EndDate], [Description], [OrganizationName], [OrganizationDescription], [CoverImageId], [PaymentEmail], [EventType], [EventTopic], [IsShowRemainingNumberTicket], [Location_StreetName], [Location_Address], [Location_Address2], [Location_City], [Location_State], [ZipCode], [Country], [Status], [SortOrder], [IsVerified]) VALUES (44, N'ddb46e6f-f39b-4616-b700-f0526374788e', N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'DEVOPS AND CONTINUOUS DELIVERY FOR MANAGERS- from ', CAST(0x0000A6BE00631FC8 AS DateTime), CAST(0x0000A6BE016A9388 AS DateTime), N'<h3>Understand exactly what is happening in your business, from your systems generated data to each and every click from your users.</h3>

<p>Companies want innovative solutions to business problems, often turning ideas into products and services at a very fast pace. To achive this they trying to apply Agile and similar methodologies, but are still finding it difficult to meet the challenges of development and delivery. With all the new methodologies, getting software released to users is still too often a risky, painful and time-consuming endeavor. This is a challenge for both small and big companies.</p>

<p>Continuous delivery brings principles that are already prevalent in most successful organizations, improvements on how products are built, deployed and tested. Better definitions about improving how to do development, testing and operations of products and services.</p>

<p>DevOps may seem a buzzword to many, but it is essential business-driven delivery approach. It involves the business owner as well as the development, operations, and quality assurance departments to collaborate in continuously deliver the software /product/service. The continuity helps the company to gain market advantage, which is vital in today&rsquo;s market condition.</p>
', N'DevopsPro', N'<p>DevOps Pro provides tech training services to help organizations and individuals adopt the best industry practices in order to improve their development and deployment operations.</p>

<p>The training sessions are professionally crafted to meet the requirements of Startups, SMB&rsquo;s and enterprise companies and are aimed to serve functions such as technical managers, technical experts, software developers and software engineers</p>
', 486, N'trungkien3289@gmail.com', 10, 115, 0, N'Google campus', N'5  Bonhill Street', NULL, N'Greater London', N'England', NULL, N'GB', 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[event_Event] OFF
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (13, N'dd9f9430-b789-4037-8770-bd67e0945ed7')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (17, N'dd9f9430-b789-4037-8770-bd67e0945ed7')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (19, N'dd9f9430-b789-4037-8770-bd67e0945ed7')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (20, N'109b6373-4e29-4fec-bb53-e2cbee2416e9')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (22, N'109b6373-4e29-4fec-bb53-e2cbee2416e9')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (23, N'109b6373-4e29-4fec-bb53-e2cbee2416e9')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (23, N'dd9f9430-b789-4037-8770-bd67e0945ed7')
INSERT [dbo].[event_EventBookMark] ([EventId], [UserId]) VALUES (25, N'109b6373-4e29-4fec-bb53-e2cbee2416e9')
SET IDENTITY_INSERT [dbo].[event_Order] ON 

INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (1, N'8b21a030-ad44-45fc-bb7e-d1ade59c8ac6', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (2, N'7748d514-5b36-41f0-b555-99c0df02d1cc', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (3, N'5d27ff95-d2b5-4ecc-a8ac-e34471fbbcbd', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B80185819D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (4, N'781f84a8-06c9-453d-835c-3fc72cf9d624', 15, NULL, NULL, NULL, NULL, 1, CAST(0x0000A6B80188DC09 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (5, N'fe646ab7-dace-4a43-a9c2-8740bc2d7fb0', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B901553461 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (6, N'7188da34-2ec4-4dff-9ac4-fb6c67203003', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9015DFBCF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (7, N'cca09554-d5e3-4f4c-83af-9f4ed7f01088', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9015E7D1A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (8, N'b78b2026-447d-4edd-a6b9-714cfa7cba40', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9015F0987 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (9, N'3d05ce6f-6a62-4874-8ca5-201cc5f7b2a5', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9015F7F24 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (10, N'9677673a-fb75-475d-90ac-9f55c40f7523', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9016D447D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (11, N'077456f4-567b-49d0-b920-7165728bc9b0', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9016D9241 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (12, N'cf2f6afd-74ef-4bd4-89a4-8acd5a58519e', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B90171C502 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (13, N'a1dbcc2c-b748-45dd-9cae-919027d01820', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9017C5276 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (14, N'65516370-d020-4758-aa4c-3ced1f6a7f6d', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9017ED814 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (15, N'841a518a-aaf7-4d0e-8ca7-b23f316d5694', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B9017F5261 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (16, N'ec246390-d151-4c4d-b8e8-63704ad871d4', 15, NULL, NULL, NULL, NULL, 1, CAST(0x0000A6B9017FF231 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (17, N'aa8d1a85-7eea-4d6b-8243-930b5cde3cff', 15, NULL, NULL, NULL, NULL, 2, CAST(0x0000A6B901848BE7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (18, N'35ee4018-bc78-45e1-be86-2364516665e5', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B901875323 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (19, N'a5676306-353f-49ff-88e8-b62c51898af6', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6B901884567 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (20, N'68cd746c-4a43-4e4c-9bb1-a450d25f3123', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BA014FF799 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (21, N'42c9cc80-5300-4fc7-8d46-393d7bff1e98', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BA01643E48 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (22, N'62649405-cd81-4e54-b570-c29eed8fdf34', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BA0164C375 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (23, N'13c5ea82-5a6c-4929-8919-d27651051dff', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BA01659F60 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (24, N'7dbef2d0-141d-4920-a4fc-6f2dcf2c58bd', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BA01665498 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (25, N'1c7c619d-d7f8-48cc-b7e3-285bb9d936b7', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BA01666DFD AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (26, N'bbf132c4-d7cd-4d79-8470-3150907f663c', 13, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BD00E375F5 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (27, N'3d379eec-08f2-40e0-bfa9-1d1e1f38323e', 13, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BD00E52FDF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (28, N'7c9479d1-5062-4868-ac2c-e9204c8faa9e', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BD01042D0A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (29, N'c6a89f73-4e2f-412b-aa1c-ab535f921f98', 15, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6BD012433F6 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (30, N'ec6053e3-8f40-4c79-9ddb-e3026b9713aa', 7, NULL, NULL, NULL, NULL, 1, CAST(0x0000A6BD017A7806 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (31, N'1a111263-b2ce-453a-9f26-03dff0638d8b', 25, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6C10186871C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (32, N'1589e3b3-d3f4-4357-ad94-5b29ff33e183', 13, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6C6013ADC02 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (33, N'0a12cc8f-8ed5-460f-9370-ad66228c22bb', 13, NULL, NULL, NULL, NULL, 1, CAST(0x0000A6C6013CD206 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (34, N'2bcf8716-55fa-44c6-9e13-e5b14a63922b', 13, NULL, NULL, NULL, NULL, 0, CAST(0x0000A6C6013F5894 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (35, N'1e03486c-06f0-4552-9d7f-a28fa4f3a651', 22, NULL, NULL, NULL, NULL, 1, CAST(0x0000A6C801715542 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (36, N'550b6f5a-fd3c-47fe-93a0-092d1081433f', 22, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 1, CAST(0x0000A6C8017A698D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (37, N'd237bbad-2c88-4f81-8b42-01006dfc35e7', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 1, CAST(0x0000A6C901712F8D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (38, N'c0a0a7fb-4185-434e-8fc2-e34a5c26ccde', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6C9017991DE AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (39, N'd4cba550-4a88-4917-a52c-1e1697093429', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 1, CAST(0x0000A6CA00C8048D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (40, N'ad1579e2-5c4d-436b-8e00-98cc187dd107', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00C8399E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (41, N'8000867f-98fe-4111-b0b9-b58c52d61a31', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00E128CF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (42, N'15370b61-a93f-40ac-a757-c5e9397b598b', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00E387C9 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (43, N'fc02a514-2bff-420a-a965-121c6fb88834', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00E3AEE6 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (44, N'62f4e50a-496d-4dbd-bdfa-a449745aa2d8', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00E3EBDA AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (45, N'547088ec-80c6-4794-82ee-05b0c777c9cf', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00E41695 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (46, N'8d754f70-2f84-453f-a504-9067dc83435a', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00F4E8AD AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (47, N'7e6f9738-6dc7-4069-aed7-42b45d11c53f', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00F6570B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (48, N'bd4ac01f-b501-4a5f-977b-3329c3bedddc', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00FA704D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (49, N'ef648c41-ff47-4f29-a0a5-7267358b52c0', 13, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00FCAEB6 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (50, N'6575b44d-6c77-4b62-be6f-62786f68f9d7', 23, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA00FFCAF0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (51, N'0123c93d-d119-4b7f-a173-4b58f027c143', 23, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA0102285D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (52, N'ec7d8c44-93dd-4873-bb30-359729eeb311', 23, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CA01047E61 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (53, N'9f110c43-3bf2-4860-b3f0-76e4b953714b', 25, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 1, CAST(0x0000A6CA0116E7ED AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (54, N'eff56701-dfc0-4367-a485-1356f72508d8', 25, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 1, CAST(0x0000A6CA011D0DAA AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (55, N'b9a1a49b-9f97-4a00-9c71-ff83f6a5f27e', 13, N'dd9f9430-b789-4037-8770-bd67e0945ed7', NULL, NULL, NULL, 0, CAST(0x0000A6CB00D89D7A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (56, N'c3ed961c-c1c9-4ecd-948c-b45146bbcb1a', 23, N'dd9f9430-b789-4037-8770-bd67e0945ed7', NULL, NULL, NULL, 0, CAST(0x0000A6CB00E1516B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (57, N'67c7f8d4-f7de-4f39-a3e9-a24abdc51b97', 23, N'dd9f9430-b789-4037-8770-bd67e0945ed7', NULL, NULL, NULL, 1, CAST(0x0000A6CB00E1D8F0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (58, N'43a4bc2a-e0ec-445d-8b61-ea252736eac9', 19, N'dd9f9430-b789-4037-8770-bd67e0945ed7', N'Kien', N'Trinh', N'crusorobinson@gmail.com                                                                                                                                                                                 ', 1, CAST(0x0000A6CB00EF2391 AS DateTime), N'01238742227', N'165 Hoang Dieu', NULL, N'Da Nang', N'VN', N'165 Hoang Dieu', NULL, N'Da Nang', N'VN')
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (59, N'3c86d0fb-ab18-430c-b543-009671de18ff', 23, N'dd9f9430-b789-4037-8770-bd67e0945ed7', N'asd', N'asd', N'crusorobinson@gmail.com                                                                                                                                                                                 ', 1, CAST(0x0000A6CB00F27FD2 AS DateTime), N'asd', N'asd', N'asd', N'asd', N'GB', N'asd', N'asd', N'asd', N'GB')
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (60, N'1b5d1cc4-5196-4290-80e6-1c6128963f24', 23, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CB00F336F7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (61, N'af3af451-d88d-48c2-b32d-a57c827dd288', 23, N'dd9f9430-b789-4037-8770-bd67e0945ed7', NULL, NULL, NULL, 0, CAST(0x0000A6CB00F664D2 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[event_Order] ([Id], [Guid], [EventId], [UserId], [FirstName], [LastName], [EmailAddress], [Status], [OrderTime], [PhoneNumber], [Billing_Address], [Billing_Address2], [Billing_City], [Billing_Country], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Shipping_Country]) VALUES (62, N'9ffc27dc-bb56-44b0-854c-c04ac1eed753', 23, N'109b6373-4e29-4fec-bb53-e2cbee2416e9', NULL, NULL, NULL, 0, CAST(0x0000A6CB00F7F589 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (9, 13, N'00000000-0000-0000-0000-000000000000', N'kaka2', 12, 12, N'                                                                                                                                            kaka2
                        
                        
                        
                        
                        ', 1, 0, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A69D015E1B58 AS DateTime), CAST(0x0000A69C015E1C84 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (10, 14, N'00000000-0000-0000-0000-000000000000', N'VIP', 20, 20, N'                                                        for VIP
                        
                        ', 1, 2, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A6B30164F220 AS DateTime), CAST(0x0000A6C20164F5A4 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (11, 15, N'00000000-0000-0000-0000-000000000000', NULL, 12, 12, N'                                                                                    ki
                        
                        
                        ', 1, 0, 0, 0, 1, 10, N'abc', 1, 1, 0.0000, CAST(0x0000A6BB017A36A8 AS DateTime), CAST(0x0000A6C2017A3900 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (12, 16, N'20851df3-355a-4485-8d84-b49114771ac8', N'normal', 12, 12, N'lala', 1, 0, 0, 0, 1, 10, N'20851df3-355a-4485-8d84-b49114771ac8', 1, 1, 0.0000, CAST(0x0000A6C000E62080 AS DateTime), CAST(0x0000A6C900E622D8 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (13, 17, N'6900a8bb-5ada-493e-8e90-c035e62b366d', N'free ticket', 100, 100, N'                            free ticket
                        ', 1, 0, 0, 0, 1, 10, N'6900a8bb-5ada-493e-8e90-c035e62b366d', 1, 1, 0.0000, CAST(0x0000A6C30128B0BC AS DateTime), CAST(0x0000A6C40128B56C AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (14, 18, N'4b220343-f852-47db-babe-5adeb99e4567', N'Quan tri cuoc doi free', 20, 20, NULL, 1, 0, 0, 0, 1, 10, N'4b220343-f852-47db-babe-5adeb99e4567', 1, 1, 0.0000, CAST(0x0000A6E2006318C0 AS DateTime), CAST(0x0000A6C4015A11C0 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (15, 19, N'4413bffe-e44c-4778-9167-9c0ce1d76057', N'MXV 2017', 150, 150, NULL, 1, 0, 0, 0, 1, 10, N'4413bffe-e44c-4778-9167-9c0ce1d76057', 1, 1, 0.0000, CAST(0x0000A7FF017DB850 AS DateTime), CAST(0x0000A809017DBF58 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (16, 20, N'b1a9ad67-4592-4fd9-b142-dbfa03818f75', N'Free ticket', 40, 40, NULL, 1, 0, 0, 0, 1, 10, N'b1a9ad67-4592-4fd9-b142-dbfa03818f75', 1, 1, 0.0000, CAST(0x0000A75D009494B8 AS DateTime), CAST(0x0000A75E01392CA8 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (17, 21, N'41bbdb4d-c2c6-4348-a1f1-0414e3316e93', N'Normal', 20, 20, NULL, 1, 0, 0, 0, 1, 10, N'41bbdb4d-c2c6-4348-a1f1-0414e3316e93', 1, 1, 2.0000, CAST(0x0000A6C30083F478 AS DateTime), CAST(0x0000A6C4013941C0 AS DateTime), 1)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (18, 22, N'7025a561-8a85-4fd7-8bf8-c060558e4c83', N'Khởi tạo doanh nghiệp', 100, 100, NULL, 1, 0, 0, 0, 1, 10, N'7025a561-8a85-4fd7-8bf8-c060558e4c83', 1, 1, 361.0000, CAST(0x0000A6D000840030 AS DateTime), CAST(0x0000A6D001395228 AS DateTime), 1)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (19, 23, N'fd5ef59d-7354-4f96-8a90-cc3fc5894536', N'Free ticket', 30, 30, NULL, 1, 0, 0, 0, 1, 10, N'fd5ef59d-7354-4f96-8a90-cc3fc5894536', 1, 1, 0.0000, CAST(0x0000A6C20083FB80 AS DateTime), CAST(0x0000A6C3015A3E48 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (20, 24, N'65365359-9634-4514-9184-af1f38ac9cbf', N'General', 100, 100, NULL, 1, 0, 0, 0, 1, 10, N'65365359-9634-4514-9184-af1f38ac9cbf', 1, 1, 1330.0000, CAST(0x0000A6C100738C78 AS DateTime), CAST(0x0000A6C101395804 AS DateTime), 1)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (21, 25, N'6b0552ec-ba9f-42a1-9f6c-11b985a0953f', N'Free', 12, 12, NULL, 1, 0, 0, 0, 1, 10, N'6b0552ec-ba9f-42a1-9f6c-11b985a0953f', 1, 1, 0.0000, CAST(0x0000A6BC00630024 AS DateTime), CAST(0x0000A6C101394418 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (22, 26, N'5ffccd50-6571-48f7-aec0-f7e19d736582', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'5ffccd50-6571-48f7-aec0-f7e19d736582', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (23, 27, N'76a11cb1-b7be-42b7-aa8f-2305fcf8ae68', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'76a11cb1-b7be-42b7-aa8f-2305fcf8ae68', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (24, 28, N'cfef7d21-08f3-4a1a-aed1-1581b55c9c8d', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'cfef7d21-08f3-4a1a-aed1-1581b55c9c8d', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (25, 29, N'ba6b43e8-2942-4904-ab98-cb76dd40a526', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'ba6b43e8-2942-4904-ab98-cb76dd40a526', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (26, 30, N'9dcc8fac-f4b4-4495-b389-faca6ed20cf2', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'9dcc8fac-f4b4-4495-b389-faca6ed20cf2', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (27, 31, N'9bd5a7bd-11a7-42f3-94d3-55d1f42263ea', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'9bd5a7bd-11a7-42f3-94d3-55d1f42263ea', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (28, 32, N'67792ee4-65a0-4d1d-ad7a-7345d6db7bac', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'67792ee4-65a0-4d1d-ad7a-7345d6db7bac', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (29, 33, N'983260f1-e7d2-44a6-b1f7-e8ef7f4c52cf', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'983260f1-e7d2-44a6-b1f7-e8ef7f4c52cf', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (30, 34, N'c1f47a4f-adea-44cf-ba61-e88c07e1e031', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'c1f47a4f-adea-44cf-ba61-e88c07e1e031', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (31, 35, N'f2be202d-a808-47a2-9611-6de95ddbffbf', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'f2be202d-a808-47a2-9611-6de95ddbffbf', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (32, 36, N'5b8947e4-d973-4fd8-ba66-1eb5a83f1a95', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'5b8947e4-d973-4fd8-ba66-1eb5a83f1a95', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (33, 37, N'0687a848-4227-4f5c-92a2-cd537e37126e', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'0687a848-4227-4f5c-92a2-cd537e37126e', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (34, 38, N'9afed673-51f4-478c-9b74-3ed6056f67a1', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'9afed673-51f4-478c-9b74-3ed6056f67a1', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (35, 39, N'4ff98e3e-b61d-4130-af5a-703316ad1730', N'Free ticket', 19, 19, NULL, 1, 1, 0, 0, 1, 10, N'4ff98e3e-b61d-4130-af5a-703316ad1730', 1, 1, 0.0000, CAST(0x0000A6CC00738DA4 AS DateTime), CAST(0x0000A6CC01186284 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (36, 40, N'1158c229-d882-4482-8448-dac874c83c97', N'Free Ticket', 20, 20, N'Ticket free', 1, 0, 0, 0, 1, 10, N'1158c229-d882-4482-8448-dac874c83c97', 1, 1, 0.0000, CAST(0x0000A6CC007395D8 AS DateTime), CAST(0x0000A6CC01186BE4 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (37, 41, N'92255deb-f057-4956-abaa-3df048e933b6', N'Free ticket', 20, 20, N'Free ticket', 1, 0, 0, 0, 1, 10, N'92255deb-f057-4956-abaa-3df048e933b6', 1, 1, 0.0000, CAST(0x0000A6C900840BE8 AS DateTime), CAST(0x0000A6C901395930 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (38, 42, N'afb1f34b-cb06-4c95-8446-fa0635240e9c', N'Free ticket', 20, 20, N'Free ticket', 1, 0, 0, 0, 1, 10, N'afb1f34b-cb06-4c95-8446-fa0635240e9c', 1, 1, 0.0000, CAST(0x0000A6C900840BE8 AS DateTime), CAST(0x0000A6C901395930 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (39, 43, N'5ee5f3eb-3878-4e41-8bf7-f00e69311d42', N'Free ticket', 20, 20, N'Free ticket', 1, 0, 0, 0, 1, 10, N'5ee5f3eb-3878-4e41-8bf7-f00e69311d42', 1, 1, 0.0000, CAST(0x0000A6C900840BE8 AS DateTime), CAST(0x0000A6C901395930 AS DateTime), 0)
INSERT [dbo].[event_Ticket] ([Id], [EventId], [Guid], [Name], [Quantity], [AvailableTicketQuantity], [Description], [IsShowDescription], [SaleChanel], [SaleEndOption], [IsHide], [MinimunTicketOrder], [MaximunTicketOrder], [TicketCode], [Status], [SortOrder], [Price], [StartSaleDateTime], [EndSaleDateTime], [Type]) VALUES (40, 44, N'c0294c11-6390-4d77-81bd-0c2de189d23a', N'Vip', 20, 20, N'                            For Vip person
                        ', 1, 0, 0, 0, 1, 10, N'c0294c11-6390-4d77-81bd-0c2de189d23a', 1, 1, 40.0000, CAST(0x0000A6BD0062E530 AS DateTime), CAST(0x0000A6BD015A1EA4 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[event_Ticket] OFF
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'9c11bf9f-19ff-4c74-9fb1-38449d389e27')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'af75c4ba-7334-4f74-aee1-3d08c85bff6a')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'ed12bcce-37ad-44e9-b711-596722df34e2')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'6779bc9e-0f88-4218-9cda-75086af00e6c')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'838cf70d-7138-46f6-8477-b85a9b6b4f1b')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'b3add33a-2a72-4776-ba7c-bdcb7f4c4972')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'95a2c906-fe35-4a82-bf0b-be7c1050b392')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'f7dca7bc-8e5c-43fb-b3c2-ca761728fc51')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 39, N'c275b7cc-4b19-491e-8ca7-ef56823e277e')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 40, N'd161b7b4-73b4-4136-b4fd-5ed7259a15ea')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 40, N'9e133ae9-d045-4626-89f2-84a3c1674410')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 40, N'a0b31b80-648b-41dc-b68f-a7a1c2f78ba8')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 40, N'e8c080c3-328d-4b49-8545-bf98f9474f5e')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 40, N'004222cb-b510-4a07-bfaa-e794560aca45')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 41, N'dd5d9207-b701-4f8e-b638-54227e5f215d')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 41, N'f1dd342a-502a-4067-b25b-8178d6d4e91f')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 41, N'e5594216-c028-44c2-a94f-8d82e7a275f6')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 42, N'3f1407e6-71ea-49e9-8aff-3ac869ab6e3e')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 42, N'6ec90ab6-98d0-4c89-a85e-b78c5bb61591')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 42, N'73d4df6f-ed77-4bea-b6ab-e702b2db41e5')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 43, N'5c57e90d-cc3b-4dfc-924a-41917765687f')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 43, N'c9dc57aa-a91e-4d6f-b8eb-497b91f6bd42')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 43, N'4d383fc7-e1a3-4633-92e2-fc1bf5d57e6f')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 44, N'8f0c0637-652b-4f70-8d69-1e69e91f4bd8')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 44, N'75934917-3a75-41fd-85b7-6eb66075bec6')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 44, N'4839483e-b843-4116-8cc8-f0b8d922a365')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 45, N'92698036-1d04-499f-b995-3bedf9eacbb4')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 45, N'99857a55-48f6-4bde-bccb-93a8afc5ee71')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 45, N'b3009975-694f-4322-bea3-d59bf0bdaafa')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 46, N'61ae9876-98e4-4871-a5c2-0cd7b6b1ffcc')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 46, N'dc671e12-9f70-4ab5-98ad-6a5012ab364e')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 47, N'c8fa670e-b67e-43fb-9184-856ea51d344c')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 47, N'5b0280d4-6aa3-40e5-bd6b-d359f1d92b41')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 48, N'716ca24e-4fb3-448a-8b47-3c0e4545c926')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 48, N'f1797e8a-31cc-4ca0-a438-d6540803ff8f')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 49, N'7472b2f3-9ecd-4fcb-953b-99b0122b4620')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (9, 55, N'720ae5d0-34d9-4f5e-9cbc-481269a7f256')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (15, 58, N'fa953eb7-9e8b-4bf5-8e5e-0a9786c1642e')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (15, 58, N'33f4f857-650a-4b1f-99a6-15d119ebb804')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (15, 58, N'd5a496c7-e7d9-4da4-8174-658d3a3ab636')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 50, N'c54c8b10-2440-4fee-9ed9-0bcb75ec481a')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 50, N'edfac5bc-8d7d-4bde-97e8-5e70cda6f9da')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 50, N'd9ca2a4a-0f85-4c9f-8b00-d1d9727d0278')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 51, N'dd78cd0e-3fac-4be8-b7d0-c8e150680c70')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 52, N'13a562e1-df7a-424d-80fd-54faced48222')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 56, N'ee32adaf-772d-43ac-a219-f980ccd2ecba')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 57, N'0f5db942-e3a5-440f-bf3b-cf38eb1ee920')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 59, N'316d4075-903d-4889-9d1a-301fd2764280')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 59, N'1378b415-752b-439f-aaf6-5becce524f6f')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 59, N'09a3c0f4-3e01-4299-871f-cc9abba7ec07')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 59, N'a71ce1ea-04a8-45a0-9f2d-e0ff1436caba')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 60, N'8746bc53-c491-4007-9c83-268ff5683b4b')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 60, N'b6ec0f19-18b6-4614-8ea3-694d5a4789ca')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 60, N'64543ae4-ec1e-4233-9eab-774ab705aa1f')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 60, N'43f134be-6234-42d7-b612-91ae012715fe')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 60, N'0040b388-e73a-4984-aa1a-cb7227e3825b')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 61, N'dcdbc39a-20ee-4d37-b5c4-97d3537c9be6')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 61, N'271f2324-aab3-4793-8b17-c1b646cf0c2b')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 61, N'bfd99c0d-44c8-4227-987b-fe4b4a608396')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 61, N'488256c3-b37c-4d67-9724-feb722a89c74')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 62, N'355317ef-f236-4a06-8160-7d84044f632e')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (19, 62, N'54aaf719-9bc8-4b37-bd94-d3771c88d860')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 53, N'71804ed4-cac5-4b81-abc5-a9d15ceb7f34')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 53, N'b42bc7aa-6fdf-490d-976d-bdca29e3031d')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 53, N'c55faabd-be26-4da4-ace4-cc584ff3d1e5')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 53, N'f6fd0450-4d9b-46ed-87c2-dcf4d5c4a782')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 53, N'd477d10c-0b00-4748-ba98-ef24e874012d')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 54, N'cb4638e3-9bbd-4223-b159-043283ba478d')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 54, N'ebc5c2c7-77d5-434a-9dd8-84ebcfc793fa')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 54, N'1a777e48-4329-4711-8871-97dda9ad85d6')
INSERT [dbo].[event_TicketOrder] ([TicketId], [OrderId], [TicketCode]) VALUES (21, 54, N'a0cb5f5e-bc5d-4094-a616-e1e8cbfcb8c0')
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
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (450, N'item_11_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_11_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (451, N'item_12_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_12_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (452, N'item_13_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_13_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (453, N'item_14_2a-1415000287_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_14_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (454, N'item_6_2-1464573361_660x0.jpg', N'/Content/Images/UploadImages/ProjectImages/item_6_2-1464573361_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (455, N'item_0_study_aboard_at_home.png', N'/Content/Images/UploadImages/ProjectImages/item_0_study_aboard_at_home.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (456, N'item_1_study_aboard_at_home.png', N'/Content/Images/UploadImages/ProjectImages/item_1_study_aboard_at_home.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (457, N'item_2_study_aboard_at_home.png', N'/Content/Images/UploadImages/ProjectImages/item_2_study_aboard_at_home.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (458, N'item_3_study_aboard_at_home.png', N'/Content/Images/UploadImages/ProjectImages/item_3_study_aboard_at_home.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (459, N'item_4_study_aboard_at_home.png', N'/Content/Images/UploadImages/ProjectImages/item_4_study_aboard_at_home.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (460, N'item_0_quantricuoidoievent.png', N'/Content/Images/UploadImages/ProjectImages/item_0_quantricuoidoievent.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (461, N'item_0_logo.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_logo.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (462, N'item_0_Industrial Components and Subcontracting .jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_Industrial Components and Subcontracting .jpg', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (463, N'item_0_daotaoquandocsanxuat.png', N'/Content/Images/UploadImages/ProjectImages/item_0_daotaoquandocsanxuat.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (464, N'item_0_khoitaoduannghiep.png', N'/Content/Images/UploadImages/ProjectImages/item_0_khoitaoduannghiep.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (465, N'item_0_giamđocieuhanhchuyennghiep.pn.png', N'/Content/Images/UploadImages/ProjectImages/item_0_giamđocieuhanhchuyennghiep.pn.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (466, N'item_0_webxongtienve.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_webxongtienve.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (467, N'item_0_hoathinh.png', N'/Content/Images/UploadImages/ProjectImages/item_0_hoathinh.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (468, N'item_0_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (469, N'item_1_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_1_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (470, N'item_2_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_2_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (471, N'item_3_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_3_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (472, N'item_4_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_4_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (473, N'item_5_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_5_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (474, N'item_6_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_6_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (475, N'item_7_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_7_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (476, N'item_8_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_8_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (477, N'item_9_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_9_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (478, N'item_10_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_10_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (479, N'item_11_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_11_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (480, N'item_12_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_12_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (481, N'item_13_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_13_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (482, N'item_14_Neo4j.jpg', N'/Content/Images/UploadImages/ProjectImages/item_14_Neo4j.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (483, N'item_0_Hackathon.png', N'/Content/Images/UploadImages/ProjectImages/item_0_Hackathon.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (484, N'item_1_Hackathon.png', N'/Content/Images/UploadImages/ProjectImages/item_1_Hackathon.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (485, N'item_2_Hackathon.png', N'/Content/Images/UploadImages/ProjectImages/item_2_Hackathon.png', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (486, N'item_0_develop.jpg', N'/Content/Images/UploadImages/ProjectImages/item_0_develop.jpg', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Images] OFF
SET IDENTITY_INSERT [dbo].[system_Banners] ON 

INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 231, N'TRANH2', 1, NULL, NULL, 4, 1, NULL, CAST(0x0000A645011DA9AE AS DateTime), NULL, CAST(0x0000A66801182413 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 232, N'TRANH3 ', 1, NULL, NULL, 3, 1, NULL, CAST(0x0000A645011F1BBE AS DateTime), NULL, CAST(0x0000A66801181F9B AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 233, N'TRANH4', 1, NULL, NULL, 2, 1, NULL, CAST(0x0000A6450125B094 AS DateTime), NULL, CAST(0x0000A66801181BC7 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 268, N'Banner  4', 1, NULL, NULL, 1, 1, NULL, CAST(0x0000A6450125CBFA AS DateTime), NULL, CAST(0x0000A668011816ED AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [StartDate], [EndDate], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 230, N'TRANH', 4, NULL, NULL, NULL, 1, NULL, CAST(0x0000A64E016BDF0B AS DateTime), NULL, CAST(0x0000A66801179C5B AS DateTime))
SET IDENTITY_INSERT [dbo].[system_Banners] OFF
SET IDENTITY_INSERT [dbo].[system_Config] ON 

INSERT [dbo].[system_Config] ([Id], [Name], [Value], [Status]) VALUES (1, N'TotalVisitors', N'1863', 1)
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
SET IDENTITY_INSERT [dbo].[system_Organisers] ON 

INSERT [dbo].[system_Organisers] ([Id], [UserId], [AvatarId], [OrganiserName], [About], [Website], [Facebook], [Twitter], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'dd9f9430-b789-4037-8770-bd67e0945ed7', NULL, N'', NULL, NULL, NULL, NULL, 1, N'dd9f9430-b789-4037-8770-bd67e0945ed7', CAST(0x0000A6C6013FF804 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[system_Organisers] OFF
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Email], [Password], [Status], [Prefix], [HomePhone], [MobilePhone], [JobTitle], [Company], [Website], [Blog], [Home_Address], [Home_Address2], [Home_City], [Billing_Address], [Billing_Address2], [Billing_City], [Shipping_Address], [Shipping_Address2], [Shipping_City], [Work_Address], [Work_Address2], [Work_City], [Gender], [BirthDate], [Age]) VALUES (N'dd9f9430-b789-4037-8770-bd67e0945ed7', N'crusorobinson@gmail.com', N'crusorobinson@gmail.com', N'123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
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
ALTER TABLE [dbo].[event_EventBookMark]  WITH CHECK ADD  CONSTRAINT [FK_event_EventBookMark_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[event_EventBookMark] CHECK CONSTRAINT [FK_event_EventBookMark_AspNetUsers]
GO
ALTER TABLE [dbo].[event_EventBookMark]  WITH CHECK ADD  CONSTRAINT [FK_event_EventBookMark_event_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[event_Event] ([Id])
GO
ALTER TABLE [dbo].[event_EventBookMark] CHECK CONSTRAINT [FK_event_EventBookMark_event_Event]
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
