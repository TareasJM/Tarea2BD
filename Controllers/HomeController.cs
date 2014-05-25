using System;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using Tarea2BD.Models;

namespace Tarea2BD.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Index";
            string items = "Pass doesn´t match";
            ViewBag.Items = items;
            Session["UserIDG"] = 4;
            return View();
        }
 
        public ActionResult Registracion()
        {
            G_User gu = new G_User();
            int retorno = 0;
            ViewBag.Message = "Formulario de Registro";
            List<string> items = new List<string>();
            items.Add("Pass doesn´t match");
            items.Add("Complete camp");
            ViewBag.Items = items;
            string user = (string)Request["UserName"];
            string type = (string)Request["UserType"];
            string pass = (string)Request["PassUser"];
            string rpass = (string)Request["RPass"];
            string born = (string)Request["UserBorn"];
            string sex = (string)Request["UserSex"];
            string url = (string)Request["UserAvatar-Url"];
            int cero = 0;
            int id_group = gu.getIDGUser(type);
            String sql = "Insert into users (id_group,name,pass,n_comment,a_url,born,sex,date_r) "
            + "values  ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')";

            if (user != null && pass != null)
            {
                using (SqlConnection connection = BD.getConnection())
                {
                    SqlCommand Comando = new SqlCommand(string.Format(sql,id_group,user,pass,cero,url,born,sex,born), connection);

                    retorno = Comando.ExecuteNonQuery();
                    connection.Close();

                }
                if (retorno > 0)
                {
                    MessageBox.Show("Cliente Guardado Con Exito!!", "Guardado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return Redirect("UserIn");
                }
                else
                {
                    MessageBox.Show("No se pudo guardar el cliente", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

                }
            }
            return View();
        }

        public ActionResult Login()
        {
            ViewBag.Message = "Login";
            return View();
        }

        public ActionResult Logout()
        {
            Session["User"] = null;
            Session["UserIDG"] = null;
            return Redirect("Index");
        }

        public ActionResult UserIn()
        {
            ViewBag.Message = "Mi cuenta";
            return View();
        }

        public ActionResult UserIn2()
        {
            ViewBag.Message = "Mi cuenta";
            ViewBag.Items = "Complete Camp";
            string name = (string)Request["UserName"];
            string pass = (string)Request["PassUser"];       
            User user = new User();
            user = user.getUser(name);

            Session["User"] = name;
            Session["UserID"] = user.id;
            Session["UserIDG"] = user.id_group;
            if (!user.name.Equals(name) && !user.pass.Equals(pass))
            {
                MessageBox.Show("Usuario o Pass no Coinciden", "Error", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return Redirect("Login");
            }
            MessageBox.Show("Bienvenido " + name , "Welcome", MessageBoxButtons.OK, MessageBoxIcon.Information);
            return Redirect("UserIn");
        }

        public ActionResult Tema()
        {
            ViewBag.Message = "Nuevo Tema";

            return View();
        }

        public ActionResult Categorias()
        {
            ViewBag.Message = "Categorias";
            List<String> ListCat = new List<String>();
            return View();
        }

        public ActionResult MiPerfil()
        {
            ViewBag.Message = "Mi Perfil";

            return View();
        }

        public ActionResult VerPerfil(int id)
        {
            ViewData["VerPerfilID"] = id;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Página de descripción de la aplicación.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Página de contacto.";

            return View();
        }
    }
}
