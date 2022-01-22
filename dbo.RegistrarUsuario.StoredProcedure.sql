USE [DbCarrito]
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 21/1/2022 8:31:51 p. m. ******/
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
