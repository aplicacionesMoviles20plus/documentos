USE [master]
GO
/****** Object:  Database [TrabajoMoviles]    Script Date: 09/06/2018 0:18:26 ******/
CREATE DATABASE [TrabajoMoviles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrabajoMoviles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TrabajoMoviles.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrabajoMoviles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TrabajoMoviles_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrabajoMoviles] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrabajoMoviles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrabajoMoviles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrabajoMoviles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrabajoMoviles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrabajoMoviles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrabajoMoviles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrabajoMoviles] SET  MULTI_USER 
GO
ALTER DATABASE [TrabajoMoviles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrabajoMoviles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrabajoMoviles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrabajoMoviles] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TrabajoMoviles] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrabajoMoviles', N'ON'
GO
USE [TrabajoMoviles]
GO
/****** Object:  Schema [m2ss]    Script Date: 09/06/2018 0:18:26 ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Table [dbo].[cursogrado]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cursogrado](
	[idcursogrado] [int] IDENTITY(10,1) NOT NULL,
	[nombre] [nvarchar](35) NULL DEFAULT (NULL),
	[contenido] [nvarchar](65) NULL DEFAULT (NULL),
	[grado] [varchar](35) NULL,
 CONSTRAINT [PK_curso_idcurso] PRIMARY KEY CLUSTERED 
(
	[idcursogrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hijo]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hijo](
	[idhijo] [int] IDENTITY(1,1) NOT NULL,
	[id_tutoria] [int] NULL,
	[id_padre] [int] NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_hijo] PRIMARY KEY CLUSTERED 
(
	[idhijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[horario]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[horario](
	[idhorario] [int] IDENTITY(62,1) NOT NULL,
	[horainicio] [varchar](8000) NULL DEFAULT (NULL),
	[horafin] [varchar](8000) NULL DEFAULT (NULL),
	[dia] [nvarchar](25) NULL DEFAULT (NULL),
 CONSTRAINT [PK_horario_idhorario] PRIMARY KEY CLUSTERED 
(
	[idhorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mensaje]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mensaje](
	[idmensaje] [int] IDENTITY(4,1) NOT NULL,
	[hora] [varchar](8000) NULL,
	[fecha] [datetime2](0) NULL,
	[contenido] [nvarchar](120) NULL,
	[id_padre] [int] NULL,
	[id_profe] [int] NULL,
	[remitente] [nvarchar](45) NULL,
 CONSTRAINT [PK_mensaje_idmensaje] PRIMARY KEY CLUSTERED 
(
	[idmensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[metodopago]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[metodopago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NULL,
	[numerotarjeta] [varchar](16) NULL,
	[fecha] [date] NULL,
	[cvv] [varchar](3) NULL,
 CONSTRAINT [PK_metodopago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[padre]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[padre](
	[idpadre] [int] IDENTITY(4,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[password] [nvarchar](45) NULL,
	[email] [nvarchar](60) NULL,
	[departamento] [nvarchar](35) NULL,
	[provincia] [nvarchar](35) NULL,
	[distrito] [nvarchar](35) NULL,
	[direccion] [nvarchar](70) NULL,
	[celular] [int] NULL,
	[dni] [int] NULL,
	[fotourl] [varchar](250) NULL,
 CONSTRAINT [PK_padre_idpadre] PRIMARY KEY CLUSTERED 
(
	[idpadre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[profesor]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[profesor](
	[idprofesor] [int] IDENTITY(4,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[password] [nvarchar](45) NULL,
	[email] [nvarchar](60) NULL,
	[celular] [nvarchar](45) NULL,
	[descripcion] [nvarchar](65) NULL,
	[preciomin] [decimal](4, 2) NULL,
	[preciomax] [decimal](4, 2) NULL,
	[experiencia] [nvarchar](65) NULL,
	[calificacion] [int] NULL,
	[dni] [int] NULL,
	[antecedentes] [varchar](100) NULL,
	[fotourl] [varchar](250) NULL,
	[id_metodopago] [int] NULL,
 CONSTRAINT [PK_profesor_idprofesor] PRIMARY KEY CLUSTERED 
(
	[idprofesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[profesor_cursogrado]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesor_cursogrado](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[id_profesor] [int] NULL,
	[id_cursogrado] [int] NULL,
 CONSTRAINT [PK_profesor_curso_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[profesor_horario]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[profesor_horario](
	[id] [int] IDENTITY(9,1) NOT NULL,
	[id_profesor] [int] NULL,
	[id_horario] [int] NULL,
	[estado] [varchar](20) NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_profesor_horario_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[profesor_zona]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesor_zona](
	[id] [int] IDENTITY(5,1) NOT NULL,
	[id_profe] [int] NULL,
	[id_zona] [int] NULL,
 CONSTRAINT [PK_profesor_zona_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[profesorfavorito]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesorfavorito](
	[id] [int] IDENTITY(3,1) NOT NULL,
	[id_profesor] [int] NULL,
	[id_padre] [int] NULL,
 CONSTRAINT [PK_profesorfavorito_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[resumenclase]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resumenclase](
	[idresumen] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](80) NULL,
	[fecha] [datetime2](0) NULL,
	[id_tutoria] [int] NULL,
 CONSTRAINT [PK_avance_idavance] PRIMARY KEY CLUSTERED 
(
	[idresumen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[servicio]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[servicio](
	[idservicio] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[tipodepago] [varchar](30) NULL,
 CONSTRAINT [PK_servicio] PRIMARY KEY CLUSTERED 
(
	[idservicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[suscripcion]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suscripcion](
	[idsuscripcion] [int] IDENTITY(3,1) NOT NULL,
	[fechainicio] [datetime2](0) NULL,
	[fechafin] [datetime2](0) NULL,
	[id_profesor] [int] NULL,
 CONSTRAINT [PK_suscripcion_idsuscripcion] PRIMARY KEY CLUSTERED 
(
	[idsuscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tutoria]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutoria](
	[idtutoria] [int] IDENTITY(2,1) NOT NULL,
	[hora] [time](7) NULL,
	[fecha] [datetime2](0) NULL,
	[precio] [decimal](8, 2) NULL,
	[comentario] [nvarchar](90) NULL,
	[calificacion] [int] NULL,
	[id_padre] [int] NULL,
	[estado] [nvarchar](20) NULL,
	[curso] [nvarchar](50) NULL,
	[id_horario] [int] NULL,
	[id_servicio] [int] NULL,
	[numerohoras] [int] NULL,
 CONSTRAINT [PK_tutoria_idtutoria] PRIMARY KEY CLUSTERED 
(
	[idtutoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zona]    Script Date: 09/06/2018 0:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zona](
	[idzona] [int] IDENTITY(11,1) NOT NULL,
	[zona] [nvarchar](50) NULL DEFAULT (NULL),
 CONSTRAINT [PK_zona_idzona] PRIMARY KEY CLUSTERED 
(
	[idzona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cursogrado] ON 

INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (10, N'Matematica', N'Matematica para primero', N'Primero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (11, N'Matematica', N'Matematica para segundo', N'Segundo')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (12, N'Matematica', N'Matematica para tercero', N'Tercero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (13, N'Matematica', N'Matematica para cuarto', N'Cuarto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (14, N'Matematica', N'Matematica para quinto', N'Quinto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (15, N'Matematica', N'Matematica para sexto', N'Sexto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (16, N'Ingles', N'Ingles para primero', N'Primero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (17, N'Ingles', N'Ingles para segundo', N'Segundo')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (18, N'Ingles', N'Ingles para tercero', N'Tercero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (19, N'Ingles', N'Ingles para cuarto', N'Cuarto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (20, N'Ingles', N'Ingles para quinto', N'Quinto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (21, N'Ingles', N'Ingles para sexto', N'Sexto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (22, N'Comunicacion Integral', N'Comunicacion integral para primero', N'Primero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (23, N'Comunicacion Integral', N'Comunicacion integral para segundo', N'Segundo')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (24, N'Comunicacion Integral', N'Comunicacion integral para tercero', N'Tercero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (25, N'Comunicacion Integral', N'Comunicacion integral para cuarto', N'Cuarto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (26, N'Comunicacion Integral', N'Comunicacion integral para quinto', N'Quinto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (27, N'Comunicacion Integral', N'Comunicacion integral para sexto', N'Sexto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (28, N'Personal Social', N'Personal Social para primero', N'Primero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (29, N'Personal Social', N'Personal Social para segundo', N'Segundo')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (30, N'Personal Social', N'Personal Social para tercero', N'Tercero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (31, N'Personal Social', N'Personal Social para cuarto', N'Cuarto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (32, N'Personal Social', N'Personal Social para quinto', N'Quinto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (33, N'Personal Social', N'Personal Social para sexto', N'Sexto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (34, N'Computacion', N'Computacion para primero', N'Primero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (35, N'Computacion', N'Computacion para segundo', N'Segundo')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (36, N'Computacion', N'Computacion para tercero', N'Tercero')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (37, N'Computacion', N'Computacion para cuarto', N'Cuarto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (38, N'Computacion', N'Computacion para quinto', N'Quinto')
INSERT [dbo].[cursogrado] ([idcursogrado], [nombre], [contenido], [grado]) VALUES (39, N'Computacion', N'Computacion para sexto', N'Sexto')
SET IDENTITY_INSERT [dbo].[cursogrado] OFF
SET IDENTITY_INSERT [dbo].[horario] ON 

INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (2, N'08:00:00', N'09:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (3, N'09:00:00', N'10:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (4, N'10:00:00', N'11:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (5, N'11:00:00', N'12:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (6, N'12:00:00', N'13:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (7, N'13:00:00', N'14:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (8, N'14:00:00', N'15:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (9, N'15:00:00', N'16:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (10, N'16:00:00', N'17:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (11, N'17:00:00', N'18:00:00', N'Lunes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (12, N'08:00:00', N'09:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (13, N'09:00:00', N'10:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (14, N'10:00:00', N'11:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (15, N'11:00:00', N'12:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (16, N'12:00:00', N'13:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (17, N'13:00:00', N'14:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (18, N'14:00:00', N'15:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (19, N'15:00:00', N'16:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (20, N'16:00:00', N'17:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (21, N'17:00:00', N'18:00:00', N'Martes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (22, N'08:00:00', N'09:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (23, N'09:00:00', N'10:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (24, N'10:00:00', N'11:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (25, N'11:00:00', N'12:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (26, N'12:00:00', N'13:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (27, N'13:00:00', N'14:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (28, N'14:00:00', N'15:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (29, N'15:00:00', N'16:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (30, N'16:00:00', N'17:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (31, N'17:00:00', N'18:00:00', N'Miercoles')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (32, N'08:00:00', N'09:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (33, N'09:00:00', N'10:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (34, N'10:00:00', N'11:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (35, N'11:00:00', N'12:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (36, N'12:00:00', N'13:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (37, N'13:00:00', N'14:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (38, N'14:00:00', N'15:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (39, N'15:00:00', N'16:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (40, N'16:00:00', N'17:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (41, N'17:00:00', N'18:00:00', N'Jueves')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (42, N'08:00:00', N'09:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (43, N'09:00:00', N'10:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (44, N'10:00:00', N'11:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (45, N'11:00:00', N'12:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (46, N'12:00:00', N'13:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (47, N'13:00:00', N'14:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (48, N'14:00:00', N'15:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (49, N'15:00:00', N'16:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (50, N'16:00:00', N'17:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (51, N'17:00:00', N'18:00:00', N'Viernes')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (52, N'08:00:00', N'09:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (53, N'09:00:00', N'10:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (54, N'10:00:00', N'11:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (55, N'11:00:00', N'12:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (56, N'12:00:00', N'13:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (57, N'13:00:00', N'14:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (58, N'14:00:00', N'15:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (59, N'15:00:00', N'16:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (60, N'16:00:00', N'17:00:00', N'Sabado')
INSERT [dbo].[horario] ([idhorario], [horainicio], [horafin], [dia]) VALUES (61, N'17:00:00', N'18:00:00', N'Sabado')
SET IDENTITY_INSERT [dbo].[horario] OFF
SET IDENTITY_INSERT [dbo].[zona] ON 

INSERT [dbo].[zona] ([idzona], [zona]) VALUES (1, N'San Isidro')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (3, N'Chorrillos')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (4, N'Miraflores')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (5, N'La Molina')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (6, N'San Borja')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (7, N'Surco')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (8, N'Barranco')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (13, N'Jesus Maria')
INSERT [dbo].[zona] ([idzona], [zona]) VALUES (14, N'Surquillo')
SET IDENTITY_INSERT [dbo].[zona] OFF
/****** Object:  Index [FK_Mensaje_Padre_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Mensaje_Padre_idx] ON [dbo].[mensaje]
(
	[id_padre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Mensaje_Profe_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Mensaje_Profe_idx] ON [dbo].[mensaje]
(
	[id_profe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Curso_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Curso_idx] ON [dbo].[profesor_cursogrado]
(
	[id_cursogrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PRofesor_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_PRofesor_idx] ON [dbo].[profesor_cursogrado]
(
	[id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Horario_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Horario_idx] ON [dbo].[profesor_horario]
(
	[id_horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Profes_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Profes_idx] ON [dbo].[profesor_horario]
(
	[id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_profe_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_profe_idx] ON [dbo].[profesor_zona]
(
	[id_profe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_zona_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_zona_idx] ON [dbo].[profesor_zona]
(
	[id_zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ProfeFav_Padre_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_ProfeFav_Padre_idx] ON [dbo].[profesorfavorito]
(
	[id_padre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ProfeFav_Profe_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_ProfeFav_Profe_idx] ON [dbo].[profesorfavorito]
(
	[id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Avance_Tutoria_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Avance_Tutoria_idx] ON [dbo].[resumenclase]
(
	[id_tutoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Profe_Suscripcion_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Profe_Suscripcion_idx] ON [dbo].[suscripcion]
(
	[id_profesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Tutoria_Padre_idx]    Script Date: 09/06/2018 0:18:26 ******/
