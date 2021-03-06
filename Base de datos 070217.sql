USE [master]
GO
/****** Object:  Database [GrupoSM]    Script Date: 02/02/2017 01:47:33 p. m. ******/
CREATE DATABASE [GrupoSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GrupoSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SERVIDOR\MSSQL\DATA\GrupoSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GrupoSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SERVIDOR\MSSQL\DATA\GrupoSM_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GrupoSM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GrupoSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GrupoSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GrupoSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GrupoSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GrupoSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GrupoSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [GrupoSM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GrupoSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GrupoSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GrupoSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GrupoSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GrupoSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GrupoSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GrupoSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GrupoSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GrupoSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GrupoSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GrupoSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GrupoSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GrupoSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GrupoSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GrupoSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GrupoSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GrupoSM] SET RECOVERY FULL 
GO
ALTER DATABASE [GrupoSM] SET  MULTI_USER 
GO
ALTER DATABASE [GrupoSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GrupoSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GrupoSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GrupoSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GrupoSM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GrupoSM', N'ON'
GO
ALTER DATABASE [GrupoSM] SET QUERY_STORE = OFF
GO
USE [GrupoSM]
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
USE [GrupoSM]
GO
/****** Object:  User [Sistema]    Script Date: 02/02/2017 01:47:34 p. m. ******/
CREATE USER [Sistema] FOR LOGIN [Sistema] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [Sistema]
GO
/****** Object:  Table [dbo].[orden_produccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_produccion](
	[id_orden] [int] IDENTITY(100,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[asunto] [varchar](max) NULL,
	[observaciones] [varchar](max) NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_entrega] [datetime] NULL,
	[avios_completo] [int] NULL,
	[fecha_avios] [datetime] NULL,
	[tela_completa] [int] NULL,
	[fecha_tela] [datetime] NULL,
	[ruta_establecida] [int] NULL,
	[fecha_ruta] [datetime] NULL,
	[trazado_completo] [int] NULL,
	[fecha_trazado_inicio] [datetime] NULL,
	[fecha_trazado_terminado] [datetime] NULL,
	[tendido_completo] [int] NULL,
	[fecha_tendido] [datetime] NULL,
	[corte] [int] NULL,
	[fecha_corte_inicio] [datetime] NULL,
	[fecha_corte_terminado] [datetime] NULL,
	[separado] [int] NULL,
	[fecha_separado_inicio] [datetime] NULL,
	[fecha_separado_terminado] [datetime] NULL,
	[en_maquila] [int] NULL,
	[fecha_maquila_salida] [datetime] NULL,
	[fecha_maquila_entrada] [datetime] NULL,
	[acabados] [int] NULL,
	[fecha_acabados_inicio] [datetime] NULL,
	[fecha_acabados_terminado] [datetime] NULL,
	[calidad] [int] NULL,
	[Terminado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ficha_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ficha_detalle](
	[idficha_detalle] [int] IDENTITY(100,1) NOT NULL,
	[nombre_prenda] [varchar](max) NULL,
	[modelo] [varchar](max) NULL,
	[tela] [varchar](max) NULL,
	[ancho_tela] [float] NULL,
	[consumo_tela] [float] NULL,
	[combinacion] [varchar](max) NULL,
	[ancho_tela_conbinacion] [float] NULL,
	[consumo_conbinacion] [float] NULL,
	[forro] [varchar](max) NULL,
	[ancho_tela_forro] [float] NULL,
	[consumo_forro] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idficha_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[produccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produccion](
	[id_produccion] [int] IDENTITY(100,1) NOT NULL,
	[idorden] [int] NOT NULL,
	[idficha] [int] NOT NULL,
	[observaciones_diseño] [varchar](max) NULL,
	[rutas] [varchar](max) NULL,
	[trazo] [varchar](max) NULL,
	[tendio] [varchar](max) NULL,
	[corto] [varchar](max) NULL,
	[separado] [varchar](max) NULL,
	[marca] [varchar](max) NULL,
	[pellon] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_produccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[ordenesvista_telas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[ordenesvista_telas]
as
select id_orden,
		idficha,
		asunto,
		tela,
		forro,
		consumo_forro,
		combinacion,
		consumo_conbinacion,
		id_cliente
from orden_produccion,
		produccion,
		ficha_detalle
where produccion.idorden=orden_produccion.id_orden and ficha_detalle.idficha_detalle=produccion.idficha and orden_produccion.tela_completa is null


GO
/****** Object:  View [dbo].[ordenesvista_avios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ordenesvista_avios]
as
select id_orden,
	idficha,
	asunto,
	tela,
	forro,
	consumo_forro,
	combinacion,
	consumo_conbinacion,
	id_cliente
from orden_produccion,
	produccion,
	ficha_detalle
where produccion.idorden=orden_produccion.id_orden and ficha_detalle.idficha_detalle=produccion.idficha and orden_produccion.avios_completo is null;


GO
/****** Object:  View [dbo].[ordenesvista]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ordenesvista]
as
select orden_produccion.id_orden,
	produccion.idficha,
	orden_produccion.asunto,
	ficha_detalle.tela,
	ficha_detalle.forro,
	ficha_detalle.consumo_forro,
	ficha_detalle.combinacion,
	ficha_detalle.consumo_conbinacion,
	orden_produccion.id_cliente
from orden_produccion,
	produccion,
	ficha_detalle
where produccion.idorden=orden_produccion.id_orden and orden_produccion.fecha_trazado_inicio is null and ficha_detalle.idficha_detalle=produccion.idficha


GO
/****** Object:  Table [dbo].[avios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avios](
	[id_avios] [int] IDENTITY(100,1) NOT NULL,
	[nombre] [varchar](max) NULL,
	[tipo] [int] NOT NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_avios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[avios_bodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avios_bodega](
	[idaviosbodega] [int] IDENTITY(100,1) NOT NULL,
	[idavios] [int] NOT NULL,
	[cantidad] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idaviosbodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vistabodegaavios3]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vistabodegaavios3]
as
Select avios.nombre,
		avios.tipo,
		ROUND(avios_bodega.cantidad, 2),
		case
		when avios.tipo = 0 then 'Boton'
		when avios.tipo = 1 then 'Bordado'
		when avios.tipo = 2 then 'Cierre'
		when avios.tipo = 3 then 'Cintas'
		when avios.tipo = 4 then 'Elastico'
		when avios.tipo = 5 then 'Encaje'
		when avios.tipo = 6 then 'Entretela'
		when avios.tipo = 7 then 'Etiqueta'
		when avios.tipo = 8 then 'Forro'
		when avios.tipo = 9 then 'Gancho'
		when avios.tipo = 10 then 'Hombreras'
		when avios.tipo = 11 then 'Hilo'
		when avios.tipo = 12 then 'Pellon'
		when avios.tipo = 13 then 'Otros'
		END as [Descripcion]
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios and cantidad=0 and avios.precio=0

GO
/****** Object:  View [dbo].[vistabodegaavios4]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vistabodegaavios4]
as
Select avios.nombre,
		avios.tipo,
		ROUND(avios_bodega.cantidad, 2),
		case
		when avios.tipo = 0 then 'Boton'
		when avios.tipo = 1 then 'Bordado'
		when avios.tipo = 2 then 'Cierre'
		when avios.tipo = 3 then 'Cintas'
		when avios.tipo = 4 then 'Elastico'
		when avios.tipo = 5 then 'Encaje'
		when avios.tipo = 6 then 'Entretela'
		when avios.tipo = 7 then 'Etiqueta'
		when avios.tipo = 8 then 'Forro'
		when avios.tipo = 9 then 'Gancho'
		when avios.tipo = 10 then 'Hombreras'
		when avios.tipo = 11 then 'Hilo'
		when avios.tipo = 12 then 'Pellon'
		when avios.tipo = 13 then 'Otros'
		END as [Descripcion]
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios and avios.precio=0

GO
/****** Object:  Table [dbo].[procesos_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procesos_detalle](
	[id_procesos_detalle] [int] IDENTITY(100,1) NOT NULL,
	[id_ficha] [int] NOT NULL,
	[id_proceso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_procesos_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[procesos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procesos](
	[id_procesos] [int] IDENTITY(100,1) NOT NULL,
	[operacion] [varchar](max) NULL,
	[tipo] [int] NOT NULL,
	[tiempo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_procesos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[procesosficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[procesosficha]
as
select id_ficha,
		operacion,
		tiempo,
		id_proceso
from procesos,
	procesos_detalle
where id_proceso=id_procesos


GO
/****** Object:  View [dbo].[avios_mas_bodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Alter view [dbo].[avios_mas_bodega]
as
select avios.id_avios,
		avios.nombre,
		avios.precio,
		ROUND(avios_bodega.cantidad, 2),
		avios.tipo,
		avios_bodega.idaviosbodega
from avios,
		avios_bodega
where avios.id_avios=avios_bodega.idavios and tipo>=14

GO
/****** Object:  View [dbo].[VistaActivosMonitor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaActivosMonitor]
as
select orden_produccion.asunto as 'Prenda',
		orden_produccion.fecha_inicio as 'Entra Pedido',
		orden_produccion.fecha_avios as 'Avios Completos',
		orden_produccion.fecha_tela as 'Tela Completa',
		orden_produccion.fecha_trazado_inicio as 'Se imprimio la hoja de corte',
		orden_produccion.fecha_ruta as 'Rutas Establecidas',
		orden_produccion.fecha_trazado_terminado as 'Empezo el trazado',
		--orden_produccion.fecha_trazado_terminado as 'Termino el trazado',
		orden_produccion.fecha_tendido as 'Termina tendido',
		orden_produccion.fecha_corte_inicio as 'Inicia Corte',
		orden_produccion.fecha_corte_terminado as 'Termina Corte',
		orden_produccion.fecha_separado_inicio as 'Inicio Separado',
		orden_produccion.fecha_separado_terminado as 'Termina Separado',
		orden_produccion.fecha_maquila_salida as 'Sale a maquila',
		orden_produccion.fecha_maquila_entrada as 'Entrada Completa de Maquila',
		orden_produccion.fecha_acabados_terminado as 'Acabados terminado'
from orden_produccion
where orden_produccion.Terminado is null


GO
/****** Object:  Table [dbo].[solicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud](
	[id_solicitud] [int] IDENTITY(100,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[asunto] [varchar](max) NULL,
	[fecha] [datetime] NULL,
	[respondido] [int] NULL,
	[descripcion] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vistasolicitudes]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vistasolicitudes] 
as
select id_solicitud,
		asunto,
		fecha
from solicitud


GO
/****** Object:  View [dbo].[VistaTerminadosMonitor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaTerminadosMonitor]
as
select orden_produccion.asunto as 'Prenda',
		orden_produccion.fecha_inicio as 'Entra Pedido',
		orden_produccion.fecha_entrega as 'Entregado',
		orden_produccion.fecha_avios as 'Avios Completos',
		orden_produccion.fecha_tela as 'Tela Completa',
		orden_produccion.fecha_trazado_inicio as 'Se imprimio la hoja de corte',
		orden_produccion.fecha_ruta as 'Rutas Establecidas',
		orden_produccion.fecha_trazado_terminado as 'Empezo el trazado',
		--orden_produccion.fecha_trazado_terminado as 'Termino el trazado',
		orden_produccion.fecha_tendido as 'Termina tendido',
		orden_produccion.fecha_corte_inicio as 'Inicia Corte',
		orden_produccion.fecha_corte_terminado as 'Termina Corte',
		orden_produccion.fecha_separado_inicio as 'Inicio Separado',
		orden_produccion.fecha_separado_terminado as 'Termina Separado',
		orden_produccion.fecha_maquila_salida as 'Sale a maquila',
		orden_produccion.fecha_maquila_entrada as 'Entrada Completa de Maquila',
		orden_produccion.fecha_acabados_terminado as 'Acabados terminado'
from orden_produccion
where orden_produccion.Terminado is not null


GO
/****** Object:  Table [dbo].[clientes]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idclientes] [int] IDENTITY(100,1) NOT NULL,
	[nombre] [varchar](max) NULL,
	[costo_minuto] [float] NULL,
	[costo_metro] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idclientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[solicitudclientes]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[solicitudclientes]
as
select id_solicitud,
		idclientes,
		asunto,
		fecha,
		respondido,
		descripcion,
		nombre,
		costo_minuto
from solicitud,
		clientes
where solicitud.id_cliente=clientes.idclientes and solicitud.respondido=0


GO
/****** Object:  Table [dbo].[tela]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tela](
	[id_tela] [int] IDENTITY(100,1) NOT NULL,
	[cliente] [int] NOT NULL,
	[proveedor] [int] NOT NULL,
	[produccion] [int] NOT NULL,
	[fecha_entrada] [datetime] NULL,
	[nombre_descripcion] [varchar](max) NULL,
	[metros] [float] NULL,
	[composicion] [varchar](max) NULL,
	[color] [varchar](max) NULL,
	[ancho] [float] NULL,
	[largo_trazo] [float] NULL,
	[paños] [float] NULL,
	[utilizado_tela] [float] NULL,
	[retazo_tela] [float] NULL,
	[saldo_tela] [float] NULL,
	[faltante_tela] [float] NULL,
	[precio_metro] [float] NULL,
	[tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vistatelas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vistatelas] 
as
select produccion,
		fecha_entrada,
		nombre_descripcion,
		metros,
		composicion,
		color,
		ancho,
		tipo,
		proveedor
from tela


GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idproveedor] [int] IDENTITY(100,1) NOT NULL,
	[nombre] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tela_bodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tela_bodega](
	[idtela] [int] IDENTITY(100,1) NOT NULL,
	[cliente] [int] NOT NULL,
	[proveedor] [int] NOT NULL,
	[fecha_entrada] [datetime] NULL,
	[nombre_descripcion] [varchar](max) NULL,
	[metros] [float] NULL,
	[composicion] [varchar](max) NULL,
	[color] [varchar](max) NULL,
	[ancho] [float] NULL,
	[tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idtela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[telasbodegavista]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[telasbodegavista]
as
SELECT        dbo.tela.produccion as ORDEN, dbo.tela.idtela AS ID, dbo.tela.nombre_descripcion AS Nombre, dbo.tela.metros, dbo.tela.composicion, dbo.tela.color, dbo.tela.ancho, dbo.tela.tipo, dbo.tela.fecha_entrada AS [Fecha Entrada], 
                         dbo.tela.proveedor AS ProveedorID, dbo.proveedor.nombre AS Proveedor, CASE WHEN tela.tipo = 1 THEN 'Tela' WHEN tela.tipo = 2 THEN 'Combinacion' WHEN tela.tipo = 3 THEN 'Forro' END AS Descripcion
FROM            dbo.tela INNER JOIN
                         dbo.proveedor ON dbo.tela.proveedor = dbo.proveedor.idproveedor
GO
/****** Object:  Table [dbo].[ficha_tecnica]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ficha_tecnica](
	[idficha_tecnica] [int] IDENTITY(100,1) NOT NULL,
	[idficha_detalle] [int] NOT NULL,
	[idsolicitud] [int] NULL,
	[cliente] [int] NULL,
	[especificacionescostura] [varchar](max) NULL,
	[tiempo_costura] [float] NULL,
	[tiempo_acabados] [float] NULL,
	[Costeo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idficha_tecnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[Vclientefichas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter view [dbo].[Vclientefichas]
as
select id_solicitud,
		idficha_tecnica,
		asunto,
		tiempo_costura,
		tiempo_acabados,
		costo_minuto,
		costo_metro,
		consumo_tela,
		tela,
		combinacion, 
		forro,
		consumo_conbinacion,
		consumo_forro
from clientes,
	solicitud,
	ficha_tecnica,
	ficha_detalle
where ( ficha_tecnica.cliente=clientes.idclientes and ficha_tecnica.idsolicitud=solicitud.id_solicitud and solicitud.respondido=1 and ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle)


GO
/****** Object:  Table [dbo].[solicitudrespuesta]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitudrespuesta](
	[id_solicitudrespuesta] [int] IDENTITY(100,1) NOT NULL,
	[solicitud] [int] NOT NULL,
	[fecharespuesta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_solicitudrespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vistasolicitudes2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vistasolicitudes2]
as
select asunto as 'Asunto',
		fecha as 'Fecha Creado',
		respondido,
		fecharespuesta as 'Fecha de respuesta',
		descripcion as 'Descripcion', 
		id_cliente,
		id_solicitud
from solicitud,
		solicitudrespuesta
where id_solicitud=solicitud and respondido=0

GO
/****** Object:  View [dbo].[vistabodegaavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vistabodegaavios]
as
Select avios.nombre,
		avios.tipo,
		ROUND(avios_bodega.cantidad, 2)
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios

GO
/****** Object:  View [dbo].[Vistafichastecnicascompleta]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vistafichastecnicascompleta]
as
select ficha_tecnica.idficha_tecnica,
		ficha_detalle.nombre_prenda,
		ficha_detalle.modelo,
		ficha_detalle.tela,
		ficha_detalle.ancho_tela,
		ficha_detalle.consumo_tela,
		ficha_detalle.combinacion,
		ficha_detalle.ancho_tela_conbinacion,
		ficha_detalle.consumo_conbinacion,
		ficha_detalle.forro,
		ficha_detalle.ancho_tela_forro,
		ficha_detalle.consumo_forro,
		ficha_tecnica.especificacionescostura,
		ficha_tecnica.tiempo_costura,
		ficha_tecnica.tiempo_acabados
from ficha_tecnica,
		ficha_detalle
where ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle


GO
/****** Object:  View [dbo].[Vfichas_tecnicas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter view [dbo].[Vfichas_tecnicas]
as
select nombre_prenda,
		modelo,
		tela,
		combinacion,
		consumo_conbinacion,
		forro,
		consumo_forro,
		ancho_tela_conbinacion,
		ancho_tela_forro,
		tiempo_costura,
		tiempo_acabados,
		costo_minuto,
		costo_metro,
		consumo_tela,
		idficha_tecnica
from clientes,
	ficha_tecnica,
	ficha_detalle
where ( ficha_tecnica.cliente=clientes.idclientes and ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle)


GO
/****** Object:  View [dbo].[vistabodegaavios2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vistabodegaavios2]
as
Select avios.nombre,
		avios.tipo,
		ROUND(avios_bodega.cantidad, 2),
		case
		when avios.tipo = 0 then 'Boton'
		when avios.tipo = 1 then 'Bordado'
		when avios.tipo = 2 then 'Cierre'
		when avios.tipo = 3 then 'Cintas'
		when avios.tipo = 4 then 'Elastico'
		when avios.tipo = 5 then 'Encaje'
		when avios.tipo = 6 then 'Entretela'
		when avios.tipo = 7 then 'Etiqueta'
		when avios.tipo = 8 then 'Forro'
		when avios.tipo = 9 then 'Gancho'
		when avios.tipo = 10 then 'Hombreras'
		when avios.tipo = 11 then 'Hilo'
		when avios.tipo = 12 then 'Pellon'
		when avios.tipo = 13 then 'Otros'
		END as [Descripcion]
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios and cantidad!=0

GO
/****** Object:  Table [dbo].[salidamaquiladetalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salidamaquiladetalle](
	[id_salidadetalle] [int] IDENTITY(100,1) NOT NULL,
	[idproduccion] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Modelo] [varchar](max) NULL,
	[Mano_de_obra] [decimal](18, 2) NULL,
	[Prenda] [varchar](max) NULL,
	[Tela] [varchar](max) NULL,
	[Notas] [varchar](max) NULL,
	[Especificaciones] [varchar](max) NULL,
	[Pagare] [varchar](max) NULL,
	[Maquilador] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_salidadetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vistasalidadetalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter view [dbo].[vistasalidadetalle]
as
Select salidamaquiladetalle.id_salidadetalle,
		salidamaquiladetalle.idproduccion,
		salidamaquiladetalle.Fecha,
		salidamaquiladetalle.Modelo as 'Ruta ficha tecnica',
		salidamaquiladetalle.Mano_de_obra,
		salidamaquiladetalle.Prenda,
		salidamaquiladetalle.Tela,
		salidamaquiladetalle.Notas,
		salidamaquiladetalle.Especificaciones,
		salidamaquiladetalle.Pagare,
		salidamaquiladetalle.Maquilador,
		orden_produccion.id_cliente,
		clientes.nombre,
		Pellones.Modelo as 'Modelo',
		Pellones.Pellon as 'Pedido'
from salidamaquiladetalle,
		orden_produccion,
		clientes,
		Pellones
where salidamaquiladetalle.idproduccion=orden_produccion.id_orden and clientes.idclientes=orden_produccion.id_cliente and orden_produccion.id_orden=Pellones.Orden


GO
/****** Object:  View [dbo].[vernombressolicitudes]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vernombressolicitudes]
as
select nombre
from clientes


GO
/****** Object:  Table [dbo].[acabados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acabados](
	[id_acabados] [int] IDENTITY(100,1) NOT NULL,
	[operacion] [varchar](max) NULL,
	[tipo] [int] NOT NULL,
	[tiempo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_acabados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[acabados_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acabados_detalle](
	[id_acabados_detalle] [int] IDENTITY(100,1) NOT NULL,
	[id_ficha] [int] NOT NULL,
	[id_acabdos] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[tiempo_total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_acabados_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[acabados_fichas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[acabados_fichas]
as
select id_ficha,
		operacion,
		tipo,
		tiempo,
		cantidad,
		tiempo_total,
		id_acabados
from acabados,
	acabados_detalle
where id_acabados=id_acabdos


GO
/****** Object:  View [dbo].[vista_prendas_trazado]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[vista_prendas_trazado]
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		orden_produccion.fecha_ruta as 'Rutas Establecidas',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.rutas as 'Rutas',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.trazado_completo IS NULL and orden_produccion.id_orden=produccion.idorden

GO
/****** Object:  View [dbo].[vista_prendas_separado]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_prendas_separado]
AS
SELECT        dbo.orden_produccion.id_orden AS Produccion, dbo.orden_produccion.asunto, dbo.orden_produccion.fecha_corte_terminado AS [Termina Corte], dbo.orden_produccion.fecha_separado_inicio AS [Inicio Separado],
                          dbo.orden_produccion.fecha_separado_terminado AS [Termina Separado], dbo.clientes.nombre AS Cliente, dbo.ficha_detalle.modelo, dbo.orden_produccion.observaciones AS Notas, 
                         dbo.produccion.observaciones_diseño AS [Observaciones/Notas Produccion], dbo.produccion.rutas, dbo.produccion.idficha
FROM            dbo.orden_produccion INNER JOIN
                         dbo.clientes ON dbo.orden_produccion.id_cliente = dbo.clientes.idclientes INNER JOIN
                         dbo.produccion ON dbo.orden_produccion.id_orden = dbo.produccion.idorden AND dbo.orden_produccion.id_orden = dbo.produccion.idorden INNER JOIN
                         dbo.ficha_detalle ON dbo.produccion.idficha = dbo.ficha_detalle.idficha_detalle
WHERE        (dbo.orden_produccion.fecha_maquila_salida IS NULL)

GO
/****** Object:  View [dbo].[vista_prendas_maquila]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_prendas_maquila]
AS
SELECT        dbo.orden_produccion.id_orden AS Produccion, dbo.orden_produccion.asunto, dbo.clientes.nombre AS Cliente, dbo.ficha_detalle.modelo, dbo.orden_produccion.observaciones AS Notas, 
                         dbo.produccion.observaciones_diseño AS [Observaciones/Notas Produccion], dbo.produccion.rutas, dbo.ficha_tecnica.tiempo_costura AS [Tiempo Costura], 
                         dbo.ficha_tecnica.especificacionescostura AS [Especificaciones de costura], dbo.produccion.idficha, 
FROM            dbo.orden_produccion INNER JOIN
                         dbo.clientes ON dbo.orden_produccion.id_cliente = dbo.clientes.idclientes INNER JOIN
                         dbo.produccion ON dbo.orden_produccion.id_orden = dbo.produccion.idorden AND dbo.orden_produccion.id_orden = dbo.produccion.idorden INNER JOIN
                         dbo.ficha_detalle ON dbo.produccion.idficha = dbo.ficha_detalle.idficha_detalle INNER JOIN
                         dbo.ficha_tecnica ON dbo.produccion.idficha = dbo.ficha_tecnica.idficha_detalle
WHERE        (dbo.orden_produccion.en_maquila IS NULL)

GO
/****** Object:  View [dbo].[vista_prendas_entrega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_prendas_entrega]
AS
SELECT        dbo.orden_produccion.id_orden AS Produccion, dbo.orden_produccion.asunto, dbo.clientes.nombre AS Cliente, dbo.ficha_detalle.modelo, 
                         dbo.orden_produccion.fecha_acabados_terminado AS [Acabados Terminado], dbo.orden_produccion.fecha_acabados_inicio AS [Termina Calidad], dbo.orden_produccion.observaciones AS Notas, 
                         dbo.produccion.observaciones_diseño AS [Observaciones/Notas Produccion], dbo.produccion.rutas, dbo.produccion.idficha
FROM            dbo.orden_produccion INNER JOIN
                         dbo.clientes ON dbo.orden_produccion.id_cliente = dbo.clientes.idclientes INNER JOIN
                         dbo.produccion ON dbo.orden_produccion.id_orden = dbo.produccion.idorden AND dbo.orden_produccion.id_orden = dbo.produccion.idorden INNER JOIN
                         dbo.ficha_detalle ON dbo.produccion.idficha = dbo.ficha_detalle.idficha_detalle
WHERE        (dbo.orden_produccion.fecha_entrega IS NULL)

GO
/****** Object:  View [dbo].[vista_prendas_entrada]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_prendas_entrada]
AS
SELECT        dbo.orden_produccion.id_orden AS Produccion, dbo.orden_produccion.asunto, dbo.clientes.nombre AS Cliente, dbo.ficha_detalle.modelo, 
                         dbo.orden_produccion.fecha_maquila_entrada AS [Entrada Maquila Completa], dbo.orden_produccion.fecha_acabados_terminado AS [Acabados Terminado], dbo.orden_produccion.observaciones AS Notas, 
                         dbo.produccion.observaciones_diseño AS [Observaciones/Notas Produccion], dbo.produccion.rutas, dbo.produccion.idficha
FROM            dbo.orden_produccion INNER JOIN
                         dbo.clientes ON dbo.orden_produccion.id_cliente = dbo.clientes.idclientes INNER JOIN
                         dbo.produccion ON dbo.orden_produccion.id_orden = dbo.produccion.idorden AND dbo.orden_produccion.id_orden = dbo.produccion.idorden INNER JOIN
                         dbo.ficha_detalle ON dbo.produccion.idficha = dbo.ficha_detalle.idficha_detalle
WHERE        (dbo.orden_produccion.calidad IS NULL)

GO
/****** Object:  View [dbo].[vista_prendas_corte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
				
CREATE view [dbo].[vista_prendas_corte]
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		orden_produccion.fecha_trazado_inicio as 'Empezo el trazado',
		orden_produccion.fecha_trazado_terminado as 'Termino el trazado e inicio tendido',
		orden_produccion.fecha_tendido as 'Corte Inicia',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		produccion.rutas as 'Rutas',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.corte is null and orden_produccion.id_orden=produccion.idorden

GO
/****** Object:  Table [dbo].[avios_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avios_detalle](
	[id_avios_detalle] [int] IDENTITY(100,1) NOT NULL,
	[id_ficha] [int] NOT NULL,
	[id_avio] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[costo] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_avios_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vista_avios_orden]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vista_avios_orden]
as
select avios.id_avios,
avios_detalle.id_ficha,
avios.nombre,
avios_bodega.cantidad as cantidad_bodega,
avios_detalle.cantidad as cantidad_ficha
from avios,
avios_bodega,
avios_detalle
where avios_bodega.idavios=avios.id_avios and avios_detalle.id_avio=avios.id_avios


GO
/****** Object:  Table [dbo].[especificacionesficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especificacionesficha](
	[idespecificaciones] [int] IDENTITY(100,1) NOT NULL,
	[fichatecnica] [int] NOT NULL,
	[Especificaciones] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idespecificaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[Vfichas_tecnicas2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Vfichas_tecnicas2]
as
select  nombre_prenda,
		modelo,
		tela,
		ancho_tela,
		consumo_tela,
		combinacion,
		ancho_tela_conbinacion,
		consumo_conbinacion,
		forro,
		ancho_tela_forro,
		consumo_forro,
		tiempo_costura,
		tiempo_acabados,
		idficha_tecnica,
		costo_minuto,
		costo_metro,
		clientes.nombre,
		idclientes,
		ficha_tecnica.especificacionescostura,
		especificacionesficha.Especificaciones
from clientes,
	ficha_tecnica,
	ficha_detalle,
	especificacionesficha
where ficha_tecnica.cliente=clientes.idclientes and ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle and ficha_tecnica.idficha_tecnica=especificacionesficha.fichatecnica


GO
/****** Object:  View [dbo].[vistaproduccion_paracorte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vistaproduccion_paracorte]
AS
SELECT        dbo.orden_produccion.id_orden AS Produccion, dbo.orden_produccion.asunto, dbo.clientes.nombre AS Cliente, dbo.ficha_detalle.modelo, dbo.orden_produccion.observaciones, dbo.produccion.idficha
FROM            dbo.orden_produccion INNER JOIN
                         dbo.clientes ON dbo.orden_produccion.id_cliente = dbo.clientes.idclientes INNER JOIN
                         dbo.produccion ON dbo.orden_produccion.id_orden = dbo.produccion.idorden INNER JOIN
                         dbo.ficha_detalle ON dbo.produccion.idficha = dbo.ficha_detalle.idficha_detalle
WHERE        (dbo.orden_produccion.avios_completo = 1) AND (dbo.orden_produccion.tela_completa = 1)

GO
/****** Object:  View [dbo].[ver_avios_ficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ver_avios_ficha]
AS
SELECT        dbo.avios_detalle.id_ficha, dbo.avios.nombre, ROUND(dbo.avios_detalle.cantidad, 2), ROUND(dbo.avios.precio, 2), ROUND(dbo.avios_detalle.costo, 2), dbo.avios.id_avios
FROM            dbo.avios INNER JOIN
                         dbo.avios_detalle ON dbo.avios.id_avios = dbo.avios_detalle.id_avio

GO
/****** Object:  Table [dbo].[piezas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[piezas](
	[id_piezas] [int] IDENTITY(100,1) NOT NULL,
	[tipo] [int] NOT NULL,
	[nombre] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_piezas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[piezas_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[piezas_detalle](
	[id_piezas_detalle] [int] IDENTITY(100,1) NOT NULL,
	[id_ficha] [int] NOT NULL,
	[id_pieza] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_piezas_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ver_piezasficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ver_piezasficha]
as
select id_ficha,
		nombre,
		cantidad,
		piezas.id_piezas
from piezas,
piezas_detalle
where ( piezas_detalle.id_pieza=piezas.id_piezas)


GO
/****** Object:  Table [dbo].[acabadosplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acabadosplantilla](
	[id_acabados_detalle] [int] IDENTITY(100,1) NOT NULL,
	[IDplantilla] [int] NOT NULL,
	[id_acabdos] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
	[tiempo_total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_acabados_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[avios_produccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avios_produccion](
	[idavios_produccion] [int] IDENTITY(100,1) NOT NULL,
	[aviosid] [int] NOT NULL,
	[producciondetalle] [int] NOT NULL,
	[cantidad_necesaria] [float] NOT NULL,
	[cantidad_ficha] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idavios_produccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[aviosplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aviosplantilla](
	[IDaviosplantilla] [int] IDENTITY(100,1) NOT NULL,
	[IDplantilla] [int] NOT NULL,
	[id_avio] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NULL,
	[costo] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDaviosplantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AviosSubgrupos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AviosSubgrupos](
	[IDAviosSubGrupo] [int] IDENTITY(100,1) NOT NULL,
	[IDAvioPrincipal] [int] NOT NULL,
	[IDAvioSubColor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAviosSubGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ColorAvio]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorAvio](
	[IDColoravios] [int] IDENTITY(100,1) NOT NULL,
	[IDAviopro] [int] NOT NULL,
	[Color] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDColoravios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IDEmpleado] [int] IDENTITY(100,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Afinidad1] [int] NULL,
	[Afinidad2] [int] NULL,
	[Afinidad3] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmpleadosPorcentajesProduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpleadosPorcentajesProduccion](
	[IDPorcentajeProduccion] [int] IDENTITY(100,1) NOT NULL,
	[Empleado] [int] NOT NULL,
	[Produccion] [int] NOT NULL,
	[Proceso] [int] NOT NULL,
	[FechaAsignado] [datetime] NULL,
	[FechaTerminado] [datetime] NULL,
	[Cantidad] [decimal](18, 2) NULL,
	[TiempoEsperado] [decimal](18, 2) NULL,
	[PorcentajeTrabajo] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPorcentajeProduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleadosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleadosproduccion](
	[IDEmpleadoProduccion] [int] IDENTITY(100,1) NOT NULL,
	[Empleado] [int] NOT NULL,
	[Produccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEmpleadoProduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[maquiladores]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maquiladores](
	[idmaquiladores] [int] IDENTITY(100,1) NOT NULL,
	[nombre] [varchar](max) NULL,
	[precio_minuto] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idmaquiladores] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pellones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pellones](
	[IDPellones] [int] IDENTITY(100,1) NOT NULL,
	[Orden] [int] NOT NULL,
	[Pellon] [varchar](max) NULL,
	[Modelo] [varchar](max) NULL,
	[Composicion] [varchar](max) NULL,
	[Marca] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPellones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

create procedure insertapellones
@idorden int, @pedido varchar(max), @modelo varchar(max), @composicion varchar(max), @marca varchar(max) as
if exists(Select * from pellones where Orden=@idorden)
update Pellones set Orden=@idorden, Pellon=@pedido, Modelo=@modelo, Composicion=@composicion, Marca=@marca where Orden=@idorden
else
insert into pellones (Orden, Pellon, Modelo, Composicion, Marca) values (@idorden, @pedido, @modelo, @composicion, @marca)
go

/****** Object:  Table [dbo].[piezasplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[piezasplantilla](
	[IDpiezasplantilla] [int] IDENTITY(100,1) NOT NULL,
	[IDplantilla] [int] NOT NULL,
	[id_pieza] [int] NOT NULL,
	[cantidad] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDpiezasplantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[plantillas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantillas](
	[IDPlantilla] [int] IDENTITY(100,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPlantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[plantillasespecificaciones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantillasespecificaciones](
	[idespecificacionesplantilla] [int] IDENTITY(100,1) NOT NULL,
	[plantillaid] [int] NOT NULL,
	[Observaciones] [varchar](max) NULL,
	[Especificaciones] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idespecificacionesplantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[procesosplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procesosplantilla](
	[idprocesosplantilla] [int] IDENTITY(100,1) NOT NULL,
	[IDplantilla] [int] NOT NULL,
	[id_proceso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idprocesosplantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[produccion_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produccion_detalle](
	[id_produccion_detalle] [int] IDENTITY(100,1) NOT NULL,
	[producionid] [int] NOT NULL,
	[tela] [varchar](max) NULL,
	[combinacion] [varchar](max) NULL,
	[num_tela_rollo] [float] NULL,
	[num_combinacion_rollo] [float] NULL,
	[talla] [varchar](max) NULL,
	[color] [varchar](max) NULL,
	[metros_recibidos] [float] NULL,
	[cantidad_prendas] [float] NULL,
	[avios_completo] [int] NULL,
	[tela_completa] [int] NULL,
	[maquila_completa] [int] NULL,
	[metros_hilo] [float] NULL,
	[cantidad_prendas_final] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_produccion_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[salida_maquila]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida_maquila](
	[id_salida] [int] IDENTITY(100,1) NOT NULL,
	[id_producciondetalle] [int] NOT NULL,
	[maquilador] [int] NOT NULL,
	[prendas_enviadas] [float] NULL,
	[prendas_recibidas] [float] NULL,
	[mano_obra] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_salida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[salidadetalleavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salidadetalleavios](
	[id_salidaavios] [int] IDENTITY(100,1) NOT NULL,
	[idproduccion] [int] NOT NULL,
	[texto1] [varchar](max) NULL,
	[texto2] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_salidaavios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[telacosteo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telacosteo](
	[idtelas] [int] IDENTITY(100,1) NOT NULL,
	[nombre] [varchar](max) NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idtelas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trabajoprocesos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trabajoprocesos](
	[IDTrabajoprocesos] [int] IDENTITY(100,1) NOT NULL,
	[Produccion] [int] NOT NULL,
	[Proceso] [int] NOT NULL,
	[Cantidad] [decimal](18, 2) NULL,
	[TiempoTotal] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTrabajoprocesos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trabajoseparadohojacorte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trabajoseparadohojacorte](
	[IDTrabajoseparado] [int] IDENTITY(100,1) NOT NULL,
	[Orden] [int] NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Cantidad] [int] NULL,
	[Talla] [varchar](max) NULL,
	[Color] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTrabajoseparado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[acabados_detalle]  WITH CHECK ADD FOREIGN KEY([id_acabdos])
REFERENCES [dbo].[acabados] ([id_acabados])
GO
ALTER TABLE [dbo].[acabados_detalle]  WITH CHECK ADD FOREIGN KEY([id_acabdos])
REFERENCES [dbo].[acabados] ([id_acabados])
GO
ALTER TABLE [dbo].[acabados_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[acabados_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[acabadosplantilla]  WITH CHECK ADD FOREIGN KEY([id_acabdos])
REFERENCES [dbo].[acabados] ([id_acabados])
GO
ALTER TABLE [dbo].[acabadosplantilla]  WITH CHECK ADD FOREIGN KEY([id_acabdos])
REFERENCES [dbo].[acabados] ([id_acabados])
GO
ALTER TABLE [dbo].[acabadosplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[acabadosplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[avios_bodega]  WITH CHECK ADD FOREIGN KEY([idavios])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[avios_bodega]  WITH CHECK ADD FOREIGN KEY([idavios])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[avios_detalle]  WITH CHECK ADD FOREIGN KEY([id_avio])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[avios_detalle]  WITH CHECK ADD FOREIGN KEY([id_avio])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[avios_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[avios_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[avios_produccion]  WITH CHECK ADD FOREIGN KEY([aviosid])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[avios_produccion]  WITH CHECK ADD FOREIGN KEY([aviosid])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[avios_produccion]  WITH CHECK ADD FOREIGN KEY([producciondetalle])
REFERENCES [dbo].[produccion] ([id_produccion])
GO
ALTER TABLE [dbo].[avios_produccion]  WITH CHECK ADD FOREIGN KEY([producciondetalle])
REFERENCES [dbo].[produccion] ([id_produccion])
GO
ALTER TABLE [dbo].[aviosplantilla]  WITH CHECK ADD FOREIGN KEY([id_avio])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[aviosplantilla]  WITH CHECK ADD FOREIGN KEY([id_avio])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[aviosplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[aviosplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[AviosSubgrupos]  WITH CHECK ADD FOREIGN KEY([IDAvioPrincipal])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[AviosSubgrupos]  WITH CHECK ADD FOREIGN KEY([IDAvioSubColor])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[AviosSubgrupos]  WITH CHECK ADD FOREIGN KEY([IDAvioPrincipal])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[AviosSubgrupos]  WITH CHECK ADD FOREIGN KEY([IDAvioSubColor])
REFERENCES [dbo].[avios] ([id_avios])
GO
ALTER TABLE [dbo].[ColorAvio]  WITH CHECK ADD FOREIGN KEY([IDAviopro])
REFERENCES [dbo].[avios_produccion] ([idavios_produccion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmpleadosPorcentajesProduccion]  WITH CHECK ADD FOREIGN KEY([Empleado])
REFERENCES [dbo].[Empleados] ([IDEmpleado])
GO
ALTER TABLE [dbo].[EmpleadosPorcentajesProduccion]  WITH CHECK ADD FOREIGN KEY([Empleado])
REFERENCES [dbo].[Empleados] ([IDEmpleado])
GO
ALTER TABLE [dbo].[EmpleadosPorcentajesProduccion]  WITH CHECK ADD FOREIGN KEY([Proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[EmpleadosPorcentajesProduccion]  WITH CHECK ADD FOREIGN KEY([Proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[EmpleadosPorcentajesProduccion]  WITH CHECK ADD FOREIGN KEY([Produccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[EmpleadosPorcentajesProduccion]  WITH CHECK ADD FOREIGN KEY([Produccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[empleadosproduccion]  WITH CHECK ADD FOREIGN KEY([Empleado])
REFERENCES [dbo].[Empleados] ([IDEmpleado])
GO
ALTER TABLE [dbo].[empleadosproduccion]  WITH CHECK ADD FOREIGN KEY([Empleado])
REFERENCES [dbo].[Empleados] ([IDEmpleado])
GO
ALTER TABLE [dbo].[empleadosproduccion]  WITH CHECK ADD FOREIGN KEY([Produccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[empleadosproduccion]  WITH CHECK ADD FOREIGN KEY([Produccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[especificacionesficha]  WITH CHECK ADD FOREIGN KEY([fichatecnica])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[especificacionesficha]  WITH CHECK ADD FOREIGN KEY([fichatecnica])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[ficha_tecnica]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[ficha_tecnica]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[ficha_tecnica]  WITH CHECK ADD FOREIGN KEY([idficha_detalle])
REFERENCES [dbo].[ficha_detalle] ([idficha_detalle])
GO
ALTER TABLE [dbo].[ficha_tecnica]  WITH CHECK ADD FOREIGN KEY([idficha_detalle])
REFERENCES [dbo].[ficha_detalle] ([idficha_detalle])
GO
ALTER TABLE [dbo].[ficha_tecnica]  WITH CHECK ADD FOREIGN KEY([idsolicitud])
REFERENCES [dbo].[solicitud] ([id_solicitud])
GO
ALTER TABLE [dbo].[ficha_tecnica]  WITH CHECK ADD FOREIGN KEY([idsolicitud])
REFERENCES [dbo].[solicitud] ([id_solicitud])
GO
ALTER TABLE [dbo].[orden_produccion]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[orden_produccion]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[Pellones]  WITH CHECK ADD FOREIGN KEY([Orden])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[Pellones]  WITH CHECK ADD FOREIGN KEY([Orden])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[piezas_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[piezas_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[piezas_detalle]  WITH CHECK ADD FOREIGN KEY([id_pieza])
REFERENCES [dbo].[piezas] ([id_piezas])
GO
ALTER TABLE [dbo].[piezas_detalle]  WITH CHECK ADD FOREIGN KEY([id_pieza])
REFERENCES [dbo].[piezas] ([id_piezas])
GO
ALTER TABLE [dbo].[piezasplantilla]  WITH CHECK ADD FOREIGN KEY([id_pieza])
REFERENCES [dbo].[piezas] ([id_piezas])
GO
ALTER TABLE [dbo].[piezasplantilla]  WITH CHECK ADD FOREIGN KEY([id_pieza])
REFERENCES [dbo].[piezas] ([id_piezas])
GO
ALTER TABLE [dbo].[piezasplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[piezasplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[plantillasespecificaciones]  WITH CHECK ADD FOREIGN KEY([plantillaid])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[plantillasespecificaciones]  WITH CHECK ADD FOREIGN KEY([plantillaid])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[procesos_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[procesos_detalle]  WITH CHECK ADD FOREIGN KEY([id_ficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[procesos_detalle]  WITH CHECK ADD FOREIGN KEY([id_proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[procesos_detalle]  WITH CHECK ADD FOREIGN KEY([id_proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[procesosplantilla]  WITH CHECK ADD FOREIGN KEY([id_proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[procesosplantilla]  WITH CHECK ADD FOREIGN KEY([id_proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[procesosplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[procesosplantilla]  WITH CHECK ADD FOREIGN KEY([IDplantilla])
REFERENCES [dbo].[plantillas] ([IDPlantilla])
GO
ALTER TABLE [dbo].[produccion]  WITH CHECK ADD FOREIGN KEY([idficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[produccion]  WITH CHECK ADD FOREIGN KEY([idficha])
REFERENCES [dbo].[ficha_tecnica] ([idficha_tecnica])
GO
ALTER TABLE [dbo].[produccion_detalle]  WITH CHECK ADD FOREIGN KEY([producionid])
REFERENCES [dbo].[produccion] ([id_produccion])
GO
ALTER TABLE [dbo].[produccion_detalle]  WITH CHECK ADD FOREIGN KEY([producionid])
REFERENCES [dbo].[produccion] ([id_produccion])
GO
ALTER TABLE [dbo].[salida_maquila]  WITH CHECK ADD FOREIGN KEY([id_producciondetalle])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[salida_maquila]  WITH CHECK ADD FOREIGN KEY([id_producciondetalle])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[salida_maquila]  WITH CHECK ADD FOREIGN KEY([maquilador])
REFERENCES [dbo].[maquiladores] ([idmaquiladores])
GO
ALTER TABLE [dbo].[salida_maquila]  WITH CHECK ADD FOREIGN KEY([maquilador])
REFERENCES [dbo].[maquiladores] ([idmaquiladores])
GO
ALTER TABLE [dbo].[salidadetalleavios]  WITH CHECK ADD FOREIGN KEY([idproduccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[salidadetalleavios]  WITH CHECK ADD FOREIGN KEY([idproduccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[salidamaquiladetalle]  WITH CHECK ADD FOREIGN KEY([idproduccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[salidamaquiladetalle]  WITH CHECK ADD FOREIGN KEY([idproduccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[solicitud]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[solicitudrespuesta]  WITH CHECK ADD FOREIGN KEY([solicitud])
REFERENCES [dbo].[solicitud] ([id_solicitud])
GO
ALTER TABLE [dbo].[solicitudrespuesta]  WITH CHECK ADD FOREIGN KEY([solicitud])
REFERENCES [dbo].[solicitud] ([id_solicitud])
GO
ALTER TABLE [dbo].[tela]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[tela]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[tela]  WITH CHECK ADD FOREIGN KEY([produccion])
REFERENCES [dbo].[produccion_detalle] ([id_produccion_detalle])
GO
ALTER TABLE [dbo].[tela]  WITH CHECK ADD FOREIGN KEY([produccion])
REFERENCES [dbo].[produccion_detalle] ([id_produccion_detalle])
GO
ALTER TABLE [dbo].[tela]  WITH CHECK ADD FOREIGN KEY([proveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[tela]  WITH CHECK ADD FOREIGN KEY([proveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[tela_bodega]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[tela_bodega]  WITH CHECK ADD FOREIGN KEY([cliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[tela_bodega]  WITH CHECK ADD FOREIGN KEY([proveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[tela_bodega]  WITH CHECK ADD FOREIGN KEY([proveedor])
REFERENCES [dbo].[proveedor] ([idproveedor])
GO
ALTER TABLE [dbo].[trabajoprocesos]  WITH CHECK ADD FOREIGN KEY([Proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[trabajoprocesos]  WITH CHECK ADD FOREIGN KEY([Proceso])
REFERENCES [dbo].[procesos] ([id_procesos])
GO
ALTER TABLE [dbo].[trabajoprocesos]  WITH CHECK ADD FOREIGN KEY([Produccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[trabajoprocesos]  WITH CHECK ADD FOREIGN KEY([Produccion])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
ALTER TABLE [dbo].[trabajoseparadohojacorte]  WITH CHECK ADD FOREIGN KEY([Orden])
REFERENCES [dbo].[orden_produccion] ([id_orden])
GO
/****** Object:  StoredProcedure [dbo].[actualiza_acorteproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[actualiza_acorteproduccion]
@idproduccion int, @fechatrazado datetime as
if exists(select * from orden_produccion where trazado_completo=1 and id_orden=@idproduccion)
return 0
else
update orden_produccion set trazado_completo=1, fecha_trazado_terminado=@fechatrazado where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[actualiza_avios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualiza_avios]
@idavios as int, @nombres as varchar(max), @tipo as int, @precio as float as
update avios set nombre=@nombres, tipo=@tipo, precio=@precio where id_avios=@idavios




GO
/****** Object:  StoredProcedure [dbo].[actualiza_bodega_asignaciones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[actualiza_bodega_asignaciones]
@cantidad_asignada as decimal(18, 2), @idaviosproc int as
update avios_produccion set cantidad_necesaria=@cantidad_asignada where avios_produccion.idavios_produccion=@idaviosproc
GO


GO
/****** Object:  StoredProcedure [dbo].[actualiza_bodegaavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualiza_bodegaavios]
@idbodagaavio as int, @cantidad as float as
update avios_bodega set cantidad=@cantidad where idavios=@idbodagaavio;


GO
/****** Object:  StoredProcedure [dbo].[actualiza_clientefichatecnica]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualiza_clientefichatecnica]
@idficha as int, @idcliente as int as
update ficha_tecnica set cliente=@idcliente where idficha_detalle=@idficha


GO
/****** Object:  StoredProcedure [dbo].[actualiza_estado_teladetalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[actualiza_estado_teladetalle]
@iddetalle as int as
update produccion_detalle set tela_completa=1 where id_produccion_detalle=@iddetalle


GO
/****** Object:  StoredProcedure [dbo].[actualiza_fechainicio]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[actualiza_fechainicio]
@idproduccionas int, @fecha as datetime as
update orden_produccion set fecha_inicio=@fecha where id_orden=@idproduccionas


GO
/****** Object:  StoredProcedure [dbo].[actualiza_fichadetalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------Fichas---------------------------------------------------------
CREATE procedure [dbo].[actualiza_fichadetalle]
@idficha_detalle as int, @nombreprenda as varchar(max), @modelo varchar(max),
@tela as varchar(max),
@ancho_tela as float,
@consumo_tela as float,
@combinacion as varchar(max),
@ancho_tela_conbinacion as float,
@consumo_conbinacion as float,
@forro as varchar(max),
@ancho_tela_forro as float,
@consumo_forro as float as
update ficha_detalle set nombre_prenda=@nombreprenda, modelo=@modelo, tela=@tela, ancho_tela=@ancho_tela,
		consumo_tela=@consumo_tela, combinacion=@combinacion, ancho_tela_conbinacion=@ancho_tela_conbinacion,
		consumo_conbinacion=@consumo_conbinacion,
		forro=@forro,
		ancho_tela_forro=@ancho_tela_forro,
		consumo_forro=@consumo_forro where idficha_detalle=@idficha_detalle


GO
/****** Object:  StoredProcedure [dbo].[actualiza_observacionesproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[actualiza_observacionesproduccion]
@idproduccion int, @observaciones varchar(max) as
update produccion set observaciones_diseño=@observaciones where idorden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[actualiza_orden_tela]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[actualiza_orden_tela]
@idorden as int, @fecha as datetime as
update orden_produccion set tela_completa=1, fecha_tela=@fecha where id_orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[actualiza_prendacorte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
					
CREATE procedure [dbo].[actualiza_prendacorte]
@idproduccion int, @fecha datetime as
if exists(select * from orden_produccion where tendido_completo=1 and fecha_tendido is not null and fecha_corte_inicio is not null and id_orden=@idproduccion)
update orden_produccion set corte=1, fecha_corte_terminado=@fecha, fecha_separado_inicio=@fecha where id_orden=@idproduccion
else
return 0


GO
/****** Object:  StoredProcedure [dbo].[actualiza_prendamaquila]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
						    
							
							
							
							
							CREATE procedure [dbo].[actualiza_prendamaquila]
							@idorden int as
							update orden_produccion set separado=1, fecha_separado_terminado=CURRENT_TIMESTAMP


GO
/****** Object:  StoredProcedure [dbo].[actualiza_prendas_devoluciones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							CREATE procedure [dbo].[actualiza_prendas_devoluciones]
							@produccion int, @prendas int as
							update salida_maquila set prendas_recibidas+=@prendas where id_producciondetalle=@produccion


GO
/****** Object:  StoredProcedure [dbo].[actualiza_prendasalidamaquila]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							
CREATE procedure [dbo].[actualiza_prendasalidamaquila]
@idorden int, @maquilador int, @enviadas int, @manobra float as
update orden_produccion set en_maquila=1, fecha_maquila_salida=CURRENT_TIMESTAMP
exec salidamaquilainsert @idorden, @maquilador, @enviadas, @manobra
update produccion_detalle set cantidad_prendas_final=0 where producionid=@idorden


GO
/****** Object:  StoredProcedure [dbo].[actualiza_produccionmaquilainterior]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

							
CREATE procedure [dbo].[actualiza_produccionmaquilainterior]
@idorden int as
update orden_produccion set en_maquila=1, fecha_maquila_salida=CURRENT_TIMESTAMP
update produccion_detalle set cantidad_prendas_final=0 where producionid=@idorden


GO
/****** Object:  StoredProcedure [dbo].[actualiza_proveedor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							
---------------------------------------------------------------PROVEEDOR---------------------------------------------------------
							

								CREATE procedure [dbo].[actualiza_proveedor]
					@idproveedor as int, @nombre as varchar(max) as
					update proveedor set nombre=@nombre where idproveedor=@idproveedor
					


GO
/****** Object:  StoredProcedure [dbo].[actualiza_rutasproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE procedure [dbo].[actualiza_rutasproduccion]
@idproduccion as int, @rutas varchar(max), @fecha datetime as
update produccion set rutas=@rutas where idorden=@idproduccion
update orden_produccion set fecha_ruta=@fecha, ruta_establecida=1 where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[actualiza_telas_entrada]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualiza_telas_entrada]
@idtela int, @cantidadprendas int as
update produccion_detalle set cantidad_prendas_final=@cantidadprendas where id_produccion_detalle=@idtela


GO
/****** Object:  StoredProcedure [dbo].[actualiza_telascorte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							
							CREATE procedure [dbo].[actualiza_telascorte]
							@idtela int, @largotrazo float, @paños float, @utilizadotela float, @retazotela float, @saldotela float, @faltante float as
							update tela set largo_trazo=@largotrazo, paños=@paños, utilizado_tela=@utilizadotela, retazo_tela=@retazotela, saldo_tela=@saldotela, faltante_tela=@faltante where id_tela=@idtela 


GO
/****** Object:  StoredProcedure [dbo].[actualiza_tendidoterminado]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualiza_tendidoterminado]
@idproduccion as int, @fechaterminado datetime as
if exists(select * from orden_produccion where tendido_completo=1 and id_orden=@idproduccion)
return 0
else
update orden_produccion set tendido_completo=1, fecha_tendido=@fechaterminado, fecha_corte_inicio=@fechaterminado where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[actualizaacabados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------acabados---------------------------------------------------------

CREATE procedure [dbo].[actualizaacabados]
@idacabado as int, @nombre as varchar(max), @tipos as int, @tiempo as float as
update acabados set operacion=@nombre, tipo=@tipos, tiempo=@tiempo where id_acabados=@idacabado


GO
/****** Object:  StoredProcedure [dbo].[actualizaavioproduccionsubgrupo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	
CREATE procedure [dbo].[actualizaavioproduccionsubgrupo]
@idavioproduc int, @idavio int as
update avios_produccion set aviosid=@idavio where idavios_produccion=@idavioproduc


GO
/****** Object:  StoredProcedure [dbo].[actualizabodegaavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizabodegaavios]
@aviosid int, @cantidad int as
update avios_bodega set cantidad+=@cantidad where idavios=@aviosid


GO
/****** Object:  StoredProcedure [dbo].[actualizacliente]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizacliente]
@idcliente as int, @nombre as varchar(max), @costo as float, @costometro as float as
update clientes set nombre=@nombre, costo_minuto=@costo, costo_metro=@costometro where idclientes=@idcliente 


GO
/****** Object:  StoredProcedure [dbo].[ActualizaEmpleados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ActualizaEmpleados]
@idempleado int, @nombre varchar(max), @afinidad1 int, @afinidad2 int, @afinidad3 int as
Update Empleados set Nombre=@nombre, Afinidad1=@afinidad1, Afinidad2=@afinidad2, Afinidad3=@afinidad3 where IDEmpleado=@idempleado


GO
/****** Object:  StoredProcedure [dbo].[actualizaempleadosporcentajesproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizaempleadosporcentajesproduccion]
@idporcentajeproduccion int, @fechaterminado datetime, @porcentajetrabajo decimal(18, 2)
as
update EmpleadosPorcentajesProduccion set FechaTerminado=@fechaterminado, PorcentajeTrabajo=@porcentajetrabajo where IDPorcentajeProduccion=@idporcentajeproduccion


GO
/****** Object:  StoredProcedure [dbo].[actualizaespecificacionesdeplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizaespecificacionesdeplantilla]
@idficha int, @observaciones varchar(max), @especificaciones varchar(max) as
exec insertaespecificacionesfichatecnica @idficha, @especificaciones
update ficha_tecnica set ficha_tecnica.especificacionescostura=@observaciones where ficha_tecnica.idficha_tecnica=@idficha


GO
/****** Object:  StoredProcedure [dbo].[actualizafichatecnica_parcial]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[actualizafichatecnica_parcial]
@idficha as int, @especificaiones as varchar(max), @tiempocostura as float, @tiempoacabados as float, @costeo as float as
update ficha_tecnica set especificacionescostura=@especificaiones, tiempo_costura=@tiempocostura, tiempo_acabados=@tiempoacabados, costeo=@costeo where idficha_tecnica=@idficha


GO
/****** Object:  StoredProcedure [dbo].[actualizamaquiladores]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------maquiladores---------------------------------------------------------
CREATE procedure [dbo].[actualizamaquiladores]
@idmaquila as int, @nombr as varchar(max), @preciominuto as float as
update maquiladores set nombre=@nombr, precio_minuto=@preciominuto where idmaquiladores=@idmaquila



GO
/****** Object:  StoredProcedure [dbo].[actualizaobservaciones_orden]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE procedure [dbo].[actualizaobservaciones_orden]
@idorden as int, @observaciones as varchar(max) as
update orden_produccion set observaciones=@observaciones where id_orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[actualizapellones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			
CREATE procedure [dbo].[actualizapellones] 
@idorden int, @pellones varchar(max), @modelo varchar(max), @Composicion varchar(max), @Marca varchar(max) as
update Pellones set Pellon=@pellones, Modelo=@modelo, Composicion=@Composicion, Marca=@Marca where Orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[actualizapiezas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizapiezas]
@idpieza as int, @tipo as int, @nombre as varchar(max) as
update piezas set tipo=@tipo, nombre=@nombre where id_piezas=@idpieza


GO
/****** Object:  StoredProcedure [dbo].[actualizaprocesos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---------------------------------------------------------------procesos---------------------------------------------------------
CREATE procedure [dbo].[actualizaprocesos]
@idproceso as int, @nombre as varchar(max), @tipos as int, @tiempo as float as
update procesos set operacion=@nombre, tipo=@tipos, tiempo=@tiempo where id_procesos=@idproceso


GO
/****** Object:  StoredProcedure [dbo].[actualizaprocesostrabajo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizaprocesostrabajo]
@idtrabajoproceso int, @idproduccion int, @cantidad decimal(18, 2), @tiempototal decimal(18, 2) as
update trabajoprocesos set Cantidad=@cantidad, TiempoTotal=@tiempototal where IDTrabajoprocesos=@idtrabajoproceso


GO
/****** Object:  StoredProcedure [dbo].[actualizaproduccion_trazo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizaproduccion_trazo]
@idorden as int, @fecha as datetime as
update orden_produccion set orden_produccion.fecha_trazado_inicio=@fecha where id_orden=@idorden

GO
/****** Object:  StoredProcedure [dbo].[actualizaproduccion_trazo2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[actualizaproduccion_trazo2]
@idorden as int, @fecha as datetime as
update orden_produccion set orden_produccion.fecha_trazado_terminado=@fecha, orden_produccion.trazado_completo='1' where id_orden=@idorden

GO
/****** Object:  StoredProcedure [dbo].[actualizasolicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[actualizasolicitud]
@id_solicitud as int, @idcliente as int, @asuntos as varchar(max), @descripciones as varchar(max) as
update solicitud set id_cliente=@idcliente, asunto=@asuntos, descripcion=@descripciones where id_solicitud=@id_solicitud				 



GO
/****** Object:  StoredProcedure [dbo].[actualizatrabajoseparadohojacorte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[actualizatrabajoseparadohojacorte]
@orden int, @nombre varchar(max), @cantidadseparado int, @talla varchar(max), @color varchar(max) as
if exists(select * from trabajoseparadohojacorte where Orden=@orden and Nombre=@nombre and Cantidad=@cantidadseparado and Talla=@talla and Color=@color)
return 0
else
insert into trabajoseparadohojacorte(Orden, Nombre, Cantidad, Talla, Color) values (@orden, @nombre, @cantidadseparado, @talla, @color)

GO
/****** Object:  StoredProcedure [dbo].[avios_impresion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[avios_impresion]
@idproduccion int as
Select avios.nombre as 'Avio',
		avios.precio as 'Precio Unitario',
		avios_produccion.cantidad_ficha as 'Cantidad por prenda',
		round(avios_produccion.cantidad_necesaria, 2) as 'Cantidad total',
		round(avios_bodega.cantidad, 2) as 'Cantidad en bodega',
		ColorAvio.Color
from avios,
		avios_produccion,
		avios_bodega,
		ColorAvio
where avios.id_avios=avios_produccion.aviosid and 
avios_produccion.producciondetalle=@idproduccion and avios_bodega.idavios=avios_produccion.aviosid and ColorAvio.IDAviopro=avios_produccion.idavios_produccion


GO
/****** Object:  StoredProcedure [dbo].[avios_orden_asignaciones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[avios_orden_asignaciones]
@idproduccion as int as
select avios.nombre,
		round(avios_bodega.cantidad, 2) as cantidad_bodega,
		avios_produccion.cantidad_ficha,
		round(avios_produccion.cantidad_necesaria, 2),
		avios.id_avios
		from avios,
				avios_bodega,
				avios_produccion
where avios_bodega.idavios=avios.id_avios and avios_produccion.aviosid=avios.id_avios and avios_produccion.producciondetalle=@idproduccion and avios_produccion.cantidad_necesaria>0


GO
/****** Object:  StoredProcedure [dbo].[avios_vistaasignacion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[avios_vistaasignacion]
@idproduccion int as
Select avios.nombre as 'Nombre',
ColorAvio.Color,
round(avios_produccion.cantidad_necesaria, 2) as 'Cantidad necesaria',
Round(avios_bodega.cantidad, 2) as 'Cantidad bodega',
avios_produccion.cantidad_ficha,
avios_produccion.idavios_produccion as 'Clave avio produccion',
avios_produccion.aviosid as 'Clave Avio'
From avios,
avios_bodega,
avios_produccion,
ColorAvio
where avios_produccion.producciondetalle=@idproduccion and ColorAvio.IDAviopro=avios_produccion.idavios_produccion and 
avios.id_avios=avios_produccion.aviosid and avios_bodega.idavios=avios_produccion.aviosid and avios_produccion.cantidad_necesaria!=0

GO
/****** Object:  StoredProcedure [dbo].[borra_acabado]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[borra_acabado]
@idacabado as int as
delete from acabados where id_acabados=@idacabado


GO
/****** Object:  StoredProcedure [dbo].[borra_acabadosficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[borra_acabadosficha]
@idacabado as int, @idficha as int as 
delete from acabados_detalle where id_ficha=@idficha and id_acabdos=@idacabado


GO
/****** Object:  StoredProcedure [dbo].[borra_aviosficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borra_aviosficha]
@idavio as int, @idficha as int as 
delete from avios_detalle where id_ficha=@idficha and id_avio=@idavio
	


GO
/****** Object:  StoredProcedure [dbo].[borra_cliente]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[borra_cliente]
@idcliente int as
delete from clientes where idclientes=@idcliente


GO
/****** Object:  StoredProcedure [dbo].[borra_maquilador]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							
CREATE procedure [dbo].[borra_maquilador]
@idmaquilador int as
delete from maquiladores where idmaquiladores=@idmaquilador


GO
/****** Object:  StoredProcedure [dbo].[borra_orden_produccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[borra_orden_produccion]
@idorden as int as
delete from produccion_detalle where producionid=@idorden
delete from avios_produccion where producciondetalle=@idorden
delete from produccion where idorden=@idorden
delete from orden_produccion where id_orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[borra_pieza]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[borra_pieza]
@idpieza as int as
delete from piezas where id_piezas=@idpieza					


GO
/****** Object:  StoredProcedure [dbo].[borra_piezasficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borra_piezasficha]
@idpieza as int, @idficha as int as 
delete from piezas_detalle where id_ficha=@idficha and id_pieza=@idpieza


GO
/****** Object:  StoredProcedure [dbo].[borra_proceso]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[borra_proceso]
@idproceso as int as 
delete from procesos where id_procesos=@idproceso


GO
/****** Object:  StoredProcedure [dbo].[borra_procesosficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[borra_procesosficha]
@idproceso as int, @idficha as int as 
delete from procesos_detalle where id_ficha=@idficha and id_proceso=@idproceso


GO
/****** Object:  StoredProcedure [dbo].[borra_proveedor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borra_proveedor]
@idproveedor int as 
delete from proveedor where idproveedor=@idproveedor


GO
/****** Object:  StoredProcedure [dbo].[borra_tablas_ficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borra_tablas_ficha]
@idficha as int as
delete from acabados_detalle where id_ficha=@idficha
delete from procesos_detalle where id_ficha=@idficha
delete from piezas_detalle where id_ficha=@idficha
delete from avios_detalle where id_ficha=@idficha
delete from ficha_tecnica where idficha_tecnica=@idficha
delete from ficha_detalle where idficha_detalle=@idficha


GO
/****** Object:  StoredProcedure [dbo].[borra_tallacolorproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[borra_tallacolorproduccion]
@idproduccion as int, @talla as varchar(32), @color as varchar(32) as
delete from produccion_detalle where producionid=@idproduccion and talla=@talla and color=@color


GO
/****** Object:  StoredProcedure [dbo].[borra_telabodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[borra_telabodega]
@idtelas int as
delete from tela_bodega where idtela=@idtelas


GO
/****** Object:  StoredProcedure [dbo].[borra_telas_asignadas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[borra_telas_asignadas] 
@tipo as int, @orden as int as
delete from tela where tipo=@tipo and produccion=@orden


GO
/****** Object:  StoredProcedure [dbo].[borratela_bodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borratela_bodega]
@idtela as int as
delete from tela_bodega where idtela=@idtela


GO
/****** Object:  StoredProcedure [dbo].[borratelaproduccionasiganada]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




alter procedure [dbo].[borratelaproduccionasiganada]
@idproduccion int, @fechaentrada datetime, @nombre varchar(max) as
delete from tela where produccion=@idproduccion and fecha_entrada=@fechaentrada and nombre_descripcion=@nombre;


GO
/****** Object:  StoredProcedure [dbo].[busca_acabadostipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[busca_acabadostipo]
@tipo as int as
select * from acabados where tipo=@tipo


GO
/****** Object:  StoredProcedure [dbo].[busca_aviostipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[busca_aviostipo]
@tipo as int as
select * from avios where tipo=@tipo


GO
/****** Object:  StoredProcedure [dbo].[busca_aviostipoBASE]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[busca_aviostipoBASE]
as
select avios.id_avios,
		avios.nombre,
		avios.precio
from avios,
	avios_bodega where avios.id_avios=avios_bodega.idavios and avios_bodega.cantidad=0	

GO
/****** Object:  StoredProcedure [dbo].[busca_aviostipoBASEPortipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------------------------------------------------------------------

--CREATE procedure insertanuevos_aviosproduccion
--@idavio as int, @produccionid as int, @cantidad as float as
--insert into avios_produccion values(@idavio, @produccionid, @cantidad)
--GO


---------------------------------------------------------------------------------------------------------------------------

alter procedure [dbo].[busca_aviostipoBASEPortipo]
@tipo int
as
select avios.id_avios,
		avios.nombre,
		avios.precio
from avios,
	avios_bodega where avios.id_avios=avios_bodega.idavios and avios_bodega.cantidad=0 and avios.tipo=@tipo			

GO
/****** Object:  StoredProcedure [dbo].[busca_piezastipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[busca_piezastipo]
@tipo as int as
select * from piezas where tipo=@tipo


GO
/****** Object:  StoredProcedure [dbo].[busca_procesostipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[busca_procesostipo]
@tipo as int as
select * from procesos where tipo=@tipo


GO
/****** Object:  StoredProcedure [dbo].[busca_tipo_aviosmasbodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[busca_tipo_aviosmasbodega]
@tipo as int as
select * from avios_mas_bodega where tipo=@tipo						


GO
/****** Object:  StoredProcedure [dbo].[cantidadprendas_orden]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[cantidadprendas_orden]
@idorden as int as
SELECT SUM(cantidad_prendas)
FROM produccion_detalle
WHERE producionid=@idorden



GO
/****** Object:  StoredProcedure [dbo].[comprueba_existencia_aviosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[comprueba_existencia_aviosproduccion] 
@id_produccion int 
as
IF EXISTS(SELECT * FROM avios_produccion WHERE producciondetalle = @id_produccion) 
	return 1
ELSE
	return 0;


GO
/****** Object:  StoredProcedure [dbo].[creafichaparcial]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[creafichaparcial]
@iddetalle as int, @idcliente as int as
insert into ficha_tecnica(idficha_detalle, cliente) values(@iddetalle, @idcliente)							


GO
/****** Object:  StoredProcedure [dbo].[creafichaparcial_solicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
						
CREATE procedure [dbo].[creafichaparcial_solicitud]
@iddetalle as int, @idcliente as int, @solicitud as int as
insert into ficha_tecnica(idficha_detalle, idsolicitud, cliente) values(@iddetalle, @solicitud, @idcliente)	


GO
/****** Object:  StoredProcedure [dbo].[creasolicitudrespuesta]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[creasolicitudrespuesta]
@idsolicitud int as 
insert into solicitudrespuesta(solicitud) values(@idsolicitud)


GO
/****** Object:  StoredProcedure [dbo].[datos_cantidadprendas_orden]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[datos_cantidadprendas_orden]
@idorden as int as
SELECT SUM(cantidad_prendas) as 'Numero de prendas'
FROM produccion_detalle
WHERE producionid=@idorden


GO
/****** Object:  StoredProcedure [dbo].[datos_orden_reporte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[datos_orden_reporte]
@idproduccion int as
select * from ordenesvista where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[datos_orden_reporteCompleto]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[datos_orden_reporteCompleto]
@idproduccion int as
select * from ordenesvista where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[devuelveacabados_plantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelveacabados_plantilla]
@idplantilla int as
select acabadosplantilla.id_acabdos as 'ID',
		acabados.operacion as 'Nombre',
		acabadosplantilla.cantidad as 'Cantidad',
		acabadosplantilla.tiempo_total as 'Tiempo'
from acabados,
		acabadosplantilla
where acabadosplantilla.IDplantilla=@idplantilla and acabados.id_acabados=acabadosplantilla.id_acabdos


GO
/****** Object:  StoredProcedure [dbo].[devuelveavios_plantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[devuelveavios_plantilla]
@idplantilla int as
select aviosplantilla.id_avio as 'ID',
		avios.nombre as 'Nombre',
		aviosplantilla.cantidad as 'Cantidad',
		aviosplantilla.costo as 'Costo'
from avios,
	aviosplantilla
where aviosplantilla.IDplantilla=@idplantilla and avios.id_avios=aviosplantilla.id_avio


GO
/****** Object:  StoredProcedure [dbo].[devuelveaviosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[devuelveaviosproduccion]
@idproduccion int as
select * from avios_produccion where producciondetalle=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[devuelvecliente]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelvecliente]
@idcliente as int as
select * from clientes where idclientes=@idcliente


GO
/****** Object:  StoredProcedure [dbo].[devuelveempleado]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[devuelveempleado]
@idempleado int as
select * from Empleados where IDEmpleado=@idempleado


GO
/****** Object:  StoredProcedure [dbo].[DevuelveEmpleados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DevuelveEmpleados]
as
select Empleados.IDEmpleado, Empleados.Nombre from Empleados


GO
/****** Object:  StoredProcedure [dbo].[devuelveempleadosmaquilapoduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelveempleadosmaquilapoduccion]
@idproduccion int as
select Empleados.Nombre as 'Empleado',
		procesos.operacion as 'Trabajo',
		EmpleadosPorcentajesProduccion.FechaAsignado,
		EmpleadosPorcentajesProduccion.FechaTerminado,
		EmpleadosPorcentajesProduccion.Cantidad,
		EmpleadosPorcentajesProduccion.TiempoEsperado,
		EmpleadosPorcentajesProduccion.PorcentajeTrabajo,
		EmpleadosPorcentajesProduccion.IDPorcentajeProduccion as 'Folio Trabajo'
from
Empleados,
procesos,
EmpleadosPorcentajesProduccion
where EmpleadosPorcentajesProduccion.Produccion=@idproduccion and EmpleadosPorcentajesProduccion.Proceso=procesos.id_procesos and EmpleadosPorcentajesProduccion.Empleado=Empleados.IDEmpleado


GO
/****** Object:  StoredProcedure [dbo].[devuelveempleadosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelveempleadosproduccion]
@idproduccion int as 
select empleadosproduccion.Empleado as 'ID',
		Empleados.Nombre
from Empleados,
		empleadosproduccion
where empleadosproduccion.Produccion=@idproduccion and Empleados.IDEmpleado=empleadosproduccion.Empleado


GO
/****** Object:  StoredProcedure [dbo].[devuelveespecificacionesplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelveespecificacionesplantilla]
@idplantilla int as
select plantillasespecificaciones.Observaciones, plantillasespecificaciones.Especificaciones from plantillasespecificaciones where plantillaid=@idplantilla


GO
/****** Object:  StoredProcedure [dbo].[devuelvenumeroprendascolor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[devuelvenumeroprendascolor]
@idproduccion int, @color varchar(max) as
Select SUM(produccion_detalle.cantidad_prendas) as Cantidad_prendas
FROM produccion_detalle
WHERE producionid=@idproduccion and color=@color


GO
/****** Object:  StoredProcedure [dbo].[devuelvepellones]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelvepellones]
@idorden int as 
select * from Pellones where Pellones.Orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[devuelvepiezasplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[devuelvepiezasplantilla]
@idplantilla int as
select piezasplantilla.id_pieza as 'ID',
		piezas.nombre as 'Nombre',
		piezasplantilla.cantidad as 'Cantidad'
from piezas,
		piezasplantilla
where piezasplantilla.IDplantilla=@idplantilla and piezas.id_piezas=piezasplantilla.id_pieza


GO
/****** Object:  StoredProcedure [dbo].[devuelveprocesosplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		
CREATE procedure [dbo].[devuelveprocesosplantilla]
@idplantilla int as
select procesosplantilla.id_proceso as 'ID',
		procesos.operacion as 'Operacion',
		procesos.tiempo as 'Tiempo'
from procesos,
		procesosplantilla
where procesosplantilla.IDplantilla=@idplantilla and procesos.id_procesos=procesosplantilla.id_proceso


GO
/****** Object:  StoredProcedure [dbo].[devuelvesalidaavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
					
CREATE procedure [dbo].[devuelvesalidaavios]
@produccion int as
select texto1 as 'Avio', texto2 as 'Descripcion', id_salidaavios as 'ID' from salidadetalleavios where idproduccion=@produccion


GO
/****** Object:  StoredProcedure [dbo].[devuelvesalidadetalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelvesalidadetalle]
@idproduccion int as
select * from  where idproduccion=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[devuelvesolicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[devuelvesolicitud]
@idsolic as int as
select * from solicitud where id_solicitud=@idsolic



GO
/****** Object:  StoredProcedure [dbo].[devuelvesubgruposcolor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelvesubgruposcolor]
@idavio int as
Select avios.id_avios as 'ID',
		avios.nombre as 'Nombre',
		AviosSubgrupos.IDAviosSubGrupo as 'ID SubAvio'
from avios,
		AviosSubgrupos
where AviosSubgrupos.IDAvioPrincipal=@idavio and avios.id_avios=AviosSubgrupos.IDAvioSubColor		


GO
/****** Object:  StoredProcedure [dbo].[devuelvetiempodecostura]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelvetiempodecostura]
@idficha int as
select tiempo_costura from ficha_tecnica where idficha_tecnica=@idficha


GO
/****** Object:  StoredProcedure [dbo].[devuelvetrabajoseparado]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[devuelvetrabajoseparado]
@orden int as
select * from trabajoseparadohojacorte 
where trabajoseparadohojacorte.Orden=@orden

GO
/****** Object:  StoredProcedure [dbo].[devuelvevistabodegaaviostipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[devuelvevistabodegaaviostipo]
@tipo int as
Select avios.nombre,
		avios.tipo,
		avios_bodega.cantidad
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios

GO
/****** Object:  StoredProcedure [dbo].[devuelvevistabodegaaviostipo2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[devuelvevistabodegaaviostipo2]
@tipo int as
Select *
from vistabodegaavios2
where vistabodegaavios2.tipo=@tipo

GO
/****** Object:  StoredProcedure [dbo].[elimina_ordenproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


alter procedure [dbo].[elimina_ordenproduccion]
@idproduccion int as
if exists (select * from avios_produccion where idavios_produccion=@idproduccion)
return 0
else
DELETE FROM tela where produccion=@idproduccion
DELETE FROM produccion_detalle where producionid=@idproduccion
DELETE FROM avios_produccion where producciondetalle=@idproduccion
DELETE FROM produccion where idorden=@idproduccion
DELETE FROM orden_produccion where id_orden=@idproduccion
GO

/****** Object:  StoredProcedure [dbo].[eliminaacabados_plantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[eliminaacabados_plantilla]
@idplantilla int, @idacabados int as
delete from acabadosplantilla where IDplantilla=@idplantilla and id_acabdos=@idacabados


GO
/****** Object:  StoredProcedure [dbo].[eliminaaviosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[eliminaaviosproduccion]
@idorden int as
delete from avios_produccion where producciondetalle=@idorden
update orden_produccion set avios_completo=null, fecha_avios=null where id_orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[eliminaaviossubgrupos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[eliminaaviossubgrupos]
@idavio int as
delete from AviosSubgrupos where IDAviosSubGrupo=@idavio


GO
/****** Object:  StoredProcedure [dbo].[eliminadetallesalidaavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[eliminadetallesalidaavios]
@idsalida int as
delete from salidadetalleavios where id_salidaavios=@idsalida


GO
/****** Object:  StoredProcedure [dbo].[EliminaEmpleados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[EliminaEmpleados]
@idempleado int as
delete from Empleados where IDEmpleado=@idempleado


GO
/****** Object:  StoredProcedure [dbo].[eliminaempleadosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminaempleadosproduccion] 
@produccion int, @idempleado int as
delete from empleadosproduccion where Empleado=@idempleado and Produccion=@produccion


GO
/****** Object:  StoredProcedure [dbo].[eliminapiezas_plantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[eliminapiezas_plantilla]
@idplantilla int, @idpieza int as
delete from piezasplantilla where IDplantilla=@idplantilla and id_pieza=@idpieza


GO
/****** Object:  StoredProcedure [dbo].[eliminaplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	
CREATE procedure [dbo].[eliminaplantilla]
@idplantilla int as
delete from aviosplantilla where IDplantilla=@idplantilla
delete from piezasplantilla where IDplantilla=@idplantilla
delete from procesosplantilla where IDplantilla=@idplantilla
delete from acabadosplantilla where IDplantilla=@idplantilla
delete from plantillasespecificaciones where plantillaid=@idplantilla
delete from plantillas where IDPlantilla=@idplantilla


GO
/****** Object:  StoredProcedure [dbo].[eliminaplantilla_avios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[eliminaplantilla_avios]
@idplantilla int, @idavio int as
delete from aviosplantilla where IDplantilla=@idplantilla and id_avio=@idavio


GO
/****** Object:  StoredProcedure [dbo].[eliminaplantilla_procesos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[eliminaplantilla_procesos]
@idplantilla int, @idproceso int as
delete from procesosplantilla where IDplantilla=@idplantilla and id_proceso=@idproceso


GO
/****** Object:  StoredProcedure [dbo].[eliminaprocesostrabajo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[eliminaprocesostrabajo]
@idtrabajoprocesos int as
delete from trabajoprocesos where IDTrabajoprocesos=@idtrabajoprocesos


GO
/****** Object:  StoredProcedure [dbo].[eliminatelacosteo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[eliminatelacosteo]
@idtela int as 
delete from telacosteo where idtelas=@idtela


GO
/****** Object:  StoredProcedure [dbo].[establece_solicitudrespondida]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------solicitud---------------------------------------------------------
			 

CREATE procedure [dbo].[establece_solicitudrespondida]
@idsolicitud as int as
update solicitud set respondido=1 where id_solicitud=@idsolicitud


GO
/****** Object:  StoredProcedure [dbo].[Existen_aviosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Existen_aviosproduccion]
@idproduccion as int as
DECLARE @return_status int;
EXEC @return_status = comprueba_existencia_aviosproduccion @idproduccion;
SELECT 'Return_Status' = @return_status;


GO
/****** Object:  StoredProcedure [dbo].[fichassolicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[fichassolicitud]
@idsolicitud as int as
select * from ficha_tecnica where idsolicitud=@idsolicitud



GO
/****** Object:  StoredProcedure [dbo].[impresioncosteo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[impresioncosteo] 
@idsolicitud int as
Select solicitud.asunto,
		solicitud.descripcion,
		solicitud.fecha,
		clientes.nombre
from solicitud,
		clientes
where solicitud.id_solicitud=@idsolicitud and clientes.idclientes=solicitud.id_cliente

GO
/****** Object:  StoredProcedure [dbo].[ingresa_ordenparcial]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ingresa_ordenparcial]
@idcliente as int, @asunto as varchar(max) as
insert into orden_produccion(id_cliente, asunto) values(@idcliente, @asunto)


GO
/****** Object:  StoredProcedure [dbo].[ingresa_producciondetalle_parcial]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[ingresa_producciondetalle_parcial]
@idproduccion as int, @tela as varchar(max), @combinacion as varchar(max),
@telarollo_num as int, @combinacionrollo_num as int, @talla as varchar(32), 
@color as varchar(max), @metrosrecibidos as decimal, @cantidadprendas as decimal,
@forro varchar(max), @metrosrecibidos_forro decimal, @metrosrecibidos_combinacion decimal,
@numerorollo_forro decimal as
insert into produccion_detalle(producionid, tela, combinacion, num_tela_rollo, num_combinacion_rollo,
talla, color, metros_recibidos, cantidad_prendas, forro, numeroforro_rollo, metros_recibidosforro,
metros_recibidoscombinacion) 
values(@idproduccion, @tela, @combinacion, @telarollo_num, @combinacionrollo_num, @talla, @color,
@metrosrecibidos, @cantidadprendas, @forro, @numerorollo_forro, @metrosrecibidos_forro,
@metrosrecibidos_combinacion)

GO
/****** Object:  StoredProcedure [dbo].[ingresa_produccionparcial]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ingresa_produccionparcial]
@idorden as int, @idficha as int as
insert into produccion(idorden, idficha) values(@idorden, @idficha);


GO
/****** Object:  StoredProcedure [dbo].[insertaespecificacionesfichatecnica]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertaespecificacionesfichatecnica]
@idficha int, @especificaciones varchar(max) as
if EXISTS(select * from especificacionesficha where fichatecnica=@idficha)
UPDATE especificacionesficha set Especificaciones=@especificaciones where fichatecnica=@idficha
else
insert into especificacionesficha(fichatecnica, Especificaciones) values(@idficha, @especificaciones)


GO
/****** Object:  StoredProcedure [dbo].[InsertaEspecificacionesplantillas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[InsertaEspecificacionesplantillas]
@idplantilla int, @observaciones varchar(max), @especificaciones varchar(max) as
if exists(select * from plantillasespecificaciones where plantillaid=@idplantilla)
update plantillasespecificaciones set Observaciones=@observaciones, Especificaciones=@especificaciones where plantillaid=@idplantilla
else
insert into plantillasespecificaciones values(@idplantilla, @observaciones, @especificaciones)


GO
/****** Object:  StoredProcedure [dbo].[insertaficha_acabados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[insertaficha_acabados]
@idficha as int, @idacabado as int, @cantidad as float, @tiempo as decimal(18, 2) as
if EXISTS(select * from acabados_detalle where id_ficha=@idficha and id_acabdos=@idacabado)
UPDATE acabados_detalle SET cantidad=@cantidad, tiempo_total=@tiempo where id_ficha=@idficha and id_acabdos=@idacabado
ELSE
insert into acabados_detalle values(@idficha, @idacabado, @cantidad, @tiempo);


GO
/****** Object:  StoredProcedure [dbo].[insertaficha_avios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertaficha_avios]
@idficha as int, @idavio as int, @cantidad as float, @costo as float as
if EXISTS(select * from avios_detalle where id_ficha=@idficha and id_avio=@idavio)
UPDATE avios_detalle SET cantidad=@cantidad, costo=@costo where id_ficha=@idficha and id_avio=@idavio
ELSE
insert into avios_detalle values(@idficha, @idavio, @cantidad, @costo);


GO
/****** Object:  StoredProcedure [dbo].[insertaficha_piezas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[insertaficha_piezas]
@idficha as int, @idpieza as int, @cantidad as float as
if EXISTS(select * from piezas_detalle where id_ficha=@idficha and id_pieza=@idpieza)
UPDATE piezas_detalle SET cantidad=@cantidad where id_ficha=@idficha and id_pieza=@idpieza
ELSE
insert into piezas_detalle values(@idficha, @idpieza, @cantidad);


GO
/****** Object:  StoredProcedure [dbo].[insertaficha_procesos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertaficha_procesos]
@idficha as int, @idproceso as int as
if EXISTS(select * from procesos_detalle where id_ficha=@idficha and id_proceso=@idproceso)
return 0
ELSE
insert into procesos_detalle values(@idficha, @idproceso);


GO
/****** Object:  StoredProcedure [dbo].[insertaplantilla_acabados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							
CREATE procedure [dbo].[insertaplantilla_acabados]
@idplantilla as int, @idacabado as int, @cantidad as float, @tiempo as decimal(18, 2) as
if EXISTS(select * from acabadosplantilla where IDplantilla=@idplantilla and id_acabdos=@idacabado)
UPDATE acabadosplantilla SET cantidad=@cantidad, tiempo_total=@tiempo where IDplantilla=@idplantilla and id_acabdos=@idacabado
ELSE
insert into acabadosplantilla values(@idplantilla, @idacabado, @cantidad, @tiempo);


GO
/****** Object:  StoredProcedure [dbo].[insertaplantilla_avios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertaplantilla_avios]
@idplantilla as int, @idavio as int, @cantidad as float, @costo as float as
if EXISTS(select * from aviosplantilla where IDplantilla=@idplantilla and id_avio=@idavio)
UPDATE aviosplantilla SET cantidad=@cantidad, costo=@costo where IDplantilla=@idplantilla and id_avio=@idavio
ELSE
insert into aviosplantilla values(@idplantilla, @idavio, @cantidad, @costo);


GO
/****** Object:  StoredProcedure [dbo].[insertaplantilla_piezas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertaplantilla_piezas]
@idplantilla as int, @idpieza as int, @cantidad as float as
if EXISTS(select * from piezasplantilla where IDplantilla=@idplantilla and id_pieza=@idpieza)
UPDATE piezasplantilla SET cantidad=@cantidad where IDplantilla=@idplantilla and id_pieza=@idpieza
ELSE
insert into piezasplantilla values(@idplantilla, @idpieza, @cantidad);


GO
/****** Object:  StoredProcedure [dbo].[insertaplantilla_procesos]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[insertaplantilla_procesos]
@idplantilla as int, @idproceso as int as
if EXISTS(select * from procesosplantilla where IDplantilla=@idplantilla and id_proceso=@idproceso)
return 0
ELSE
insert into procesosplantilla values(@idplantilla, @idproceso);


GO
/****** Object:  StoredProcedure [dbo].[modifica_telas_bodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							CREATE procedure [dbo].[modifica_telas_bodega]
							@idtela int, @nombre varchar(max), @metros float, @composicion varchar(max), @color varchar(max), @ancho float, @tipo int as
							update tela_bodega set nombre_descripcion=@nombre, metros=@metros, composicion=@composicion, color=@color, ancho=@ancho, tipo=@tipo where idtela=@idtela


GO
/****** Object:  StoredProcedure [dbo].[modificaplantillas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
						
CREATE procedure [dbo].[modificaplantillas]
@idplantilla int, @Nombre varchar(max) as
update plantillas set Nombre=@Nombre where IDPlantilla=@idplantilla


GO
/****** Object:  StoredProcedure [dbo].[modificatelabodega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[modificatelabodega]
@idtelas as int, @metro as float as 
update tela_bodega set metros=@metro where idtela=@idtelas


GO
/****** Object:  StoredProcedure [dbo].[modificatelacosteo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

						
CREATE procedure [dbo].[modificatelacosteo]
@nombre varchar(max), @precio float, @idtela int as
update telacosteo set nombre=@nombre, precio=@precio where idtelas=@idtela


GO
/****** Object:  StoredProcedure [dbo].[numeroavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------Avios---------------------------------------------------------

CREATE procedure [dbo].[numeroavios]
as
select MAX(id_avios) from avios;


GO
/****** Object:  StoredProcedure [dbo].[numeroaviosproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

						
CREATE procedure [dbo].[numeroaviosproduccion]
as
select MAX(idavios_produccion) from avios_produccion


GO
/****** Object:  StoredProcedure [dbo].[numerofichatecnica]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[numerofichatecnica]
as
select MAX(idficha_detalle) from ficha_detalle;


GO
/****** Object:  StoredProcedure [dbo].[numeroplantilla]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[numeroplantilla]
as
select MAX(IDPlantilla) from plantillas;


GO
/****** Object:  StoredProcedure [dbo].[numeroproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
				
---------------------------------------------------------------produccion---------------------------------------------------------
CREATE procedure [dbo].[numeroproduccion]
as
select MAX(id_orden) from orden_produccion;


GO
/****** Object:  StoredProcedure [dbo].[numerosolicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[numerosolicitud]
as
select MAX(id_solicitud) from solicitud;


GO
/****** Object:  StoredProcedure [dbo].[prenda_termina_entrega]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							CREATE procedure [dbo].[prenda_termina_entrega]
							@idproduccion int as
							update orden_produccion set fecha_entrega=CURRENT_TIMESTAMP where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[prendas_entrada]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
							CREATE procedure [dbo].[prendas_entrada]
							@idproducciondetalle as int as
							select id_produccion_detalle as 'ID',
									tela,
									talla,
									color,
									combinacion,
									cantidad_prendas as 'Cantidad Enviada',
									cantidad_prendas_final as 'Cantidad Recibida'
							from    produccion_detalle
							where producionid=@idproducciondetalle


GO
/****** Object:  StoredProcedure [dbo].[prendas_termina_acabados]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							CREATE procedure [dbo].[prendas_termina_acabados]
							@idorden int as
							update orden_produccion set fecha_acabados_terminado=CURRENT_TIMESTAMP, calidad=1 where id_orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[prendas_termina_maquila]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							
								
							CREATE procedure [dbo].[prendas_termina_maquila]
							@idorden int as
							update orden_produccion set fecha_maquila_entrada=CURRENT_TIMESTAMP, acabados=1 where id_orden=@idorden


GO
/****** Object:  StoredProcedure [dbo].[prendas_terminacalidad]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							CREATE procedure [dbo].[prendas_terminacalidad]
							@idproduccion int as 
							update orden_produccion set fecha_acabados_inicio=CURRENT_TIMESTAMP, Terminado=1 where id_orden=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[producciondetalle_preliminar]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[producciondetalle_preliminar]
@idproducciondetalle as int as
select tela,
		talla,
		color,
		combinacion,
		cantidad_prendas,
		metros_recibidos,
		num_tela_rollo,
		num_combinacion_rollo
from    produccion_detalle
where producionid=@idproducciondetalle
order by produccion_detalle.talla

GO
/****** Object:  StoredProcedure [dbo].[producciondetalle_preliminar2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[producciondetalle_preliminar2]
							@idproducciondetalle int as
							select produccion_detalle.tela,
									produccion_detalle.talla,
									produccion_detalle.color,
									produccion_detalle.combinacion,
									produccion_detalle.cantidad_prendas
							from    produccion_detalle
							where producionid=@idproducciondetalle
							Order By Case talla
    When 'XS' Then 1
    When 'S' Then 2
    When 'M' Then 3
	When 'L' Then 4
	When 'XL' Then 5
	When '2XL' Then 6
    Else 7 END

GO
/****** Object:  StoredProcedure [dbo].[produccionprocesostrabajo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[produccionprocesostrabajo]
@idproduccion int as
select trabajoprocesos.IDTrabajoprocesos as 'ID',
		procesos.operacion as 'Operacion',
		trabajoprocesos.Cantidad,
		trabajoprocesos.TiempoTotal,
		procesos.id_procesos as 'IDProceso'
from procesos,
	trabajoprocesos
where procesos.id_procesos=trabajoprocesos.Proceso and trabajoprocesos.Produccion=@idproduccion


GO
/****** Object:  StoredProcedure [dbo].[regresa_fichatecnica_vista2]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[regresa_fichatecnica_vista2]
@idficha as int as 
select * from Vfichas_tecnicas2 where idficha_tecnica=@idficha;



GO
/****** Object:  StoredProcedure [dbo].[respuestasolicitud]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[respuestasolicitud]
@idsolicitud int, @fecha datetime as
if EXISTS(select * from solicitudrespuesta where solicitud=@idsolicitud)
UPDATE solicitudrespuesta set fecharespuesta=@fecha where solicitud=@idsolicitud
else
insert into solicitudrespuesta values(@idsolicitud, @fecha)


GO
/****** Object:  StoredProcedure [dbo].[salidamaquiladetalleinsert]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[salidamaquiladetalleinsert]
@idproduccion int, @fecha datetime, @modelo varchar(max), @manoobra decimal(18, 2), @prenda varchar(max), @tela varchar(max), @notas varchar(max), @especificaciones varchar(max), @pagare varchar(max), @maquilador varchar(max) as
if EXISTS(select * from salidamaquiladetalle where idproduccion=@idproduccion)
UPDATE salidamaquiladetalle set Modelo=@modelo, Mano_de_obra=@manoobra, Prenda=@prenda, Tela=@tela, Notas=@notas, Especificaciones=@especificaciones, Pagare=@pagare, Maquilador=@maquilador
else
insert into salidamaquiladetalle values(@idproduccion, @fecha, @modelo, @manoobra, @prenda, @tela, @notas, @especificaciones, @pagare, @maquilador)


GO
/****** Object:  StoredProcedure [dbo].[salidamaquilainsert]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[salidamaquilainsert]
@idproduccion int, @maquilador int, @prendasenviadas float, @manoobra float as
if EXISTS(select * from salida_maquila where id_producciondetalle=@idproduccion)
UPDATE salida_maquila set maquilador=@maquilador, prendas_enviadas=@prendasenviadas, mano_obra=@manoobra where id_producciondetalle=@idproduccion
else
insert into salida_maquila(id_producciondetalle, maquilador, prendas_enviadas, mano_obra) values(@idproduccion, @maquilador, @prendasenviadas, @manoobra)


GO
/****** Object:  StoredProcedure [dbo].[solicitudesrespondidas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[solicitudesrespondidas]
as
select * from solicitud where respondido=1


GO
/****** Object:  StoredProcedure [dbo].[telas_produccioncorte]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
							alter procedure [dbo].[telas_produccioncorte]
							@produccion int as
							select nombre_descripcion as 'Tela',
									metros,
									color,
									ancho,
									largo_trazo as 'Largo Trazo',
									paños,
									utilizado_tela as 'Tela Utilizada',
									retazo_tela as 'Retazo Tela',
									saldo_tela as 'Saldo',
									faltante_tela as 'Faltante',
									idtela
							from tela where produccion=@produccion


GO

create procedure actualizatela
@idtela as int,
@largotrazo as float,
@paños as float,
@utilizado as float,
@retazo as float,
@saldo as float,
@ancho as float, 
@faltante as float 
as
update tela set largo_trazo=@largotrazo, paños=@paños, utilizado_tela=@utilizado, retazo_tela=@retazo,
saldo_tela=@saldo, ancho=@ancho, faltante_tela=@faltante where idtela=@idtela
GO

/****** Object:  StoredProcedure [dbo].[telasbodegavista_porcliente]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[telasbodegavista_porcliente]
@idclient int as
Select * from telasbodegavista
where telasbodegavista.ClientesID=@idclient

GO
/****** Object:  StoredProcedure [dbo].[telasbodegavista_porNombre]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[telasbodegavista_porNombre]
@nombretela int as
Select * from telasbodegavista
where telasbodegavista.Orden=@nombretela

GO
/****** Object:  StoredProcedure [dbo].[telasbodegavista_porProveedor]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[telasbodegavista_porProveedor]
@idproveedor int as
select * from telasbodegavista
where telasbodegavista.ProveedorID=@idproveedor

GO
/****** Object:  StoredProcedure [dbo].[ver_asignados_tipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ver_asignados_tipo]
@tipo as int, @orden as int as
select * from vistatelas where produccion=@orden and tipo=@tipo


GO
/****** Object:  StoredProcedure [dbo].[ver_asignadostelas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
						

CREATE procedure [dbo].[ver_asignadostelas]
@orden as int as
select * from vistatelas where produccion=@orden


GO
/****** Object:  StoredProcedure [dbo].[ver_avios_fichas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ver_avios_fichas]
@ficha as int as
select * from ver_avios_ficha where id_ficha=@ficha


GO
/****** Object:  StoredProcedure [dbo].[ver_bodegatelas_tipo]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


alter procedure [dbo].[ver_bodegatelas_tipo]
@cliente as int, @tipo as int as 
select nombre_descripcion, ROUND(metros, 2), composicion, color, ancho, fecha_entrada, tipo, idtela, cliente, proveedor from tela_bodega where cliente=@cliente and tipo=@tipo


GO
/****** Object:  StoredProcedure [dbo].[ver_combinacionproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ver_combinacionproduccion]
@idproduccion as int as	
SELECT combinacion, SUM(cantidad_prendas) as Cantidad_prendas
FROM produccion_detalle
WHERE producionid=@idproduccion
GROUP BY combinacion
ORDER BY combinacion;							


GO
/****** Object:  StoredProcedure [dbo].[ver_especificacionesficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ver_especificacionesficha]
@idficha int as
select * from especificacionesficha where especificacionesficha.fichatecnica=@idficha


GO
/****** Object:  StoredProcedure [dbo].[ver_piezas_ficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ver_piezas_ficha]
@ficha as int as 
select * from piezas


GO
/****** Object:  StoredProcedure [dbo].[ver_produccion_detalle]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ver_produccion_detalle]
@idorden as int as
select * from produccion_detalle where producionid=@idorden


GO
/****** Object:  StoredProcedure [dbo].[veracabados_fichas]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[veracabados_fichas]
@idficha int as
select * from acabados_fichas where id_ficha=@idficha



GO
/****** Object:  StoredProcedure [dbo].[verificaordenavios]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
select avios.nombre,
avios_bodega.cantidad as cantidad_bodega,
avios_detalle.cantidad as cantidad_ficha,
avios_produccion.cantidad_necesaria,
avios.id_avios,
avios_detalle.id_ficha
from avios,
avios_bodega,
avios_detalle,
avios_produccion
where avios.id_avios=avios_bodega.idavios and avios.id_avios=avios_detalle.id_avio and avios.id_avios=avios_produccion.aviosid and avios_produccion.cantidad_necesaria!=0 and avios_produccion.producciondetalle=8 and avios_detalle.id_ficha=115

alter procedure [dbo].[verificaordenavios] 
@idproduccion as int, @idficha as int, @fecha datetime as	
if EXISTS(select avios.nombre,
avios_bodega.cantidad as cantidad_bodega,
avios_detalle.cantidad as cantidad_ficha,
avios_produccion.cantidad_necesaria,
avios.id_avios,
avios_detalle.id_ficha
from avios,
avios_bodega,
avios_detalle,
avios_produccion
where avios_bodega.idavios=avios.id_avios and avios_detalle.id_avio=avios.id_avios and avios_produccion.aviosid=avios.id_avios and avios_produccion.producciondetalle=@idproduccion and avios_detalle.id_ficha=@idficha and [avios_produccion].cantidad_necesaria>0)
return 0
else
update orden_produccion set avios_completo=1, fecha_avios=@fecha where id_orden=@idproduccion
GO

/****** Object:  StoredProcedure [dbo].[verpiezas_ficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	
CREATE procedure [dbo].[verpiezas_ficha]
@idficha as int as
select * from ver_piezasficha where id_ficha=@idficha


GO
/****** Object:  StoredProcedure [dbo].[verprocesosficha]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[verprocesosficha]
@idficha int as 
select id_ficha,
		operacion,
		tiempo,
		id_proceso
from procesos,
	procesos_detalle
where id_proceso=id_procesos and id_ficha=@idficha
order by procesos_detalle.id_procesos_detalle


GO
/****** Object:  StoredProcedure [dbo].[versolicitudes]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[versolicitudes]
as
select * from vistasolicitudes


GO
/****** Object:  StoredProcedure [dbo].[vertelasproduccion]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


alter procedure [dbo].[vertelasproduccion]
@idproduccion as int as	
SELECT tela,
		combinacion,
		forro,
		color,
		cantidad_prendas,
		metros_recibidos,
		metros_recibidoscombinacion,
		metros_recibidosforro
FROM produccion_detalle
WHERE producionid=@idproduccion

GO
/****** Object:  StoredProcedure [dbo].[vistahojacorte1]    Script Date: 02/02/2017 01:47:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--alter procedure insertaespecificacionesfichatecnica
--@idficha int, @especificaciones varchar(max) as
--if EXISTS(select * from especificacionesficha where fichatecnica=@idficha)
--return 0
--else
--insert into especificacionesficha(fichatecnica, Especificaciones) values(@idficha, @especificaciones)
--GO

						
CREATE procedure [dbo].[vistahojacorte1]
@idproduccion int as
select orden_produccion.id_cliente,
		produccion.idorden,
		clientes.nombre,
		orden_produccion.asunto,
		orden_produccion.observaciones,
		produccion.observaciones_diseño,
		Vistafichastecnicascompleta.modelo,
		Vistafichastecnicascompleta.tela,
		Vistafichastecnicascompleta.ancho_tela,
		Vistafichastecnicascompleta.consumo_tela,
		Vistafichastecnicascompleta.combinacion,
		Vistafichastecnicascompleta.ancho_tela_conbinacion,
		Vistafichastecnicascompleta.consumo_conbinacion,
		Vistafichastecnicascompleta.forro,
		Vistafichastecnicascompleta.ancho_tela_forro,
		Vistafichastecnicascompleta.consumo_forro,
		Vistafichastecnicascompleta.idficha_tecnica,
		especificacionesficha.Especificaciones
from orden_produccion,
		produccion,
		Vistafichastecnicascompleta,
		clientes,
		especificacionesficha
where clientes.idclientes=orden_produccion.id_cliente and produccion.idorden=orden_produccion.id_orden and Vistafichastecnicascompleta.idficha_tecnica=produccion.idficha and orden_produccion.id_orden=@idproduccion and especificacionesficha.fichatecnica=Vistafichastecnicascompleta.idficha_tecnica


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
         Begin Table = "avios"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "avios_bodega"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'avios_mas_bodega'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'avios_mas_bodega'
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
         Begin Table = "avios"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "avios_detalle"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 417
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ver_avios_ficha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ver_avios_ficha'
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
         Begin Table = "orden_produccion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clientes"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "produccion"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_detalle"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_entrada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_entrada'
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
         Begin Table = "orden_produccion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clientes"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "produccion"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_detalle"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_entrega'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_entrega'
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
         Begin Table = "orden_produccion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clientes"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "produccion"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_detalle"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_tecnica"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 252
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
         Or =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_maquila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_maquila'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_maquila'
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
         Begin Table = "orden_produccion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clientes"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "produccion"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_detalle"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_separado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_separado'
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
         Begin Table = "orden_produccion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clientes"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "produccion"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_detalle"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_trazado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_prendas_trazado'
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
         Begin Table = "orden_produccion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "clientes"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "produccion"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ficha_detalle"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 255
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vistaproduccion_paracorte'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vistaproduccion_paracorte'
GO
USE [master]
GO
ALTER DATABASE [GrupoSM] SET  READ_WRITE 
GO
