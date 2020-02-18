USE [master]
GO
CREATE DATABASE [DBW301]
 CONTAINMENT = NONE
 ON  PRIMARY 
ALTER DATABASE [DBW301] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBW301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBW301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBW301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBW301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBW301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBW301] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBW301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBW301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBW301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBW301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBW301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBW301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBW301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBW301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBW301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBW301] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBW301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBW301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBW301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBW301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBW301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBW301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBW301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBW301] SET RECOVERY FULL 
GO
ALTER DATABASE [DBW301] SET  MULTI_USER 
GO
ALTER DATABASE [DBW301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBW301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBW301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBW301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBW301] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBW301', N'ON'
GO
ALTER DATABASE [DBW301] SET QUERY_STORE = OFF
GO
USE [DBW301]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
	[date_of_birdth] [date] NOT NULL,
	[phone] [nchar](13) NOT NULL,
	[gender] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineMove]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineMove](
	[move_id] [int] NOT NULL,
	[machine_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_MachineMove] PRIMARY KEY CLUSTERED 
(
	[move_id] ASC,
	[machine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machines]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[state] [nvarchar](max) NOT NULL,
	[country] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Machines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[bill] [float] NOT NULL,
	[category] [nchar](255) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[return_date] [date] NOT NULL,
	[machine_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetail](
	[receipt_id] [int] NOT NULL,
	[rental_id] [int] NOT NULL,
	[move_id] [int] NOT NULL,
	[amount] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[customer_id] [int] NOT NULL,
	[machine_id] [int] NOT NULL,
	[rental_date] [date] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalMovies]    Script Date: 2/18/2020 5:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalMovies](
	[rental_id] [int] NOT NULL,
	[move_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_RentalMovies] PRIMARY KEY CLUSTERED 
(
	[rental_id] ASC,
	[move_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MachineMove]  WITH CHECK ADD  CONSTRAINT [FK_MachineMove_Machines] FOREIGN KEY([machine_id])
REFERENCES [dbo].[Machines] ([id])
GO
ALTER TABLE [dbo].[MachineMove] CHECK CONSTRAINT [FK_MachineMove_Machines]
GO
ALTER TABLE [dbo].[MachineMove]  WITH CHECK ADD  CONSTRAINT [FK_MachineMove_Movies] FOREIGN KEY([move_id])
REFERENCES [dbo].[Movies] ([id])
GO
ALTER TABLE [dbo].[MachineMove] CHECK CONSTRAINT [FK_MachineMove_Movies]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Customers]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Machines] FOREIGN KEY([machine_id])
REFERENCES [dbo].[Machines] ([id])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Machines]
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetail_Receipt] FOREIGN KEY([receipt_id])
REFERENCES [dbo].[Receipt] ([id])
GO
ALTER TABLE [dbo].[ReceiptDetail] CHECK CONSTRAINT [FK_ReceiptDetail_Receipt]
GO
ALTER TABLE [dbo].[ReceiptDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReceiptDetail_RentalMovies] FOREIGN KEY([rental_id], [move_id])
REFERENCES [dbo].[RentalMovies] ([rental_id], [move_id])
GO
ALTER TABLE [dbo].[ReceiptDetail] CHECK CONSTRAINT [FK_ReceiptDetail_RentalMovies]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Customers]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Machines] FOREIGN KEY([machine_id])
REFERENCES [dbo].[Machines] ([id])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Machines]
GO
ALTER TABLE [dbo].[RentalMovies]  WITH CHECK ADD  CONSTRAINT [FK_RentalMovies_Movies] FOREIGN KEY([move_id])
REFERENCES [dbo].[Movies] ([id])
GO
ALTER TABLE [dbo].[RentalMovies] CHECK CONSTRAINT [FK_RentalMovies_Movies]
GO
ALTER TABLE [dbo].[RentalMovies]  WITH CHECK ADD  CONSTRAINT [FK_RentalMovies_Rental] FOREIGN KEY([rental_id])
REFERENCES [dbo].[Rental] ([id])
GO
ALTER TABLE [dbo].[RentalMovies] CHECK CONSTRAINT [FK_RentalMovies_Rental]
GO
USE [master]
GO
ALTER DATABASE [DBW301] SET  READ_WRITE 
GO