CREATE NONCLUSTERED INDEX [FK_Tutoria_Padre_idx] ON [dbo].[tutoria]
(
	[id_padre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mensaje] ADD  DEFAULT (NULL) FOR [hora]
GO
ALTER TABLE [dbo].[mensaje] ADD  DEFAULT (NULL) FOR [fecha]
GO
ALTER TABLE [dbo].[mensaje] ADD  DEFAULT (NULL) FOR [contenido]
GO
ALTER TABLE [dbo].[mensaje] ADD  DEFAULT (NULL) FOR [id_padre]
GO
ALTER TABLE [dbo].[mensaje] ADD  DEFAULT (NULL) FOR [id_profe]
GO
ALTER TABLE [dbo].[mensaje] ADD  DEFAULT (NULL) FOR [remitente]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [nombre]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [apellido]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [departamento]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [provincia]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [distrito]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [direccion]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [celular]
GO
ALTER TABLE [dbo].[padre] ADD  DEFAULT (NULL) FOR [dni]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [nombre]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [apellido]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [password]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [celular]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [descripcion]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [preciomin]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [preciomax]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [experiencia]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [calificacion]
GO
ALTER TABLE [dbo].[profesor] ADD  DEFAULT (NULL) FOR [dni]
GO
ALTER TABLE [dbo].[profesor_cursogrado] ADD  DEFAULT (NULL) FOR [id_profesor]
GO
ALTER TABLE [dbo].[profesor_cursogrado] ADD  DEFAULT (NULL) FOR [id_cursogrado]
GO
ALTER TABLE [dbo].[profesor_horario] ADD  DEFAULT (NULL) FOR [id_profesor]
GO
ALTER TABLE [dbo].[profesor_horario] ADD  DEFAULT (NULL) FOR [id_horario]
GO
ALTER TABLE [dbo].[profesor_zona] ADD  DEFAULT (NULL) FOR [id_profe]
GO
ALTER TABLE [dbo].[profesor_zona] ADD  DEFAULT (NULL) FOR [id_zona]
GO
ALTER TABLE [dbo].[profesorfavorito] ADD  DEFAULT (NULL) FOR [id_profesor]
GO
ALTER TABLE [dbo].[profesorfavorito] ADD  DEFAULT (NULL) FOR [id_padre]
GO
ALTER TABLE [dbo].[resumenclase] ADD  DEFAULT (NULL) FOR [descripcion]
GO
ALTER TABLE [dbo].[resumenclase] ADD  DEFAULT (NULL) FOR [fecha]
GO
ALTER TABLE [dbo].[resumenclase] ADD  DEFAULT (NULL) FOR [id_tutoria]
GO
ALTER TABLE [dbo].[suscripcion] ADD  DEFAULT (NULL) FOR [fechainicio]
GO
ALTER TABLE [dbo].[suscripcion] ADD  DEFAULT (NULL) FOR [fechafin]
GO
ALTER TABLE [dbo].[suscripcion] ADD  DEFAULT (NULL) FOR [id_profesor]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__hora__5BE2A6F2]  DEFAULT (NULL) FOR [hora]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__fecha__5CD6CB2B]  DEFAULT (NULL) FOR [fecha]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__precio__5DCAEF64]  DEFAULT (NULL) FOR [precio]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__comenta__5EBF139D]  DEFAULT (NULL) FOR [comentario]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__calific__5FB337D6]  DEFAULT (NULL) FOR [calificacion]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__id_padr__60A75C0F]  DEFAULT (NULL) FOR [id_padre]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__estado__628FA481]  DEFAULT (NULL) FOR [estado]
GO
ALTER TABLE [dbo].[tutoria] ADD  CONSTRAINT [DF__tutoria__curso__6477ECF3]  DEFAULT (NULL) FOR [curso]
GO
ALTER TABLE [dbo].[hijo]  WITH CHECK ADD  CONSTRAINT [FK_hijo_padre] FOREIGN KEY([id_padre])
REFERENCES [dbo].[padre] ([idpadre])
GO
ALTER TABLE [dbo].[hijo] CHECK CONSTRAINT [FK_hijo_padre]
GO
ALTER TABLE [dbo].[hijo]  WITH CHECK ADD  CONSTRAINT [FK_hijo_tutoria] FOREIGN KEY([id_tutoria])
REFERENCES [dbo].[tutoria] ([idtutoria])
GO
ALTER TABLE [dbo].[hijo] CHECK CONSTRAINT [FK_hijo_tutoria]
GO
ALTER TABLE [dbo].[mensaje]  WITH NOCHECK ADD  CONSTRAINT [mensaje$FK_Mensaje_Padre] FOREIGN KEY([id_padre])
REFERENCES [dbo].[padre] ([idpadre])
GO
ALTER TABLE [dbo].[mensaje] CHECK CONSTRAINT [mensaje$FK_Mensaje_Padre]
GO
ALTER TABLE [dbo].[mensaje]  WITH NOCHECK ADD  CONSTRAINT [mensaje$FK_Mensaje_Profe] FOREIGN KEY([id_profe])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[mensaje] CHECK CONSTRAINT [mensaje$FK_Mensaje_Profe]
GO
ALTER TABLE [dbo].[profesor]  WITH CHECK ADD  CONSTRAINT [FK_profesor_metodopago] FOREIGN KEY([id_metodopago])
REFERENCES [dbo].[metodopago] ([id])
GO
ALTER TABLE [dbo].[profesor] CHECK CONSTRAINT [FK_profesor_metodopago]
GO
ALTER TABLE [dbo].[profesor_cursogrado]  WITH NOCHECK ADD  CONSTRAINT [profesor_curso$FK_Curso] FOREIGN KEY([id_cursogrado])
REFERENCES [dbo].[cursogrado] ([idcursogrado])
GO
ALTER TABLE [dbo].[profesor_cursogrado] CHECK CONSTRAINT [profesor_curso$FK_Curso]
GO
ALTER TABLE [dbo].[profesor_cursogrado]  WITH NOCHECK ADD  CONSTRAINT [profesor_curso$FK_PRofesor] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[profesor_cursogrado] CHECK CONSTRAINT [profesor_curso$FK_PRofesor]
GO
ALTER TABLE [dbo].[profesor_horario]  WITH NOCHECK ADD  CONSTRAINT [profesor_horario$FK_Horario] FOREIGN KEY([id_horario])
REFERENCES [dbo].[horario] ([idhorario])
GO
ALTER TABLE [dbo].[profesor_horario] CHECK CONSTRAINT [profesor_horario$FK_Horario]
GO
ALTER TABLE [dbo].[profesor_horario]  WITH NOCHECK ADD  CONSTRAINT [profesor_horario$FK_Profes] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[profesor_horario] CHECK CONSTRAINT [profesor_horario$FK_Profes]
GO
ALTER TABLE [dbo].[profesor_zona]  WITH NOCHECK ADD  CONSTRAINT [profesor_zona$FK_Profesor_Zona] FOREIGN KEY([id_profe])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[profesor_zona] CHECK CONSTRAINT [profesor_zona$FK_Profesor_Zona]
GO
ALTER TABLE [dbo].[profesor_zona]  WITH NOCHECK ADD  CONSTRAINT [profesor_zona$FK_ZONA_Profesor] FOREIGN KEY([id_zona])
REFERENCES [dbo].[zona] ([idzona])
GO
ALTER TABLE [dbo].[profesor_zona] CHECK CONSTRAINT [profesor_zona$FK_ZONA_Profesor]
GO
ALTER TABLE [dbo].[profesorfavorito]  WITH NOCHECK ADD  CONSTRAINT [profesorfavorito$FK_ProfeFav_Padre] FOREIGN KEY([id_padre])
REFERENCES [dbo].[padre] ([idpadre])
GO
ALTER TABLE [dbo].[profesorfavorito] CHECK CONSTRAINT [profesorfavorito$FK_ProfeFav_Padre]
GO
ALTER TABLE [dbo].[profesorfavorito]  WITH NOCHECK ADD  CONSTRAINT [profesorfavorito$FK_ProfeFav_Profe] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[profesorfavorito] CHECK CONSTRAINT [profesorfavorito$FK_ProfeFav_Profe]
GO
ALTER TABLE [dbo].[resumenclase]  WITH CHECK ADD  CONSTRAINT [FK_resumenclase_tutoria] FOREIGN KEY([id_tutoria])
REFERENCES [dbo].[tutoria] ([idtutoria])
GO
ALTER TABLE [dbo].[resumenclase] CHECK CONSTRAINT [FK_resumenclase_tutoria]
GO
ALTER TABLE [dbo].[suscripcion]  WITH NOCHECK ADD  CONSTRAINT [suscripcion$FK_Profe_Suscripcion] FOREIGN KEY([id_profesor])
REFERENCES [dbo].[profesor] ([idprofesor])
GO
ALTER TABLE [dbo].[suscripcion] CHECK CONSTRAINT [suscripcion$FK_Profe_Suscripcion]
GO
ALTER TABLE [dbo].[tutoria]  WITH CHECK ADD  CONSTRAINT [FK_tutoria_profesor_horario] FOREIGN KEY([id_horario])
REFERENCES [dbo].[profesor_horario] ([id])
GO
ALTER TABLE [dbo].[tutoria] CHECK CONSTRAINT [FK_tutoria_profesor_horario]
GO
ALTER TABLE [dbo].[tutoria]  WITH CHECK ADD  CONSTRAINT [FK_tutoria_servicio] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[servicio] ([idservicio])
GO
ALTER TABLE [dbo].[tutoria] CHECK CONSTRAINT [FK_tutoria_servicio]
GO
ALTER TABLE [dbo].[tutoria]  WITH NOCHECK ADD  CONSTRAINT [tutoria$FK_Tutoria_Padre] FOREIGN KEY([id_padre])
REFERENCES [dbo].[padre] ([idpadre])
GO
ALTER TABLE [dbo].[tutoria] CHECK CONSTRAINT [tutoria$FK_Tutoria_Padre]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'cursogrado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.horario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'horario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.mensaje' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mensaje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.padre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'padre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.profesor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'profesor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.profesor_curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'profesor_cursogrado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.profesor_horario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'profesor_horario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.profesor_zona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'profesor_zona'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.profesorfavorito' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'profesorfavorito'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.avance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'resumenclase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.suscripcion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'suscripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.tutoria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tutoria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'TrabajoMoviles.zona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'zona'
GO
USE [master]
GO
ALTER DATABASE [TrabajoMoviles] SET  READ_WRITE 
GO
