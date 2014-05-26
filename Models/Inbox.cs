using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Tarea2BD.Models
{
    public class Inbox
    {
        public int id;
        public int id_user;
        public int msg_in;
        public int msg_out;

        public Inbox()
        {

        }

        public Inbox getInbox(int id)
        {
            Inbox inbox = new Inbox();
            String sql = "Select *From Inbox where id_user = '" + id + "'";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    inbox.id = reader.GetInt32(0);
                    inbox.id_user= reader.GetInt32(1);
                    inbox.msg_in = reader.GetInt32(2);
                    inbox.msg_in = reader.GetInt32(3);
       
                }
            }
            return inbox;
        }

    }
}