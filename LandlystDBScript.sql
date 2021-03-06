USE [master]
GO
/****** Object:  Database [LandLyst]    Script Date: 13-12-2020 23:29:44 ******/
CREATE DATABASE [LandLyst]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LandLyst', FILENAME = N'C:\Users\mort286f\LandLyst.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LandLyst_log', FILENAME = N'C:\Users\mort286f\LandLyst_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LandLyst] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LandLyst].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LandLyst] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LandLyst] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LandLyst] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LandLyst] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LandLyst] SET ARITHABORT OFF 
GO
ALTER DATABASE [LandLyst] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LandLyst] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LandLyst] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LandLyst] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LandLyst] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LandLyst] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LandLyst] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LandLyst] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LandLyst] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LandLyst] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LandLyst] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LandLyst] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LandLyst] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LandLyst] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LandLyst] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LandLyst] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LandLyst] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LandLyst] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LandLyst] SET  MULTI_USER 
GO
ALTER DATABASE [LandLyst] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LandLyst] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LandLyst] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LandLyst] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LandLyst] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LandLyst] SET QUERY_STORE = OFF
GO
USE [LandLyst]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [LandLyst]
GO
/****** Object:  Table [dbo].[Addition]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addition](
	[Addition_ID] [int] IDENTITY(1,1) NOT NULL,
	[Addition] [varchar](30) NOT NULL,
	[AdditionPrice] [smallmoney] NULL,
 CONSTRAINT [PK_Addition] PRIMARY KEY CLUSTERED 
(
	[Addition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ZipCode] [char](4) NOT NULL,
	[City] [varchar](25) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [char](16) NOT NULL,
	[E-mail] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[ZipCode] [char](4) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[Reservation_ID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [char](16) NOT NULL,
	[VisitorAmount] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[CheckinDate] [datetime] NOT NULL,
	[CheckoutDate] [datetime] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[Reservation_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation_Audit]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation_Audit](
	[Reservation_ID] [int] NULL,
	[PhoneNumber] [char](16) NULL,
	[VisitorAmount] [int] NULL,
	[RoomNumber] [int] NULL,
	[CheckinDate] [datetime] NULL,
	[CheckoutDate] [datetime] NULL,
	[trg_username] [varchar](50) NULL,
	[audit_action] [varchar](100) NULL,
	[audit_timestamp] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNumber] [int] NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_Room_1] PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomAdditions]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAdditions](
	[RoomNumber] [int] NOT NULL,
	[Addition_ID] [int] NOT NULL,
 CONSTRAINT [PK_RoomAdditions] PRIMARY KEY CLUSTERED 
(
	[RoomNumber] ASC,
	[Addition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[StatusID] [int] NOT NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_RoomStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_City_Customer] FOREIGN KEY([ZipCode])
REFERENCES [dbo].[City] ([ZipCode])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_City_Customer]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Reservation] FOREIGN KEY([PhoneNumber])
REFERENCES [dbo].[Customer] ([PhoneNumber])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Customer_Reservation]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Room_Reservation] FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Room_Reservation]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_RoomStatus_Room] FOREIGN KEY([StatusID])
REFERENCES [dbo].[RoomStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_RoomStatus_Room]
GO
ALTER TABLE [dbo].[RoomAdditions]  WITH CHECK ADD  CONSTRAINT [FK_Addition_RoomAdditions] FOREIGN KEY([Addition_ID])
REFERENCES [dbo].[Addition] ([Addition_ID])
GO
ALTER TABLE [dbo].[RoomAdditions] CHECK CONSTRAINT [FK_Addition_RoomAdditions]
GO
ALTER TABLE [dbo].[RoomAdditions]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomAdditions] FOREIGN KEY([RoomNumber])
REFERENCES [dbo].[Room] ([RoomNumber])
GO
ALTER TABLE [dbo].[RoomAdditions] CHECK CONSTRAINT [FK_Room_RoomAdditions]
GO
/****** Object:  StoredProcedure [dbo].[CreateCustomer]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCustomer]
	@PhoneNumber char(16),
	@FirstName varchar(50),
	@LastName varchar(50),
	@Address varchar(50),
	@email varchar(30),
	@zipCode char(4)
AS
	IF (NOT EXISTS (SELECT * FROM Customer WHERE Customer.PhoneNumber = @PhoneNumber))
BEGIN
	INSERT INTO Customer (PhoneNumber, FirstName, LastName, [E-mail], [Address], ZipCode)
	VALUES (@PhoneNumber, @FirstName, @LastName, @Address, @email, @zipCode)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateReservation]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateReservation]
	@roomNumber int,
	@phoneNumber char(16),
	@visitorAmount int,
	@checkinDate datetime,
	@checkoutDate datetime
AS
	INSERT INTO Reservation (RoomNumber, PhoneNumber, VisitorAmount, CheckinDate, CheckoutDate)
	VALUES (@roomNumber, @phoneNumber, @visitorAmount, @checkinDate, @checkoutDate)
GO
/****** Object:  StoredProcedure [dbo].[CreateReservationAndCustomer]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateReservationAndCustomer] 
	@PhoneNumber char(16), 
	@FirstName varchar(50), 
	@LastName varchar(50), 
	@Email varchar(50), 
	@ZipCode char(4),
	@Address varchar(50),
	@RoomNumber	int,
	@VisitorAmount int,
	@CheckinDate DateTime,
	@CheckoutDate DateTime
AS
	EXEC CreateCustomer @PhoneNumber, @FirstName, @LastName, @Address, @Email, @ZipCode
	EXEC CreateReservation @RoomNumber, @PhoneNumber, @VisitorAmount, @CheckinDate, @CheckoutDate
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableRooms]    Script Date: 13-12-2020 23:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAvailableRooms]
AS
	SELECT Room.RoomNumber, Room.Price, Addition.Addition, Addition.AdditionPrice FROM RoomAdditions LEFT JOIN Room ON RoomAdditions.RoomNumber = Room.RoomNumber
	LEFT JOIN Addition ON RoomAdditions.Addition_ID = Addition.Addition_ID
GO
USE [master]
GO
ALTER DATABASE [LandLyst] SET  READ_WRITE 
GO
