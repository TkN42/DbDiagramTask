﻿USE [master]
GO
/****** Object:  Database [Banka]    Script Date: 13.02.2024 12:10:09 ******/
CREATE DATABASE [Banka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Banka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Banka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Banka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Banka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Banka] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Banka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banka] SET RECOVERY FULL 
GO
ALTER DATABASE [Banka] SET  MULTI_USER 
GO
ALTER DATABASE [Banka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Banka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Banka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Banka', N'ON'
GO
ALTER DATABASE [Banka] SET QUERY_STORE = OFF
GO
USE [Banka]
GO
/****** Object:  Table [dbo].[Adresler]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriId] [int] NOT NULL,
	[AdresDetay] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Adresler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bilancolar]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bilancolar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriId] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Tutar] [money] NOT NULL,
 CONSTRAINT [PK_Bilancolar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GercekMusteriler]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GercekMusteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
	[Soyad] [varchar](50) NOT NULL,
	[TcKimlikNo] [char](11) NOT NULL,
 CONSTRAINT [PK_GercekMusteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_GercekMusteriler_TcKimlikNo] UNIQUE NONCLUSTERED 
(
	[TcKimlikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kanallar]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kanallar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Kanallar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [char](10) NOT NULL,
	[KanalId] [int] NOT NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Musteriler_MusteriNo] UNIQUE NONCLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sendikalar]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sendikalar](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sendikalar] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicariFaaliyetler]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicariFaaliyetler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GercekMusteriId] [int] NOT NULL,
	[BaslangicTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_TicariFaaliyetler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_TicariFaaliyetler_GercekMusteriId] UNIQUE NONCLUSTERED 
(
	[GercekMusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuzelMusteriler]    Script Date: 13.02.2024 12:10:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuzelMusteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[Unvan] [varchar](50) NOT NULL,
	[VergiNo] [char](10) NOT NULL,
 CONSTRAINT [PK_TuzelMusteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adresler]  WITH CHECK ADD  CONSTRAINT [FK_Adresler_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([Id])
GO
ALTER TABLE [dbo].[Adresler] CHECK CONSTRAINT [FK_Adresler_Musteriler]
GO
ALTER TABLE [dbo].[Bilancolar]  WITH CHECK ADD  CONSTRAINT [FK_Bilancolar_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([Id])
GO
ALTER TABLE [dbo].[Bilancolar] CHECK CONSTRAINT [FK_Bilancolar_Musteriler]
GO
ALTER TABLE [dbo].[GercekMusteriler]  WITH CHECK ADD  CONSTRAINT [FK_GercekMusteriler_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([Id])
GO
ALTER TABLE [dbo].[GercekMusteriler] CHECK CONSTRAINT [FK_GercekMusteriler_Musteriler]
GO
ALTER TABLE [dbo].[Musteriler]  WITH CHECK ADD  CONSTRAINT [FK_Musteriler_Kanallar] FOREIGN KEY([KanalId])
REFERENCES [dbo].[Kanallar] ([Id])
GO
ALTER TABLE [dbo].[Musteriler] CHECK CONSTRAINT [FK_Musteriler_Kanallar]
GO
ALTER TABLE [dbo].[Sendikalar]  WITH CHECK ADD  CONSTRAINT [FK_Sendikalar_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([Id])
GO
ALTER TABLE [dbo].[Sendikalar] CHECK CONSTRAINT [FK_Sendikalar_Musteriler]
GO
ALTER TABLE [dbo].[TicariFaaliyetler]  WITH CHECK ADD  CONSTRAINT [FK_TicariFaaliyetler_GercekMusteriler] FOREIGN KEY([GercekMusteriId])
REFERENCES [dbo].[GercekMusteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[TicariFaaliyetler] CHECK CONSTRAINT [FK_TicariFaaliyetler_GercekMusteriler]
GO
ALTER TABLE [dbo].[TuzelMusteriler]  WITH CHECK ADD  CONSTRAINT [FK_TuzelMusteriler_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([Id])
GO
ALTER TABLE [dbo].[TuzelMusteriler] CHECK CONSTRAINT [FK_TuzelMusteriler_Musteriler]
GO
USE [master]
GO
ALTER DATABASE [Banka] SET  READ_WRITE 
GO
