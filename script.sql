USE [master]
GO
/****** Object:  Database [Giveaways]    Script Date: 09-Feb-17 09:06:19 ******/
CREATE DATABASE [Giveaways]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Giveaways', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Giveaways.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Giveaways_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Giveaways_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Giveaways] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Giveaways].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Giveaways] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Giveaways] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Giveaways] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Giveaways] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Giveaways] SET ARITHABORT OFF 
GO
ALTER DATABASE [Giveaways] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Giveaways] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Giveaways] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Giveaways] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Giveaways] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Giveaways] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Giveaways] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Giveaways] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Giveaways] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Giveaways] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Giveaways] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Giveaways] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Giveaways] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Giveaways] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Giveaways] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Giveaways] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Giveaways] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Giveaways] SET RECOVERY FULL 
GO
ALTER DATABASE [Giveaways] SET  MULTI_USER 
GO
ALTER DATABASE [Giveaways] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Giveaways] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Giveaways] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Giveaways] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Giveaways] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Giveaways', N'ON'
GO
ALTER DATABASE [Giveaways] SET QUERY_STORE = OFF
GO
USE [Giveaways]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Giveaways]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyBranches]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyBranches](
	[BranchID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[AddressCont] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
	[Latitude] [geography] NULL,
	[Longitude] [geography] NULL,
 CONSTRAINT [PK_CompanyBranches] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CouponCategory]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponCategory](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CouponCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Giveaways]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giveaways](
	[GiveawayID] [int] NOT NULL,
	[GiveawayTypeID] [int] NOT NULL,
	[GiveawayStatus] [bit] NULL,
	[GiveawayName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Giveaways] PRIMARY KEY CLUSTERED 
(
	[GiveawayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiveawaysAvailable]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiveawaysAvailable](
	[ID] [nchar](10) NOT NULL,
	[GiveawayID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_GiveawaysAvailable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiveawayType]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiveawayType](
	[GiveawayTypeID] [int] NOT NULL,
	[GiveawayTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GiveawayType] PRIMARY KEY CLUSTERED 
(
	[GiveawayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginDetails](
	[UserId] [nvarchar](50) NOT NULL,
	[Salt] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[VerificationStatus] [bit] NOT NULL,
 CONSTRAINT [PK_LoginDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RedemptionHistory]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedemptionHistory](
	[ID] [int] NOT NULL,
	[GiveawayID] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RedemptionHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](50) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[Gender] [char](10) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoHistory]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoHistory](
	[ID] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[WatchedInZip] [int] NOT NULL,
	[VideoID] [int] NOT NULL,
 CONSTRAINT [PK_VideoHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoURLs]    Script Date: 09-Feb-17 09:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoURLs](
	[VideoID] [int] NOT NULL,
	[URL] [nvarchar](50) NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_VideoURLs] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Giveaways] ADD  CONSTRAINT [DF_Giveaways_GiveawayStatus]  DEFAULT ((0)) FOR [GiveawayStatus]
GO
ALTER TABLE [dbo].[LoginDetails] ADD  CONSTRAINT [DF_LoginDetails_VerificationStatus]  DEFAULT ((0)) FOR [VerificationStatus]
GO
ALTER TABLE [dbo].[CompanyBranches]  WITH CHECK ADD  CONSTRAINT [FK_CompanyBranches_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyBranches] CHECK CONSTRAINT [FK_CompanyBranches_Company]
GO
ALTER TABLE [dbo].[Giveaways]  WITH CHECK ADD  CONSTRAINT [FK_Giveaways_GiveawayType] FOREIGN KEY([GiveawayTypeID])
REFERENCES [dbo].[GiveawayType] ([GiveawayTypeID])
GO
ALTER TABLE [dbo].[Giveaways] CHECK CONSTRAINT [FK_Giveaways_GiveawayType]
GO
ALTER TABLE [dbo].[GiveawaysAvailable]  WITH CHECK ADD  CONSTRAINT [FK_GiveawaysAvailable_Company] FOREIGN KEY([BranchID])
REFERENCES [dbo].[CompanyBranches] ([BranchID])
GO
ALTER TABLE [dbo].[GiveawaysAvailable] CHECK CONSTRAINT [FK_GiveawaysAvailable_Company]
GO
ALTER TABLE [dbo].[GiveawaysAvailable]  WITH CHECK ADD  CONSTRAINT [FK_GiveawaysAvailable_CouponCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CouponCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[GiveawaysAvailable] CHECK CONSTRAINT [FK_GiveawaysAvailable_CouponCategory]
GO
ALTER TABLE [dbo].[GiveawaysAvailable]  WITH CHECK ADD  CONSTRAINT [FK_GiveawaysAvailable_Giveaways] FOREIGN KEY([GiveawayID])
REFERENCES [dbo].[Giveaways] ([GiveawayID])
GO
ALTER TABLE [dbo].[GiveawaysAvailable] CHECK CONSTRAINT [FK_GiveawaysAvailable_Giveaways]
GO
ALTER TABLE [dbo].[LoginDetails]  WITH CHECK ADD  CONSTRAINT [FK_LoginDetails_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoginDetails] CHECK CONSTRAINT [FK_LoginDetails_UserDetails]
GO
ALTER TABLE [dbo].[RedemptionHistory]  WITH CHECK ADD  CONSTRAINT [FK_RedemptionHistory_Giveaways] FOREIGN KEY([GiveawayID])
REFERENCES [dbo].[Giveaways] ([GiveawayID])
GO
ALTER TABLE [dbo].[RedemptionHistory] CHECK CONSTRAINT [FK_RedemptionHistory_Giveaways]
GO
ALTER TABLE [dbo].[RedemptionHistory]  WITH CHECK ADD  CONSTRAINT [FK_RedemptionHistory_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[RedemptionHistory] CHECK CONSTRAINT [FK_RedemptionHistory_UserDetails]
GO
ALTER TABLE [dbo].[VideoHistory]  WITH CHECK ADD  CONSTRAINT [FK_VideoHistory_UserDetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[VideoHistory] CHECK CONSTRAINT [FK_VideoHistory_UserDetails]
GO
ALTER TABLE [dbo].[VideoHistory]  WITH CHECK ADD  CONSTRAINT [FK_VideoHistory_VideoURLs] FOREIGN KEY([VideoID])
REFERENCES [dbo].[VideoURLs] ([VideoID])
GO
ALTER TABLE [dbo].[VideoHistory] CHECK CONSTRAINT [FK_VideoHistory_VideoURLs]
GO
ALTER TABLE [dbo].[VideoURLs]  WITH CHECK ADD  CONSTRAINT [FK_VideoURLs_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[VideoURLs] CHECK CONSTRAINT [FK_VideoURLs_Company]
GO
USE [master]
GO
ALTER DATABASE [Giveaways] SET  READ_WRITE 
GO
