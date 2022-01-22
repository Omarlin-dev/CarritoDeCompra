USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 21/1/2022 8:31:49 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'SONYTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'HPTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'LGTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'HYUNDAITE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'CANONTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
INSERT [dbo].[Marca] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'ROBERTA ALLENTE', 1, CAST(N'2022-01-17T16:18:10.963' AS DateTime))
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
ALTER TABLE [dbo].[Marca] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Marca] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
