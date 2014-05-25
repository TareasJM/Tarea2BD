using System;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using Tarea2BD.Models;

namespace Tarea2BD.Controllers
{
    public class AddUser : Controller
    {
        //
        // GET: /AddUser/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Index(String UserName, String UserPass)
        {
            /*int retorno = 0;
            String sql = "Insert into usuario (Nombre, Pass) values ('{0}','{1}')";
            //MySqlCommand comando = new MySqlCommand(string.Format(sql,UserName,UserPass), BD.getConnection());
            retorno = comando.ExecuteNonQuery();
            if (retorno > 0)
            {
                MessageBox.Show("Cliente Guardado Con Exito!!", "Guardado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("No se pudo guardar el cliente", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }*/
            return View();
        }
    }
}
