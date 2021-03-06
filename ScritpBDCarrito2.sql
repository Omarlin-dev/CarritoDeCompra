USE [master]
GO
/****** Object:  Database [DbCarrito]    Script Date: 6/2/2022 3:08:38 p. m. ******/
CREATE DATABASE [DbCarrito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbCarrito', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbCarrito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbCarrito_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbCarrito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbCarrito] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbCarrito].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbCarrito] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbCarrito] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbCarrito] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbCarrito] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbCarrito] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbCarrito] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbCarrito] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbCarrito] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbCarrito] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbCarrito] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbCarrito] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbCarrito] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbCarrito] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbCarrito] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbCarrito] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbCarrito] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbCarrito] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbCarrito] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbCarrito] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbCarrito] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbCarrito] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbCarrito] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbCarrito] SET RECOVERY FULL 
GO
ALTER DATABASE [DbCarrito] SET  MULTI_USER 
GO
ALTER DATABASE [DbCarrito] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbCarrito] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbCarrito] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbCarrito] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbCarrito] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbCarrito] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbCarrito', N'ON'
GO
ALTER DATABASE [DbCarrito] SET QUERY_STORE = OFF
GO
USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Reestablecer] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[IdDistrito] [varchar](6) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdProvincia] [varchar](4) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[NombreImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[IdProvincia] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Reestrablecer] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 6/2/2022 3:08:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[TotalProducto] [int] NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[IdDistrito] [varchar](10) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](300) NULL,
	[IdTransaccion] [varchar](50) NULL,
	[FechaVenta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Tecnologia', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Muebles', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Dormitorio', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'Deportes', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'Electrodomesticos', 1, CAST(N'2022-01-24T16:38:59.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (N'01', N'Arequipa')
INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (N'02', N'Ica')
INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (N'03', N'Lima')
GO
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010101', N'Nieva', N'0101', N'01')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010102', N'El Cenepa', N'0101', N'01')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010201', N'Camaná', N'0102', N'01')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'010202', N'José María Quimper', N'0102', N'01')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020101', N'Ica', N'0201', N'02')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020102', N'La Tinguiña', N'0201', N'02')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020201', N'Chincha Alta', N'0202', N'02')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'020202', N'Alto Laran', N'0202', N'02')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030101', N'Lima', N'0301', N'03')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030102', N'Ancón', N'0301', N'03')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030201', N'Barranca', N'0302', N'03')
INSERT [dbo].[Distrito] ([IdDistrito], [Descripcion], [IdProvincia], [IdDepartamento]) VALUES (N'030202', N'Paramonga', N'0302', N'03')
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'SONYTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'HPTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'LGTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'HYUNDAITE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'CANONTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'ROBERTA ALLENTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0101', N'Arequipa', N'01')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0102', N'Camaná', N'01')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0201', N'Ica ', N'02')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0202', N'Chincha ', N'02')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0301', N'Lima ', N'03')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0302', N'Barranca ', N'03')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestrablecer], [Activo], [FechaRegistro]) VALUES (1, N'test nombre', N'test apellido', N'test@example.com', N'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae', 1, 1, CAST(N'2022-01-17T16:19:20.517' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestrablecer], [Activo], [FechaRegistro]) VALUES (2, N'Rosa', N'Torres', N'rosa@gmail.com', N'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae', 1, 1, CAST(N'2022-01-22T15:15:23.540' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestrablecer], [Activo], [FechaRegistro]) VALUES (15, N'Juan', N'garces', N'wihax66888@showbaz.com', N'b917efcc54b9a6bccc7ede4fe20ce1730d2a2dd12fc058031272ea9d672ca83e', 1, 1, CAST(N'2022-01-23T16:24:26.837' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestrablecer], [Activo], [FechaRegistro]) VALUES (16, N'pedro', N'ulerio', N'msanfordf_n732l@vixej.com', N'fae0be65afd4b85c6bd8106b684a5eedb2adafa2763fb722affc61723e086047', 1, 1, CAST(N'2022-01-23T16:44:45.507' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Reestrablecer], [Activo], [FechaRegistro]) VALUES (17, N'omarlin', N'garces', N'omarlingarcesrodriguez@gmail.com', N'0178968a1424fc02584f1cd88ea5006f443895edd5626f0e8f7dc483aecde3ef', 1, 1, CAST(N'2022-01-23T17:36:59.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT ((0)) FOR [Reestablecer]
GO
ALTER TABLE [dbo].[Cliente] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Marca] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Marca] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Reestrablecer]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [FechaVenta]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
/****** Object:  StoredProcedure [dbo].[EditarCategoria]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EditarCategoria](
@IdCategoria int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)

as
begin
	set @Resultado = 0
	if NOT EXISTS (SELECT * FROM Categoria WHERE Descripcion = @Descripcion AND IdCategoria != @IdCategoria)
	begin
	UPDATE TOP(1) Categoria SET Descripcion= @Descripcion, Activo = @Activo 
	WHERE IdCategoria = @IdCategoria
	
	SET @Resultado = 1
	END
	else
 	set @Mensaje = 'La categoria ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[EditarMarca]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EditarMarca](
@IdMarca int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)

as
begin
	set @Resultado = 0
	if NOT EXISTS (SELECT * FROM Marca WHERE Descripcion = @Descripcion AND IdMarca != @IdMarca)
	begin
	UPDATE TOP(1) Marca SET Descripcion= @Descripcion, Activo = @Activo 
	WHERE IdMarca = @IdMarca
	
	SET @Resultado = 1
	END
	else
 	set @Mensaje = 'La marca ya existe'
end

GO
/****** Object:  StoredProcedure [dbo].[EditarUsuario]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[EditarUsuario](
@IdUsuario int,
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int Output
)
AS	
begin

	set @Resultado = 0

if not exists (SELECT * FROM Usuario where Correo = @Correo and IdUsuario != @IdUsuario)
begin
	UPDATE top(1) Usuario set 
	Nombres = @Nombres, 
	Apellidos = @Apellidos,
	Correo = @Correo,
	Activo = @Activo
	WHERE IdUsuario = @IdUsuario

	SET @Resultado = 1
end
else
	SET @Mensaje = 'El correo del usuario ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EliminarCategoria](
@IdCategoria int,
@Mensaje varchar(500) output,
@Resultado bit output
)

as
begin
	set @Resultado = 0
	if NOT EXISTS (SELECT * FROM Producto p   
	inner join Categoria c ON p.IdCategoria = c.IdCategoria
	WHERE p.IdCategoria = @IdCategoria)
	begin
	DELETE TOP(1) FROM Categoria WHERE IdCategoria = @IdCategoria
	
	SET @Resultado = 1
	END
	else
 	set @Mensaje = 'La categoria se encuentra relacionada a un producto'
end
GO
/****** Object:  StoredProcedure [dbo].[EliminarMarca]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[EliminarMarca](
@IdMarca int,
@Mensaje varchar(500) output,
@Resultado bit output
)

as
begin
	set @Resultado = 0
	if NOT EXISTS (SELECT * FROM Producto p   
	inner join Marca m ON p.IdMarca = m.IdMarca
	WHERE p.IdMarca = @IdMarca)
	begin
	DELETE TOP(1) FROM Marca WHERE IdMarca = @IdMarca
	
	SET @Resultado = 1
	END
	else
 	set @Mensaje = 'La marca se encuentra relacionada a un producto'
end
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCategoria]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[RegistrarCategoria](
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)

as
begin
	set @Resultado = 0
	if NOT EXISTS (SELECT * FROM Categoria WHERE Descripcion = @Descripcion)
	begin
	INSERT INTO Categoria(Descripcion, Activo) VALUES
	(@Descripcion, @Activo)
	SET @Resultado = SCOPE_IDENTITY()
	END
	else
 	set @Mensaje = 'La categoria ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[RegistrarMarca]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[RegistrarMarca](
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)

as
begin
	set @Resultado = 0
	if NOT EXISTS (SELECT * FROM Marca WHERE Descripcion = @Descripcion)
	begin
	INSERT INTO Marca(Descripcion, Activo) VALUES
	(@Descripcion, @Activo)
	SET @Resultado = SCOPE_IDENTITY()
	END
	else
 	set @Mensaje = 'La marca ya existe'
end

GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 6/2/2022 3:08:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[RegistrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int Output
)

AS	
begin
	set @Resultado = 0
if not exists (SELECT * FROM Usuario where Correo = @Correo)
begin
	Insert into Usuario(Nombres, Apellidos, Correo, Clave, Activo)
	values(@Nombres, @Apellidos, @Correo, @Clave, @Activo)
	
	SET @Resultado = SCOPE_IDENTITY()
end
else
	SET @Mensaje = 'El correo del usuario ya existe'
end
GO
USE [master]
GO
ALTER DATABASE [DbCarrito] SET  READ_WRITE 
GO
