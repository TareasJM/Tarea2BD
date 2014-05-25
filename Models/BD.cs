using System;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace Tarea2BD.Models
{
    public class BD
    {
        public static SqlConnection getConnection()
        {
            SqlConnection connection = new SqlConnection("Data Source=SALINAS-VAIO\\SQLEXPRESS2008;Initial Catalog=BaseDeDatos;Integrated Security=True");
            connection.Open();

            return connection;

        }

        public static void getUser(String name)
        {
            String sql = "Select Name From users where name like '%{0}%'";
            using (SqlConnection connection = BD.getConnection())
            {
                SqlCommand Comando = new SqlCommand(string.Format(sql, name), connection);

                SqlDataReader reader = Comando.ExecuteReader();
                while (reader.Read())
                {
                    MessageBox.Show(reader.GetString(0));
                    if(!name.Equals(reader.GetString(0)))
                    {
                        MessageBox.Show("User doesn´t match");
                    }
                }
                connection.Close();

            }
        }


        /*public void Desconectar()
        {
            MiConexion.Close();
        }

        public void EjecturarSql(String Query) // funcion para ejecutar todas nuestras querys...
        {
            SqlCommand MiComando = new SqlCommand(Query, this.MiConexion); //recibe cadena de texto

            int FilasAfectadas = MiComando.ExecuteNonQuery(); // se ejecuta la query. Retorna un valor entero

            if (FilasAfectadas > 0) //se realizo exitosamente
            {
                MessageBox.Show("Cliente Guardado Con Exito!!", "Guardado", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //MessageBox.Show("")......
            }
            else
            {
                MessageBox.Show("No se pudo guardar el cliente", "Fallo!!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                //ver como mandar mensaje al usuario...
                //error!

            }
        }
        /*public void ActualizarGrid(DataGridView dg, String Query){
         this.Conectar(); //se conecta a la base de datos..
         System.Data.DataSet MiDataSet = new System.Data.DataSet(); // crear data set
             
         SqlDataAdapter MiDataAdapter = new SqlDataAdapter(Query,MiConexion); //crear adaptador de datos
             
           
         *
         *
             
         //Llenar el data set, solo se puede hacer a traves de un data adapter
         *
         MiDataAdapter.Fill(MiDataSet,"alumno");
         dg.DataSource = MiDataSet;
         dg.DataMember = "alumno"; //llenar el valor adecuado a las propiedades del DataGrid
           
         this.Desconectar(); //desconectarse de la bd.
         }*/

    }
}