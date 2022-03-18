using CapaEntidad;
using CapaNegocio;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;
using ClosedXML.Excel;
using System.IO;
using System;

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

        //Region Usuario
        #region Usuario
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

        #endregion

        [HttpGet]
        public JsonResult ListaReporte(string FechaInio, string FechaFin, string IdTransaccion)
        {
            List<Reporte> lista = new List<Reporte>(); 
            lista = new CnReporte().Ventas(FechaInio, FechaFin, IdTransaccion);
             

            return Json(new { data = lista }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public JsonResult VistaDashboard()
        {
            Dashboard obj = new CnReporte().VerDashboard();


            return Json(new { resultado = obj }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public FileResult ExportarVenta(string FechaInio, string FechaFin, string IdTransaccion) 
        {
            List<Reporte> lst = new List<Reporte>();

            lst = new CnReporte().Ventas(FechaInio, FechaFin, IdTransaccion);

            DataTable dt = new DataTable();

            dt.Locale = new System.Globalization.CultureInfo("es-dom");
            dt.Columns.Add("Fecha Venta", typeof(string));
            dt.Columns.Add("Cliente", typeof(string));
            dt.Columns.Add("Producto", typeof(string));
            dt.Columns.Add("Precio", typeof(decimal));
            dt.Columns.Add("Cantidad", typeof(int));
            dt.Columns.Add("Total", typeof(decimal));
            dt.Columns.Add("IdTransaccion", typeof(string));

            foreach(Reporte rp in lst)
            {
                dt.Rows.Add(new object[]
                {
                    rp.FechaVenta,
                    rp.Cliente,
                    rp.Producto,
                    rp.Precio,
                    rp.Cantidad,
                    rp.Total,
                    rp.IdTransaccion
                });
            }

            dt.TableName = "Datos";

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);

                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);

                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.presentationml.presentation", "ReporteVenta"+ DateTime.Now.ToString() + ".xlsx");
                }
            }

        }
    }
}