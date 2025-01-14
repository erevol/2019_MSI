USE [master]
GO
/****** Object:  Database [Museo]    Script Date: 4/11/2019 1:26:50 p. m. ******/
CREATE DATABASE [Museo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Museo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Museo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Museo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Museo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Museo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Museo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Museo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Museo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Museo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Museo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Museo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Museo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Museo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Museo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Museo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Museo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Museo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Museo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Museo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Museo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Museo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Museo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Museo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Museo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Museo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Museo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Museo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Museo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Museo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Museo] SET  MULTI_USER 
GO
ALTER DATABASE [Museo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Museo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Museo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Museo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Museo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Museo] SET QUERY_STORE = OFF
GO
USE [Museo]
GO
/****** Object:  Table [dbo].[Artista]    Script Date: 4/11/2019 1:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artista](
	[idArtista] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[seudonimo] [varchar](50) NULL,
	[fechaNacimiento] [datetime] NULL,
	[fechaDefuncion] [datetime] NULL,
	[ciudadOrigen] [varchar](50) NULL,
 CONSTRAINT [PK_Artista] PRIMARY KEY CLUSTERED 
(
	[idArtista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vArtista]    Script Date: 4/11/2019 1:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vArtista] 
as
Select idArtista, nombre+' '+apellido Artista from Artista
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 4/11/2019 1:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[puesto] [varchar](50) NULL,
	[dni] [varchar](50) NULL,
	[tel] [varchar](50) NULL,
	[horario] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guia]    Script Date: 4/11/2019 1:26:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guia](
	[idGuia] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NULL,
 CONSTRAINT [PK_Guia] PRIMARY KEY CLUSTERED 
(
	[idGuia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGuia]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGuia]
AS
SELECT        g.idGuia, STR(g.idGuia) + '- ' + e.nombre + ' ' + e.apellido AS Guia
FROM            dbo.Guia AS g INNER JOIN
                         dbo.Empleado AS e ON g.idEmpleado = e.idEmpleado
GO
/****** Object:  Table [dbo].[Obra]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obra](
	[idObra] [int] IDENTITY(1,1) NOT NULL,
	[idCompra] [int] NULL,
	[idVenta] [int] NULL,
	[idArtista] [int] NULL,
	[idDonacion] [int] NULL,
	[idDepositoYMantenimiento] [int] NULL,
	[nombreObra] [varchar](50) NULL,
	[idEstilo] [int] NOT NULL,
	[fechaCreacion] [date] NULL,
	[procedencia] [varchar](50) NULL,
	[dimensionAncho_cm] [int] NULL,
	[dimensionAlto_cm] [int] NULL,
	[fechaRegistracion] [date] NULL,
	[encargadoRegistro] [varchar](50) NULL,
	[valuacion] [float] NULL,
	[descripcion] [varchar](50) NULL,
	[idTipoObra] [int] NOT NULL,
	[idDestino] [int] NOT NULL,
	[idMotivoIngreso] [int] NOT NULL,
 CONSTRAINT [PK_Obra] PRIMARY KEY CLUSTERED 
(
	[idObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destino]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destino](
	[idDestino] [int] IDENTITY(1,1) NOT NULL,
	[destino] [varchar](30) NULL,
 CONSTRAINT [PK_Destino] PRIMARY KEY CLUSTERED 
(
	[idDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilo]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estilo](
	[idEstilo] [int] IDENTITY(1,1) NOT NULL,
	[estilo] [varchar](50) NULL,
 CONSTRAINT [PK_Estilo] PRIMARY KEY CLUSTERED 
(
	[idEstilo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotivoDeIngreso]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotivoDeIngreso](
	[idMotivoIngreso] [int] IDENTITY(1,1) NOT NULL,
	[motivo] [varchar](30) NULL,
 CONSTRAINT [PK_MotivoDeIngreso] PRIMARY KEY CLUSTERED 
(
	[idMotivoIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeObra]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeObra](
	[idTipoObra] [int] IDENTITY(1,1) NOT NULL,
	[tipoObra] [varchar](50) NULL,
 CONSTRAINT [PK_TipoDeObra] PRIMARY KEY CLUSTERED 
(
	[idTipoObra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vImprimirObra]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vImprimirObra]
as 
select o.idObra ID, nombreObra Obra, descripcion Descripcion, 
a.nombre+' '+a.apellido Artista, 
e.estilo Estilo, t.tipoObra 'Tipo de Obra', fechaCreacion 'Fecha creación',
dimensionAlto_cm 'Alto (cm)',dimensionAncho_cm 'Ancho (cm)', 
fechaRegistracion 'Fecha registración',
encargadoRegistro 'Encargado del registro', valuacion 'Valuación',
d.destino Destino, m.motivo 'Motivo de Ingreso'
from Obra o 
join Artista a on o.idArtista=a.idArtista 
join Estilo e on o.idEstilo=e.idEstilo
join TipoDeObra t on o.idTipoObra=t.idTipoObra
join Destino d on o.idDestino=d.idDestino
join MotivoDeIngreso m on o.idMotivoIngreso=m.idMotivoIngreso
GO
/****** Object:  Table [dbo].[Cobrador]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cobrador](
	[idEmpleado] [int] NOT NULL,
	[idCobrador] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Cobrador] PRIMARY KEY CLUSTERED 
(
	[idCobrador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cobro]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cobro](
	[idCobro] [int] IDENTITY(1,1) NOT NULL,
	[idVisita] [int] NULL,
	[idCobrador] [int] NULL,
	[idTipoDeCobro] [int] NULL,
	[monto] [money] NULL,
 CONSTRAINT [PK_Cobro] PRIMARY KEY CLUSTERED 
(
	[idCobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDeCobro] [int] NOT NULL,
	[fechaCompra] [datetime] NULL,
	[monto] [float] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositoYMatenimiento]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositoYMatenimiento](
	[idDepositoYMantenimiento] [int] IDENTITY(1,1) NOT NULL,
	[fechaDeIngreso] [datetime] NULL,
	[fechaDeEgreso] [datetime] NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_DepositoYMatenimiento] PRIMARY KEY CLUSTERED 
(
	[idDepositoYMantenimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalleExposicion]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalleExposicion](
	[idDetalleExposicion] [int] IDENTITY(1,1) NOT NULL,
	[idObra] [int] NULL,
	[idExposicion] [int] NULL,
 CONSTRAINT [PK_detalleExposicion] PRIMARY KEY CLUSTERED 
(
	[idDetalleExposicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donacion]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donacion](
	[idDonacion] [int] IDENTITY(1,1) NOT NULL,
	[personaOInstitucion] [varchar](50) NOT NULL,
	[entregadaORecibida] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Donacion] PRIMARY KEY CLUSTERED 
(
	[idDonacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exposicion]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exposicion](
	[idExposicion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[ubicacionSala] [int] NULL,
	[fechaInicial] [datetime] NULL,
	[fechaFinal] [datetime] NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Exposicion] PRIMARY KEY CLUSTERED 
(
	[idExposicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeCobro]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeCobro](
	[idTipoDeCobro] [int] IDENTITY(1,1) NOT NULL,
	[cantidadDeCuotas] [int] NULL,
	[tipoDeCobro] [varchar](50) NULL,
 CONSTRAINT [PK_TipoDeCobro] PRIMARY KEY CLUSTERED 
(
	[idTipoDeCobro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[tipoUsuario] [varchar](50) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[idTipoUsuario] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idTipoDeCobro] [int] NOT NULL,
	[fechaVenta] [datetime] NOT NULL,
	[monto] [float] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visita]    Script Date: 4/11/2019 1:26:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visita](
	[idVisita] [int] IDENTITY(1,1) NOT NULL,
	[idExposicion] [int] NULL,
	[idGuia] [int] NULL,
	[cantidadVisitantes] [int] NULL,
	[solicitudGuia] [bit] NULL,
	[tipoVisita] [varchar](30) NULL,
	[idCobrador] [int] NULL,
	[horario] [varchar](50) NULL,
	[monto] [float] NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_Visita] PRIMARY KEY CLUSTERED 
(
	[idVisita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artista] ON 

INSERT [dbo].[Artista] ([idArtista], [nombre], [apellido], [seudonimo], [fechaNacimiento], [fechaDefuncion], [ciudadOrigen]) VALUES (1, N'Miguel Ángel', N'Buonarroti', N'Michelangelo', CAST(N'1775-03-06T00:00:00.000' AS DateTime), CAST(N'1864-02-18T00:00:00.000' AS DateTime), N'Roma')
INSERT [dbo].[Artista] ([idArtista], [nombre], [apellido], [seudonimo], [fechaNacimiento], [fechaDefuncion], [ciudadOrigen]) VALUES (2, N'Leonardo', N'da Vinci', N'da Vinci', CAST(N'1760-04-15T00:00:00.000' AS DateTime), CAST(N'1852-05-02T00:00:00.000' AS DateTime), N'Florencia')
INSERT [dbo].[Artista] ([idArtista], [nombre], [apellido], [seudonimo], [fechaNacimiento], [fechaDefuncion], [ciudadOrigen]) VALUES (3, N'Pablo Ruiz', N'Picasso', N'Picasso', CAST(N'1881-10-25T00:00:00.000' AS DateTime), CAST(N'1973-04-08T00:00:00.000' AS DateTime), N'Málaga')
INSERT [dbo].[Artista] ([idArtista], [nombre], [apellido], [seudonimo], [fechaNacimiento], [fechaDefuncion], [ciudadOrigen]) VALUES (4, N'Salvador', N'Dalí', N'Dalí', CAST(N'1904-05-11T00:00:00.000' AS DateTime), CAST(N'1989-01-23T00:00:00.000' AS DateTime), N'Figueras')
INSERT [dbo].[Artista] ([idArtista], [nombre], [apellido], [seudonimo], [fechaNacimiento], [fechaDefuncion], [ciudadOrigen]) VALUES (5, N'Marcel', N'Duchamp', N'Marcel', CAST(N'1887-07-28T00:00:00.000' AS DateTime), CAST(N'1968-10-02T00:00:00.000' AS DateTime), N'Normandía')
SET IDENTITY_INSERT [dbo].[Artista] OFF
SET IDENTITY_INSERT [dbo].[Cobrador] ON 

INSERT [dbo].[Cobrador] ([idEmpleado], [idCobrador]) VALUES (1, 1)
INSERT [dbo].[Cobrador] ([idEmpleado], [idCobrador]) VALUES (2, 2)
SET IDENTITY_INSERT [dbo].[Cobrador] OFF
SET IDENTITY_INSERT [dbo].[Destino] ON 

INSERT [dbo].[Destino] ([idDestino], [destino]) VALUES (1, N'Exposición')
INSERT [dbo].[Destino] ([idDestino], [destino]) VALUES (2, N'Depósito')
SET IDENTITY_INSERT [dbo].[Destino] OFF
SET IDENTITY_INSERT [dbo].[detalleExposicion] ON 

INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (1, NULL, 1)
INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (2, NULL, 1)
INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (3, NULL, 2)
INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (4, NULL, 2)
INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (5, NULL, 2)
INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (6, NULL, 2)
INSERT [dbo].[detalleExposicion] ([idDetalleExposicion], [idObra], [idExposicion]) VALUES (7, NULL, 2)
SET IDENTITY_INSERT [dbo].[detalleExposicion] OFF
SET IDENTITY_INSERT [dbo].[Donacion] ON 

INSERT [dbo].[Donacion] ([idDonacion], [personaOInstitucion], [entregadaORecibida]) VALUES (1, N'Persona', N'Entregada')
INSERT [dbo].[Donacion] ([idDonacion], [personaOInstitucion], [entregadaORecibida]) VALUES (2, N'Persona', N'Recibida')
INSERT [dbo].[Donacion] ([idDonacion], [personaOInstitucion], [entregadaORecibida]) VALUES (3, N'Institución', N'Entregada')
INSERT [dbo].[Donacion] ([idDonacion], [personaOInstitucion], [entregadaORecibida]) VALUES (4, N'Institución', N'Recibida')
SET IDENTITY_INSERT [dbo].[Donacion] OFF
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([idEmpleado], [nombre], [apellido], [puesto], [dni], [tel], [horario], [email]) VALUES (1, N'Ary', N'Alonso', NULL, N'46785463', N'3516787845', N'7:30-12:00', N'ary_a@gmail.com')
INSERT [dbo].[Empleado] ([idEmpleado], [nombre], [apellido], [puesto], [dni], [tel], [horario], [email]) VALUES (2, N'Franco', N'Fernandez', NULL, N'38764572', N'3514567453', N'12:00-18:30', N'fran_f@gmail.com')
INSERT [dbo].[Empleado] ([idEmpleado], [nombre], [apellido], [puesto], [dni], [tel], [horario], [email]) VALUES (3, N'Lucas', N'Pereyra', NULL, N'39768956', N'3514967581', N'12:00-18:30', N'lucas_p@gmail.com')
INSERT [dbo].[Empleado] ([idEmpleado], [nombre], [apellido], [puesto], [dni], [tel], [horario], [email]) VALUES (4, N'Jose', N'Pereti', NULL, N'36785123', N'3521465734', N'7:30-12:00', N'jose_p@gmail.com')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[Estilo] ON 

INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (1, N'Barroco')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (2, N'Clasicismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (3, N'Romanticismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (4, N'Cubismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (5, N'Expresionismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (6, N'Surrealismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (7, N'Abstractismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (8, N'Luminismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (9, N'Fauvismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (10, N'Modernismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (11, N'Hiperrealismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (12, N'Postimpresionismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (13, N'Pop')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (14, N'Academicismo')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (15, N'Paisaje')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (16, N'Naturaleza muerta')
INSERT [dbo].[Estilo] ([idEstilo], [estilo]) VALUES (17, N'Renacentismo')
SET IDENTITY_INSERT [dbo].[Estilo] OFF
SET IDENTITY_INSERT [dbo].[Exposicion] ON 

INSERT [dbo].[Exposicion] ([idExposicion], [nombre], [ubicacionSala], [fechaInicial], [fechaFinal], [descripcion]) VALUES (1, N'Obras daVinci', 1, CAST(N'2019-06-05T00:00:00.000' AS DateTime), CAST(N'2019-06-07T00:00:00.000' AS DateTime), N'Obras de Leonardo da Vinci')
INSERT [dbo].[Exposicion] ([idExposicion], [nombre], [ubicacionSala], [fechaInicial], [fechaFinal], [descripcion]) VALUES (2, N'Obras clásicas antiguas', 2, CAST(N'2019-11-10T00:00:00.000' AS DateTime), CAST(N'2019-11-15T00:00:00.000' AS DateTime), N'Obras destacadas de la historia')
SET IDENTITY_INSERT [dbo].[Exposicion] OFF
SET IDENTITY_INSERT [dbo].[Guia] ON 

INSERT [dbo].[Guia] ([idGuia], [idEmpleado]) VALUES (1, 3)
INSERT [dbo].[Guia] ([idGuia], [idEmpleado]) VALUES (2, 4)
SET IDENTITY_INSERT [dbo].[Guia] OFF
SET IDENTITY_INSERT [dbo].[MotivoDeIngreso] ON 

INSERT [dbo].[MotivoDeIngreso] ([idMotivoIngreso], [motivo]) VALUES (1, N'Compra')
INSERT [dbo].[MotivoDeIngreso] ([idMotivoIngreso], [motivo]) VALUES (2, N'Donación')
INSERT [dbo].[MotivoDeIngreso] ([idMotivoIngreso], [motivo]) VALUES (3, N'Préstamo')
SET IDENTITY_INSERT [dbo].[MotivoDeIngreso] OFF
SET IDENTITY_INSERT [dbo].[Obra] ON 

INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (2, NULL, NULL, 2, NULL, NULL, N'Mona Lisa', 17, CAST(N'1755-07-02' AS Date), N'Francia', 120, 160, CAST(N'2000-05-04' AS Date), N'Franco Fernandez', 2000000, N'Retrato', 9, 1, 2)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (3, NULL, NULL, 1, NULL, NULL, N'La creación de Adán', 17, CAST(N'1755-07-02' AS Date), N'Italia', 280, 570, CAST(N'2008-06-02' AS Date), N'Lucas Pereyra', 23333, N'wew', 7, 1, 3)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (4, NULL, NULL, 3, NULL, NULL, N'Guernica', 4, CAST(N'1755-07-02' AS Date), N'Madrid', 776, 349, CAST(N'2002-08-26' AS Date), N'Lucas Pereyra', 900000, N'Bombardeo de Guernica', 2, 1, 2)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (5, NULL, NULL, 2, NULL, NULL, N'La última cena', 17, CAST(N'1755-07-02' AS Date), N'Italia', 880, 460, CAST(N'2008-09-12' AS Date), N'Franco Fernando', 2500000, N'wow', 2, 1, 3)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (6, NULL, NULL, 2, NULL, NULL, N'weewwew', 1, CAST(N'1755-07-02' AS Date), N'Francia', 32, 32, CAST(N'2019-11-01' AS Date), N'asdsda', 32, N'sda', 2, 1, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (26, NULL, NULL, 2, NULL, NULL, N'dsa', 4, CAST(N'2019-10-27' AS Date), N'arg', 23, 32, CAST(N'2019-10-28' AS Date), N'dsa', 2332, N'sad', 1, 1, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (34, NULL, NULL, 2, NULL, NULL, N'sad', 2, CAST(N'2019-10-27' AS Date), N'arg', 33, 33, CAST(N'2019-10-27' AS Date), N'sda', 23232, N'dsa', 1, 1, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (35, NULL, NULL, 3, NULL, NULL, N'we', 2, CAST(N'2019-10-28' AS Date), N'arg', 332, 32, CAST(N'2019-09-29' AS Date), N'dsa', 3232, N'sa', 2, 1, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (37, NULL, NULL, 1, NULL, NULL, N'das', 2, CAST(N'2019-11-02' AS Date), N'arg', 2, 23, CAST(N'2019-11-02' AS Date), N'dsa', 332, N'dsa', 2, 1, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (38, NULL, NULL, 1, NULL, NULL, N'sdaaaaaaaaaaaaaaaaaa', 3, CAST(N'2019-10-27' AS Date), N'arg', 999, 999, CAST(N'2019-10-27' AS Date), N'sda', 99999999, N'asddddd', 1, 1, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (39, NULL, NULL, 2, NULL, NULL, N'ads', 2, CAST(N'2019-11-03' AS Date), N'arg', 32, 32, CAST(N'2019-11-03' AS Date), N'dsa', 32243, N'ds', 3, 2, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (40, NULL, NULL, 2, NULL, NULL, N'asd', 1, CAST(N'2019-11-03' AS Date), N'arg', 32, 23, CAST(N'2019-11-03' AS Date), N'dsa', 232, N'asd', 2, 2, 1)
INSERT [dbo].[Obra] ([idObra], [idCompra], [idVenta], [idArtista], [idDonacion], [idDepositoYMantenimiento], [nombreObra], [idEstilo], [fechaCreacion], [procedencia], [dimensionAncho_cm], [dimensionAlto_cm], [fechaRegistracion], [encargadoRegistro], [valuacion], [descripcion], [idTipoObra], [idDestino], [idMotivoIngreso]) VALUES (46, NULL, NULL, 4, NULL, NULL, N'Obra de Prueba', 2, CAST(N'2019-10-27' AS Date), NULL, 45, 75, CAST(N'2019-09-04' AS Date), N'Emma', 239900, N'Muy linda', 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Obra] OFF
SET IDENTITY_INSERT [dbo].[TipoDeObra] ON 

INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (1, N'Acuarela')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (2, N'Óleo')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (3, N'Gouache')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (4, N'Aerografía')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (5, N'Pintura al pastel')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (6, N'Temple al huevo')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (7, N'Fresco')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (8, N'Tinta')
INSERT [dbo].[TipoDeObra] ([idTipoObra], [tipoObra]) VALUES (9, N'Claroscuro')
SET IDENTITY_INSERT [dbo].[TipoDeObra] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [tipoUsuario]) VALUES (1, N'Recepcionista')
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [tipoUsuario]) VALUES (2, N'Encargado de Museo')
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña], [idTipoUsuario]) VALUES (1, N'Emmanuel Ayala', N'emma', 2)
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña], [idTipoUsuario]) VALUES (2, N'Stefano Demat', N'stefano', 2)
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña], [idTipoUsuario]) VALUES (3, N'Facundo Amaya', N'facundo', 1)
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña], [idTipoUsuario]) VALUES (4, N'Oscar Ayala', N'oscar', 1)
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña], [idTipoUsuario]) VALUES (6, N'Alonso Ary', N'alonso', 1)
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña], [idTipoUsuario]) VALUES (8, N'German Bartoli', N'german', 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET IDENTITY_INSERT [dbo].[Visita] ON 

INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (2, 1, 2, 20, 1, N'Especial', 1, N'9:00', 0, CAST(N'2019-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (4, 1, 1, 5, 1, N'Común', 2, N'15:30', 100, CAST(N'2019-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (5, 2, 1, 12, 1, N'Especial', 1, N'10:00', 0, CAST(N'2019-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (6, 1, 1, 3, 1, N'Común', 2, N'17:00', 60, CAST(N'2019-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (7, 1, NULL, 4, 0, N'Especial', 2, NULL, 0, CAST(N'2019-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (9, NULL, 1, 2, 1, N'Común', NULL, NULL, 2, NULL)
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (11, NULL, NULL, 1, 0, N'Común', NULL, NULL, 1, NULL)
INSERT [dbo].[Visita] ([idVisita], [idExposicion], [idGuia], [cantidadVisitantes], [solicitudGuia], [tipoVisita], [idCobrador], [horario], [monto], [fecha]) VALUES (12, NULL, NULL, 4, 0, N'Común', NULL, NULL, 105, NULL)
SET IDENTITY_INSERT [dbo].[Visita] OFF
ALTER TABLE [dbo].[Cobrador]  WITH CHECK ADD  CONSTRAINT [FK_Cobrador_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Cobrador] CHECK CONSTRAINT [FK_Cobrador_Empleado]
GO
ALTER TABLE [dbo].[Cobro]  WITH CHECK ADD  CONSTRAINT [FK_Cobro_Cobrador] FOREIGN KEY([idCobrador])
REFERENCES [dbo].[Cobrador] ([idCobrador])
GO
ALTER TABLE [dbo].[Cobro] CHECK CONSTRAINT [FK_Cobro_Cobrador]
GO
ALTER TABLE [dbo].[Cobro]  WITH CHECK ADD  CONSTRAINT [FK_Cobro_TipoDeCobro] FOREIGN KEY([idTipoDeCobro])
REFERENCES [dbo].[TipoDeCobro] ([idTipoDeCobro])
GO
ALTER TABLE [dbo].[Cobro] CHECK CONSTRAINT [FK_Cobro_TipoDeCobro]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_TipoDeCobro] FOREIGN KEY([idTipoDeCobro])
REFERENCES [dbo].[TipoDeCobro] ([idTipoDeCobro])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_TipoDeCobro]
GO
ALTER TABLE [dbo].[detalleExposicion]  WITH CHECK ADD  CONSTRAINT [FK_detalleExposicion_Exposicion] FOREIGN KEY([idExposicion])
REFERENCES [dbo].[Exposicion] ([idExposicion])
GO
ALTER TABLE [dbo].[detalleExposicion] CHECK CONSTRAINT [FK_detalleExposicion_Exposicion]
GO
ALTER TABLE [dbo].[detalleExposicion]  WITH CHECK ADD  CONSTRAINT [FK_detalleExposicion_Obra1] FOREIGN KEY([idObra])
REFERENCES [dbo].[Obra] ([idObra])
GO
ALTER TABLE [dbo].[detalleExposicion] CHECK CONSTRAINT [FK_detalleExposicion_Obra1]
GO
ALTER TABLE [dbo].[Guia]  WITH CHECK ADD  CONSTRAINT [FK_Guia_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Guia] CHECK CONSTRAINT [FK_Guia_Empleado]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_Artista] FOREIGN KEY([idArtista])
REFERENCES [dbo].[Artista] ([idArtista])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_Artista]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_Compra] FOREIGN KEY([idCompra])
REFERENCES [dbo].[Compra] ([idCompra])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_Compra]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_DepositoYMatenimiento] FOREIGN KEY([idDepositoYMantenimiento])
REFERENCES [dbo].[DepositoYMatenimiento] ([idDepositoYMantenimiento])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_DepositoYMatenimiento]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_Destino] FOREIGN KEY([idDestino])
REFERENCES [dbo].[Destino] ([idDestino])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_Destino]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_Donacion] FOREIGN KEY([idDonacion])
REFERENCES [dbo].[Donacion] ([idDonacion])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_Donacion]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_Estilo] FOREIGN KEY([idEstilo])
REFERENCES [dbo].[Estilo] ([idEstilo])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_Estilo]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_MotivoDeIngreso] FOREIGN KEY([idMotivoIngreso])
REFERENCES [dbo].[MotivoDeIngreso] ([idMotivoIngreso])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_MotivoDeIngreso]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_Obra] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_Obra]
GO
ALTER TABLE [dbo].[Obra]  WITH CHECK ADD  CONSTRAINT [FK_Obra_TipoDeObra] FOREIGN KEY([idTipoObra])
REFERENCES [dbo].[TipoDeObra] ([idTipoObra])
GO
ALTER TABLE [dbo].[Obra] CHECK CONSTRAINT [FK_Obra_TipoDeObra]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_TipoDeCobro] FOREIGN KEY([idTipoDeCobro])
REFERENCES [dbo].[TipoDeCobro] ([idTipoDeCobro])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_TipoDeCobro]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Cobrador] FOREIGN KEY([idCobrador])
REFERENCES [dbo].[Cobrador] ([idCobrador])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Cobrador]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Exposicion] FOREIGN KEY([idExposicion])
REFERENCES [dbo].[Exposicion] ([idExposicion])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Exposicion]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Guia] FOREIGN KEY([idGuia])
REFERENCES [dbo].[Guia] ([idGuia])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Guia]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "g"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGuia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGuia'
GO
USE [master]
GO
ALTER DATABASE [Museo] SET  READ_WRITE 
GO
