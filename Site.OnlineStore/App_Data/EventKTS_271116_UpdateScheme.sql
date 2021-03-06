USE [PortalDB.Event]
GO
/****** Object:  Table [dbo].[event_Order]    Script Date: 11/27/2016 3:10:30 PM ******/
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
/****** Object:  Table [dbo].[event_Ticket]    Script Date: 11/27/2016 3:10:30 PM ******/
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
/****** Object:  Table [dbo].[event_TicketOrder]    Script Date: 11/27/2016 3:10:30 PM ******/
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
/****** Object:  Table [dbo].[system_Profiles]    Script Date: 11/27/2016 3:10:30 PM ******/
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
