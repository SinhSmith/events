USE [PortalDB.Event]
GO
/****** Object:  Table [dbo].[system_Organisers]    Script Date: 11/1/2016 5:22:45 PM ******/
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
/****** Object:  Table [dbo].[system_Profiles]    Script Date: 11/1/2016 5:22:45 PM ******/
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
ALTER TABLE [dbo].[system_Organisers]  WITH CHECK ADD  CONSTRAINT [FK_system_Organisers_share_Images] FOREIGN KEY([AvatarId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[system_Organisers] CHECK CONSTRAINT [FK_system_Organisers_share_Images]
GO
