using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacionAdmin.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Access
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CambiarClave()
        {
            return View();
        }
        public ActionResult Reestablecer()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string correo, string clave)
        {
            Usuario oUsuario = new Usuario();
            oUsuario = new CnUsuarios().Listar().Where(d => d.Correo == correo && d.Clave == CnRecurso.ConvertirSha256(clave)).FirstOrDefault();

            if(oUsuario == null)
            {
                ViewBag.Error = "Correo o contrasena no correcta";
                return View();
            }
            else
            {
                if (oUsuario.Reestrablecer)
                {
                    TempData["IdUsuario"] = oUsuario.IdUsuario;
                    return RedirectToAction("CambiarClave");
                }

                ViewBag.Error = null;
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        public ActionResult CambiarClave(string IdUsuario, string ClaveActual, string NuevaClave, string ConfirmarClave)
        {
            Usuario usuario = new Usuario();

            usuario = new CnUsuarios().Listar().Where( d=> d.IdUsuario == int.Parse(IdUsuario)).FirstOrDefault();

            if(usuario.Clave != CnRecurso.ConvertirSha256(ClaveActual))
            {
                TempData["IdUsuario"] = IdUsuario;
                ViewData["vClave"] = "";
                ViewBag.Error = "La contrasena actual no es correcta";
                return View();
            }
            else if(NuevaClave != ConfirmarClave)
            {
                TempData["IdUsuario"] = IdUsuario;
                ViewData["vClave"] = ClaveActual;
                ViewBag.Error = "La contrasena no coinciden";
                return View();
            }

            ViewData["vClave"] = "";

            NuevaClave = CnRecurso.ConvertirSha256(NuevaClave);

            string mensaje = string.Empty;

            bool respuesta = new CnUsuarios().CambiarClave(int.Parse(IdUsuario), NuevaClave, out mensaje);

            if (respuesta)
                return RedirectToAction("Index");
            else {

                TempData["IdUsuario"] = IdUsuario;
                ViewBag.Error = mensaje;
                return View();

            }
        }
    }
}