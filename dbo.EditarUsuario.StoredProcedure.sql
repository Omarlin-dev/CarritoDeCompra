USE [DbCarrito]
GO
/****** Object:  StoredProcedure [dbo].[EditarUsuario]    Script Date: 21/1/2022 8:31:51 p. m. ******/
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
