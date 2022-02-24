using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;


namespace CapaNegocio
{
    public class CnReporte
    {
        private CdReporte objCapaDato = new CdReporte();

        public Dashboard VerDashboard()
        {
            return objCapaDato.VerDashboard();
        }

    }
}
