using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Tarea2BD.Models
{
    public class MP
    {
        public int id;
        public int id_from;
        public int id_inbox;
        public int check;
        public string msg;
        public string date_send;
        public string title;

        public MP()
        {

        }

        public List<MP> getMyMPs(int id)
        {
            List<MP> mps = new List<MP>();
            String sql = "Select *From MP where id_inbox = '" + id + "'";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    MP mp = new MP();
                    mp.id = reader.GetInt32(0);
                    mp.id_from = reader.GetInt32(1);
                    mp.id_inbox = reader.GetInt32(2);
                    mp.title = reader.GetString(3);
                    mp.check = reader.GetInt32(4);
                    mp.msg = reader.GetString(5);
                    mp.date_send = reader.GetString(6);            
                    mps.Add(mp);
                }
            }
            return mps;
        }

        public MP getMPByID(int id)
        {
            MP mp = new MP();
            String sql = "Select *From MP where id_message = '" + id + "'";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    
                    mp.id = reader.GetInt32(0);
                    mp.id_from = reader.GetInt32(1);
                    mp.id_inbox = reader.GetInt32(2);
                    mp.title = reader.GetString(3);
                    mp.check = reader.GetInt32(4);
                    mp.msg = reader.GetString(5);
                    mp.date_send = reader.GetString(6);
                   
                   
                }
            }
            return mp;
        }
    }
}