USE [PRN212_Project]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 1/14/2024 10:34:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[BookingReservationID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ActualPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[BookingReservationID] ASC,
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingReservation]    Script Date: 1/14/2024 10:34:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingReservation](
	[BookingReservationID] [int] IDENTITY(1,1) NOT NULL,
	[BookingDate] [date] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[CustomerID] [int] NULL,
	[BookingStatus] [int] NULL,
 CONSTRAINT [PK_BookingReservation] PRIMARY KEY CLUSTERED 
(
	[BookingReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/14/2024 10:34:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFullName] [varchar](100) NULL,
	[Telephone] [nvarchar](20) NULL,
	[EmailAddress] [nvarchar](300) NULL,
	[CustomerBirthday] [date] NULL,
	[CustomerStatus] [bit] NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomInformation]    Script Date: 1/14/2024 10:34:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInformation](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](50) NULL,
	[RoomDetailDescription] [nvarchar](3000) NULL,
	[RoomMaxCapacity] [int] NULL,
	[RoomTypeID] [int] NULL,
	[RoomStatus] [bit] NULL,
	[RoomPricePerDay] [decimal](18, 2) NULL,
 CONSTRAINT [PK_RoomInformation] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 1/14/2024 10:34:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeName] [nvarchar](100) NULL,
	[TypeDescription] [nvarchar](3000) NULL,
	[TypeNote] [nvarchar](3000) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookingDetail] ([BookingReservationID], [RoomID], [StartDate], [EndDate], [ActualPrice]) VALUES (1, 2, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-13' AS Date), CAST(1200000.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[BookingReservation] ON 

INSERT [dbo].[BookingReservation] ([BookingReservationID], [BookingDate], [TotalPrice], [CustomerID], [BookingStatus]) VALUES (1, CAST(N'2024-01-14' AS Date), CAST(1200000.00 AS Decimal(18, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[BookingReservation] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerFullName], [Telephone], [EmailAddress], [CustomerBirthday], [CustomerStatus], [Password]) VALUES (1, N'Nguyen Van AA', N'0123456789', N'a@gmail.com', CAST(N'2003-01-01' AS Date), NULL, N'1')
INSERT [dbo].[Customer] ([CustomerID], [CustomerFullName], [Telephone], [EmailAddress], [CustomerBirthday], [CustomerStatus], [Password]) VALUES (2, N'Nguyen Van B', N'0375801453', N'b@gmail.com', CAST(N'2024-01-10' AS Date), 1, N'1')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomInformation] ON 

INSERT [dbo].[RoomInformation] ([RoomID], [RoomNumber], [RoomDetailDescription], [RoomMaxCapacity], [RoomTypeID], [RoomStatus], [RoomPricePerDay]) VALUES (1, N'120', N'khách sạn', 100, 1, NULL, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[RoomInformation] ([RoomID], [RoomNumber], [RoomDetailDescription], [RoomMaxCapacity], [RoomTypeID], [RoomStatus], [RoomPricePerDay]) VALUES (2, N'121', N'khách sạn', 100, 1, NULL, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[RoomInformation] ([RoomID], [RoomNumber], [RoomDetailDescription], [RoomMaxCapacity], [RoomTypeID], [RoomStatus], [RoomPricePerDay]) VALUES (3, N'122', N'khách sạn', 100, 1, NULL, CAST(100000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[RoomInformation] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName], [TypeDescription], [TypeNote]) VALUES (1, N'Khách sạn 5 sao', N'Khách sạn 5 sao', N'Khách sạn 5 sao')
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomTypeName], [TypeDescription], [TypeNote]) VALUES (2, N'Khách sạn 4 sao', N'Khách sạn 4 sao', N'Khách sạn 4 sao')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_BookingReservation] FOREIGN KEY([BookingReservationID])
REFERENCES [dbo].[BookingReservation] ([BookingReservationID])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_BookingReservation]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_RoomInformation] FOREIGN KEY([RoomID])
REFERENCES [dbo].[RoomInformation] ([RoomID])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_RoomInformation]
GO
ALTER TABLE [dbo].[BookingReservation]  WITH CHECK ADD  CONSTRAINT [FK_BookingReservation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[BookingReservation] CHECK CONSTRAINT [FK_BookingReservation_Customer]
GO
ALTER TABLE [dbo].[RoomInformation]  WITH CHECK ADD  CONSTRAINT [FK_RoomInformation_RoomType] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
GO
ALTER TABLE [dbo].[RoomInformation] CHECK CONSTRAINT [FK_RoomInformation_RoomType]
GO
