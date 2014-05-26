using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Drawing;
using Tarea2BD.Models;

namespace Tarea2BD.Controllers
{
    public class CategoriasController : Controller
    {
        //
        // GET: /Categorias/
        [HttpGet]
        public ActionResult GeneralCat(string name)
        {
            Session["CatName"] = name; 
            Categorias cat = new Categorias();
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
            return View();
        }

        [HttpGet]
        public ActionResult Comentar(int topic, int topicIDU)
        {
            ViewData["IDTopic"] = topic;
            ViewData["TopicIDU"] = topicIDU;
            return View();
        }

        [HttpPost]
        public ActionResult Comentar2()
        {

            int id_topic = int.Parse(Request["idtopic"]);
            int id_user = (int)Session["UserID"];
            string msg = (string)Request["Mensaje"];
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
            return RedirectToAction("GeneralTop", new { name = Session["TopicName"].ToString() });
        }

        [HttpGet]
        public ActionResult EliminarCo(int id)
        {

            string texto = "Estas seguro de Eliminar el comentario?";
            string titulo = "Eliminar Comentario";
            MessageBoxButtons button = MessageBoxButtons.YesNoCancel;
            MessageBoxIcon icon = MessageBoxIcon.Question;
            DialogResult result = MessageBox.Show(texto, titulo, button, icon);
            
            if (result.Equals(System.Windows.Forms.DialogResult.Yes))
            {
                String sql = "Delete from Comments where id_comment = '" + id + "'";
                int retorno = 0;
                using (SqlConnection connection = BD.getConnection())
                {
                    SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                    retorno = Comando.ExecuteNonQuery();
                    connection.Close();

                }
                if (retorno > 0)
                {
                    MessageBox.Show("Comentario Borrado Con Exito!!", "Enviado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("No se pudo borrar el Comentario", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
                       
            return RedirectToAction("GeneralTop", new { name = Session["TopicName"].ToString() });

        }

        [HttpGet]
        public ActionResult EditarCo(int id)
        {   
            string msg = Microsoft.VisualBasic.Interaction.InputBox("Editar Mensaje:");
            String sql = "Update Comments set msg = '" + msg + "' where id_comment = '" + id + "'";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                MessageBox.Show("Comentario Editado Con Exito!!", "Editado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("No se pudo Editar el Comentario", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
            return RedirectToAction("GeneralTop", new { name = Session["TopicName"].ToString() });

        }

        [HttpGet]
        public ActionResult EliminarCa(int id)
        {   
            string texto = "Estas seguro de Eliminar la categoria?";
            string titulo = "Eliminar Categoria";
            MessageBoxButtons button = MessageBoxButtons.YesNoCancel;
            MessageBoxIcon icon = MessageBoxIcon.Question;
            DialogResult result = MessageBox.Show(texto, titulo, button, icon);
            List<Topics> topics = new List<Topics>();
            Comments comments = new Comments();
            Topics top = new Topics();
            topics = top.getAllTopicsByCatID(id);
            if (result.Equals(System.Windows.Forms.DialogResult.Yes))
            {
                
                for (int i = 0; i < topics.Count; i++)
                {
                    if (comments.DeleteCommentsByIDTopic(topics[i].id_topic))
                    {
                        continue;                 
                    }
                    else
                    {
                        MessageBox.Show("Comentario de " + topics[i].id_topic + "no eliminado");
                    }
                }
                if (!top.DeleteTopicsByIDCat(id))
                {
                    MessageBox.Show("Topic de " + id + "no eliminado");   
                }

                String sql = "Delete from Category where id_category = '" + id.ToString() + "'";
                int retorno = 0;
                using (SqlConnection connection = BD.getConnection())
                {
                    SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                    retorno = Comando.ExecuteNonQuery();
                    connection.Close();

                }
                if (retorno > 0)
                {
                    MessageBox.Show("Categoria Borrada Con Exito!!", "Eliminada", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("No se pudo borrar la Categoria", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
            return RedirectToAction("Categorias", "Home");
        }

        public ActionResult NuevaCategoria()
        {
            ViewBag.Message = "Nueva Categoria";
            Categorias cat = new Categorias();
            List<string> names = cat.getAllNamesCat();
            ViewBag.Items = names;
            ViewBag.Serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return View();
        }

        [HttpGet]
        public ActionResult NuevoTopic(string cat)
        {
            ViewBag.Message = "Nuevo Topic";
            ViewData["CatName2"] = cat;
            Topics topic = new Topics();
            List<string> names = topic.getAllNamesTopic();
            ViewBag.Items = names;
            ViewBag.Serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            return View();
        }

        public ActionResult MakeCat()
        {
            int pub = 0;
            if (Request["CatPub"] != null)
            {
                pub = 1;
            }
            MessageBox.Show("check box value = " + pub);
            string name = (string)Request["CatName"];
            string des = (string)Request["CatDes"];
            String sql = "Insert into Category (name_category,descrip,publico) "
            + "values  ('{0}','{1}','{2}')";
            int retorno = 0;
            ViewData["CatName"] = name;
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

            return Redirect("../Home/Categorias");
        }

        public ActionResult MakeTopic()
        {
            int pub = 0;
            if (Request["TopicPub"] != null)
            {
                pub = 1;
            }
            Categorias cat = new Categorias();
            int id_cat = cat.getIDCatName((string)Request["Cat_name"]);
            int id_user = (int)Session["UserID"];
            string name = (string)Request["TopicName"];
            string des = (string)Request["TopicDes"];
            string msg = (string)Request["TopicMsg"];
            String sql = "Insert into Topic (id_catTopic,id_userTopic,nameTopic,desTopic,msgTopic,publico) "
            + "values  ('{0}','{1}','{2}','{3}','{4}','{5}')";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql,id_cat,id_user, name, des,msg,pub), connection);

                retorno = Comando.ExecuteNonQuery();
                connection.Close();

            }
            if (retorno > 0)
            {
                MessageBox.Show("Topic Guardado Con Exito!!", "Guardado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return RedirectToAction("GeneralCat",new{name = (string)Request["Cat_name"]});
            }
            else
            {
                MessageBox.Show("No se pudo guardar el Topic", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

            return Redirect("NuevoTopic");
        }

        [HttpGet]
        public ActionResult EliminarTop(string name)
        {   

            string texto = "Estas seguro de Eliminar el topic?";
            string titulo = "Eliminar Topic";
            MessageBoxButtons button = MessageBoxButtons.YesNoCancel;
            MessageBoxIcon icon = MessageBoxIcon.Question;
            DialogResult result = MessageBox.Show(texto, titulo, button, icon);

            if (result.Equals(System.Windows.Forms.DialogResult.Yes))
            {
                String sql = "Delete from Topic where nameTopic = '" + name + "'";
                int retorno = 0;
                using (SqlConnection connection = BD.getConnection())
                {
                    SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                    retorno = Comando.ExecuteNonQuery();
                    connection.Close();

                }
                if (retorno > 0)
                {
                    MessageBox.Show("Topic Borrado Con Exito!!", "Eliminado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("No se pudo borrar el Topic", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }

             return Redirect("GeneralCat");


        }

    }
}
