using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Tarea2BD.Models;

namespace Tarea2BD.Models
{
    public class ViewComments
    {
        public int id_topic;
        public int id_user;
        public int id_comment;
        public string nameTopic;
        public string nameUser;

        public ViewComments()
        {


        }

        public List<ViewComments> GetMadeTopics(int id)
        {
            List<ViewComments> views = new List<ViewComments>();
            String sql = "Select TOP 5 *From VIEW_ULTIMOS_COMENTARIOS where id_user = '" + id + "' ORDER BY id_comment DESC";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, id), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    ViewComments view = new ViewComments();
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