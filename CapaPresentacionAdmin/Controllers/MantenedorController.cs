using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CapaPresentacionAdmin.Controllers
{
    public class MantenedorController : Controller
    {
        // GET: Mantenedor
        public ActionResult Categoria()
        {
            return View();
        }       

        public ActionResult Marca()
        {
            return View();
        }
        public ActionResult Producto() 
        {
            return View();
        }

        public JsonResult ListarCategoria()
        {
            List<Categoria> oLista = new List<Categoria>();

            oLista = new CnCategoria().Listar();

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarCategoria(Categoria obj)
        {
            object Resultado;
            string mensaje = string.Empty;

            if (obj.IdCategoria == 0)
            {
                Resultado = new CnCategoria().Registrar(obj, out mensaje);

            }
            else
            {
                Resultado = new CnCategoria().Editar(obj, out mensaje);
            }

            return Json(new { resultado = Resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarCategoria(int Id)
        {
            bool respuesta = false;
            string mensaje = string.Empty;

            respuesta = new CnCategoria().EliminarUsuario(Id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);

        }
    }
}