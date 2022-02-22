using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CdProducto
    {
        public List<Producto> Listar()
        {

            List<Producto> lista = new List<Producto>();

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    StringBuilder sb = new StringBuilder();

                    sb.AppendLine("SELECT p.IdProducto, p.Nombre, p.Descripcion,");
                    sb.AppendLine("m.IdMarca, m.Descripcion[DesMarca],");
                    sb.AppendLine("c.IdCategoria, c.Descripcion[DesCategoria],");
                    sb.AppendLine("p.Precio, p.Stock, p.RutaImagen, p.NombreImagen, p.Activo");                    
                    sb.AppendLine("from Producto p inner join Marca m ON P.IdMarca = m.IdMarca");
                    sb.AppendLine("inner join Categoria c on c.IdCategoria = p.IdCategoria");
                    

                    SqlCommand cmd = new SqlCommand(sb.ToString(), connection);
                    cmd.CommandType = CommandType.Text;

                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            lista.Add(
                                    new Producto
                                    {
                                        IdProducto = Convert.ToInt32(dataReader["IdProducto"]),
                                        Nombre = dataReader["Nombre"].ToString(),
                                        Descripcion = dataReader["Descripcion"].ToString(),
                                        oMarca = new Marca()
                                        {
                                            IdMarca = Convert.ToInt32(dataReader["IdMarca"]),
                                            Descripcion= dataReader["DesMarca"].ToString(),
                                           

                                        },
                                        oCategoria = new Categoria()
                                        {
                                            IdCategoria = Convert.ToInt32(dataReader["IdCategoria"]),
                                            Descripcion = dataReader["DesCategoria"].ToString()                                            
                                        },
                                        Precio = Convert.ToDecimal(dataReader["Precio"], new CultureInfo("es-PE")),
                                        Stock = Convert.ToInt32(dataReader["Stock"]),
                                        RutaImagen = dataReader["RutaImagen"].ToString(),
                                        NombreImagen = dataReader["NombreImagen"].ToString(),
                                        Activo = Convert.ToBoolean(dataReader["Activo"])
                                    }

                                );
                        }
                    }
                }


            }
            catch
            {

                lista = new List<Producto>();
            }

            return lista;
        }

        public int Registrar(Producto obj, out string Mensaje)
        {
            int IdAutoGenerado = 0;
            Mensaje = string.Empty;

            try
            {
                using (SqlConnection conexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("RegistrarProducto", conexion);
                    cmd.Parameters.AddWithValue("Nombre", obj.Nombre);
                    cmd.Parameters.AddWithValue("Descripcion", obj.Descripcion);
                    cmd.Parameters.AddWithValue("IdMarca", obj.oMarca.IdMarca);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.oCategoria.IdCategoria);
                    cmd.Parameters.AddWithValue("Precio", obj.Precio);
                    cmd.Parameters.AddWithValue("Stock", obj.Stock);
                    cmd.Parameters.AddWithValue("Activo", obj.Activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    conexion.Open();

                    cmd.ExecuteNonQuery();

                    IdAutoGenerado = Convert.ToInt32(cmd.Parameters["Resultado"].Value);

                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();

                }
            }
            catch (Exception ex)
            {
                IdAutoGenerado = 0;
                Mensaje = ex.Message;
            }

            return IdAutoGenerado;
        }

        public bool Editar(Producto obj, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;

            try
            {
                using (SqlConnection conexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("EditarProducto", conexion);
                    cmd.Parameters.AddWithValue("IdProducto", obj.IdProducto);
                    cmd.Parameters.AddWithValue("Nombre", obj.Nombre);
                    cmd.Parameters.AddWithValue("Descripcion", obj.Descripcion);
                    cmd.Parameters.AddWithValue("IdMarca", obj.oMarca.IdMarca);
                    cmd.Parameters.AddWithValue("IdCategoria", obj.oCategoria.IdCategoria);
                    cmd.Parameters.AddWithValue("Precio", obj.Precio);
                    cmd.Parameters.AddWithValue("Stock", obj.Stock);
                    cmd.Parameters.AddWithValue("Activo", obj.Activo);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

                    conexion.Open();

                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);

                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();

                }
            }
            catch (Exception ex)
            {
                resultado = false;
                Mensaje = ex.Message;
            }

            return resultado;
        }

        public bool GuardarDatosImagen(Producto producto, out string mensaje)
        {
            bool resultado = false;
            mensaje = string.Empty;

            try
            {
                using (SqlConnection conexion = new SqlConnection(Conexion.cn))
                {
                    string query = "UPDATE Producto  set RutaImagen = @rutaImagen,  NombreImagen = @nombreProducto where IdProducto = @idProducto";
                    SqlCommand cmd = new SqlCommand(query, conexion);
                    cmd.Parameters.AddWithValue("@rutaImagen", producto.RutaImagen);
                    cmd.Parameters.AddWithValue("@nombreProducto", producto.NombreImagen);
                    cmd.Parameters.AddWithValue("@idProducto", producto.IdProducto);
                    cmd.CommandType = CommandType.Text;

                    conexion.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        resultado = true;
                    }
                    else
                    {
                        mensaje = "No se pudo actualizar la imagen";
                    }                   
                }
            }
            catch (Exception ex)
            {
                resultado = false;
                mensaje = ex.Message;
            }

            return resultado;
        }

        public bool Eliminar(int Id, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("EliminarProducto", connection); 

                    cmd.Parameters.AddWithValue("IdProducto", Id);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;

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
