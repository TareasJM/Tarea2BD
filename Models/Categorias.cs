﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Tarea2BD.Models
{
    public class Categorias
    {

        public int id_categoria { get; set; }
        public string name { get; set; }
        public string descripcion { get; set; }
        public int publico { get; set; }

        public Categorias()
        {
        }

        public Categorias(int id_categoria, string name, string descripcion, int publico)
        {
            this.id_categoria = id_categoria;
            this.name = name;
            this.descripcion = descripcion;
            this.publico = publico;
        }
        //0 false , 1 true

        public List<Categorias> getAllCategories()
        {
            List<Categorias> ListCat = new List<Categorias>();
            String sql = "Select *From Category order by name_category";

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    
                    Categorias cat = new Categorias();
                    cat.id_categoria = reader.GetInt32(0);
                    cat.name = reader.GetString(1);
                    cat.descripcion = reader.GetString(2);
                    cat.publico = reader.GetInt32(3);
                   

                    ListCat.Add(cat);
                }
            }

            return ListCat;
        }

        public List<int> getAllIdsCat()
        {
            List<int> ListCat = new List<int>();
            String sql = "Select id_category From Category order by id_category";

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    
                    int cat = reader.GetInt32(0);
                    ListCat.Add(cat);
                }
            }

            return ListCat;
        }

        public int getIDCatName(string name)
        {
            String sql = "Select id_category From Category where name_category = '"+name+"'";
            int id = 0;
   
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql,name), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                   
                    id = reader.GetInt32(0);
                }
            }
            return id;
        }

        public List<string> getAllNamesCat()
        {
            List<string> ListCat = new List<string>();
            String sql = "Select name_category From Category order by id_category";

            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    
                    string cat = reader.GetString(0).ToUpper();
                    ListCat.Add(cat);
                }
            }

            return ListCat;
        }

        public string getLasTopicCommentedForIDCat(int id_cat)
        {

            String sql = "Select TOP(1) nameTopic From VIEW_ULTIMOS_TEMAS_COMENTADOS WHERE id_catTopic =" + id_cat + "order by id_comment DESC";
            string name = "";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {

                    name = reader.GetString(0).ToUpper();
                    
                }
            }

            return name;
        }

    }
}