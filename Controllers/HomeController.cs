﻿using System;
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



        public ActionResult Categorias()
        {
            ViewBag.Message = "Categorias";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            return View();
        }

        public ActionResult EditarPerfil(string name, int id)
        {
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            Session["CatName"] = Session["CatName"];
            Session["TopicName"] = Session["TopicName"];
            ViewData["VerPerfilID"] = id;
            ViewBag.SessionUserIDG = Session["UserIDG"];
            ViewBag.Message = "Perfil de " + name;

            return View();
        }


        public ActionResult EditarPerfil2()
        {
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            int id_group = 0;
            if (Session["UserIDG"].Equals(1))
            {
                id_group = int.Parse(Request["UserType"]);
            }
            string user = (string)Request["UserName"];
            string pass = (string)Request["PassUser"];
            string born = (string)Request["UserBorn"];
            string url = (string)Request["UserAvatar-Url"];
            int id_veedor = int.Parse(Request["IDVeedor"]);
            String sql;
            int retorno = 0;
            if (Session["UserIDG"].Equals(1))
            {
                sql = "Update Users set id_group ='" + id_group + "', pass = '" + pass + "'," +
               "born = '" + born + "' , a_url = '" + url + "' where name = '" + user + "'";
            }
            else
            {
                sql = "Update Users set pass = '" + pass + "'," + "born = '" + born + "' ," +
                    "a_url = '" + url + "' where name = '" + user + "'";
            }
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                MessageBox.Show("Perfil Editado Con Exito!!", "Editado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("No se pudo editar el Perfil", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            }
            if (id_veedor.Equals(Session["UserID"]))
            {
                return Redirect("MiPerfil");
            }
            else
            {
                return RedirectToAction("VerPerfil", new { name = user, id = id_veedor });
            }
        }

        public ActionResult EnviarMP()
        {
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            ViewBag.Message = "Mensaje Privado";
            User user = new User();
            Inbox inbox = new Inbox();
            int retorno = 0;
            string message = (string)Request["Mensaje"];
            string title = (string)Request["title"];
            string destiny = (string)Request["Destinatario"];
            int origen = (int)Session["UserID"];
            if (!user.Checkuser(destiny))
            {
                MessageBox.Show("No Existe Usuario Destino", "Invalido", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return Redirect("MP");
            }
            user = user.getUser(destiny);
            inbox = inbox.getInbox(user.id);
            DateTime thisDay = DateTime.Now;
            string date = thisDay.ToString();

            String sql = "Insert into mp (id_userfrom,id_inbox,title,check_read,messages,date_send)"
             + "values ('{0}','{1}','{2}','{3}','{4}','{5}')";

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, origen, inbox.id, title, 0, message, date), connection);

                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {

                MessageBox.Show("Mensaje Enviado Con Exito!!", "Enviado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return Redirect("UserIn");
            }
            else
            {
                MessageBox.Show("No se pudo enviar el Mensaje", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            }
            return Redirect("MP"); ;
        }

        public ActionResult Index()
        {
            ViewBag.Message = "Index";
            string items = "Pass doesn´t match";
            ViewBag.Items = items;
            Session["UserIDG"] = 4;
            Session["UserID"] = 0;
            Session["User"] = null;
            Session["CatName"] = null;
            Session["TopicName"] = null;

            //return View();
            return RedirectToAction("Categorias","Home");
        }

        public ActionResult Inbox()
        {
            ViewBag.Message = "Inbox";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            return View();
        }

        public ActionResult Login()
        {
            ViewBag.Message = "Login";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            User users = new User();
            List<string> names = users.getAllUsersNamesNormal();
            List<string> passes = users.getAllUsersPass();
            ViewBag.Items = names;
            ViewBag.items2 = passes;
            ViewBag.Serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            ViewBag.Serializer2 = new System.Web.Script.Serialization.JavaScriptSerializer();
            return View();
        }

        public ActionResult Logout()
        {
            Session["User"] = null;
            Session["UserID"] = 0;
            Session["UserIDG"] = 4;
            return Redirect("Index");
        }


        public ActionResult MiPerfil()
        {
            ViewBag.Message = "Mi Perfil";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            Session["CatName"] = null;
            Session["TopicName"] = null;
            return View();
        }

        [HttpGet]
        public ActionResult MP(string name, string title)
        {
            ViewBag.Message = "Mensaje Privado";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            ViewBag.name = name;
            ViewBag.Asunto = title;
            User users = new User();
            List<string> names = users.getAllUsersNames();
            ViewBag.Items = names;
            ViewBag.Serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return View();
        }

        public ActionResult Registracion()
        {
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            ViewBag.Message = "Formulario de Registro";
            User users = new User();
            List<string> names = users.getAllUsersNames();
            ViewBag.Items = names;
            ViewBag.Serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return View();
        }

        public ActionResult Registracion2()
        {
            //G_User gu = new G_User();
            
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            int retorno = 0;
            ViewBag.Message = "Formulario de Registro";
            string user = (string)Request["UserName"];
            //int id_group = int.Parse(Request["UserType"]);
            string pass = (string)Request["PassUser"];
            string rpass = (string)Request["RPass"];
            string born = (string)Request["UserBorn"];
            string sex = (string)Request["UserSex"];
            string url = (string)Request["UserAvatar-Url"];
            DateTime thisDay = DateTime.Now;
            string date = thisDay.ToString();
            //int id_group = gu.getIDGUser(type);
            String sql = "Insert into Users (id_group,name,pass,n_comment,a_url,born,sex,date_r) "
            + "values  ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')";
            String sql2 = "Insert into inbox (id_user,messages_in,messages_out)"
                + "values ('{0}','{1}','{2}')";

            User u = new User();

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql,3,user,pass,0,url,born,sex,date), connection);

                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                u = u.getUser(user);
          
                using (SqlConnection connection = BD.getConnection())
                {
                    SqlCommand Comando = new SqlCommand(string.Format(sql2, u.id, 0, 0), connection);
                    retorno = Comando.ExecuteNonQuery();
                    connection.Close();
                }
                MessageBox.Show("Cliente Guardado Con Exito!!", "Guardado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return Redirect("Login");
            }
            else
            {
                MessageBox.Show("No se pudo guardar el cliente", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            }
            
            return Redirect("Registracion");
        }

        [HttpGet]
        public ActionResult ResponderMP(string name, string title)
        {
            ViewBag.Message = "Mensaje Privado";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            ViewBag.name = name;
            ViewBag.Asunto = title;
            return View();
        }


        public ActionResult UserIn()
        {
            ViewBag.Message = "Mi cuenta";
            return View();
        }

        public ActionResult UserIn2()
        {
            ViewBag.Message = "Mi cuenta";
            string name = (string)Request["UserName"];
            string pass = (string)Request["PassUser"];
            User user = new User();
            user = user.getUser(name);
            Session["User"] = name;
            Session["UserID"] = user.id;
            Session["UserIDG"] = user.id_group;
            //MessageBox.Show("Bienvenido " + user.name,"Wellcome" ,MessageBoxButtons.OK);
            //return Redirect("UserIn");
            return Redirect("Categorias");
        }

        [HttpGet]
        public ActionResult VerMP(int id)
        {
            ViewBag.Message = "Inbox";
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            MP mp = new MP();
            mp = mp.getMPByID(id);
            User user = new User();
            user = user.getUserID(mp.id_from); 
            List<string> items = new List<string>();
            items.Add(mp.title);
            items.Add(mp.date_send);
            items.Add(mp.msg);
            items.Add(user.name);
            ViewBag.Items = items;
            if (mp.check.Equals(1))
            {
                return View();
            }
            String sql = "Update  MP set check_read = '1' where id_message = '" + id + "'";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            return View();
        }

        [HttpGet]
        public ActionResult VerPerfil(string name,int id)
        {
            Session["UserIDG"] = Session["UserIDG"];
            Session["UserID"] = Session["UserID"];
            Session["User"] = Session["User"];
            Session["CatName"] = Session["CatName"];
            Session["TopicName"] = Session["TopicName"];
            ViewData["VerPerfilID"] = id;
            ViewBag.Message = "Perfil de " + name;
            return View();
        }

    }
}
