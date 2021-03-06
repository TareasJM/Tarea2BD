﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Windows.Forms;
using Tarea2BD.Models;

namespace Tarea2BD.Models
{
    public class Comments
    {
        public int id;
        public int id_topic;
        public int id_user;
        public string msg;

        public Comments()
        {
        }

        public Comments(int id, int id_topic, int id_user, string msg)
        {
            this.id = id;
            this.id_topic = id_topic;
            this.id_user = id_user;
            this.msg = msg;
        }

        public List<Comments> getAllCommentByIDTopic(int id)
        {

            String sql = "Select *From Comments where id_topic = '"+id.ToString()+"'";
            List<Comments> Comments = new List<Comments>();
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    Comments com = new Comments();
                    com.id = reader.GetInt32(0);
                    com.id_topic = reader.GetInt32(1);
                    com.id_user = reader.GetInt32(2);
                    com.msg = reader.GetString(3);
                    Comments.Add(com);
                }
            }
            return Comments;
        }


        public bool DeleteCommentsByIDTopic(int id)
        {

            String sql = "Delete From Comments where id_topic = '" + id.ToString() + "'";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                retorno = Comando.ExecuteNonQuery();
                
                if (retorno >= 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
              
        }

    }
}