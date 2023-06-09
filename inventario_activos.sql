USE [master]
GO
/****** Object:  Database [inventario_activos]    Script Date: 22/5/2023 17:40:46 ******/
CREATE DATABASE [inventario_activos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inventario_activos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SAFETICA\MSSQL\DATA\inventario_activos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'inventario_activos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SAFETICA\MSSQL\DATA\inventario_activos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [inventario_activos] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventario_activos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventario_activos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventario_activos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventario_activos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventario_activos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventario_activos] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventario_activos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [inventario_activos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventario_activos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventario_activos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventario_activos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventario_activos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventario_activos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventario_activos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventario_activos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventario_activos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [inventario_activos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventario_activos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventario_activos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventario_activos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventario_activos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventario_activos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventario_activos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventario_activos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inventario_activos] SET  MULTI_USER 
GO
ALTER DATABASE [inventario_activos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventario_activos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inventario_activos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inventario_activos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [inventario_activos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [inventario_activos] SET QUERY_STORE = OFF
GO
USE [inventario_activos]
GO
/****** Object:  Table [dbo].[tbl_activo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_activo](
	[id_activo] [int] IDENTITY(1,1) NOT NULL,
	[cod1_activo] [varchar](20) NULL,
	[cod2_activo] [varchar](20) NULL,
	[tipo_activo] [varchar](50) NULL,
	[id_marca] [int] NULL,
	[id_modelo] [int] NULL,
	[serial_activo] [varchar](50) NULL,
	[ubicacion_activo] [varchar](50) NULL,
	[id_estadoAc] [int] NULL,
	[observacion_activo] [varchar](200) NULL,
	[estado_uso] [char](1) NULL,
 CONSTRAINT [PK_tbl_activo] PRIMARY KEY CLUSTERED 
(
	[id_activo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_custodio]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_custodio](
	[id_custodio] [int] IDENTITY(1,1) NOT NULL,
	[id_activo] [int] NULL,
	[id_empleado] [int] NULL,
	[fecha_entrega] [date] NULL,
	[fecha_recepcion] [date] NULL,
	[estado_custodio] [char](1) NULL,
	[observacion] [varchar](200) NULL,
 CONSTRAINT [PK_tbl_custodio] PRIMARY KEY CLUSTERED 
(
	[id_custodio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_departamento]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departamento](
	[id_departamento] [int] IDENTITY(1,1) NOT NULL,
	[desc_departamento] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_departamento] PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_empleado]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empleado] [varchar](70) NULL,
	[apellido_empleado] [varchar](70) NULL,
	[correo_empleado] [varchar](50) NULL,
	[id_departamento] [int] NULL,
	[id_rol] [int] NULL,
	[dni_empleado] [varchar](15) NULL,
	[contrasena_empleado] [varchar](50) NULL,
	[estado_empleado] [char](1) NULL,
 CONSTRAINT [PK_tb_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estadoAc]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estadoAc](
	[id_estadoAc] [int] IDENTITY(1,1) NOT NULL,
	[desc_estadoAc] [varchar](25) NULL,
 CONSTRAINT [PK_tbl_estadoAc] PRIMARY KEY CLUSTERED 
(
	[id_estadoAc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_marca]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[desc_marca] [varchar](25) NULL,
 CONSTRAINT [PK_tbl_marca] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_marcaModelo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_marcaModelo](
	[id_marcaModelo] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NULL,
	[id_modelo] [int] NULL,
 CONSTRAINT [PK_tbl_marcaModelo] PRIMARY KEY CLUSTERED 
(
	[id_marcaModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_modelo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_modelo](
	[id_modelo] [int] IDENTITY(1,1) NOT NULL,
	[desc_modelo] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_modelo] PRIMARY KEY CLUSTERED 
(
	[id_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rol]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_rol] [varchar](50) NULL,
	[estado_rol] [char](1) NULL,
 CONSTRAINT [PK_tbl_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_activo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_activo_tbl_estadoAc] FOREIGN KEY([id_estadoAc])
REFERENCES [dbo].[tbl_estadoAc] ([id_estadoAc])
GO
ALTER TABLE [dbo].[tbl_activo] CHECK CONSTRAINT [FK_tbl_activo_tbl_estadoAc]
GO
ALTER TABLE [dbo].[tbl_activo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_activo_tbl_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[tbl_modelo] ([id_modelo])
GO
ALTER TABLE [dbo].[tbl_activo] CHECK CONSTRAINT [FK_tbl_activo_tbl_modelo]
GO
ALTER TABLE [dbo].[tbl_custodio]  WITH CHECK ADD  CONSTRAINT [FK_tbl_custodio_tb_empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[tbl_empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[tbl_custodio] CHECK CONSTRAINT [FK_tbl_custodio_tb_empleado]
GO
ALTER TABLE [dbo].[tbl_custodio]  WITH CHECK ADD  CONSTRAINT [FK_tbl_custodio_tbl_activo1] FOREIGN KEY([id_activo])
REFERENCES [dbo].[tbl_activo] ([id_activo])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tbl_custodio] CHECK CONSTRAINT [FK_tbl_custodio_tbl_activo1]
GO
ALTER TABLE [dbo].[tbl_empleado]  WITH CHECK ADD  CONSTRAINT [FK_tb_empleado_tbl_departamento] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[tbl_departamento] ([id_departamento])
GO
ALTER TABLE [dbo].[tbl_empleado] CHECK CONSTRAINT [FK_tb_empleado_tbl_departamento]
GO
ALTER TABLE [dbo].[tbl_empleado]  WITH CHECK ADD  CONSTRAINT [FK_tb_empleado_tbl_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[tbl_rol] ([id_rol])
GO
ALTER TABLE [dbo].[tbl_empleado] CHECK CONSTRAINT [FK_tb_empleado_tbl_rol]
GO
ALTER TABLE [dbo].[tbl_marcaModelo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_marcaModelo_tbl_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[tbl_marca] ([id_marca])
GO
ALTER TABLE [dbo].[tbl_marcaModelo] CHECK CONSTRAINT [FK_tbl_marcaModelo_tbl_marca]
GO
ALTER TABLE [dbo].[tbl_marcaModelo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_marcaModelo_tbl_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[tbl_modelo] ([id_modelo])
GO
ALTER TABLE [dbo].[tbl_marcaModelo] CHECK CONSTRAINT [FK_tbl_marcaModelo_tbl_modelo]
GO
/****** Object:  StoredProcedure [dbo].[Activos_disponibles]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Activos_disponibles]
as
select id_activo 'N°', cod1_activo Código_1 ,cod2_activo Código_2,tipo_activo Tipo, desc_marca  +' - '+ desc_modelo Descripción,serial_activo Serial

from tbl_activo a
inner join tbl_marca b on a.id_marca=b.id_marca inner join tbl_modelo c on a.id_modelo=c.id_modelo inner join tbl_estadoAc d on a.id_estadoAc=d.id_estadoAc
where estado_uso like 0
GO
/****** Object:  StoredProcedure [dbo].[actualizar_departamento]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_departamento]
(
@id_departamento int,
@desc_departamento varchar(50)
)as
update tbl_departamento set desc_departamento=@desc_departamento
where id_departamento=@id_departamento
GO
/****** Object:  StoredProcedure [dbo].[actualizar_estadoAc]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_estadoAc]
(
@id_estadoAc int,
@desc_estadoAc varchar(50)
)as
update tbl_estadoAc set desc_estadoAc=@desc_estadoAc
where id_estadoAc=@id_estadoAc
GO
/****** Object:  StoredProcedure [dbo].[actualizar_marca]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure  [dbo].[actualizar_marca]
(
@id_marca int,
@des_marca varchar(50)
)
as 
Update tbl_marca
Set    desc_marca=@des_marca
where id_marca=@id_marca
GO
/****** Object:  StoredProcedure [dbo].[actualizar_modelo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_modelo]
(
@id_modelo int,
@desc_modelo varchar(50)
)
as
update tbl_modelo
set desc_modelo=@desc_modelo
where id_modelo=@id_modelo
GO
/****** Object:  StoredProcedure [dbo].[actualizar_rol]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[actualizar_rol]
(
@id_rol int,
@descripcion_rol varchar(50),
@estado_rol char(1)
)
as
update tbl_rol
set descripcion_rol=@descripcion_rol,estado_rol=@estado_rol
where id_rol=@id_rol
GO
/****** Object:  StoredProcedure [dbo].[buscaMasiva_activo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscaMasiva_activo]
@descripcion varchar(100)
as
select cod1_activo Código_1 ,cod2_activo Código_2,tipo_activo Tipo, desc_marca Marca,desc_modelo Modelo,serial_activo Serial,ubicacion_activo,desc_estadoAc Estado_Activo,observacion_activo Observaciones,estado_uso Estado_Uso

from tbl_activo a
inner join tbl_marca b on a.id_marca = b.id_marca 
inner join tbl_modelo c on a.id_modelo = c.id_modelo 
left join tbl_estadoAc d on a.id_estadoAc = d.id_estadoAc

where    cod1_activo like '%'+@descripcion+'%' or cod2_activo like '%'+@descripcion+'%' or desc_modelo like '%'+@descripcion+'%' or serial_activo like '%'+@descripcion+'%'
GO
/****** Object:  StoredProcedure [dbo].[buscaMasiva_empleado]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscaMasiva_empleado]
@descripcion varchar(100)	
as
select a.id_empleado ID, a.nombre_empleado Nombres,a.apellido_empleado Apellidos,a.correo_empleado Mail, c.desc_departamento Departamento, descripcion_rol Rol,a.dni_empleado Cédula,a.estado_empleado Estado
from tbl_empleado a 
inner join tbl_rol b on a.id_rol=b.id_rol inner join tbl_departamento c on c.id_departamento=a.id_departamento
where    nombre_empleado like '%'+@descripcion+'%' or apellido_empleado like '%'+@descripcion+'%' or dni_empleado like '%'+@descripcion+'%' or correo_empleado like '%'+@descripcion+'%'
GO
/****** Object:  StoredProcedure [dbo].[buscar_AcDisponible]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_AcDisponible]
(
@descipcion varchar(50)
)
as
select id_activo 'N°', cod1_activo  +'  '+ cod2_activo Activo,tipo_activo Tipo, desc_marca  +' - '+ desc_modelo Descripción,serial_activo Serial
from tbl_activo a
inner join tbl_marca b on a.id_marca=b.id_marca inner join tbl_modelo c on a.id_modelo=c.id_modelo inner join tbl_estadoAc d on a.id_estadoAc=d.id_estadoAc
where  estado_uso like 0 and ( cod1_activo like '%'+@descipcion+'%' or cod2_activo like '%'+@descipcion+'%' or serial_activo like '%'+@descipcion+'%')
GO
/****** Object:  StoredProcedure [dbo].[buscar_activo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_activo]
as
select cod1_activo Código_1 ,cod2_activo Código_2,tipo_activo Tipo, desc_marca Marca,desc_modelo Modelo,serial_activo Serial,ubicacion_activo,desc_estadoAc Estado_Activo,observacion_activo Observaciones,estado_uso Estado

from tbl_activo a, tbl_modelo b,tbl_marca c,tbl_estadoAc d 
GO
/****** Object:  StoredProcedure [dbo].[buscar_custodio]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_custodio]
(
@id_activo int,
@id_empleado int
)
as
select b.id_activo Activo ,c.nombre_empleado+' '+c.apellido_empleado Nombre,fecha_entrega,fecha_recepcion,estado_custodio,observacion
from tbl_custodio a
inner join tbl_activo b on a.id_activo = b.id_activo
inner join tbl_empleado c on a.id_empleado=c.id_empleado
where a.id_activo like '%'+@id_activo+'%' or a.id_empleado like '%'+@id_empleado+'%'
GO
/****** Object:  StoredProcedure [dbo].[buscar_departamento]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_departamento]
@desc_departamento varchar(50)
as
select * from tbl_departamento
where desc_departamento like '%'+@desc_departamento
GO
/****** Object:  StoredProcedure [dbo].[buscar_estadoAc]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_estadoAc]
(
@desc_estadoAc varchar(50)
)as
select * from tbl_estadoAc
where desc_estadoAc like '%'+@desc_estadoAc
GO
/****** Object:  StoredProcedure [dbo].[buscar_marca]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[buscar_marca]
(
@desc_marca varchar(50)
)
as
select * from tbl_marca 
where desc_marca like '%'+@desc_marca+'%'
GO
/****** Object:  StoredProcedure [dbo].[buscar_modelo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_modelo]
(
@desc_modelo varchar(50)
)
as
select * from tbl_modelo
where desc_modelo like '%'+@desc_modelo+'%'
GO
/****** Object:  StoredProcedure [dbo].[buscar_rol]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buscar_rol]
(
@descripcion_rol varchar(50)
)
as
select * from tbl_rol
where descripcion_rol like '%'+@descripcion_rol
GO
/****** Object:  StoredProcedure [dbo].[CorregirCamposVacios]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CorregirCamposVacios]
AS
BEGIN
    UPDATE [dbo].[tbl_activo]
 SET 
		[cod1_activo]= COALESCE(NULLIF([cod1_activo],''),'Sin Información'),
		[cod2_activo]= COALESCE(NULLIF([cod2_activo],''),'Sin Información'),
		[id_marca] = COALESCE(NULLIF([id_marca], ''), 1),
        [id_modelo] = COALESCE(NULLIF([id_modelo], ''), 1),
        [id_estadoAc] = COALESCE(NULLIF([id_estadoAc], ''), 1),
        [tipo_activo] = COALESCE(NULLIF([tipo_activo], ''), 'Sin Información'),
        [serial_activo] = COALESCE(NULLIF([serial_activo], ''), 'Sin Información'),
        [ubicacion_activo] = COALESCE(NULLIF([ubicacion_activo], ''), 'Sin Información'),
        [observacion_activo] = COALESCE(NULLIF([observacion_activo], ''), 'Sin Información'),
        [estado_uso] = COALESCE(NULLIF([estado_uso], ''), 'I')
    WHERE  [cod1_activo] IS NULL
		OR [cod2_activo]IS NULL
		OR	[tipo_activo] IS NULL
       OR [serial_activo] IS NULL
       OR [ubicacion_activo] IS NULL
       OR [observacion_activo] IS NULL
       OR [estado_uso] IS NULL
		OR	[cod1_activo] = ''
		OR [cod2_activo]= ''
       OR [tipo_activo] = ''
       OR [serial_activo] = ''
       OR [ubicacion_activo] = ''
       OR [observacion_activo] = ''
       OR [estado_uso] = '';

END
GO
/****** Object:  StoredProcedure [dbo].[editar_empleado]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[editar_empleado]
@id_empleado int,
@nombre_empleado varchar(75),
@apellido_empleado varchar(75),
@correo_empleado varchar(100),
@dni_empleado varchar(15)
as
Update tbl_empleado
Set      nombre_empleado=@nombre_empleado,apellido_empleado=@apellido_empleado,correo_empleado=@correo_empleado,dni_empleado=@dni_empleado
where @id_empleado=id_empleado
GO
/****** Object:  StoredProcedure [dbo].[insertar_activo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_activo]
@cod1_activo varchar(20),
@cod2_activo varchar(20),
@tipo_activo varchar(50),
@id_marca int,
@id_modelo int,
@serial_activo varchar(50),
@ubicacion_activo varchar(50),
@id_estadoAC int,
@observacion_activo varchar(200),
@estado_uso char(1)
as
insert into tbl_activo (cod1_activo,cod2_activo,tipo_activo,id_marca,id_modelo,serial_activo,ubicacion_activo,id_estadoAc,observacion_activo,estado_uso)
values(@cod1_activo,@cod2_activo,@tipo_activo,@id_marca,@id_modelo,@serial_activo,@ubicacion_activo,@id_estadoAC,@observacion_activo,@estado_uso)
GO
/****** Object:  StoredProcedure [dbo].[insertar_custodio]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_custodio]
(
@id_activo int,
@id_empleado int,
@fecha_entrega date,
@fecha_recepcion date,
@estado_custodio char(1),
@observacion varchar(100)
)
as
insert into tbl_custodio (id_activo,id_empleado,fecha_entrega,fecha_recepcion, estado_custodio,observacion) 
values (@id_activo,@id_empleado,@fecha_entrega,@fecha_recepcion,@estado_custodio,@observacion)
GO
/****** Object:  StoredProcedure [dbo].[insertar_departamento]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_departamento]
(
@desc_departamento varchar(50)
)as
insert into tbl_departamento (desc_departamento) values(@desc_departamento)
GO
/****** Object:  StoredProcedure [dbo].[insertar_estadoAc]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_estadoAc]
(
@desc_estadoAc varchar(50)
)as
insert into  tbl_estadoAc (desc_estadoAc) values(@desc_estadoAc)
GO
/****** Object:  StoredProcedure [dbo].[insertar_marca]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_marca]
(
@desc_marca varchar(50)
)
as
insert into tbl_marca (desc_marca) values (@desc_marca)
GO
/****** Object:  StoredProcedure [dbo].[insertar_modelo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_modelo]
(
@desc_modelo varchar(50)
)
as
insert into tbl_modelo (desc_modelo) values(@desc_modelo)
GO
/****** Object:  StoredProcedure [dbo].[insertar_persona]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_persona]

@nombre_empleado varchar(70),
@apellido_empleado varchar(70),
@correo_empleado varchar(100),
@id_departamento int,
@id_roll int,
@dni_empleado varchar(15),
@contrasena_empleado varchar (30),
@estado_empleado@ char(1)


as
insert into tbl_empleado (nombre_empleado,apellido_empleado,correo_empleado,id_departamento,id_rol,dni_empleado,contrasena_empleado,estado_empleado) values(

@nombre_empleado,@apellido_empleado,@correo_empleado,@id_departamento,@id_roll,@dni_empleado,@contrasena_empleado,@estado_empleado@);
GO
/****** Object:  StoredProcedure [dbo].[insertar_rol]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_rol]
(
@descripcion_rol varchar(50),
@estado_rol char(1)
)
as
insert into tbl_rol (descripcion_rol,estado_rol) values(@descripcion_rol,@estado_rol)
GO
/****** Object:  StoredProcedure [dbo].[listar_activo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listar_activo]
as
select cod1_activo Código_1 ,cod2_activo Código_2,tipo_activo Tipo, desc_marca Marca,desc_modelo Modelo,serial_activo Serial,ubicacion_activo,desc_estadoAc Estado_Activo,observacion_activo Observaciones,estado_uso Estado_Uso

from tbl_activo a
inner join tbl_marca b on a.id_marca=b.id_marca inner join tbl_modelo c on a.id_modelo=c.id_modelo inner join tbl_estadoAc d on a.id_estadoAc=d.id_estadoAc
where estado_uso='A'
GO
/****** Object:  StoredProcedure [dbo].[listar_all_activo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listar_all_activo]
as
SELECT ROW_NUMBER() OVER (ORDER BY cod1_activo) AS '#',
       cod1_activo AS Código_1,
       cod2_activo AS Código_2,
       tipo_activo AS Tipo,
       desc_marca AS Marca,
       desc_modelo AS Modelo,
       serial_activo AS Serial,
       ubicacion_activo,
       desc_estadoAc AS Estado_Activo,
       observacion_activo AS Observaciones,
       estado_uso AS Estado_Uso
FROM tbl_activo a
INNER JOIN tbl_marca b ON a.id_marca = b.id_marca
INNER JOIN tbl_modelo c ON a.id_modelo = c.id_modelo
INNER JOIN tbl_estadoAc d ON a.id_estadoAc = d.id_estadoAc;
GO
/****** Object:  StoredProcedure [dbo].[listar_custodio]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_custodio]
as
select b.id_activo Activo ,c.nombre_empleado+' '+c.apellido_empleado Nombre,fecha_entrega,fecha_recepcion,estado_custodio,observacion
from tbl_custodio a
inner join tbl_activo b on a.id_activo = b.id_activo
inner join tbl_empleado c on a.id_empleado=c.id_empleado
GO
/****** Object:  StoredProcedure [dbo].[listar_departamento]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_departamento]
as
select * from tbl_departamento
GO
/****** Object:  StoredProcedure [dbo].[listar_empleado]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_empleado]
as
select a.id_empleado ID,  a.nombre_empleado Nombres,a.apellido_empleado Apellidos,a.correo_empleado Mail, c.desc_departamento Departamento, descripcion_rol Rol,a.dni_empleado Cédula,a.estado_empleado Estado
from tbl_empleado a 
inner join tbl_rol b on a.id_rol=b.id_rol inner join tbl_departamento c on c.id_departamento=a.id_departamento
GO
/****** Object:  StoredProcedure [dbo].[listar_estadoAc]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_estadoAc]
as
select * from tbl_estadoAc
GO
/****** Object:  StoredProcedure [dbo].[listar_marca]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_marca]
as
select * from tbl_marca 
GO
/****** Object:  StoredProcedure [dbo].[listar_modelo]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_modelo]
as
select * from tbl_modelo
GO
/****** Object:  StoredProcedure [dbo].[listar_rol]    Script Date: 22/5/2023 17:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listar_rol]
as
select * from tbl_rol
GO
USE [master]
GO
ALTER DATABASE [inventario_activos] SET  READ_WRITE 
GO
