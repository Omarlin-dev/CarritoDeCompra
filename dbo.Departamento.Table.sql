USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 21/1/2022 8:31:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (N'01', N'Arequipa')
INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (N'02', N'Ica')
INSERT [dbo].[Departamento] ([IdDepartamento], [Descripcion]) VALUES (N'03', N'Lima')
GO
