USE [WRRData]
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
	-- Add the parameters for the stored procedure here
	@ID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM AspNetUsers
	WHERE Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserRole]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserRole]
	@UserID nvarchar(128)
AS
	Delete from AspNetUserRoles
	Where UserId = @UserID
GO
/****** Object:  StoredProcedure [dbo].[genDelCalendarEvent]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genDelCalendarEvent]
	-- Add the parameters for the stored procedure here
	@EventID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete CalendarEvents
	Where EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[genDelCreditCard]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelCreditCard]
@ReservationID int

AS
BEGIN
	Declare @creditNum varchar(50)
	Declare @newNum nvarchar(50)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Set @creditNum = (Select CardNumber from Reservation
						Where ReservationID = @ReservationID)
	
	Set @newNum = REPLICATE('X', DATALENGTH(@creditNum)-4)+RIGHT(@creditNum, 4)
	
	update Reservation
	Set CardNumber = @newNum,
	CardSecureCode = '000',
	CardExpirationDate = '00/00'
	Where ReservationID = @ReservationID
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[genDelCustomMessage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelCustomMessage]
	-- Add the parameters for the stored procedure here
	@MessageID int
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from CustomMessage
	Where MessageID = @MessageID
END
GO
/****** Object:  StoredProcedure [dbo].[genDelHotelEvent]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelHotelEvent]
	-- Add the parameters for the stored procedure here
	@EventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete HotelEvent
	Where EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[genDelHotelPayment]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelHotelPayment]
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from HotelPaymentTypes
	Where HotelID = @HotelID
END

GO
/****** Object:  StoredProcedure [dbo].[genDelPackageAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelPackageAmenity]
	@ExtraAmenityID int,
	@PackageID int
AS
	Delete from PackageAmenity
	Where ExtraAmenityID = @ExtraAmenityID and PackageID = @PackageID
GO
/****** Object:  StoredProcedure [dbo].[genDelPackageCreditCard]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelPackageCreditCard] 
@ReservationID int

AS
BEGIN
	Declare @creditNum varchar(50)
	Declare @newNum nvarchar(50)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Set @creditNum = (Select CardNumber from PackageReservation
						Where ReservationID = @ReservationID)
						
	Set @newNum = REPLICATE('X', DATALENGTH(@creditNum)-4)+ RIGHT(@creditNum, 4)
	
	update PackageReservation
	set CardNumber = @newNum
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[genDelRoomFeature]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDelRoomFeature]
	@ID int
AS
	begin
		Delete from RoomFeatures
		Where Id = @ID
	end
GO
/****** Object:  StoredProcedure [dbo].[genDropAmenitiesFromPackage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDropAmenitiesFromPackage]
	@AmenityID int
AS
	Delete from PackageAmenity
	Where ExtraAmenityID = @AmenityID
GO
/****** Object:  StoredProcedure [dbo].[genDropRoomsFromPackage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genDropRoomsFromPackage]
	-- Add the parameters for the stored procedure here
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from PackageRoomType
	Where PackageID = @PackageID
END
GO
/****** Object:  StoredProcedure [dbo].[genInsAdultBase]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsAdultBase]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@AdultBase int,
	@ChildBase int,
	@AdultMax int,
	@ChildMax int,
	@Total int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete from AdultBase
	Where RoomTypeID = @RoomID
	
	Delete from MaxBase
	where RoomTypeID = @RoomID

    -- Insert statements for procedure here
	Insert into AdultBase
	(RoomTypeID, AdultBaseCount, ChildBaseCount, MaxAdult, MaxChild, MaxRoomTotal)
	values
	(@RoomID, @AdultBase, @ChildBase, @AdultMax, @ChildMax, @Total)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsAllocation] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Date datetime,
	@Quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    Delete from RoomTypeAllocation
    Where RoomTypeID = @RoomID and AllocateDate = @Date
    
	insert into RoomTypeAllocation
	(RoomTypeID, AllocateDate, Quantity)
	values
	(@RoomID, @Date, @Quantity)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsCalendarEvents]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsCalendarEvents]
	-- Add the parameters for the stored procedure here
	@Title nvarchar(max),
	@StartDate datetime,
	@EndDate datetime,
	@Venue nvarchar(max),
	@Address nvarchar(max),
	@Time nvarchar(200),
	@Website nvarchar(max),
	@Details nvarchar(max),
	@ImgUrl nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into CalendarEvents
	(Title, StartDate, EndDate,  Venue, Address, Time, Website, Details, ImgUrl)
	values
	(@Title, @StartDate, @EndDate, @Venue, @Address, @Time, @Website, @Details, @ImgUrl)

	Select CAST(SCOPE_IDENTITY() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsCustomMessage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genInsCustomMessage]
	-- Add the parameters for the stored procedure here
	@From datetime,
	@To datetime,
	@Message nvarchar(max),
	@HotelID int
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into CustomMessage
	(DisplayFrom, DisplayTo, HotelID, Message)
	values
	(@From, @To,@HotelID, @Message)
	
		Select CAST(SCOPE_IDENTITY() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsDailyRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsDailyRate] 
	-- Add the parameters for the stored procedure here
	@ReservationID int,
	@ReservationDate datetime,
	@DailyRate decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into ReservationDailyRate
	(ReservationID, ReservationDate, DailyRate)
	values
	(@ReservationID, @ReservationDate, @DailyRate)
	
	Select CAST(scope_identity() as int)
	
END
GO
/****** Object:  StoredProcedure [dbo].[genInsDateRange]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsDateRange]
	-- Add the parameters for the stored procedure here
	@Start datetime,
	@End datetime,
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into RackRates
	(StartDate, EndDate, RoomTypeID, Visible)
	values
	(@Start, @End, @RoomID, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsEvent]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[genInsEvent] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max),
	@Detail text, 
	@HotelID int,
	@Visible bit,
	@StartDate datetime,
	@EndDate datetime,
	@Repeart bit,
	@mon bit,
	@tues bit,
	@wed bit,
	@thurs bit,
	@fri bit,
	@sat bit,
	@sun bit
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into HotelEvent
	(EventName, Details, HotelID, Visible, StartDate, EndDate, RepeatWeekly, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)
	values
	(@Name, @Detail, @HotelID, @Visible, @StartDate, @EndDate, @Repeart, @mon, @tues, @wed, @thurs, @fri, @sat, @sun)
	
	select CAST(SCOPE_IDENTITY() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsExtraAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsExtraAmenity] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(150),
	@Description text,
	@AmenityRate decimal(18,2),
	@Tax decimal(18,2),
	@PerDay bit,
	@PerDayPerPerson bit,
	@OneTimeFee bit,
	@OneTimeFeePerPerson bit,
	@PerNightStay bit,
	@ViewRate bit,
	@Mandatory bit,
	@Visible bit,
	@HotelID int,
	@Discount bit,
	@PictureUrl nvarchar(max),
	@ViewOnRR bit,
	@DiscountRegRate decimal(18,2),
	@ShortDesc nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into ExtraAmenity
	(Name, Description, ShortDescription, AmenityRate, Tax, PerDay, PerDayPerPerson, PerNightStay, OneTimeFee, OneTimeFeePerson, ViewRate, Mandatory, Visible, HotelID, Discount, PictureUrl, ViewOnRackRate, DiscountRegularRate)
	values
	(@Name, @Description, @ShortDesc, @AmenityRate, @Tax, @PerDay, @PerDayPerPerson, @PerNightStay, @OneTimeFee, @OneTimeFeePerPerson, @ViewRate, @Mandatory, @Visible, @HotelID, @Discount, @PictureUrl, @ViewOnRR, @DiscountRegRate);
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsHotelCSS]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[genInsHotelCSS]
	@HotelID int,
	@CSS nvarchar(max)
AS
	update HotelLayout
	Set NavStyleURL = @CSS
	Where HotelID = @HotelID
GO
/****** Object:  StoredProcedure [dbo].[genInsHotelEmail]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[genInsHotelEmail]
	@HotelID int,
	@Logo nvarchar(max),
	@EmailHeader nvarchar(max)
AS
	update HotelLayout
	Set EmailHeaderImage = @EmailHeader,
	EmailHotelLogo = @Logo
	Where HotelID = @HotelID
GO
/****** Object:  StoredProcedure [dbo].[genInsHotelFooter]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[genInsHotelFooter]
	@HotelID int,
	@Footer nvarchar(max)
AS
	update HotelLayout
	Set FooterFileName = @Footer
	Where HotelID = @HotelID
GO
/****** Object:  StoredProcedure [dbo].[genInsHotelHeader]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsHotelHeader]
	@HotelID int,
	@Header nvarchar(max)
AS
	update HotelLayout
	Set HeaderFileName = @Header
	Where HotelID = @HotelID
GO
/****** Object:  StoredProcedure [dbo].[genInsHotelPayment]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsHotelPayment]
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@PaymentTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into HotelPaymentTypes
	(HotelID, PaymentTypeID)
	values
	(@HotelID, @PaymentTypeID)

	SELECT CAST(scope_identity() AS int)
END

GO
/****** Object:  StoredProcedure [dbo].[genInsHotelUser]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsHotelUser]
	@UserID nvarchar(128),
	@HotelID int
	-- Add the parameters for the stored procedure here
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into HotelUsers
	(UserID, HotelID)
	values
	(@UserID, @HotelID)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsMaxBase]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsMaxBase] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@BaseCount int,
	@MaxCount int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Delete from MaxBase
	Where RoomTypeID = @RoomID
	
	Delete from AdultBase
	Where RoomTypeID = @RoomID

    -- Insert statements for procedure here
	insert into MaxBase
	(RoomTypeID, BaseCount, MaxBaseCount)
	values
	(@RoomID, @BaseCount, @MaxCount)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsMinStay]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsMinStay] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Date datetime,
	@Quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from MinStay
	Where RoomTypeID = @RoomID and StayDate = @Date
	
	Insert into MinStay
	(RoomTypeID, StayDate, MinNightStay)
	values
	(@RoomID, @Date, @Quantity)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsOptInEmail]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsOptInEmail]
	@Email nvarchar(max),
	@HotelID int,
	@FirstName nvarchar(300),
	@LastName nvarchar(300),
	@State nvarchar(100)
AS
	SET NOCOUNT ON;

	insert into OptInEmails
	(EmailAddress, HotelID, OptInDate, FirstName, LastName, State)
	values
	(@Email, @HotelID, GETDATE(), @FirstName, @LastName, @State)

	Select CAST(scope_identity() as int)
GO
/****** Object:  StoredProcedure [dbo].[genInsPackage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackage] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max),
	@Description text,
	@HotelID int,
	@Amenities bit,
	@ArrMon bit,
	@ArrTues bit,
	@ArrWed bit,
	@ArrThur bit,
	@ArrFri bit,
	@ArrSat bit,
	@ArrSun bit,
	@MinDays int,
	@MaxDays int,
	@WeekendSurcharge bit,
	@ResortFees bit,
	@ValidFrom datetime,
	@ValidTo datetime,
	@EndDisplayDate datetime,
	@Visible bit,
	@NightsFree bit,
	@NumberOfNights float,
	@PercentOff bit,
	@PercentageOff decimal(18,2),
	@PricePoint bit,
	@Deposit decimal(18,2),
	@ExtraPersonFee bit,
	@PackageAllocation bit,
	@ShortDesc nvarchar(500),
	@SpecialPage bit
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Package
	(Name, Description, HotelID, Amenities, ArrMon, ArrTues, ArrWed, ArrThur, ArrFri, ArrSat, ArrSun, MinDays, MaxDays, WeekendSurcharge, ResortFees, ValidFrom, ValidTo, EndDisplayDate, Visible, NightsFree, NumberOfNights, PercentOff, PercentageOff, PricePoint, Deposit, ExtraPersonFee, PackageAllocation, DeletedPackage,  ShortDescription, SpecialPage)
	values
	(@Name, @Description, @HotelID, @Amenities, @ArrMon, @ArrTues, @ArrWed, @ArrThur, @ArrFri, @ArrSat,@ArrSun, @MinDays, @MaxDays, @WeekendSurcharge, @ResortFees, @ValidFrom,@ValidTo, @EndDisplayDate, @Visible, @NightsFree, @NumberOfNights, @PercentOff, @PercentageOff, @PricePoint, @Deposit, @ExtraPersonFee, @PackageAllocation, 0, @ShortDesc, @SpecialPage)
	
	Select CAST(SCOPE_IDENTITY() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageAllocation] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@packageid int,
	@Date datetime,
	@Quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from PackageAllocation
    Where RoomTypeID = @RoomID and AllocateDate = @Date and PackageID = @packageid
    
	insert into PackageAllocation
	(RoomTypeID, AllocateDate, Quantity, PackageID)
	values
	(@RoomID, @Date, @Quantity, @packageid)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageAmenity]
	@Packageid int,
	@AmenityID int,
	@ViewRate bit,
	@Mandatory bit,
	@Qty int,
	@AdditionalPurchases bit
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into PackageAmenity
	(PackageID, ExtraAmenityID, Mandatory, ViewRate, MandatoryQuantity, AdditionalPurchases)
	values
	(@Packageid, @AmenityID, @Mandatory, @ViewRate, @Qty, @AdditionalPurchases)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageDailyRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageDailyRate] 
	-- Add the parameters for the stored procedure here
	@ReservationID int,
	@ReservationDate datetime,
	@DailyRate decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into PKReservationDailyRate
	(ReservationID, ReservationDate, DailyRate)
	values
	(@ReservationID, @ReservationDate, @DailyRate)
	
	Select CAST(scope_identity() as int)
	
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageRate] 
	-- Add the parameters for the stored procedure here
	@Start datetime,
	@End datetime,
	@RoomID int,
	@Price decimal(18,2),
	@PackageId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	
    -- Insert statements for procedure here
	Insert into PackageRate
	(StartDate, EndDate, RoomTypeID, Price, visible, PackageID )
	values
	(@Start, @End, @RoomID, @Price, 1, @PackageId)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageReservation]
	-- Add the parameters for the stored procedure here

@PackageID int,
@Discount decimal(18,2),
@HotelID int,
@RoomTypeID int,
@ArrivalDate datetime,
@DepartureDate datetime,
@TotalNights int,
@Adults int,
@Children int,
@AvgDailyRate decimal(18,2),
@SubTotal decimal(18,2),

@ExtraAdultCharge decimal(18,2),
@ExtraChildCharge decimal(18,2),
@WeekendFee decimal(18,2),
@ResortFee decimal(18,2),
@TotalFees decimal(18,2),
@Taxes decimal(18,2),

@TotalCharge decimal(18,2),
@Comments text,
@CardHolderName nvarchar(max),
@CardExpireDate nvarchar(50),
@CardNumber nvarchar(50),
@SecureCode nvarchar(50),

@Deposit decimal(18,2),

@FirstName nvarchar(max),
@LastName nvarchar(max),
@Address1 nvarchar(max),
@Address2 nvarchar(max),
@City nvarchar(max),
@State nvarchar(max),
@ZipCode nvarchar(50),
@PhoneNumber nvarchar(50),
@CEmail nvarchar(max),
@UserInitials nvarchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
			Declare @rescreated datetime
			Set @rescreated = GETDATE()
			INSERT into PackageReservation(PackageID, Discount, HotelID, RoomTypeID, ArrivalDate, DepartureDate,TotalNights, Adults, Children, AveDailyRate, SubTotal,  ExtraAdultCharge, ExtraChildCharge,
				WeekendFees, ResortFees, TotalFees, Taxes, TotalCharge, Deposit, Comments, CardHolderName, CardExpirationDate, CardNumber, CardSecureNumber, 
				ReservationCreated, CusFirstName, CusLastName, CusAddress1, CusAddress2, CusCity, CusState, CusZip, CusDayPhone, CusEmail, UserInitals)
			VALUES (@PackageID, @Discount, @HotelID, @RoomTypeID, @ArrivalDate, @DepartureDate, @TotalNights, @Adults, @Children, @AvgDailyRate, @SubTotal,  @ExtraAdultCharge, @ExtraChildCharge,
				@WeekendFee, @ResortFee, @TotalFees, @Taxes, @TotalCharge, @Deposit, @Comments, @CardHolderName, @CardExpireDate, @CardNumber, @SecureCode, 
				GEtDate(), @FirstName, @LastName, @Address1, @Address2, @City, @State, @ZipCode, @PhoneNumber, @CEmail, @UserInitials )
			
			SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageReservationAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageReservationAmenity]
	-- Add the parameters for the stored procedure here
	@ReservationID int,
	@AmenityID int,
	@ChargeAmount decimal(18,2),
	@Mandatory bit,
	@NumPeople int,
	@NumNights datetime,
	@TaxRate decimal(18,2),
	@TotalCharge decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into PackageReserAmenity
	(ReservationID, AmenityID, ChargeAmount, Mandatory, NumPeople, NumNights, TaxRate, TotalCharge)
	values
	(@ReservationID, @AmenityID, @ChargeAmount, @Mandatory, @NumPeople, @NumNights, @TaxRate, @TotalCharge)
	Select CAST(scope_identity() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageRoom]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageRoom]
	-- Add the parameters for the stored procedure here
	@RoomTypeID int,
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into PackageRoomType
	(RoomTypeID, PackageID)
	values
	(@RoomTypeID, @PackageID)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsPackageTierLevel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsPackageTierLevel]
	-- Add the parameters for the stored procedure here
	@PackageID int,
	@Date datetime,
	@Tier char
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Delete from PackageTierLevel
	Where PackageID = @PackageID and TierDate = @Date

    -- Insert statements for procedure here
	insert into PackageTierLevel
	(PackageID, TierDate, Tier)
	values
	(@PackageID, @Date, @Tier)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsRackRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsRackRate] 
	@Start datetime,
	@End datetime,
	@RoomID int,
	@TierA decimal(18,2),
	@TierB decimal(18,2),
	@TierC decimal(18,2),
	@TierD decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	
    -- Insert statements for procedure here
	Insert into RackRates
	(StartDate, EndDate, RoomTypeID, TierARate, TierBRate, TierCRate, TierDRate, Visible )
	values
	(@Start, @End, @RoomID, @TierA, @TierB, @TierC, @TierD, 1)

	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsReservation]
	@HotelID int,
	@RoomTypeID int,
	@ArrivalDate datetime,
	@DepartureDate datetime,
	@TotalNights int,
	@Adults int,
	@Children int,
	@AvgDailyRate decimal(18,2),
	@SubTotal decimal(18,2),
	@ExtraAdultCharge decimal(18,2),
	@ExtraChildCharge decimal(18,2),
	@WeekendFees decimal(18,2),
	@ResortFees decimal(18,2),
	@TotalFees decimal(18,2),
	@Taxes decimal(18,2),
	@TotalCharge decimal(18,2),
	@Deposit decimal(18,2),
	@Comments text,
	@CardHolderName nvarchar(50),
	@CardExpireDate nvarchar(50),
	@CardNumber nvarchar(50),
	@SecureCode nvarchar(50),
	@FirstName nvarchar(max),
	@LastName nvarchar(max),
	@Address1 nvarchar(max),
	@Address2 nvarchar(max),
	@City nvarchar(250),
	@State nvarchar(max),
	@ZipCode nvarchar(50),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(max),
	@UserInitals nvarchar(50)
AS
	begin
	Set NoCount ON;

	declare @today datetime
	Set @today = GETDATE()

	Insert into Reservation(HotelID, RoomTypeID, BookedArrivalDate, BookedDepartureDate, TotalNights, Adults, Children, AverageDailyRate, 
	SubTotal, ExtraAdultCharge, ExtraChildCharge, WeekendFee, ResortFee, TotalFees, Taxes, TotalCharge, Comments, CardHolderName, CardExpirationDate,
	CardNumber, CardSecureCode, Deposit, ReservationCreated, CusFirstName, CusLastName, CusAddress1, CusAddress2, CusCity, CusState, CusZip,
	CusDayPhone, CusEmail, UserInitals)
	values (@HotelID, @RoomTypeID, @ArrivalDate, @DepartureDate, @TotalNights, @Adults, @Children, @AvgDailyRate,
	@SubTotal, @ExtraAdultCharge, @ExtraChildCharge, @WeekendFees, @ResortFees, @TotalFees, @Taxes, @TotalCharge, @Comments, @CardHolderName, @CardExpireDate,
	@CardNumber, @SecureCode, @Deposit, @today, @FirstName, @LastName, @Address1, @Address2, @City, @State, @ZipCode, 
	@PhoneNumber, @Email, @UserInitals)
	
	SELECT CAST(scope_identity() AS int)
	end
GO
/****** Object:  StoredProcedure [dbo].[genInsReservationAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsReservationAmenity]
	-- Add the parameters for the stored procedure here
	@ReservationID int,
	@AmenityID int,
	@ChargeAmount decimal(18,2),
	@Mandatory bit,
	@NumPeople int,
	@NumNights datetime,
	@TaxRate decimal(18,2),
	@TotalCharge decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into ReservationAmenity
	(ReservationID, AmenityID, ChargeAmount, Mandatory, NumPeople, NumNights, TaxRate, TotalCharge)
	values
	(@ReservationID, @AmenityID, @ChargeAmount, @Mandatory, @NumPeople, @NumNights, @TaxRate, @TotalCharge)
	Select CAST(scope_identity() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsRoomFeature]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsRoomFeature]
	@RoomTypeID int,
	@Icon nvarchar(50),
	@Feature nvarchar(200)
AS
begin
	insert into RoomFeatures
	(RoomTypeID, Icon, Features)
	values
	(@RoomTypeID, @Icon, @Feature)

	Select CAST(SCOPE_IDENTITY() as int)
end
GO
/****** Object:  StoredProcedure [dbo].[genInsRoomImage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsRoomImage]
	-- Add the parameters for the stored procedure here
	@RoomTypeID int,
	@Visible bit,
	@ContentLength float,
	@ContentType nvarchar(50),
	@FileName nvarchar(max)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    Insert into RoomImage
    (RoomTypeID, Visible, ContentLength, ContentType, FileName)
    values
    (@RoomTypeID, @Visible, @ContentLength, @ContentType, @FileName)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsRoomType]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsRoomType] 
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@Name nvarchar(200),
	@Desc text,
	@Adult bit,
	@Max bit,
	@BedType nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into RoomType
	(HotelID, Name, Description, AdultBase, MaxBase, Visible, BedType)
	values
	(@HotelID, @Name, @Desc,@Adult, @Max, 1, @BedType)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInsTierLevel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInsTierLevel]
	-- Add the parameters for the stored procedure here
	@Date datetime,
	@Level char,
	@HotelID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from TierLevel
	Where HotelID = @HotelID and TierDate = @Date
	
	Insert into TierLevel
	(TierDate, Tier, HotelID)
	values
	(@Date, @Level, @HotelID)
	
	SELECT CAST(scope_identity() AS int)
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisbleExtraAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInvisbleExtraAmenity]
	-- Add the parameters for the stored procedure here
	@AmenityID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ExtraAmenity
	set Visible = 0
	Where AmenityID = @AmenityID
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisibleEvent]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[genInvisibleEvent] 
	-- Add the parameters for the stored procedure here
	@eventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HotelEvent
	Set Visible = 0
	Where EventID = @eventID
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisiblePackage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInvisiblePackage]
	-- Add the parameters for the stored procedure here
	@Packageid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Package
	set DeletedPackage = 1
	Where PackageID = @Packageid
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisiblePackageRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInvisiblePackageRate]
	-- Add the parameters for the stored procedure here
	@RateID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PackageRate
	Set visible = 0
	Where RateID = @RateID
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisibleRackRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInvisibleRackRate]
	-- Add the parameters for the stored procedure here
	@RackRateID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update RackRates
	Set Visible = 0
	Where RackRateID = @RackRateID
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisibleRoomImage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInvisibleRoomImage]
	-- Add the parameters for the stored procedure here
	@ImageID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update RoomImage
	Set Visible = 0,
	MainImage = 0
	where ImageID = @ImageID
END
GO
/****** Object:  StoredProcedure [dbo].[genInvisibleRoomType]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genInvisibleRoomType] 
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update RoomType
	Set Visible = 0
	Where RoomTypeID = @RoomID
END
GO
/****** Object:  StoredProcedure [dbo].[genReservePackageRoom]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genReservePackageRoom]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Date datetime,
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @QTy int
	Declare @newQty int
	
	Select @QTy = Quantity from PackageAllocation
	Where RoomTypeID = @RoomID and AllocateDate = @Date and Quantity > 0 and PackageID = @PackageID
	
	Set @newQty = @QTy - 1

    -- Insert statements for procedure here
    if @newQty >= 0
    Begin
	Update PackageAllocation
	set Quantity = @newQty
	Where RoomTypeID = @RoomID and AllocateDate = @Date and PackageID = @PackageID 
	End
	
	Select Quantity from PackageAllocation
	Where RoomTypeID = @RoomID and AllocateDate = @Date
	
END
GO
/****** Object:  StoredProcedure [dbo].[genReserveRoom]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genReserveRoom]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @QTy int
	Declare @newQty int
	
	Select @QTy = Quantity from RoomTypeAllocation
	Where RoomTypeID = @RoomID and AllocateDate = @Date and Quantity > 0
	
	Set @newQty = @QTy - 1

    -- Insert statements for procedure here
    if @newQty >= 0
    Begin
	Update RoomTypeAllocation
	set Quantity = @newQty
	Where RoomTypeID = @RoomID and AllocateDate = @Date 
	End
	
	Select Quantity from RoomTypeAllocation
	Where RoomTypeID = @RoomID and AllocateDate = @Date
	
END
GO
/****** Object:  StoredProcedure [dbo].[genRollBackAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genRollBackAllocation]
	@RoomTypeID int,
	@Date datetime
AS
begin

	Set Nocount on;
	declare @Qty int
	declare @NewQty int

	Select @qty = Quantity from RoomTypeAllocation
	Where RoomTypeID = @RoomTypeID and AllocateDate = @Date

	Set @NewQty = @Qty + 1

	update RoomTypeAllocation
	Set Quantity = @NewQty
	Where RoomTypeID = @RoomTypeID and AllocateDate = @Date
end
GO
/****** Object:  StoredProcedure [dbo].[genRollBackPackageAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genRollBackPackageAllocation]
	@RoomTypeID int,
	@Date datetime,
	@PackageID int
AS
begin

	Set Nocount on;
	declare @Qty int
	declare @NewQty int

	Select @qty = Quantity from PackageAllocation
	Where RoomTypeID = @RoomTypeID and AllocateDate = @Date and PackageID = @PackageID

	Set @NewQty = @Qty + 1

	update PackageAllocation
	Set Quantity = @NewQty
	Where RoomTypeID = @RoomTypeID and AllocateDate = @Date and PackageID = @PackageID
end
GO
/****** Object:  StoredProcedure [dbo].[genSelAdultBase]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelAdultBase]
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID] FROM AdultBase
	Left join RoomType 
	on (RoomType.RoomTypeID = AdultBase.RoomTypeID)
	Where RoomType.HotelID = @HotelID and RoomType.Visible = 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[genSelAdultBaseByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelAdultBaseByID]
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID] FROM AdultBase
	Where RoomTypeID = @RoomID
	
END
GO
/****** Object:  StoredProcedure [dbo].[genSelAllCalendarEvents]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelAllCalendarEvents]
	-- Add the parameters for the stored procedure here

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EventID] FROM CalendarEvents
	Where StartDate >= GetDate() or EndDate >= GetDate()
	Order By StartDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelAllocationByDay]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelAllocationByDay]
	@RoomID int,
	@PickedDated datetime

As
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT Quantity from RoomTypeAllocation
	Where RoomTypeID = @RoomID and
	AllocateDate = @PickedDated

END
GO
/****** Object:  StoredProcedure [dbo].[genSelAllocationByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelAllocationByID]
	@AllocationID int
AS
	Begin
	SELECT [AllocationID] FROM RoomTypeAllocation
	Where AllocationID = @AllocationID
	end
GO
/****** Object:  StoredProcedure [dbo].[genSelAllocationByRoomID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelAllocationByRoomID]
	
	@RoomID int
AS
	SELECT [AllocationID] FROM RoomTypeAllocation
	Where RoomTypeID = @RoomID and AllocateDate >= CONVERT(char(8), GetDate(), 112)
	Order by AllocateDate 
GO
/****** Object:  StoredProcedure [dbo].[genSelCalendarEventByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelCalendarEventByID]
	-- Add the parameters for the stored procedure here
	@EventID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EventID] FROM CalendarEvents
	Where EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelCalendarEventByMonth]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelCalendarEventByMonth]
	-- Add the parameters for the stored procedure here
	@Month int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EventID] FROM CalendarEvents
	Where month(StartDate) = @Month and StartDate >= GetDate() 
	Order By StartDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelCustomMessageByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelCustomMessageByDate]
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@Date datetime
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MessageID] FROM CustomMessage
	Where HotelID = @HotelID and @Date between DisplayFrom and DisplayTo
END
GO
/****** Object:  StoredProcedure [dbo].[genSelCustomMessageByHotelID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelCustomMessageByHotelID]
	-- Add the parameters for the stored procedure here
	@HotelID int
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MessageID] FROM CustomMessage
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelCustomMessageByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelCustomMessageByID]
	-- Add the parameters for the stored procedure here
	@MessageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT* from CustomMessage
	Where MessageID = @MessageID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelDisclaimer]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelDisclaimer] 
	-- Add the parameters for the stored procedure here
	@HotelID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DisclaimerID] FROM Disclaimer
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelEmailList]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelEmailList]
	@HotelID int,
	@StartDate datetime,
	@EndDate datetime
AS
	SELECT [Id] FROM OptInEmails
	Where HotelID = @HotelID and (OptInDate Between @StartDate and @EndDate)
GO
/****** Object:  StoredProcedure [dbo].[genSelEvents]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[genSelEvents] 
	-- Add the parameters for the stored procedure here
	@EventID int
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EventID] FROM HotelEvent
	Where EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelEventsByHotelID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[genSelEventsByHotelID] 
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [EventID] FROM HotelEvent
	Where HotelID = @HotelID
	
END
GO
/****** Object:  StoredProcedure [dbo].[genSelExtraAmenitiesByPackageID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelExtraAmenitiesByPackageID]
	@PackageID int
AS
	Select 
	ExtraAmenity.AmenityID,
	ExtraAmenity.AmenityRate,
	ExtraAmenity.Description,
	ExtraAmenity.Discount,
	ExtraAmenity.DiscountRegularRate,
	ExtraAmenity.HotelID,
	ExtraAmenity.Name,
	ExtraAmenity.OneTimeFee,
	ExtraAmenity.OneTimeFeePerson,
	ExtraAmenity.PerDay,
	ExtraAmenity.PerDayPerPerson,
	ExtraAmenity.PerNightStay,
	ExtraAmenity.PictureUrl,
	ExtraAmenity.Tax,
	ExtraAmenity.Visible,
	PackageAmenity.Mandatory,
	PackageAmenity.ViewRate,
	PackageAmenity.MandatoryQuantity,
	PackageAmenity.AdditionalPurchases
	from ExtraAmenity
	left join PackageAmenity  
	on ExtraAmenity.AmenityID= PackageAmenity.ExtraAmenityID
	Where PackageAmenity.PackageID = @PackageID
	Order by PackageAmenity.Mandatory DESC
GO
/****** Object:  StoredProcedure [dbo].[genSelExtraAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelExtraAmenity]
	-- Add the parameters for the stored procedure here
	@HotelID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AmenityID] FROM ExtraAmenity
	Where HotelID = @HotelID and Visible = 1
	Order by Name
END
GO
/****** Object:  StoredProcedure [dbo].[genSelExtraAmenityByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelExtraAmenityByID]
	-- Add the parameters for the stored procedure here
	@AmenityID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AmenityID] FROM ExtraAmenity
	Where AmenityID = @AmenityID
	
END
GO
/****** Object:  StoredProcedure [dbo].[genSelHotel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

Create PROCEDURE [dbo].[genSelHotel]
	-- Add the parameters for the stored procedure here
	@HotelID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [HotelID] FROM Hotel
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelHotelLayout]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelHotelLayout]
	@HotelID int
AS
	SELECT [Id] FROM HotelLayout
	Where HotelID = @HotelID
GO
/****** Object:  StoredProcedure [dbo].[genSelHotelPayments]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelHotelPayments]
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [HotelPaymentID] FROM HotelPaymentTypes
	Where HotelID = @HotelID
END

GO
/****** Object:  StoredProcedure [dbo].[genSelHotelsAssociatedUser]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelHotelsAssociatedUser]
	@UserID nvarchar(50)
	
AS
	SELECT [HotelID] FROM Hotel as ht 
	join HotelUsers as hu
	 on(ht.HotelID = hu.HotelID)
	Where hu.UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[genSelHotelSystem]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelHotelSystem]
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [SystemID] FROM HotelSystem
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelLowQtyForPackageAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelLowQtyForPackageAllocation]
	@RoomID int,
	@PackageID int,
	@Start datetime,
	@End datetime
AS
 Declare @Qty int

 Set NOCount On;
 Begin
	Select @Qty = Min(Quantity) from PackageAllocation
	Where RoomTypeID = @RoomID and PackageID = @PackageID and (AllocateDate >= @Start and AllocateDate < @End)
 End

 return @Qty
GO
/****** Object:  StoredProcedure [dbo].[genSelLowQtyForRoomAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelLowQtyForRoomAllocation]
	@RoomID int,
	@Start datetime,
	@End datetime
AS

Declare @Qty int

SET NOCOUNT ON;

Begin
	SELECT @Qty = Min(Quantity) from RoomTypeAllocation
	Where RoomTypeID = @RoomID and (AllocateDate >= @Start and AllocateDate < @End)
End

return @Qty
GO
/****** Object:  StoredProcedure [dbo].[genSelMandatoryAmenitiesForPackage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelMandatoryAmenitiesForPackage]
	-- Add the parameters for the stored procedure here
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AmenityID] FROM ExtraAmenity
	Left Join PackageAmenity on ExtraAmenity.AmenityID = PackageAmenity.ExtraAmenityID
	Where PackageAmenity.PackageID = @PackageID and PackageAmenity.Mandatory = 1 and ExtraAmenity.Visible = 1
END
GO
/****** Object:  StoredProcedure [dbo].[genSelMaxBase]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelMaxBase]
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID] FROM MaxBase
	Left join RoomType
	on (RoomType.RoomTypeID = MaxBase.RoomTypeID)
	Where RoomType.HotelID = @HotelID and RoomType.Visible = 1
END
GO
/****** Object:  StoredProcedure [dbo].[genSelMaxBaseByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelMaxBaseByID]
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID] FROM MaxBase
	Where RoomTypeID = @RoomID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelMinStayByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelMinStayByDate]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@PickedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MinStay from MinStay
	Where RoomTypeID = @RoomID and 
	StayDate = @PickedDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelMinStayByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelMinStayByID]
 @MinStayID int
AS
	begin
	SELECT [MinStayID] FROM MinStay
	Where MinStayID = @MinStayID
	end
GO
/****** Object:  StoredProcedure [dbo].[genSelMinStayByRoomID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelMinStayByRoomID]
	@RoomID int
AS
	SELECT [MinStayID] FROM MinStay
	Where RoomTypeID = @RoomID and StayDate >= CONVERT(char(8), GetDate(), 112)
	Order by StayDate
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageAllocationByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageAllocationByDate] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@PacakgeID int,
	@Month int,
	@Day int,
	@Year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AllocationID] FROM PackageAllocation
	Where RoomTypeID = @RoomID and 
	PackageID = @PacakgeID and 
	DATEPART(Year, AllocateDate) = @Year and 
	DATEPART(Month, AllocateDate) = @Month and 
	DATEPART(DAY, AllocateDate) = @Day
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageAllocationByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageAllocationByID]
	@AllocationID int
AS
begin
	SELECT [AllocationID] FROM PackageAllocation
	Where AllocationID = @AllocationID
end
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageAllocationByRoomID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageAllocationByRoomID]
	@RoomID int,
	@PackageID int
AS
	SELECT [AllocationID] FROM PackageAllocation
	Where RoomTypeID = @RoomID and PackageID = @PackageID and AllocateDate > =CONVERT(char(8), GetDate(), 112)
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageAmenities]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageAmenities]
	-- Add the parameters for the stored procedure here
	@PackageID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AmenityID] FROM PackageAmenity
	Where PackageID = @PackageID 
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageAmenityByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageAmenityByID]
	@ExtraAmenityID int,
	@PackageID int
AS
	Begin
	SELECT [AmenityID] FROM PackageAmenity
	Where PackageID = @PackageID and ExtraAmenityID = @ExtraAmenityID
	End
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageAssociatedWithAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageAssociatedWithAmenity] 
	-- Add the parameters for the stored procedure here
	@amenityid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package 
	left join PackageAmenity	on Package.PackageID = PackageAmenity.PackageID
	Where PackageAmenity.ExtraAmenityID = @amenityid and Package.Visible = 1 and PackageAmenity.Mandatory = 1
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageByID]
	-- Add the parameters for the stored procedure here
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	Where PackageID = @PackageID
	
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageForSpecialPage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageForSpecialPage]
	-- Add the parameters for the stored procedure here
	@HotelID int
	
	
AS
BEGIN
	Declare @Now datetime
	set @Now = GETDATE();
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	Where HotelID = @HotelID and MiniVac = 0 and DeletedPackage = 0 and @Now <= EndDisplayDate and Visible = 1
	Order by SortOrder
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageRateByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelPackageRateByDate]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Temp datetime,
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RateID] FROM PackageRate
	Where RoomTypeID = @RoomID and PackageID = @PackageID and @Temp between StartDate and EndDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageRateByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[genSelPackageRateByID]
	-- Add the parameters for the stored procedure here

	@PKRateID int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RateID] FROM PackageRate
	WHERE RateID = @PKRateID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageRates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageRates]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@PackageID int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RateID] FROM PackageRate
	WHERE RoomTypeID = @RoomID and Visible = 1 and PackageID = @PackageID
	and EndDate > CURRENT_TIMESTAMP
	Order by StartDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageRooms]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageRooms]
	-- Add the parameters for the stored procedure here
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RoomTypeID] FROM RoomType left join PackageRoomType
	on RoomType.RoomTypeID = PackageRoomType.RoomTypeID
	Where PackageRoomType.PackageID = @PackageID
	order by RoomType.Name
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackagesAssociatedWithRoom]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackagesAssociatedWithRoom]
	-- Add the parameters for the stored procedure here
	@RoomTypeID int,
	@Start datetime,
	@End datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Declare @Now datetime
	SET @Now = GETDATE();
	
	Declare @TS int
	Set @TS = DATEDIFF(day,@Start, @End);
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	left join PackageRoomType
	on Package.PackageID = PackageRoomType.PackageID
	Where PackageRoomType.RoomTypeID = @RoomTypeID and @Start >= Package.ValidFrom and @End <= Package.ValidTo
	and Package.Visible = 1 and MiniVac = 0 and DeletedPackage = 0 and @Now <= EndDisplayDate and @TS <= MaxDays and Package.SpecialPage = 0
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackagesByHotelID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackagesByHotelID] 
	-- Add the parameters for the stored procedure here
	@HotelID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	Where HotelID = @HotelID and DeletedPackage = 0
	Order by ValidFrom desc
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackagesWithAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[genSelPackagesWithAllocation]
	-- Add the parameters for the stored procedure here
	@hotelid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	Where HotelID = @hotelid and PackageAllocation = 1 and DeletedPackage = 0
	Order by ValidFrom desc
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackagesWithRates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackagesWithRates] 
	-- Add the parameters for the stored procedure here
	@HotelID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	Where HotelID = @HotelID and DeletedPackage = 0 and 
	PricePoint = 1
	Order by Package.ValidFrom desc
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackagesWithTierLevel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackagesWithTierLevel]
	-- Add the parameters for the stored procedure here
	@HotelID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PackageID] FROM Package
	Where HotelID = @HotelID and DeletedPackage = 0 and 
	(PercentOff = 1 or NightsFree = 1)
	Order by ValidFrom desc
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageTierLevelByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageTierLevelByDate] 
	-- Add the parameters for the stored procedure here
	@PackageID int,
	@Month int,
	@Day int,
	@Year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [TierLevelID] FROM PackageTierLevel
	Where PackageID = @PackageID and 
	DATEPART(Month, TierDate) = @Month and 
	DATEPART(Day, TierDate) = @Day and 
	DATEPART(Year, TierDate)= @Year
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageTierLevelByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageTierLevelByID]
	@TierLevelID int
AS
Begin
	SELECT [TierLevelID] FROM PackageTierLevel
	Where TierLevelID = @TierLevelID
End
GO
/****** Object:  StoredProcedure [dbo].[genSelPackageTierLevelByPackageID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPackageTierLevelByPackageID]
	@PackageID int
AS
	Begin
	SELECT [TierLevelID] FROM PackageTierLevel
	Where PackageID = @PackageID and TierDate >= CONVERT(char(8), GetDate(), 112)
	end
GO
/****** Object:  StoredProcedure [dbo].[genSelPaymentTypes]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPaymentTypes]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [PaymentTypeID] FROM PaymentType
END
GO
/****** Object:  StoredProcedure [dbo].[genSelPriorDays]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelPriorDays]
	@HotelID int,
	@Days int output
AS

begin
--Declare @Days int 

Set NOCOUNT ON;

Select @Days = PriorBook from HotelSystem
Where HotelID = @HotelID

--Set @Days = @HotelID
--select @Days
end

SET NOCOUNT OFF
return @Days
GO
/****** Object:  StoredProcedure [dbo].[genSelRackRateAmenities]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRackRateAmenities]
	-- Add the parameters for the stored procedure here
	@HotelID int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [AmenityID] FROM ExtraAmenity
	Where HotelID = @HotelID and ViewOnRackRate = 1 and Visible = 1
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRackRateByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRackRateByDate]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Temp datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RackRateID] FROM RackRates
	Where RoomTypeID = @RoomID and @Temp between StartDate and EndDate and Visible = 1
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRackRateByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRackRateByID]
	@RackRackID int
AS
Begin

Set NoCount On;

	SELECT [RackRateID] FROM RackRates
	Where RackRateID = @RackRackID
End
GO
/****** Object:  StoredProcedure [dbo].[genSelRackRateByRoomID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRackRateByRoomID]
	-- Add the parameters for the stored procedure here
	@RoomId int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Declare @Todaydate datetime
	Set @Todaydate = GETDATE()
    -- Insert statements for procedure here
	SELECT [RackRateID] FROM RackRates
	WHERE RoomTypeID = @RoomId and Convert(date,EndDate) >= Convert(date, @Todaydate) and Visible = 1
	order by StartDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomFeature]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomFeature]
	@RoomTypeID int
AS
	begin
		SELECT [Id] FROM RoomFeatures
		Where RoomTypeID = @RoomTypeID
	end
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomImageByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomImageByID] 
	-- Add the parameters for the stored procedure here
	@ImageID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ImageID] FROM RoomImage
	Where ImageID = @ImageID;
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomImagesByRoomID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomImagesByRoomID] 
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ImageID] FROM RoomImage
	Where RoomTypeID = @RoomID and Visible = 1
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomMainImage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomMainImage] 
	-- Add the parameters for the stored procedure here
	@RoomTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ImageID] FROM RoomImage
	Where RoomTypeID = @RoomTypeID and MainImage = 1 
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomsByHotelID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomsByHotelID] 
	-- Add the parameters for the stored procedure here
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RoomTypeID] FROM RoomType
	Where HotelID = @HotelID and Visible = 1
	Order by Name
END
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomsWithAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomsWithAllocation] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Start Datetime,
	@End Datetime
AS

Declare @temp datetime
Declare @Qty int
Declare @Valid bit

Set @Valid = 0;
Set @temp = @Start

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	While (@temp < @End)
	Begin
		Select @Qty = Quantity from RoomTypeAllocation
		Where AllocateDate = @temp and RoomTypeID = @RoomID
		
		if @Qty > 0
		begin
			set @Valid = 1
		end
		else
		begin
			set @Valid = 0
			return @Valid
			break
		end
			
	
		Set @temp = DATEADD(day, 1, @temp)
	End
	Set NoCount OFF
	
	Select 'valid' =  @Valid;
GO
/****** Object:  StoredProcedure [dbo].[genSelRoomTypeByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelRoomTypeByID] 
	-- Add the parameters for the stored procedure here
	@RoomID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RoomTypeID] FROM RoomType
	Where RoomTypeID = @RoomID
END
GO
/****** Object:  StoredProcedure [dbo].[genSelTierLevelByDate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================


CREATE PROCEDURE [dbo].[genSelTierLevelByDate]
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@Date Date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Tier from TierLevel
	Where HotelID = @HotelID and 
	TierDate = @Date
END
GO
/****** Object:  StoredProcedure [dbo].[genSelTierLevelByHotelID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelTierLevelByHotelID]
	@HotelID int
AS
Begin
	SELECT [TierLevelID] FROM TierLevel
	Where HotelID = @HotelID and TierDate >= CONVERT(char(8), GetDAte(), 112)
end
GO
/****** Object:  StoredProcedure [dbo].[genSelTopCalendarEvents]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelTopCalendarEvents]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Top 50 * from CalendarEvents
	Where StartDate >= GetDate() or EndDate >= GetDate()
	Order By StartDate
END
GO
/****** Object:  StoredProcedure [dbo].[genSelUserForHotel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genSelUserForHotel]
	@HotelID int

AS

 Select us.UserName, us.Id, us.Status, us.LastLoginDate from HotelUsers as ht
 join AspNetUsers as us on ht.UserID = us.Id
 join AspNetUserRoles as usro on us.Id = usro.UserId
 join AspNetRoles as ro on usro.RoleId = ro.Id
 Where ht.HotelID = @HotelID and ro.Name != 'WRRAdmin'
GO
/****** Object:  StoredProcedure [dbo].[genUpdAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdAllocation]
	@Quantity int,
	@AllocationID int
AS
begin
	update RoomTypeAllocation
	set Quantity = @Quantity
	Where AllocationID = @AllocationID
end
GO
/****** Object:  StoredProcedure [dbo].[genUpdCalendarEvents]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdCalendarEvents]
	-- Add the parameters for the stored procedure here
	@EventID int,
	@Title nvarchar(max),
	@StartDate datetime,
	@EndDate datetime,
	@Venue nvarchar(max),
	@Address nvarchar(max),
	@Time nvarchar(200),
	@Website nvarchar(max),
	@Details nvarchar(max),
	@ImgUrl nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update CalendarEvents
	Set Title = @Title,
	StartDate = @StartDate,
	EndDate = @EndDate,
	Venue = @Venue,
	Address = @Address,
	Time = @Time,
	Website = @Website,
	Details = @Details,
	ImgUrl = @ImgUrl
	Where EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdCustomMessage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdCustomMessage]
	-- Add the parameters for the stored procedure here
	@From datetime,
	@To datetime,
	@Message nvarchar(max),
	@MessageID int
AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update CustomMessage
	Set DisplayFrom = @From, 
	DisplayTo = @To, 
	Message = @Message
	Where MessageID = @MessageID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdDisclaimer]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdDisclaimer]
	-- Add the parameters for the stored procedure here
	@Disclaimer text,
	@Email text,
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Disclaimer
	set DisclaimerText = @Disclaimer,
	EmailDisclaimerText = @Email
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdEvent]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[genUpdEvent] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max),
	@Detail text, 
	@Visible bit,
	@StartDate datetime,
	@EndDate datetime,
	@Repeart bit,
	@mon bit,
	@tues bit,
	@wed bit,
	@thurs bit,
	@fri bit,
	@sat bit,
	@sun bit,
	@EventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HotelEvent
	set EventName = @Name,
	Details = @Detail,
	StartDate = @StartDate, 
	EndDate = @EndDate, 
	RepeatWeekly = @Repeart,
	Monday = @mon,
	Tuesday = @tues, 
	Wednesday = @wed,
	Thursday = @thurs,
	Friday = @fri, 
	Saturday = @sat, 
	Sunday = @sun,
	Visible = @Visible
	Where EventID = @EventID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdExtraAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdExtraAmenity]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(150),
	@Description text,
	@Tax decimal(18,2),
	@AmenityRate decimal(18,2),
	@PerDay bit,
	@PerDayPerPerson bit,
	@OneTimeFee bit,
	@OneTimeFeePerPerson bit,
	@PerNightStay bit,
	@ViewRate bit,
	@Mandatory bit,
	@Discount bit,
	@PictureUrl nvarchar(max),
	@Amenity int,
	@ViewOnRR bit,
	@DiscountRegRate decimal(18,2),
	@ShortDesc nvarchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ExtraAmenity
	set Name = @Name,
	Description = @Description,
	AmenityRate = @AmenityRate,
	Tax = @Tax,
	ViewRate = @ViewRate,
	Mandatory = @Mandatory,
	PerDay = @PerDay,
	PerDayPerPerson = @PerDayPerPerson,
	PerNightStay = @PerNightStay,
	OneTimeFee = @OneTimeFee,
	OneTimeFeePerson = @OneTimeFeePerPerson,
	Discount = @Discount,
	PictureUrl = @PictureUrl,
	DiscountRegularRate = @DiscountRegRate,
	ViewOnRackRate = @ViewOnRR,
	ShortDescription = @ShortDesc
	Where AmenityID = @Amenity
	
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdHotel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdHotel] 
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@Name nvarchar(200),
	@Email nvarchar(200),
	@AdminEmail nvarchar(256),
	@Address1 nvarchar(200),
	@Address2 nvarchar(200),
	@City nvarchar(50),
	@State nvarchar(50), 
	@Zipcode nvarchar(20),
	@FreePhone nvarchar(20),
	@LocalPhone nvarchar(20),
	@Website nvarchar(200),
	@Desc text,
	@CheckIn nvarchar(20),
	@CheckOut nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Hotel 
	SET Name = @Name,
	Email = @Email, 
	AdminEmail = @AdminEmail,
	Address1 = @Address1, 
	Address2 = @Address2, 
	City = @City, 
	State = @State, 
	ZipCode = @Zipcode,
	TollFreePhone = @FreePhone,
	LocalPhone = @LocalPhone,
	Website = @Website,
	Description = @Desc, 
	CheckIn = @CheckIn,
	CheckOut = @CheckOut
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdHotelSystem]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdHotelSystem]
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@AdultFee decimal(18,2),
	@ChildFee decimal(18,2),
	@BaseFee decimal(18,2),
	@WeekendFee decimal(18,2),
	@ResortFee decimal(18,2), 
	@TaxRate decimal(18,2),
	@AddTaxDeposit bit,
	@DisplayRoomRate nvarchar(50),
	@DisplayPackageRate nvarchar(50),
	@LowAllocationLimit int,
	@PriorBook int,
	@DepositRoomCal nvarchar(50),
	@DepositPackageCal nvarchar(50),
	@DepositRoomPercentage decimal(18,2),
	@DepositPackagePercentage decimal(18,2),
	@AddTaxWeekend bit,
	@AddTaxExtraPerson bit,
	@ResortFeeCal nvarchar(50),
	@AddTaxToResortFee bit,
	@RoomBreakDown nvarchar(50),
	@PackageBreakDown nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update HotelSystem
	set ExtraAdultFee = @AdultFee,
	ExtraChildFee = @ChildFee,
	ExtraBaseFee = @BaseFee,
	WeekendFee = @WeekendFee, 
	ResortFee = @ResortFee,
	TaxRate = @TaxRate,
	AddTaxToDeposit = @AddTaxDeposit,
	DisplayRoomRatesAs = @DisplayRoomRate,
	DisplayPackageRatesAs = @DisplayPackageRate,
	LowAllocationLimit = @LowAllocationLimit,
	PriorBook = @PriorBook,
	DepositRoomCalAs = @DepositRoomCal,
	DepositPackageCalAs = @DepositPackageCal,
	DepositRoomPercentage = @DepositRoomPercentage,
	DepositPackagePercentage = @DepositPackagePercentage,
	AddTaxToWeekendFee = @AddTaxWeekend,
	AddTaxToExtraPerson = @AddTaxExtraPerson,
	ResortFeeCalAs = @ResortFeeCal,
	AddTaxToResortFee = @AddTaxToResortFee,
	RoomBreakDownAs = @RoomBreakDown,
	PackageBreakDownAs = @PackageBreakDown
	Where HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdMinStay]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdMinStay]
	@Quantity int,
	@MinStayID int
AS
	begin
	update MinStay
	Set MinNightStay = @Quantity
	Where MinStayID = @MinStayID
	end
GO
/****** Object:  StoredProcedure [dbo].[genUpdPackage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdPackage] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max),
	@Description text,
	@HotelID int,
	@Amenities bit,
	@ArrMon bit,
	@ArrTues bit,
	@ArrWed bit,
	@ArrThur bit,
	@ArrFri bit,
	@ArrSat bit,
	@ArrSun bit,
	@MinDays int,
	@MaxDays int,
	@WeekendSurcharge bit,
	@ResortFees bit,
	@ValidFrom datetime,
	@ValidTo datetime,
	@EndDisplayDate datetime,
	@Visible bit,
	@NightsFree bit,
	@NumberOfNights float,
	@PercentOff bit,
	@PercentageOff decimal(18,2),
	@PricePoint bit,
	@Deposit decimal(18,2),
	@ExtraPersonFee bit,
	@PackageAllocation bit,
	@PackageID int,
	@MiniVac bit,
	@ShortDesc nvarchar(max),
	@SpecialPage bit
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Package
	Set Name = @Name,
	Description = @Description,
	ShortDescription = @ShortDesc,
	Amenities = @Amenities,
	ArrMon = @ArrMon,
	ArrTues = @ArrTues,
	ArrWed = @ArrWed,
	ArrThur = @ArrThur,
	ArrFri = @ArrFri,
	ArrSat = @ArrSat,
	ArrSun = @ArrSun, 
	MinDays = @MinDays,
	MaxDays = @MaxDays,
	WeekendSurcharge = @WeekendSurcharge,
	ResortFees = @ResortFees,
	ValidFrom = @ValidFrom,
	ValidTo = @ValidTo,
	EndDisplayDate = @EndDisplayDate,
	Visible = @Visible,
	SpecialPage = @SpecialPage,
	NightsFree = @NightsFree,
	NumberOfNights = @NumberOfNights,
	PercentOff = @PercentOff,
	PercentageOff = @PercentageOff,
	PricePoint = @PricePoint,
	Deposit = @Deposit,
	ExtraPersonFee =@ExtraPersonFee,
	PackageAllocation = @PackageAllocation,
	MiniVac = @MiniVac	
	Where PackageID = @PackageID
	
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdPackageAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdPackageAllocation]
	@Quantity int,
	@AllocationID int
AS
begin
	update PackageAllocation
	Set Quantity = @Quantity
	Where AllocationID = @AllocationID
End
GO
/****** Object:  StoredProcedure [dbo].[genUPdPackageAmenity]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUPdPackageAmenity]
	@PackageAmenityID int,
	@ViewRate bit,
	@Mandatory bit,
	@Qty int,
	@AdditionalPurchases bit
AS
	BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PackageAmenity
	Set Mandatory = @Mandatory,
	ViewRate = @ViewRate,
	MandatoryQuantity = @Qty,
	AdditionalPurchases = @AdditionalPurchases
	Where AmenityID = @PackageAmenityID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdPackageImage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdPackageImage]
	-- Add the parameters for the stored procedure here
	@SmImage nvarchar(max),
	@PackageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Package
	set SmImage = @SmImage
	Where PackageID = @PackageID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdPackageRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdPackageRate]
	-- Add the parameters for the stored procedure here
	@Start datetime,
	@End datetime,	
	@Price decimal(18,2),
	@RateID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PackageRate
	SEt StartDate = @Start,
	EndDate = @End,	
	Price = @Price,
	visible = 1
	Where RateID = @RateID 
	
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdPackageTierLevel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdPackageTierLevel]
	@Tier char(8),
	@PackageTierLevelID int
AS
	Begin
	update PackageTierLevel
	Set Tier = @Tier
	Where TierLevelID = @PackageTierLevelID
	End
GO
/****** Object:  StoredProcedure [dbo].[genUpdRackRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdRackRate]
	@Start datetime,
	@End datetime,	
	@TierA decimal(18,2),
	@TierB decimal(18,2),
	@TierC decimal(18,2),
	@TierD decimal(18,2),
	@RateID int
AS
	Begin
	Set Nocount on;
	update RackRates
	Set StartDate = @Start,
	EndDate = @End,
	TierARate = @TierA,
	TierBRate = @TierB,
	TierCRate = @TierC,
	TierDRate = @TierD
	Where RackRateID = @RateID
	End
GO
/****** Object:  StoredProcedure [dbo].[genUpdRoomFeature]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdRoomFeature]
	@ID int,	
	@Icon nvarchar(50),
	@Feature nvarchar(200)
AS
begin
	update RoomFeatures
	set
	Icon = @Icon,
	Features = @Feature
	Where Id = @ID
end
GO
/****** Object:  StoredProcedure [dbo].[genUpdRoomMainImage]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdRoomMainImage] 
	-- Add the parameters for the stored procedure here
	@ImageID int,
	@RoomTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update RoomImage
	Set MainImage = 0
	Where RoomTypeID = @RoomTypeID
	
	Update RoomImage
	Set MainImage = 1
	Where ImageID = @ImageID
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdRoomType]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdRoomType]
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Name nvarchar(200),
	@Desc text,
	@Adult int,
	@Max int,
	@BedType nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update RoomType
	set Name = @Name,
	Description = @Desc,
	AdultBase = @Adult,
	MaxBase = @Max,
	BedType = @BedType
	Where RoomTypeID = @RoomID
	
END
GO
/****** Object:  StoredProcedure [dbo].[genUpdTierLevel]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genUpdTierLevel]
	@Tier char(8),
	@TierLevelID int
AS
	Begin
	update TierLevel
	set Tier = @Tier
	Where TierLevelID = @TierLevelID
	end
GO
/****** Object:  StoredProcedure [dbo].[genVerifyDateRange]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genVerifyDateRange]
	@StartDate datetime,
	@EndDate datetime,
	@RoomID int
	
AS
Begin
	Declare @valid bit;
	Set @valid = 0;
	Declare @checkdate datetime;
	Set @checkdate = @StartDate;
	

	Set Nocount on;
	
	While(@checkdate <= @EndDate)
	begin
		if Exists(
			Select 0 from RackRates
			Where RoomTypeID = @RoomID and @checkdate between StartDate and EndDate and Visible = 1
			)
		if(@@ROWCOUNT > 0)
		begin
			set @valid = 0
			break;
		end
		else
			set @valid = 1;
			Set @checkdate +=1;
	End
	Select 'valid' =  @valid;
End
GO
/****** Object:  StoredProcedure [dbo].[genVerifyPackageRates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genVerifyPackageRates]
	@StartDate datetime,
	@EndDate datetime,
	@RoomID int,
	@PackageID int
AS
Begin
	Declare @valid bit;
	Set @valid = 0;
	Declare @checkdate datetime;
	Set @checkdate = @StartDate;

	Set Nocount on;

	While(@checkdate <= @EndDate)
	begin
		if Exists(
		Select 0 from PackageRate
		Where RoomTypeID = @RoomID and PackageID = PackageID and @checkdate between StartDate and EndDate and visible = 1
		)
		if(@@ROWCOUNT > 0)
		begin
			set @valid = 0
			break;
		end
		else
			set @valid = 1;
			Set @checkdate +=1;
	End
	Select 'valid' = @valid;
End
GO
/****** Object:  StoredProcedure [dbo].[genVerifyRoomAvailabilityForPackageAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genVerifyRoomAvailabilityForPackageAllocation]
	@RoomID int,
	@PackageID int,
	@Start Datetime,
	@End Datetime
AS

Declare @temp datetime
Declare @Qty int
Declare @Valid bit

Set @temp = @Start

Set NOCOUNT ON;
while(@Temp < @End)
	begin
		Select @Qty = Quantity from PackageAllocation
		Where AllocateDate = @temp and RoomTypeID = @RoomID and PackageID = @PackageID

		if @Qty > 0
		begin
			set @Valid = 1
		end
		else
		begin
			Set @Valid = 0
			return @Valid
			break
		end

		Set @temp = DATEADD(day, 1, @Temp)
	end

SET NOCOUNT OFF
return @Valid
GO
/****** Object:  StoredProcedure [dbo].[genVerifyRoomAvailabilityForRoomAllocation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genVerifyRoomAvailabilityForRoomAllocation] 
	-- Add the parameters for the stored procedure here
	@RoomID int,
	@Start Datetime,
	@End Datetime
AS

Declare @temp datetime
Declare @Qty int
Declare @Valid bit

Set @temp = @Start

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	While (@temp < @End)
	Begin
		Select @Qty = Quantity from RoomTypeAllocation
		Where AllocateDate = @temp and RoomTypeID = @RoomID
	 
		if @Qty > 0
		begin
			set @Valid = 1
		end
		else
		begin
			set @Valid = 0
			return @Valid
			break
		end
			
	
		Set @temp = DATEADD(day, 1, @temp)
	End
	Set NoCount OFF
	
	return @Valid
GO
/****** Object:  StoredProcedure [dbo].[genVisiblePackageRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genVisiblePackageRate]
	-- Add the parameters for the stored procedure here
	@RateID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PackageRate
	Set visible = 1
	Where RateID = @RateID
END
GO
/****** Object:  StoredProcedure [dbo].[genVisibleRackRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[genVisibleRackRate]
	@RackRateID int
AS
Begin
	update RackRates
	Set Visible = 1
	Where RackRateID = @RackRateID
End
GO
/****** Object:  StoredProcedure [dbo].[GetActiveCode]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetActiveCode]
	@UserID nvarchar(128)
	
AS
	SELECT [Id] FROM UsersActiveCode
	Where UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[getHotelUsers]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[getHotelUsers]
	@UserID nvarchar(50)
	
AS
	SELECT [HotelID] FROM Hotel as ht 
	join HotelUsers as hu
	 on(ht.HotelID = hu.HotelID)
	Where hu.UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[GetUser]
	-- Add the parameters for the stored procedure here
	@ID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id] FROM AspNetUsers
	WHERE Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByUsername]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByUsername]
	-- Add the parameters for the stored procedure here
	@Username nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id] FROM AspNetUsers
	WHERE Username = @Username
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoles]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[GetUserRoles]
	@UserID nvarchar(128)
AS
BEGIN
	
	SELECT R.Name As RoleName
	FROM AspNetUserRoles UR
	INNER JOIN AspNetRoles R
	ON UR.RoleId = R.Id
	WHERE UR.UserId = @UserID
	
END
GO
/****** Object:  StoredProcedure [dbo].[incrementaccessfailed]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[incrementaccessfailed]
	@ID nvarchar(128),
	@AccessFailCount int,
	@Status int
AS
	update AspNetUsers
	Set AccessFailedCount = @AccessFailCount,
	Status = @Status
	Where Id = @ID
GO
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewUser]
	-- Add the parameters for the stored procedure here
	@ID nvarchar(128),
	@UserName nvarchar(256),
	@Email nvarchar(256),
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@PhoneNumber nvarchar(max),
	@PhoneNumberConfirmed bit,
	@TwoFactorEnabled bit,
	@LockOutEnabled bit,
	@AccessFailedCount int,
	@Status int
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO ASPNetUsers(
		ID,
		UserName ,
		Email,
		EmailConfirmed,
		PasswordHash,
		SecurityStamp,
		PhoneNumber,
		PhoneNumberConfirmed,
		TwoFactorEnabled,
		LockoutEnabled,
		AccessFailedCount,		
		Status, 
		LastPasswordChangedDate
	)VALUES(
		@ID,
		@UserName ,
		@Email ,
		@EmailConfirmed,
		@PasswordHash,
		@SecurityStamp,
		@PhoneNumber,
		@PhoneNumberConfirmed,
		@TwoFactorEnabled,
		@LockOutEnabled,
		@AccessFailedCount,
		@Status,
		GetDate()
	)

END
GO
/****** Object:  StoredProcedure [dbo].[NewUserRole]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NewUserRole]
	@UserID nvarchar(128),
	@RoleName nvarchar(128)
AS
BEGIN
	DECLARE @UserRoleID nvarchar(50)
	DECLARE @RoleID nvarchar(128)
	
	SELECT @RoleID = Id
	FROM AspNetRoles
	WHERE Name = @RoleName
	
	IF @RoleID IS Not NULL
		BEGIN
			INSERT INTO AspNetUserRoles(			
				UserId,
				RoleId
			)VALUES(				
				@UserID,
				@RoleID
			)
		END 

END
GO
/****** Object:  StoredProcedure [dbo].[resetaccessfailedcount]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[resetaccessfailedcount]
	@ID nvarchar(128)
	
AS
	update AspNetUsers
	Set AccessFailedCount = 0	
	Where Id = @ID
GO
/****** Object:  StoredProcedure [dbo].[ResetPassword]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ResetPassword]
	-- Add the parameters for the stored procedure here
	@ID nvarchar(128),
	@PasswordHash nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update AspNetUsers
	set PasswordHash = @PasswordHash,
	LastPasswordChangedDate = GETDATE()
	Where Id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[rptAmenitiesCount]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptAmenitiesCount]
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime
AS
Begin
	;With query1(numofamen)
	as(
	Select Count(ID) as numofamen
	from ReservationAmenity as amen join Reservation as res
	on(amen.ReservationID = res.ReservationID)
	Where res.HotelID = @HotelID and res.ReservationCreated >= @CheckIn and res.ReservationCreated <= @CheckOut
	),
	query2 (numofamen)
	as(
	Select Count(ID) as numofamen
	from PackageReserAmenity as pa join PackageReservation as ra
	on(pa.ReservationID = ra.ReservationID)
	Where ra.HotelID = @HotelID and ra.ReservationCreated >= @CheckIn and ra.ReservationCreated <= @CheckOut
	)

	Select (query1.numofamen + query2.numofamen) as TotalNumber from query1, query2
End
GO
/****** Object:  StoredProcedure [dbo].[rptAmenitiesTotal]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptAmenitiesTotal]
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime
AS
Begin
	;With query1(totalcharge)
	as(
	Select Coalesce (sum(amen.TotalCharge), 0) as totalcharge
	from ReservationAmenity as amen join Reservation as res
	on(amen.ReservationID = res.ReservationID)
	Where res.HotelID = @HotelID and res.ReservationCreated >= @CheckIn and res.ReservationCreated <= @CheckOut
	),
	query2 (totalcharge)
	as(
	Select Coalesce (Sum(pa.TotalCharge), 0) as totalcharge
	from PackageReserAmenity as pa join PackageReservation as ra
	on(pa.ReservationID = ra.ReservationID)
	Where ra.HotelID = @HotelID and ra.ReservationCreated >= @CheckIn and ra.ReservationCreated <= @CheckOut
	)

	Select (query1.totalcharge + query2.totalcharge) as TotalCharge from query1, query2
End
GO
/****** Object:  StoredProcedure [dbo].[rptAmenityBookedByReservID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptAmenityBookedByReservID]
	-- Add the parameters for the stored procedure here
	@ReservationID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID] FROM ReservationAmenity
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[rptInsInitials]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptInsInitials] 
	-- Add the parameters for the stored procedure here
	@ReservationID int,
	@Initial nvarchar(200)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Reservation
	Set Initials = @Initial
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[rptInsOpenPackageReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[rptInsOpenPackageReservation]
	@ReservationID int,
	@DateStamp datetime,
	@UserID nvarchar(max)
AS
	insert into OpenPackageReservation
	(PackageReservationID, DateStamp, UserID)
	values
	(@ReservationID, @DateStamp, @UserID)

Select CAST(SCOPE_IDENTITY() as int)
GO
/****** Object:  StoredProcedure [dbo].[rptInsOpenReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[rptInsOpenReservation]
	@ReservationID int,
	@DateStamp datetime,
	@UserID nvarchar(max)
AS
	insert into OpenReservation
	(ReservationID, DateStamp, UserID)
	values
	(@ReservationID, @DateStamp, @UserID)

Select CAST(SCOPE_IDENTITY() as int)
GO
/****** Object:  StoredProcedure [dbo].[rptInsPackageInitials]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[rptInsPackageInitials] 
	-- Add the parameters for the stored procedure here
	@ReservationID int,
	@Initial nvarchar(200)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update PackageReservation
	Set Initials = @Initial
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[rptInsReservationQue]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptInsReservationQue]
	-- Add the parameters for the stored procedure here
	@HotelID int,
	@ReservationID int,
	@CusName nvarchar(300),
	@ReservationType int,
	@BookedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into ReservationQue
	(ReservationID, BookedDate, CustomerName, ReservationType, HotelID)
	values
	(@ReservationID, GETDATE(), @CusName, @ReservationType, @HotelID)
	
	Select CAST(SCOPE_IDENTITY() as int)
END
GO
/****** Object:  StoredProcedure [dbo].[rptPackageAmenityBookedByReservID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[rptPackageAmenityBookedByReservID]
	-- Add the parameters for the stored procedure here
	@ReservationID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ID] FROM PackageReserAmenity
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[rptPackageAmenityDailyBreakdown]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptPackageAmenityDailyBreakdown]
	@AmenityID int,	
	@Start Datetime,
	@End Datetime
AS
	SELECT sum(amen.TotalCharge) as TotalCharge, CAST(res.ReservationCreated as Date) as BookedDate, count(res.ReservationID) as ReservationCount
	From PackageReservation res
	join PackageReserAmenity amen
	on res.ReservationID = amen.ReservationID
	Where amen.AmenityID = @AmenityID and Cast(res.ReservationCreated as Date) between @Start and @End
	Group By CAST(res.ReservationCreated as Date)
	Order by BookedDate
GO
/****** Object:  StoredProcedure [dbo].[rptPackageDailyBreakdown]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptPackageDailyBreakdown]
	@HotelID int,
	@Start Datetime,
	@End Datetime
AS
	SELECT sum(res.TotalCharge) as TotalCharge, CAST(res.ReservationCreated as Date) as BookedDate, sum(res.TotalNights) as TotalNights, count(res.ReservationID) as ReservationCount, pk.Name as PackageName
	From PackageReservation res
	join Package pk
	on res.PackageID = pk.PackageID
	Where res.HotelID = @HotelID and Cast(res.ReservationCreated as Date) between @Start and @End
	Group By CAST(res.ReservationCreated as Date), pk.Name
	Order by BookedDate
GO
/****** Object:  StoredProcedure [dbo].[rptPackageReservationCount]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptPackageReservationCount]
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime
AS
Begin
	SELECT COUNT(ReservationID) as TotalNumber from PackageReservation
	Where HotelID = @HotelID and ReservationCreated >= @CheckIn and ReservationCreated <= @CheckOut
End
Set nocount off
GO
/****** Object:  StoredProcedure [dbo].[rptPackageTotal]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptPackageTotal] 
	-- Add the parameters for the stored procedure here
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime,
	@SearchBy nvarchar(200)
AS
Declare @amount decimal(16,2)

	IF @SearchBy = 'ArrivalDate'
		Begin
		 Select SUM(TotalCharge) as TotalCharge from PackageReservation
		 Where HotelID = @HotelID and ArrivalDate >= @CheckIn AND DepartureDate <= @CheckOut
		END
	ELSE IF @SearchBy = 'BookedDate'
		BEGIN
		-- Insert statements for procedure here
		SELECT SUM(TotalCharge) as TotalCharge from PackageReservation
		Where HotelID = @HotelID and ReservationCreated >= @CheckIn AND ReservationCreated <= @CheckOut
		END
GO
/****** Object:  StoredProcedure [dbo].[rptReservationAmenityDailyBreakdown]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptReservationAmenityDailyBreakdown]
	@AmenityID int,	
	@Start Datetime,
	@End Datetime
AS
	SELECT sum(amen.TotalCharge) as TotalCharge, CAST(res.ReservationCreated as Date) as BookedDate, count(res.ReservationID) as ReservationCount
	From Reservation res
	join ReservationAmenity amen
	on res.ReservationID = amen.ReservationID
	Where amen.AmenityID = @AmenityID and Cast(res.ReservationCreated as Date) between @Start and @End
	Group By CAST(res.ReservationCreated as Date)
	Order by BookedDate
GO
/****** Object:  StoredProcedure [dbo].[rptReservationCount]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptReservationCount]
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime
AS
Begin
	SELECT COUNT(ReservationID) as TotalNumber from Reservation
	Where HotelID = @HotelID and ReservationCreated >= @CheckIn and ReservationCreated <= @CheckOut
End
Set nocount off
GO
/****** Object:  StoredProcedure [dbo].[rptReservationDailyBreakdown]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptReservationDailyBreakdown]
	@HotelID int,
	@Start Datetime,
	@End Datetime
AS
	SELECT sum(TotalCharge) as TotalCharge, CAST(ReservationCreated as Date) as BookedDate, sum(TotalNights) as TotalNights, count(ReservationID) as ReservationCount
	From Reservation
	Where HotelID = @HotelID and Cast(ReservationCreated as Date) between @Start and @End
	Group By CAST(ReservationCreated as Date)
	Order by BookedDate
GO
/****** Object:  StoredProcedure [dbo].[rptReservationTotal]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptReservationTotal] 
	-- Add the parameters for the stored procedure here
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime,
	@SearchBy nvarchar(200)

	
AS

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Declare @amount decimal(16,2)
	
	IF @SearchBy = 'ArrivalDate'
		Begin
		 Select SUM(TotalCharge) as TotalCharge from Reservation
		 Where HotelID = @HotelID and BookedArrivalDate >= @CheckIn AND BookedDepartureDate <= @CheckOut
		END
	ELSE IF @SearchBy = 'BookedDate'
		BEGIN
		-- Insert statements for procedure here
		SELECT SUM(TotalCharge) as TotalCharge from Reservation
		Where HotelID = @HotelID and ReservationCreated >= @CheckIn AND ReservationCreated <= @CheckOut
		END				
	SEt Nocount off;
GO
/****** Object:  StoredProcedure [dbo].[rptReservationTotalNights]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptReservationTotalNights]
	-- Add the parameters for the stored procedure here
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @amount decimal
    -- Insert statements for procedure here
	Select SUM(TotalNights) as TotalNumber from Reservation
	Where HotelID = @HotelID and ReservationCreated >= @CheckIn AND ReservationCreated <= @CheckOut
			
END
Set nocount off
GO
/****** Object:  StoredProcedure [dbo].[rptReservationWithAmenitiesCount]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptReservationWithAmenitiesCount]
	@HotelID int, 
	@CheckIn datetime,
	@CheckOut datetime
AS
Begin
	;With query1(numofres)
	as(
	Select Count(DISTINCT amen.ReservationID) as totalnumber
	from ReservationAmenity as amen join Reservation as res
	on(amen.ReservationID = res.ReservationID)
	Where res.HotelID = @HotelID and res.ReservationCreated >= @CheckIn and res.ReservationCreated <= @CheckOut
	),
	query2 (numofres)
	as(
	Select Count(DISTINCT pa.ReservationID) as totalnumber
	from PackageReserAmenity as pa join PackageReservation as ra
	on(pa.ReservationID = ra.ReservationID)
	Where ra.HotelID = @HotelID and ra.ReservationCreated >= @CheckIn and ra.ReservationCreated <= @CheckOut
	)

	Select (query1.numofres + query2.numofres) as TotalNumber from query1, query2
End
GO
/****** Object:  StoredProcedure [dbo].[rptSelAmenitiesBookedPast30Days]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelAmenitiesBookedPast30Days]
	@HotelID int
AS
Begin
	Declare @Past30day datetime

	Set @Past30day = DATEADD(Day, -30, GetDate())

	;With query1 (numofres, totalcharge)
	as(
	Select Count(amen.ID) as numofres, Coalesce(Sum(amen.TotalCharge), 0) as totalcharge
	From ReservationAmenity as amen join Reservation as res
		on (amen.ReservationID = res.ReservationID)
	Where res.HotelID = @HotelID and (res.ReservationCreated between @Past30day and GETDATE())
	),
	query2 (numofres, totalcharge)
	as(
	Select Count(pa.ID) as numofres, Coalesce(Sum(pa.TotalCharge),0) as totalcharge
	From PackageReserAmenity as pa join PackageReservation as ra
		on(pa.ReservationID = ra.ReservationID)
	Where ra.HotelID = @HotelID and (ra.ReservationCreated between @Past30day and GetDate())
	)

	Select (query1.numofres + query2.numofres) as TotalCount, (query1.totalcharge + query2.totalcharge) as TotalRate from query1, query2
	 

	 End
GO
/****** Object:  StoredProcedure [dbo].[rptSelBookedAmenitiesByDates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelBookedAmenitiesByDates]
	@CheckIn datetime,
	@CheckOut datetime,
	@HotelID int
AS
	SELECT [ID] FROM ReservationAmenity amen
	Join Reservation res
	on amen.ReservationID = res.ReservationID
	Where res.ReservationCreated >= @CheckIn and res.ReservationCreated <= @CheckOut
	and res.HotelID = @HotelID
	Order by ReservationCreated
GO
/****** Object:  StoredProcedure [dbo].[rptSelBookedPackageAmenitiesByDates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelBookedPackageAmenitiesByDates]
	@CheckIn datetime,
	@CheckOut datetime,
	@HotelID int
AS
	SELECT [ID] FROM PackageReserAmenity amen
	Join PackageReservation res
	on amen.ReservationID = res.ReservationID
	Where res.ReservationCreated >= @CheckIn and res.ReservationCreated <= @CheckOut
	and res.HotelID = @HotelID
	Order by ReservationCreated
GO
/****** Object:  StoredProcedure [dbo].[rptSelDailyRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelDailyRate] 
	-- Add the parameters for the stored procedure here
	@ReservID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DailyRateID] FROM ReservationDailyRate
	Where ReservationID = @ReservID
END
GO
/****** Object:  StoredProcedure [dbo].[rptSelOpenPackageReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelOpenPackageReservation]
	@ReservationID int

AS
begin
	SELECT [Id] FROM OpenPackageReservation
	Where PackageReservationID = @ReservationID
	end
GO
/****** Object:  StoredProcedure [dbo].[rptSelOpenReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelOpenReservation]
	@ReservationID int

AS
begin
	SELECT [Id] FROM OpenReservation
	Where ReservationID = @ReservationID
	end
GO
/****** Object:  StoredProcedure [dbo].[rptSelPackageBookedPast30Days]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelPackageBookedPast30Days]
	@HotelID int
AS
	Declare @Past30day datetime

	Set @Past30day = DATEADD(Day, -30, GETDATE())

	SELECT Count(ReservationID) as TotalCount,
	Sum(TotalNights) as TotalNight,
	Sum(TotalCharge) as TotalRate
	from PackageReservation
	Where HotelID = @HotelID and (ReservationCreated Between @Past30day and GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[rptSelPackageDailyRate]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelPackageDailyRate] 
	-- Add the parameters for the stored procedure here
	@ReservID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DailyRateID] FROM PKReservationDailyRate
	Where ReservationID = @ReservID
END
GO
/****** Object:  StoredProcedure [dbo].[rptSelPackageReservationByDates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelPackageReservationByDates]
	-- Add the parameters for the stored procedure here
	
@CheckIn datetime,
@CheckOut datetime,
@HotelID int,
@SearchBy nvarchar(50)
AS

	IF @SearchBy = 'ArrivalDate'
		BEGIN
			SELECT [ReservationID] FROM PackageReservation
			Where ArrivalDate >= @CheckIn AND DepartureDate <= @CheckOut
			AND HotelID = @HotelID
			ORDER BY ArrivalDate
		END
	ELSE IF @SearchBy = 'BookedDate'
		BEGIN
			SELECT [ReservationID] FROM PackageReservation
			Where ReservationCreated >= @CheckIn AND ReservationCreated <= @CheckOut
			AND HotelID = @HotelID	
			ORDER BY ReservationCreated
		END
	ELSE
		BEGIN
			SELECT [ReservationID] FROM PackageReservation
			Where ArrivalDate >= @CheckIn AND DepartureDate <= @CheckOut
			AND HotelID = @HotelID	
			ORDER BY ArrivalDate
		END
GO
/****** Object:  StoredProcedure [dbo].[rptSelPackageReservationByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelPackageReservationByID]
	-- Add the parameters for the stored procedure here
	@ReservationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ReservationID] FROM PackageReservation
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[rptSelReservationBookedPast30Days]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelReservationBookedPast30Days]
	@HotelID int
AS
	Declare @Past30day datetime

	Set @Past30day = DATEADD(Day, -30, GetDate())

	SELECT COUNT(ReservationID) AS TotalCount,
	Sum(TotalNights) as TotalNight,
	Sum(TotalCharge) as TotalRate
	from Reservation
	Where HotelID = @HotelID and (ReservationCreated Between @Past30day and GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[rptSelReservationByDates]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelReservationByDates] 
	-- Add the parameters for the stored procedure here
	
@CheckIn datetime,
@CheckOut datetime,
@HotelID int,
@SearchBy nvarchar(50)
AS

	IF @SearchBy = 'ArrivalDate'
		BEGIN
			SELECT [ReservationID] FROM Reservation
			Where BookedArrivalDate >= @CheckIn AND BookedDepartureDate <= @CheckOut
			AND HotelID = @HotelID
			ORDER BY BookedArrivalDate desc
		END
	ELSE IF @SearchBy = 'BookedDate'
		BEGIN
			SELECT [ReservationID] FROM Reservation
			Where ReservationCreated >= @CheckIn AND ReservationCreated <= @CheckOut
			AND HotelID = @HotelID	
			ORDER BY ReservationCreated desc
		END
	ELSE
		BEGIN
			SELECT [ReservationID] FROM Reservation
			Where BookedArrivalDate >= @CheckIn AND BookedDepartureDate <= @CheckOut
			AND HotelID = @HotelID	
			ORDER BY BookedArrivalDate desc
		END
GO
/****** Object:  StoredProcedure [dbo].[rptSelReservationByID]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelReservationByID]
	-- Add the parameters for the stored procedure here
	@ReservationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [ReservationID] FROM Reservation
	Where ReservationID = @ReservationID
END
GO
/****** Object:  StoredProcedure [dbo].[rptSelReservationQue]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSelReservationQue]
	@HotelID int
AS
	Declare @pasttwoweek datetime

	Set @pasttwoweek = DATEADD(Day, -14, GetDate())
	
	SELECT [QueID] FROM ReservationQue
	Where HotelID = @HotelID and (BookedDate Between @pasttwoweek and GETDATE())	
	Order by Viewed ,BookedDate desc
GO
/****** Object:  StoredProcedure [dbo].[rptSubmitPackageReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSubmitPackageReservation]
	@ReservationID int,
	@DateStamp datetime,
	@UserID nvarchar(max),
	@Initials nvarchar(50)
AS
	insert into SubmitPackageReservation
	(ReservationID, DateStamp, UserID, Initials )
	values
	(@ReservationID, @DateStamp, @UserID, @Initials)

Select CAST(SCOPE_IDENTITY() as int)
GO
/****** Object:  StoredProcedure [dbo].[rptSubmitReservation]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptSubmitReservation]
	@ReservationID int,
	@DateStamp datetime,
	@UserID nvarchar(max),
	@Initials nvarchar(50)
AS
	insert into SubmitReservation
	(ReservationID, DateStamp, UserID, Initials )
	values
	(@ReservationID, @DateStamp, @UserID, @Initials)

Select CAST(SCOPE_IDENTITY() as int)
GO
/****** Object:  StoredProcedure [dbo].[rptTodaysArrival]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptTodaysArrival]
	@HotelID int
AS
	Begin
	Set nocount on;

	Declare @rackcount int
	Declare @packcount int
	Declare @TotalNumber int

	Select @rackcount = count(ReservationID) from Reservation
	Where cast(BookedArrivalDate as date) = Cast(GETDATE() as date) and HotelID = @HotelID
	
	Select @packcount = count(ReservationID) from PackageReservation
	Where cast(ArrivalDate as date) = Cast(GETDATE() as date) and HotelID = @HotelID

	Set @TotalNumber = @rackcount + @packcount;
	End

	set nocount off
	return @TotalNumber
GO
/****** Object:  StoredProcedure [dbo].[rptTodaysDeparture]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptTodaysDeparture]
	@HotelID int
AS
	Begin
	Set nocount on;

	Declare @rackcount int
	Declare @packcount int
	Declare @TotalNumber int

	Select @rackcount = count(ReservationID) from Reservation
	Where cast(BookedDepartureDate as date) = Cast(GETDATE() as date) and HotelID = @HotelID
	
	Select @packcount = count(ReservationID) from PackageReservation
	Where cast(DepartureDate as date) = Cast(GETDATE() as date) and HotelID = @HotelID

	Set @TotalNumber = @rackcount + @packcount;
	End

	set nocount off
	return @TotalNumber
GO
/****** Object:  StoredProcedure [dbo].[rptTodaysRoomOccupied]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptTodaysRoomOccupied]
	@HotelID int
AS
	Begin
	Set nocount on;

	Declare @rackcount int
	Declare @packcount int
	Declare @TotalNumber int

	Select @rackcount = count(ReservationID) from Reservation
	Where cast(BookedDepartureDate as date) > Cast(GETDATE() as date) and cast(BookedArrivalDate as date) != CAST(GETDATE() as date) and HotelID = @HotelID
	
	Select @packcount = count(ReservationID) from PackageReservation
	Where cast(DepartureDate as date) > Cast(GETDATE() as date) and cast(ArrivalDate as date) != CAST(GETDATE() as date) and HotelID = @HotelID

	Set @TotalNumber = @rackcount + @packcount;
	End

	set nocount off
	return @TotalNumber
GO
/****** Object:  StoredProcedure [dbo].[rptUpdReservationQue]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[rptUpdReservationQue]
	-- Add the parameters for the stored procedure here

	@ReservationID int,
	@UserName nvarchar(max),
	@HotelID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update ReservationQue
	Set UserName = @UserName,
	Viewed = 1
	Where ReservationID = @ReservationID and HotelID = @HotelID
END
GO
/****** Object:  StoredProcedure [dbo].[SetActiveCode]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetActiveCode]
	@UserID nvarchar(128),
	@Code nvarchar(50)
AS
	Delete UsersActiveCode
	Where UserID = @UserID

	Insert into UsersActiveCode
	(UserID, ActiveCode)
	values
	(@UserID, @Code)
GO
/****** Object:  StoredProcedure [dbo].[SetUserStatus]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetUserStatus]
	@UserID nvarchar(128),
	@Status int
AS
	Update AspNetUsers
	Set Status = @Status
	Where Id = @UserID
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser]
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50),
	@LastLoginDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE AspNetUsers
	SET LastLoginDate = @LastLoginDate
	WHERE UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[UserAccessFail]    Script Date: 4/7/2025 7:26:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserAccessFail]
	@UserID nvarchar(max)
AS
	Update AspNetUsers
	Set AccessFailedCount = 0
	Where UserName = @UserID
GO
