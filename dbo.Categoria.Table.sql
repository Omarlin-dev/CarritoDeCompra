USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 21/1/2022 8:31:49 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Tecnologia', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Muebles', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Dormitorio', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'Deportes', 1, CAST(N'2022-01-17T16:18:10.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
