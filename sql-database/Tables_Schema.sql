USE [WRRData]
GO
/****** Object:  Table [dbo].[AdultBase]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdultBase](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[AdultBaseCount] [int] NULL,
	[MaxAdult] [int] NULL,
	[ChildBaseCount] [int] NULL,
	[MaxChild] [int] NULL,
	[MaxRoomTotal] [int] NULL,
 CONSTRAINT [PK_AdultBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
 CONSTRAINT [dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalendarEvents]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendarEvents](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Venue] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Time] [nvarchar](200) NULL,
	[Website] [nvarchar](max) NULL,
	[Details] [nvarchar](max) NULL,
	[ImgUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_CalendarEvents] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomMessage]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomMessage](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [text] NULL,
	[DisplayFrom] [datetime] NULL,
	[DisplayTo] [datetime] NULL,
	[HotelID] [int] NULL,
 CONSTRAINT [PK_CustomMessage] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disclaimer]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disclaimer](
	[DisclaimerID] [int] IDENTITY(1,1) NOT NULL,
	[DisclaimerText] [text] NULL,
	[HotelID] [int] NULL,
	[EmailDisclaimerText] [text] NULL,
 CONSTRAINT [PK_Disclaimer] PRIMARY KEY CLUSTERED 
(
	[DisclaimerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraAmenity]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraAmenity](
	[AmenityID] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [text] NULL,
	[AmenityRate] [decimal](18, 0) NULL,
	[Tax] [decimal](18, 0) NULL,
	[ViewRate] [bit] NULL,
	[Mandatory] [bit] NULL,
	[Visible] [bit] NULL,
	[PerDayPerPerson] [bit] NULL,
	[PerDay] [bit] NULL,
	[OneTimeFee] [bit] NULL,
	[OneTimeFeePerson] [bit] NULL,
	[Discount] [bit] NULL,
	[PictureUrl] [nvarchar](max) NULL,
	[ViewOnRackRate] [bit] NULL,
	[DiscountRegularRate] [decimal](18, 2) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[PerNightStay] [bit] NULL,
 CONSTRAINT [PK_ExtraAmenity] PRIMARY KEY CLUSTERED 
(
	[AmenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[TollFreePhone] [nvarchar](20) NULL,
	[LocalPhone] [nvarchar](20) NULL,
	[Website] [nvarchar](200) NULL,
	[Description] [text] NULL,
	[TaxRate] [decimal](18, 0) NULL,
	[CheckIn] [nvarchar](20) NULL,
	[CheckOut] [nvarchar](20) NULL,
	[AdminEmail] [nvarchar](256) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel2]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel2](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[TollFreePhone] [nvarchar](20) NULL,
	[LocalPhone] [nvarchar](20) NULL,
	[Website] [nvarchar](200) NULL,
	[Description] [text] NULL,
	[TaxRate] [decimal](18, 0) NULL,
	[CheckIn] [nvarchar](20) NULL,
	[CheckOut] [nvarchar](20) NULL,
	[AdminEmail] [nvarchar](256) NULL,
 CONSTRAINT [PK_Hotel2] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelEvent]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelEvent](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NULL,
	[EventName] [nvarchar](max) NULL,
	[Details] [text] NULL,
	[Visible] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RepeatWeekly] [bit] NULL,
	[Monday] [bit] NULL,
	[Tuesday] [bit] NULL,
	[Wednesday] [bit] NULL,
	[Thursday] [bit] NULL,
	[Friday] [bit] NULL,
	[Saturday] [bit] NULL,
	[Sunday] [bit] NULL,
 CONSTRAINT [PK_HotelEvent] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelLayout]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelLayout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NOT NULL,
	[HeaderFileName] [nvarchar](max) NULL,
	[FooterFileName] [nvarchar](max) NULL,
	[NavStyleURL] [nvarchar](max) NULL,
	[EmailHeaderImage] [nvarchar](max) NULL,
	[EmailHotelLogo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelPaymentTypes]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelPaymentTypes](
	[HotelPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeID] [int] NOT NULL,
	[HotelID] [int] NOT NULL,
 CONSTRAINT [PK_HotelPaymentTypes] PRIMARY KEY CLUSTERED 
(
	[HotelPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelSystem]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelSystem](
	[SystemID] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NULL,
	[ExtraAdultFee] [decimal](18, 2) NULL,
	[ExtraChildFee] [decimal](18, 2) NULL,
	[ExtraBaseFee] [decimal](18, 2) NULL,
	[WeekendFee] [decimal](18, 2) NULL,
	[ResortFee] [decimal](18, 2) NULL,
	[TaxRate] [decimal](18, 2) NULL,
	[AddTaxToDeposit] [bit] NULL,
	[DisplayRoomRatesAs] [nvarchar](50) NULL,
	[DisplayPackageRatesAs] [nvarchar](50) NULL,
	[LowAllocationLimit] [int] NULL,
	[PriorBook] [int] NULL,
	[DepositRoomCalAs] [nvarchar](50) NULL,
	[DepositPackageCalAs] [nvarchar](50) NULL,
	[DepositRoomPercentage] [decimal](18, 2) NULL,
	[AddTaxToExtraPerson] [bit] NULL,
	[AddTaxToWeekendFee] [bit] NULL,
	[ResortFeeCalAs] [nvarchar](50) NULL,
	[AddTaxToResortFee] [bit] NULL,
	[DepositPackagePercentage] [decimal](18, 2) NULL,
	[DisplayRoomBreakDownAs] [nvarchar](50) NULL,
	[DisplayPackageBreakDownAs] [nvarchar](50) NULL,
 CONSTRAINT [PK_HotelSystem] PRIMARY KEY CLUSTERED 
(
	[SystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelUsers]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[HotelID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaxBase]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaxBase](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[MaxBaseCount] [int] NULL,
	[BaseCount] [int] NULL,
 CONSTRAINT [PK_MaxBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MinStay]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MinStay](
	[MinStayID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[StayDate] [datetime] NULL,
	[MinNightStay] [int] NULL,
 CONSTRAINT [PK_MinStay] PRIMARY KEY CLUSTERED 
(
	[MinStayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenPackageReservation]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenPackageReservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PackageReservationID] [int] NOT NULL,
	[DateStamp] [datetime] NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenReservation]    Script Date: 4/7/2025 7:19:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenReservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[DateStamp] [datetime] NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptInEmails]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptInEmails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
	[HotelID] [int] NOT NULL,
	[OptInDate] [datetime] NOT NULL,
	[FirstName] [nvarchar](126) NULL,
	[LastName] [nvarchar](126) NULL,
	[State] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Package]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [text] NULL,
	[HotelID] [int] NULL,
	[Amenities] [bit] NULL,
	[ArrMon] [bit] NULL,
	[ArrTues] [bit] NULL,
	[ArrWed] [bit] NULL,
	[ArrThur] [bit] NULL,
	[ArrFri] [bit] NULL,
	[ArrSat] [bit] NULL,
	[ArrSun] [bit] NULL,
	[MinDays] [int] NULL,
	[MaxDays] [int] NULL,
	[WeekendSurcharge] [bit] NULL,
	[ResortFees] [bit] NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[EndDisplayDate] [datetime] NULL,
	[Visible] [bit] NULL,
	[NightsFree] [bit] NULL,
	[NumberOfNights] [float] NULL,
	[PercentOff] [bit] NULL,
	[PercentageOff] [decimal](18, 0) NULL,
	[PricePoint] [bit] NULL,
	[Deposit] [decimal](18, 0) NULL,
	[ExtraPersonFee] [bit] NULL,
	[PackageAllocation] [bit] NULL,
	[DeletedPackage] [bit] NULL,
	[SmImage] [nvarchar](max) NULL,
	[SortOrder] [int] NULL,
	[MiniVac] [bit] NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[SpecialPage] [bit] NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageAllocation]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageAllocation](
	[AllocationID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NULL,
	[RoomTypeID] [int] NULL,
	[AllocateDate] [date] NULL,
	[Quantity] [float] NULL,
 CONSTRAINT [PK_PackageAllocation] PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageAmenity]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageAmenity](
	[AmenityID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NULL,
	[ExtraAmenityID] [int] NULL,
	[ViewRateID] [int] NULL,
	[Mandatory] [bit] NULL,
	[ViewRate] [bit] NULL,
	[MandatoryQuantity] [int] NULL,
	[AdditionalPurchases] [bit] NOT NULL,
 CONSTRAINT [PK_PackageAmenity] PRIMARY KEY CLUSTERED 
(
	[AmenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageRate]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageRate](
	[RateID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NULL,
	[RoomTypeID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Price] [decimal](18, 2) NULL,
	[visible] [bit] NULL,
 CONSTRAINT [PK_PackageRate] PRIMARY KEY CLUSTERED 
(
	[RateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageReserAmenity]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageReserAmenity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[AmenityID] [int] NULL,
	[ChargeAmount] [decimal](18, 2) NULL,
	[NumPeople] [int] NULL,
	[Mandatory] [decimal](18, 2) NULL,
	[NumNights] [datetime] NULL,
	[TaxRate] [decimal](18, 2) NULL,
	[TotalCharge] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PackageReserAmenity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageReservation]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageReservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[PackageID] [int] NULL,
	[Discount] [decimal](18, 2) NULL,
	[HotelID] [int] NULL,
	[RoomTypeID] [int] NULL,
	[PaymentTypeID] [int] NULL,
	[ArrivalDate] [datetime] NULL,
	[DepartureDate] [datetime] NULL,
	[UserID] [int] NULL,
	[TotalNights] [int] NULL,
	[Rooms] [int] NULL,
	[Adults] [int] NULL,
	[Children] [int] NULL,
	[AveDailyRate] [decimal](18, 2) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[TierLevel] [nvarchar](1) NULL,
	[ExtraAdultCharge] [decimal](18, 2) NULL,
	[ExtraChildCharge] [decimal](18, 2) NULL,
	[ExtraBaseCharge] [decimal](18, 2) NULL,
	[WeekendFees] [decimal](18, 2) NULL,
	[ResortFees] [decimal](18, 2) NULL,
	[TotalFees] [decimal](18, 2) NULL,
	[Taxes] [decimal](18, 2) NULL,
	[TotalCharge] [decimal](18, 2) NULL,
	[Comments] [nvarchar](max) NULL,
	[CardHolderName] [nvarchar](max) NULL,
	[CardExpirationDate] [nvarchar](50) NULL,
	[CardNumber] [nvarchar](50) NULL,
	[CardSecureNumber] [nvarchar](50) NULL,
	[SessionID] [nvarchar](200) NULL,
	[ReservationCreated] [datetime] NULL,
	[Deposit] [decimal](18, 2) NULL,
	[ExtraFees] [decimal](18, 2) NULL,
	[Initials] [nvarchar](128) NULL,
	[CusFirstName] [nvarchar](max) NULL,
	[CusLastName] [nvarchar](max) NULL,
	[CusAddress1] [nvarchar](max) NULL,
	[CusAddress2] [nvarchar](max) NULL,
	[CusCity] [nvarchar](max) NULL,
	[CusState] [nvarchar](max) NULL,
	[CusZip] [nvarchar](20) NULL,
	[CusDayPhone] [nvarchar](50) NULL,
	[CusEveningPhone] [nvarchar](50) NULL,
	[CusEmail] [nvarchar](max) NULL,
	[BookedAmenity] [bit] NULL,
	[CusFax] [nvarchar](50) NULL,
	[UserInitals] [nvarchar](50) NULL,
 CONSTRAINT [PK_PackageReservation] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageRoomType]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageRoomType](
	[PackageRoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[PackageID] [int] NOT NULL,
 CONSTRAINT [PK_PackageRoomType] PRIMARY KEY CLUSTERED 
(
	[PackageRoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageTierLevel]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageTierLevel](
	[TierLevelID] [int] IDENTITY(1,1) NOT NULL,
	[TierDate] [datetime] NULL,
	[PackageID] [int] NULL,
	[Tier] [char](1) NULL,
 CONSTRAINT [PK_PackageTierLevel] PRIMARY KEY CLUSTERED 
(
	[TierLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](250) NULL,
	[CreditCardName] [nvarchar](250) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PKReservationDailyRate]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PKReservationDailyRate](
	[DailyRateID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[ReservationDate] [datetime] NULL,
	[DailyRate] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PKReservationDailyRate] PRIMARY KEY CLUSTERED 
(
	[DailyRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RackRates]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RackRates](
	[RackRateID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[TierARate] [decimal](18, 2) NULL,
	[TierBRate] [decimal](18, 2) NULL,
	[TierCRate] [decimal](18, 2) NULL,
	[MonthlyRate] [decimal](18, 2) NULL,
	[Visible] [bit] NULL,
	[TierDRate] [decimal](18, 2) NULL,
 CONSTRAINT [PK_RackRates] PRIMARY KEY CLUSTERED 
(
	[RackRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationName] [nvarchar](250) NULL,
	[HotelID] [int] NULL,
	[RoomTypeID] [int] NULL,
	[PaymentTypeID] [int] NULL,
	[BookedArrivalDate] [datetime] NULL,
	[BookedDepartureDate] [datetime] NULL,
	[ActualArrivalDate] [datetime] NULL,
	[ActualDepartureDate] [datetime] NULL,
	[UserID] [int] NULL,
	[CustomerID] [int] NULL,
	[AuthorizationID] [nvarchar](50) NULL,
	[TotalNights] [int] NULL,
	[Rooms] [int] NULL,
	[Adults] [int] NULL,
	[Children] [int] NULL,
	[AverageDailyRate] [float] NULL,
	[SubTotal] [float] NULL,
	[RackRate] [float] NULL,
	[TierLevel] [nvarchar](1) NULL,
	[ExtraAdultCharge] [float] NULL,
	[ExtraChildCharge] [float] NULL,
	[WeekendFee] [float] NULL,
	[ResortFee] [float] NULL,
	[TotalFees] [float] NULL,
	[Taxes] [float] NULL,
	[RoomTaxRateID] [int] NULL,
	[TotalCharge] [float] NULL,
	[ArrivalInfo] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[CardHolderName] [nvarchar](50) NULL,
	[CardExpirationDate] [nvarchar](50) NULL,
	[CardNumber] [nvarchar](50) NULL,
	[CardSecureCode] [nvarchar](50) NULL,
	[PackageID] [int] NULL,
	[ExtraBookingField1] [nvarchar](max) NULL,
	[ExtraBookingField2] [nvarchar](max) NULL,
	[SessionID] [nvarchar](200) NULL,
	[ReservationCreated] [datetime] NULL,
	[PreArrivalEmailSent] [bit] NULL,
	[PostThankYouEmailSent] [bit] NULL,
	[Deposit] [float] NULL,
	[DepositCalculation] [nvarchar](100) NULL,
	[SpecialAllocation] [nvarchar](50) NULL,
	[ExtraFees] [float] NULL,
	[Initials] [nvarchar](128) NULL,
	[CusFirstName] [nvarchar](max) NULL,
	[CusLastName] [nvarchar](max) NULL,
	[CusAddress1] [nvarchar](max) NULL,
	[CusAddress2] [nvarchar](max) NULL,
	[CusCity] [nvarchar](max) NULL,
	[CusState] [nvarchar](max) NULL,
	[CusZip] [nvarchar](20) NULL,
	[CusDayPhone] [nvarchar](50) NULL,
	[CusFax] [nvarchar](50) NULL,
	[CusEmail] [nvarchar](max) NULL,
	[BookedAmenity] [bit] NULL,
	[CusEvenPhone] [nvarchar](50) NULL,
	[UserInitals] [nvarchar](50) NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationAmenity]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationAmenity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[AmenityID] [int] NULL,
	[ChargeAmount] [decimal](18, 2) NULL,
	[TaxIncluded] [decimal](18, 2) NULL,
	[Mandatory] [bit] NULL,
	[TaxRate] [decimal](18, 2) NULL,
	[NumPeople] [int] NULL,
	[NumNights] [datetime] NULL,
	[TotalCharge] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ReservationAmenity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationDailyRate]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationDailyRate](
	[DailyRateID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[ReservationDate] [datetime] NULL,
	[DailyRate] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ReservationDailyRate] PRIMARY KEY CLUSTERED 
(
	[DailyRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationQue]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationQue](
	[QueID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[BookedDate] [datetime] NOT NULL,
	[CustomerName] [nvarchar](max) NULL,
	[ReservationType] [int] NOT NULL,
	[Viewed] [bit] NULL,
	[HotelID] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[QueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomFeatures]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[Icon] [nvarchar](50) NULL,
	[Features] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImage]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImage](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[Description] [nvarchar](100) NULL,
	[MainImage] [bit] NULL,
	[Visible] [bit] NULL,
	[ContentLength] [float] NULL,
	[ContentType] [nvarchar](10) NULL,
	[FileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoomImage] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[HotelID] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [text] NULL,
	[AdultBase] [bit] NULL,
	[MaxBase] [bit] NULL,
	[Visible] [bit] NULL,
	[BedType] [nvarchar](200) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypeAllocation]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypeAllocation](
	[AllocationID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NULL,
	[Quantity] [int] NULL,
	[AllocateDate] [datetime] NULL,
 CONSTRAINT [PK_RoomTypeAllocation] PRIMARY KEY CLUSTERED 
(
	[AllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmitPackageReservation]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitPackageReservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[DateStamp] [datetime] NULL,
	[UserID] [nvarchar](128) NULL,
	[Initials] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmitReservation]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitReservation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[DateStamp] [datetime] NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
	[Initials] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TierLevel]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TierLevel](
	[TierLevelID] [int] IDENTITY(1,1) NOT NULL,
	[TierDate] [datetime] NULL,
	[HotelID] [int] NULL,
	[Tier] [char](1) NULL,
 CONSTRAINT [PK_TierLevel] PRIMARY KEY CLUSTERED 
(
	[TierLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersActiveCode]    Script Date: 4/7/2025 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersActiveCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[ActiveCode] [nvarchar](50) NOT NULL,
	[ActiveCodeSent] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_tblPackage_MiniVac]  DEFAULT ((0)) FOR [MiniVac]
GO
ALTER TABLE [dbo].[Package] ADD  DEFAULT ((0)) FOR [SpecialPage]
GO
ALTER TABLE [dbo].[PackageAmenity] ADD  DEFAULT ((0)) FOR [AdditionalPurchases]
GO
ALTER TABLE [dbo].[UsersActiveCode] ADD  DEFAULT (getdate()) FOR [ActiveCodeSent]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
