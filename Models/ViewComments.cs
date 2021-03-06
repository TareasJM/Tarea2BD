﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Tarea2BD.Models;

namespace Tarea2BD.Models
{
    public class ViewComments
    {
        public int id_user;
        public string nameUser;
        public int id_topic;
        public int id_catTopic;
        public string nameTopic;
        public int id_comment;
        
        public ViewComments()
        {


        }

        public List<ViewComments> GetMadeComments(int id)
        {
            List<ViewComments> views = new List<ViewComments>();
            String sql = "Select TOP 5 *From VIEW_ULTIMOS_TEMAS_COMENTADOS where id_user = '" + id + "' ORDER BY id_comment DESC";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, id), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    ViewComments view = new ViewComments();
                    view.id_user = reader.GetInt32(0);
                    view.nameUser = reader.GetString(1);
                    view.id_topic = reader.GetInt32(2);
                    view.id_catTopic = reader.GetInt32(3);
                    view.nameTopic = reader.GetString(4);  
                    view.id_comment = reader.GetInt32(5);
                    
                    views.Add(view);
                }
            }

            return views;

        }
    }
}