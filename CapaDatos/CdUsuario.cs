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
    }
}
