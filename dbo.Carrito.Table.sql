USE [DbCarrito]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 21/1/2022 8:31:48 p. m. ******/
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
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
