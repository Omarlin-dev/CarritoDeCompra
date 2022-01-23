using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacionAdmin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Usuarios()
        {
            return View();
        }
        
        public JsonResult ListarUsuarios()
        {
            List<Usuario> oLista = new List<Usuario>();

            oLista = new CnUsuarios().Listar();

            return Json(new { data= oLista }, JsonRequestBehavior.AllowGet);
        } 

        [HttpPost]
        public JsonResult GuardarUsuario(Usuario user)
        {
            object Resultado;
            string mensaje = string.Empty;
            
            if(user.IdUsuario == 0)
            {
                Resultado = new CnUsuarios().RegistrarUsuario(user, out mensaje);

            }
            else
            {
                Resultado = new CnUsuarios().EditarUsuario(user, out mensaje);
            }

            return Json(new { resultado = Resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EliminarUsuario(int Id)
        {
            bool respuesta = false;
            string mensaje = string.Empty;

            respuesta = new CnUsuarios().EliminarUsuario(Id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);

        }

    }
}