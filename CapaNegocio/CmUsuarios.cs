using CapaDatos;
using CapaEntidad;
using System.Collections.Generic;

namespace CapaNegocio
{
    public class CmUsuarios
    {
        private CdUsuario objCapaDato = new CdUsuario();

        public List<Usuario> Listar()
        {
            return objCapaDato.Listar();
        }
    }
}
