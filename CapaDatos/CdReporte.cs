using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CdReporte
    {

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
