using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Tarea2BD.Models;

namespace Tarea2BD.Models
{
    public class G_User
    {
        public int id;
        public string name;

        public G_User()
        {
        }

        public int getIDGUser(string name)
        {
            String sql = "Select id_group From Group_user where name_group like '%{0}%'";
            int id = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, name), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    id = reader.GetInt32(0);
                }
            }
            return id;
        }

    }
}