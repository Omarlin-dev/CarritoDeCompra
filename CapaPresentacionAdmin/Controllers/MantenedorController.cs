using CapaEntidad;
using CapaNegocio;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
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
        #endregion//******** MARCA *******

        //******** Producto *******
        #region Producto
        public JsonResult ListarProducto()
        {
            List<Producto> oLista = new List<Producto>();
            oLista = new CnProducto().Listar();

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GuardarProducto(string objeto, HttpPostedFileBase archivoImagen)
        {
            object Resultado;
            string mensaje = string.Empty;
            bool operacionExitosa = true;
            bool GuardarImagenExito = true;

            Producto producto = new Producto();
            producto = JsonConvert.DeserializeObject<Producto>(objeto);

            decimal precio;

            if (decimal.TryParse(producto.PrecioTexto, NumberStyles.AllowDecimalPoint, new CultureInfo("es-PE"), out precio))
            {
                producto.Precio = precio;
            }
            else
            {
                return Json(new { operacionExitosa = false, mensaje = "El formato del precio debe ser ##.##" }, JsonRequestBehavior.AllowGet);
            }

            if (producto.IdProducto == 0)
            {
                int IdProductoGenerado = new CnProducto().Registrar(producto, out mensaje);
                
                if(IdProductoGenerado != 0)
                {
                    producto.IdProducto = IdProductoGenerado;
                }
                else
                {
                    operacionExitosa = false;
                }

            }
            else
            {
                operacionExitosa = new CnProducto().Editar(producto, out mensaje);
            }

            if (operacionExitosa)
            {
                if(archivoImagen != null)
                {

                    string rutaGuardar = ConfigurationManager.AppSettings["ServidorFotos"];
                    string extension = Path.GetExtension(archivoImagen.FileName);
                    string nombreImagen = string.Concat(producto.IdProducto.ToString(), extension);

                    try
                    {
                        archivoImagen.SaveAs(Path.Combine(rutaGuardar, nombreImagen));
                    }
                    catch (Exception ex)
                    {
                        string msg = ex.Message;
                        GuardarImagenExito = false;
                    }

                    if (GuardarImagenExito)
                    {
                        producto.RutaImagen = rutaGuardar;
                        producto.NombreImagen = nombreImagen;

                        bool respuesta = new CnProducto().GuardarDatosImagen(producto, out mensaje);
                    }
                    else
                    {
                        mensaje = "Se Guardo el producto pero hubo problemas con la imagen";
                    }
                }
            }

            return Json(new { operacionExitosa = operacionExitosa, idGenerado = producto.IdProducto, mensaje = mensaje }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ImagenProducto(int Id)
        {
            bool Conversion;
            Producto producto = new CnProducto().Listar().Where(p => p.IdProducto == Id).FirstOrDefault();

            string textoBase64 = CnRecurso.ConvertirBase64(Path.Combine(producto.RutaImagen, producto.NombreImagen), out Conversion);

            return Json(new { 
                
                conversion = Conversion,
                textoBase64 = textoBase64,
                extension = Path.GetExtension(producto.NombreImagen)
            
            }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult EliminarProducto(int Id)
        {
            bool respuesta = false;
            string mensaje = string.Empty;

            respuesta = new CnProducto().Eliminar(Id, out mensaje);

            return Json(new { resultado = respuesta, mensaje = mensaje }, JsonRequestBehavior.AllowGet);

        }
        #endregion
    }
}