USE [master]
GO
/****** Object:  Database [GlobalResearch]    Script Date: 10/24/16 13:27:02 ******/
CREATE DATABASE [GlobalResearch]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GlobalResearch', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GlobalResearch.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GlobalResearch_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GlobalResearch_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GlobalResearch] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GlobalResearch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GlobalResearch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GlobalResearch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GlobalResearch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GlobalResearch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GlobalResearch] SET ARITHABORT OFF 
GO
ALTER DATABASE [GlobalResearch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GlobalResearch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GlobalResearch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GlobalResearch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GlobalResearch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GlobalResearch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GlobalResearch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GlobalResearch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GlobalResearch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GlobalResearch] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GlobalResearch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GlobalResearch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GlobalResearch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GlobalResearch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GlobalResearch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GlobalResearch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GlobalResearch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GlobalResearch] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GlobalResearch] SET  MULTI_USER 
GO
ALTER DATABASE [GlobalResearch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GlobalResearch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GlobalResearch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GlobalResearch] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GlobalResearch] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GlobalResearch]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/24/16 13:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] NOT NULL,
	[AddressText] [nvarchar](50) NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 10/24/16 13:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 10/24/16 13:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/24/16 13:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 10/24/16 13:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (1, N'Aleksandar Malinov', 1)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (2, N'Djan Djun Street', 2)
INSERT [dbo].[Address] ([Id], [AddressText], [TownId]) VALUES (3, N'Lake Road', 3)
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([Id], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Continent] ([Id], [Name]) VALUES (3, N'Africa')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (2, N'China', 2)
INSERT [dbo].[Country] ([Id], [Name], [ContinentId]) VALUES (3, N'Ghana', 3)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'Gosho', N'Goshev', 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Pesho', N'Peshev', 2)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'Mariika', N'Mariikova', 3)
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (2, N'Pekin', 2)
INSERT [dbo].[Town] ([Id], [Name], [CountryId]) VALUES (3, N'Accra', 3)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Town] FOREIGN KEY([TownId])
REFERENCES [dbo].[Town] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continent] ([Id])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country]
GO
USE [master]
GO
ALTER DATABASE [GlobalResearch] SET  READ_WRITE 
GO
