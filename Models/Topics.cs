using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Tarea2BD.Models
{
    
    public class Topics
    {

        public int id_topic { get; set; }
        public int id_categoria { get; set; }
        public int id_user { get; set; }
        public string name { get; set; }
        public string descripcion { get; set; }
        public string mensaje { get; set; }
        public int publico { get; set; }

        public List<Topics> getAllTopicsByCatID(int id)
        {
            List<Topics> ListTop = new List<Topics>();
            String sql = "Select *From Topic where id_catTopic = '"+id.ToString()+"'";

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql,id), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {   

                    Topics top = new Topics();
                    top.id_topic = reader.GetInt32(0);
                    top.id_categoria = reader.GetInt32(1);
                    top.id_user = reader.GetInt32(2);
                    top.name = reader.GetString(3);
                    top.descripcion = reader.GetString(4);
                    top.mensaje = reader.GetString(5);
                    top.publico = reader.GetInt32(6);
                    ListTop.Add(top);
                }
            }

            return ListTop;
        }

        public List<Topics> getAllTopics()
        {
            List<Topics> ListTop = new List<Topics>();
            String sql = "Select *From Topic";

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    Topics top = new Topics();
                    top.id_topic = reader.GetInt32(0);
                    top.id_categoria = reader.GetInt32(1);
                    top.id_user = reader.GetInt32(2);
                    top.name = reader.GetString(3);
                    top.descripcion = reader.GetString(4);
                    top.mensaje = reader.GetString(5);
                    top.publico = reader.GetInt32(6);
                    ListTop.Add(top);
                }
            }

            return ListTop;
        }


        public Topics getTopicsByName(string name)
        {
            String sql = "Select *From Topic where nameTopic = '"+name+"'";
            Topics top = new Topics();
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, name), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                 
                    top.id_topic = reader.GetInt32(0);
                    top.id_categoria = reader.GetInt32(1);
                    top.id_user = reader.GetInt32(2);
                    top.name = reader.GetString(3);
                    top.descripcion = reader.GetString(4);
                    top.mensaje = reader.GetString(5);        
                    top.publico = reader.GetInt32(6);

                }
            }

            return top;
        }

    }//class

     
}//namespcae