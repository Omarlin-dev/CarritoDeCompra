using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;


namespace CapaNegocio
{
    public class CnReporte
    {
        private CdReporte objCapaDato = new CdReporte();

        public List<Reporte> Ventas(string FechaInicio, string FechaFin, string IdTransaccion)
        {
            return objCapaDato.Ventas(FechaInicio, FechaFin, IdTransaccion);
        }

        public Dashboard VerDashboard()
        {
            return objCapaDato.VerDashboard();
        }

    }
}
