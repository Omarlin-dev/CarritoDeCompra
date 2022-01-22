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



                string clave = "test123";

                user.Clave = CnRecurso.ConvertirSha256(clave);

                return objCapaDato.RegistrarUsuario(user, out Mensaje);
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
                return objCapaDato.EditarUsuario(user,, out Mensaje);
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
