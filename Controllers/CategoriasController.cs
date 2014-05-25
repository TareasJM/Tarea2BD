using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Windows.Forms;
using Tarea2BD.Models;

namespace Tarea2BD.Controllers
{
    public class CategoriasController : Controller
    {
        //
        // GET: /Categorias/
        [HttpGet,ValidateInput(false)]
        public ActionResult GeneralCat(string name)
        {
            ViewData["CatName"] = name;
            Categorias cat = new Categorias();
            MessageBox.Show(name);
            int id = cat.getIDCatName(name);
            
            List<Topics> topics = new List<Topics>();
            Topics top = new Topics();
            List<string> items = new List<string>();
            topics = top.getAllTopicsByCatID(id);
           
            for (int i = 0; i < topics.Count; i++)
            {
               
                items.Add(topics[i].name);
      
            }
            ViewBag.Items = items;
            ViewData["TCount"] = topics.Count;
            return View();
        }

        [HttpGet]
        public ActionResult GeneralTop(string name)
        {
            Topics top = new Topics();
            List<string> items = new List<string>();
            top = top.getTopicsByName(name);
            items.Add(top.name);
            items.Add(top.descripcion);
            items.Add(top.mensaje);
            ViewData["TopicIDU"] = top.id_user;
            ViewData["TopicID"] = top.id_topic;
            ViewBag.Items = items;
            ViewBag.Comments = top.n_comentarios;
            return View();
        }

        [HttpGet]
        public ActionResult Comentar(int topic)
        {
            ViewData["IDTopic"] = topic;
            return View();
        }

        [HttpPost]
        public ActionResult Comentar2()
        {
            //poner el comentario y agregarlo a generalTOp
            
            int id_topic = int.Parse(Request["idtopic"]);
            int id_user = (int)Session["UserID"];
            string msg = (string)Request["Comment"];
            String sql = "Insert into Comments (id_topic,id_user,msg) "
            + "values  ('{0}','{1}','{2}')";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, id_topic, id_user, msg), connection);
                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                MessageBox.Show("Comentario Enviado Con Exito!!", "Enviado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("No se pudo guardar el Comentario", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            return Redirect("GeneralTop");
        }

        public ActionResult NuevaCategoria()
        {
            ViewBag.Message = "Nueva Categoria";
            return View();
        }

        public ActionResult NuevoTopic()
        {
            ViewBag.Message = "Nuevo Topic";
            return View();
        }

        public ActionResult MakeCat()
        {   


            string name = (string)Request["CatName"];
            string des = (string)Request["CatDes"];
            int pub = Convert.ToInt32(Request["CatPublic"]);
            Categorias cat = new Categorias(1, name, des, pub);
            String sql = "Insert into Category (name_category,descrip,publico) "
            + "values  ('{0}','{1}','{2}')";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, name, des, pub), connection);

                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                MessageBox.Show("Categoria Guardada Con Exito!!", "Guardada", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("No se pudo guardar la categoria", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

            return Redirect("../Home/Index");
        }

        public ActionResult MakeTopic()
        {
            Categorias cat = new Categorias();
            int id_cat = cat.getIDCatName((string)ViewData["CatName"]);
            int id_user = (int)Session["UserID"];
            string name = (string)Request["TopicName"];
            string des = (string)Request["TopicDes"];
            string msg = (string)Request["TopicMsg"];
            int pub = Convert.ToInt32(Request["TopicPublic"]);
            String sql = "Insert into Topic (id_catTopic,id_userTopic,nameTopic,desTopic,msgTopic,n_comments,publico) "
            + "values  ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql,id_cat,id_user, name, des,msg,0, pub), connection);

                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                MessageBox.Show("Topic Guardado Con Exito!!", "Guardado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return Redirect("GeneralTop");
            }
            else
            {
                MessageBox.Show("No se pudo guardar el Topic", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

            return Redirect("NuevoTopic");
        }

    }
}
