using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CdReporte
    {
        public List<Reporte> Ventas(string FechaInicio, string FechaFin, string IdTransaccion)
        {

            List<Reporte> lista = new List<Reporte>();

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("ReporteVenta", connection);
                    cmd.Parameters.AddWithValue("fechaInicio", FechaInicio);
                    cmd.Parameters.AddWithValue("fechaFin", FechaFin);
                    cmd.Parameters.AddWithValue("idTransaccion", IdTransaccion);
                    cmd.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            lista.Add(
                                    new Reporte
                                    {
                                        FechaVenta = dataReader["FechaVenta"].ToString(),
                                        Cliente = dataReader["Cliente"].ToString(),
                                        Producto = dataReader["Producto"].ToString(),
                                        Precio = Convert.ToDecimal(dataReader["Precio"].ToString()),
                                        Cantidad = Convert.ToInt32(dataReader["Cantidad"].ToString()),
                                        Total = Convert.ToDecimal(dataReader["Total"]),
                                        IdTransaccion = dataReader["IdTransaccion"].ToString()
                                    }

                                );
                        }
                    }
                }


            }
            catch
            {

                lista = new List<Reporte>();
            }

            return lista;
        }

        public Dashboard VerDashboard()
        {

            Dashboard obj = new Dashboard();

            try
            {
                using (SqlConnection connection = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("ReporteDashboard", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    using (SqlDataReader dataReader = cmd.ExecuteReader())
                    {
                        while (dataReader.Read())
                        {
                            obj = new Dashboard()
                            {
                                TotalCliente = Convert.ToInt32(dataReader["TotalCliente"]),
                                TotalVenta = Convert.ToInt32(dataReader["TotalVenta"]),
                                TotalProducto = Convert.ToInt32(dataReader["TotalProducto"])
                            };
                        }
                    }
                }


            }
            catch
            {

                obj = new Dashboard();
            }

            return obj;
        }      

    }
}
