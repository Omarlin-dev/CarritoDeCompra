USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 21/1/2022 8:31:49 p. m. ******/
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
