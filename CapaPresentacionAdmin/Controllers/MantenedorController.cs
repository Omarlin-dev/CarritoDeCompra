using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
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

        //******** CATEGORIA *******
        #region CATEGORIA
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
        #endregion

        //******** MARCA *******
        #region MARCA
        public JsonResult ListarMarca()
        {
            List<Marca> oLista = new List<Marca>();
            oLista = new CnMarca().Listar();

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarMarca(Marca obj)
        {
            object Resultado;
            string mensaje = string.Empty;

            if (obj.IdMarca == 0)
            {
                Resultado = new CnMarca().Registrar(obj, out mensaje);

            }
            else
            {
                Resultado = new CnMarca().Editar(obj, out mensaje);
            }

            return Json(new { resultado = Resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarMarca(int Id)
        {
            bool respuesta = false;
            string mensaje = string.Empty;

            respuesta = new CnMarca().EliminarUsuario(Id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);

        }
        #endregion
    }
}