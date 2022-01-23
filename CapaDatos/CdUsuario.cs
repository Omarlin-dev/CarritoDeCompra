using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CdUsuario
    {
        public List<Usuario> Listar()
        {

            List<Usuario> lista = new List<Usuario>();

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    string query = "SELECT IdUsuario ,Nombres ,Apellidos ,Correo ,Clave ,Reestrablecer ,Activo FROM Usuario";

                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.CommandType = CommandType.Text;

                    connection.Open();
                    using(SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            lista.Add(
                                    new Usuario
                                    {
                                        IdUsuario = Convert.ToInt32(dataReader["IdUsuario"]),
                                        Nombres = dataReader["Nombres"].ToString(),
                                        Apellidos = dataReader["Apellidos"].ToString(),
                                        Correo = dataReader["Correo"].ToString(),
                                        Clave = dataReader["Clave"].ToString(),
                                        Reestrablecer = Convert.ToBoolean(dataReader["Reestrablecer"]),
                                        Activo = Convert.ToBoolean(dataReader["Activo"])
                                    }
                                
                                );
                        }
                    }
                }


            }
            catch 
            {

                lista = new List<Usuario>();
            }

            return lista;
        }

        public bool ComprobarCorreoUsuarioIsFalse(string correo)
        {
            bool resultado;
            string correoComprobar = null;

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    string query = "SELECT Correo FROM Usuario WHERE Correo= @Correo";

                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@Correo", correo);
                    cmd.CommandType = CommandType.Text;

                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            correoComprobar = dataReader["Correo"].ToString();
                           
                        }
                    }
                }

                if (correoComprobar != correo)
                    resultado= true;
                else
                    resultado= false;
            }
            catch
            {
                resultado = false;
               
            }

            return resultado;
        }

        public int RegistrarUsuario(Usuario user, out string Mensaje)
        {
            int IdAutoGenerado = 0;
            Mensaje = string.Empty;

            try
            {
                using(SqlConnection conexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("RegistrarUsuario", conexion);
                    cmd.Parameters.AddWithValue("Nombres", user.Nombres);
                    cmd.Parameters.AddWithValue("Apellidos", user.Apellidos);
                    cmd.Parameters.AddWithValue("Correo", user.Correo);
                    cmd.Parameters.AddWithValue("Clave", user.Clave);
                    cmd.Parameters.AddWithValue("Activo", user.Activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    conexion.Open();

                    cmd.ExecuteNonQuery();

                    IdAutoGenerado = Convert.ToInt32(cmd.Parameters["Resultado"].Value);
                    
                    Mensaje = cmd.Parameters["Mensaje"].ToString();

                    if(!ComprobarCorreoUsuarioIsFalse(user.Correo))
                    {
                        IdAutoGenerado = 0;
                        Mensaje = "El correo ya existe";
                    }
                }
            }
            catch (Exception ex)
            {
                IdAutoGenerado = 0;
                Mensaje = ex.Message;
            }

            return IdAutoGenerado;
        }
        
        public bool EditarUsuario(Usuario user, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;

            try
            {
                using(SqlConnection conexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("EditarUsuario", conexion);
                    cmd.Parameters.AddWithValue("IdUsuario", user.IdUsuario);
                    cmd.Parameters.AddWithValue("Nombres", user.Nombres);
                    cmd.Parameters.AddWithValue("Apellidos", user.Apellidos);
                    cmd.Parameters.AddWithValue("Correo", user.Correo);
                    cmd.Parameters.AddWithValue("Activo", user.Activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    conexion.Open();

                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
                    Mensaje = cmd.Parameters["Mensaje"].ToString();
                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }

            return resultado;
        }

        public bool EliminarUsuario(int Id, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    string query = "DELETE top(1) FROM Usuario where IdUsuario = @id";

                    SqlCommand cmd = new SqlCommand(query, connection);
                    cmd.Parameters.AddWithValue("@id", Id);
                    cmd.CommandType = CommandType.Text;

                    connection.Open();

                    resultado = cmd.ExecuteNonQuery() > 0 ? true : false;

                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }

            return resultado;

        }
    }
}
