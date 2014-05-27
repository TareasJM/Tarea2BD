using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Tarea2BD.Models;

namespace Tarea2BD.Models
{   
    public class ViewTemas
    {
        public int id_topic;
        public int id_user;
        public int id_comment;
        public string nameTopic;
        public string nameUser;

        public ViewTemas()
        {


        }

        public List<ViewTemas> GetMadeTopics(int id)
        {
            List<ViewTemas> views = new List<ViewTemas>();
            String sql = "Select TOP 5 *From VIEW_TEMAS_USUARIO where id_user = '" + id + "' ORDER BY id_topic DESC";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, id), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    ViewTemas view = new ViewTemas();
                    view.id_topic = reader.GetInt32(0);
                    view.id_user = reader.GetInt32(1);
                    view.id_comment = reader.GetInt32(2);
                    view.nameTopic = reader.GetString(3);
                    view.nameUser = reader.GetString(3);
                    views.Add(view);
                }
            }

            return views;

        }
    }
}