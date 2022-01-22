USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 21/1/2022 8:31:49 p. m. ******/
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
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0101', N'Arequipa', N'01')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0102', N'Camaná', N'01')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0201', N'Ica ', N'02')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0202', N'Chincha ', N'02')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0301', N'Lima ', N'03')
INSERT [dbo].[Provincia] ([IdProvincia], [Descripcion], [IdDepartamento]) VALUES (N'0302', N'Barranca ', N'03')
GO
