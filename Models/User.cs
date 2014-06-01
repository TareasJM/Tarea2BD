using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Windows.Forms;
using Tarea2BD.Models;

namespace Tarea2BD.Models
{
    public class User
    {
        public int id { get; set; }
        public int id_group { get; set; }
        public string name { get; set; }
        public string pass { get; set; }
        public int comments { get; set; }
        public string a_url { get; set; }
        public string born { get; set; }
        public string sex { get; set; }
        public string date_r { get; set; }

        public User()
        {

        }

        public User(int id, int id_group, string name, string pass, int comments, string a_url,
            string born, string sex, string date_r)
        {
            this.id = id;
            this.id_group = id_group;
            this.name = name;
            this.pass = pass;
            this.comments = comments;
            this.a_url = a_url;
            this.born = born;
            this.sex = sex;
            this.date_r = date_r;
        }

        public User getUser(string name)
        {
            String sql = "Select *From Users where name = '"+name+"'";
            User user = new User();
            user.name = "vacio";
            user.pass = "vacio";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                    SqlDataReader reader = Comando.ExecuteReader();
                    while (reader.Read())
                    {

                        user.id = reader.GetInt32(0);
                        user.id_group = reader.GetInt32(1);
                        user.name = reader.GetString(2);
                        user.pass = reader.GetString(3);
                        user.comments = reader.GetInt32(4);
                        user.a_url = reader.GetString(5);
                        user.born = reader.GetString(6);
                        user.sex = reader.GetString(7);
                        user.date_r = reader.GetString(8);
                    }             
            }
            return user;
        }

        public User getUserID(int id)
        {
            String sql = "Select *From Users where id_user = '"+id.ToString()+"'";
            User user = new User();
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    user.id = reader.GetInt32(0);
                    user.id_group = reader.GetInt32(1);
                    user.name = reader.GetString(2);
                    user.pass = reader.GetString(3);
                    user.comments = reader.GetInt32(4);
                    user.a_url = reader.GetString(5);
                    user.born = reader.GetString(6);
                    user.sex = reader.GetString(7);
                    user.date_r = reader.GetString(8);
                }
            }
            return user;
        }


        public Boolean Checkuser(string name)
        {   

            String sql = "Select *From Users where name = '" + name + "'";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                retorno = Comando.ExecuteNonQuery();
                connection.Close();
                if (retorno < 0)
                {
                    return true;
                }

                
            }
            return false;
        }

        public List<string> getAllUsersNames()
        {
            String sql = "Select name From Users order by id_user";
            List<string> users = new List<string>();
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    string user = reader.GetString(0).ToUpper();
                    users.Add(user);
                }
            }
            return users;
        }

        public List<string> getAllUsersPass()
        {
            String sql = "Select pass From Users order by id_user";
            List<string> users = new List<string>();
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    string pass = reader.GetString(0);
                    users.Add(pass);
                }
            }
            return users;
        }


        public bool checkUserAndPass(string name, string pass)
        {
            String sql = "Select name, pass From Users where name = '" + name + "' and pass = '"+pass+"'";
            int retorno = 0;
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);
                retorno = Comando.ExecuteNonQuery();
                if (retorno > 0)
                {
                    return true;
                }
                
            }
            return false;
        }

    }
}