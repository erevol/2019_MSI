USE [master]
GO
/****** Object:  Database [FestivalSuquia]    Script Date: 26/10/2019 18:50:06 ******/
CREATE DATABASE [FestivalSuquia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FestivalSuquia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FestivalSuquia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FestivalSuquia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FestivalSuquia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FestivalSuquia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FestivalSuquia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FestivalSuquia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FestivalSuquia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FestivalSuquia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FestivalSuquia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FestivalSuquia] SET ARITHABORT OFF 
GO
ALTER DATABASE [FestivalSuquia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FestivalSuquia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FestivalSuquia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FestivalSuquia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FestivalSuquia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FestivalSuquia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FestivalSuquia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FestivalSuquia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FestivalSuquia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FestivalSuquia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FestivalSuquia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FestivalSuquia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FestivalSuquia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FestivalSuquia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FestivalSuquia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FestivalSuquia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FestivalSuquia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FestivalSuquia] SET RECOVERY FULL 
GO
ALTER DATABASE [FestivalSuquia] SET  MULTI_USER 
GO
ALTER DATABASE [FestivalSuquia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FestivalSuquia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FestivalSuquia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FestivalSuquia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FestivalSuquia] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FestivalSuquia', N'ON'
GO
ALTER DATABASE [FestivalSuquia] SET QUERY_STORE = OFF
GO
USE [FestivalSuquia]
GO
/****** Object:  Table [dbo].[grupo_folklorico]    Script Date: 26/10/2019 18:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo_folklorico](
	[id_grupo_folklorico] [int] IDENTITY(1,1) NOT NULL,
	[nombre_grupo] [varchar](50) NULL,
	[cant_integrantes] [int] NULL,
	[procedencia] [varchar](50) NULL,
	[tel_contacto] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[salario] [float] NULL,
 CONSTRAINT [PK_grupo_folklorico] PRIMARY KEY CLUSTERED 
(
	[id_grupo_folklorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[noche]    Script Date: 26/10/2019 18:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[noche](
	[id_noche] [int] IDENTITY(1,1) NOT NULL,
	[nro_luna] [int] NULL,
	[hora_comienzo] [datetime] NULL,
	[hora_cierre] [datetime] NULL,
 CONSTRAINT [PK_noche] PRIMARY KEY CLUSTERED 
(
	[id_noche] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[punto_venta]    Script Date: 26/10/2019 18:50:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[punto_venta](
	[id_punto_venta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[horario_apertura] [time](7) NULL,
	[horario_cierre] [time](7) NULL,
 CONSTRAINT [PK_punto_venta] PRIMARY KEY CLUSTERED 
(
	[id_punto_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [FestivalSuquia] SET  READ_WRITE 
GO
