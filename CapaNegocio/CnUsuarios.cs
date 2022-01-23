using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaNegocio
{
    public class CnUsuarios
    {
        private CdUsuario objCapaDato = new CdUsuario();

        public List<Usuario> Listar()
        {
            return objCapaDato.Listar();
        }

        public int RegistrarUsuario(Usuario user, out string Mensaje)
        {
            Mensaje = string.Empty;

            if(string.IsNullOrEmpty(user.Nombres) || string.IsNullOrWhiteSpace(user.Nombres))
            {
                Mensaje = "El nombre del usuario no puede ser vacio";
            }
            else if (string.IsNullOrEmpty(user.Apellidos) || string.IsNullOrWhiteSpace(user.Apellidos))
            {
                Mensaje = "El apellido del usuario no puede ser vacio";
            }
            else if (string.IsNullOrEmpty(user.Correo) || string.IsNullOrWhiteSpace(user.Correo))
            {
                Mensaje = "El correo del usuario no puede ser vacio";
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                string clave = CnRecurso.Generarclave();

                string asunto = "Creacion de cuenta";
                string mensajeCorreo = "<h3>Su cuenta fue creada correctamente</h3> </br> <p>Su contraseña para acceder es: Clave</p>";
                mensajeCorreo = mensajeCorreo.Replace("Clave", clave);

                bool respuesta = CnRecurso.EnviarCorreo(user.Correo, asunto, mensajeCorreo);

                if (respuesta)
                {
                    user.Clave = CnRecurso.ConvertirSha256(clave);
                    return objCapaDato.RegistrarUsuario(user, out Mensaje);
                }
                else
                {
                    Mensaje = "No se pudo enviar el correo";
                    return 0;
                }


            }
            else
            {
                return 0;
            }

        }

        public bool EditarUsuario(Usuario user, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(user.Nombres) || string.IsNullOrWhiteSpace(user.Nombres))
            {
                Mensaje = "El nombre del usuario no puede ser vacio";
            }
            else if (string.IsNullOrEmpty(user.Apellidos) || string.IsNullOrWhiteSpace(user.Apellidos))
            {
                Mensaje = "El apellido del usuario no puede ser vacio";
            }
            else if (string.IsNullOrEmpty(user.Correo) || string.IsNullOrWhiteSpace(user.Correo))
            {
                Mensaje = "El correo del usuario no puede ser vacio";
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                return objCapaDato.EditarUsuario(user, out Mensaje);
            }
            else
            {
                return false;
            }
        }

        public bool EliminarUsuario(int Id, out string Mensaje)
        {
            return objCapaDato.EliminarUsuario(Id, out Mensaje);
        }

    }
}
