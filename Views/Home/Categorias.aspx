<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>
<%  Categorias cat = new Categorias();
    List<Categorias> categorias = new List<Categorias>();
    categorias = cat.getAllCategories();%>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
</head>
<body>
    
    <div>
        <div id="header">
            
            <div id="contentHeader">

                <div id="BH">
                    <ul>
                        <%if( Session["User"] == null)
                        {%>
                        <li><%:Html.ActionLink("Home","Index","Home")%></li>
                        <li><%:Html.ActionLink("Login","Login","Home")%></li>
                        <li><%:Html.ActionLink("Register","Registracion","Home")%></li>
                        <% }%>
                        <%else
                          {%>
                        <li><%:Html.ActionLink("Home","UserIn","Home")%></li>
                        <li><%:Html.ActionLink((string)Session["User"],"MiPerfil","Home")%></li>
                        <li><%:Html.ActionLink("Logout","Logout","Home")%></li>
                        <%}%>
                    </ul>
                </div> 

                <div id="titulo">
                    <h2>Foro Tarea 2 Base de Datos</h2> 
                </div>
            </div>
                 
        </div>

        <div id="content">
            <div id="CI">

            </div>
            <div id="CC"> 
                     <%ViewData["Count"] = categorias.Count;%>             
                     <%if(!categorias.Count.Equals(0))
                       {%>
                          
                   
                            <%for (int i = 0; i < categorias.Count; i++ )
                            {
                            if(!Session["UserIDG"].Equals(4) || categorias[i].publico.Equals(0))    
                            { %>
                            
                            <table style="margin:auto; padding-top:30px" >
                                <tr>
                                    <td><%:Html.ActionLink(categorias[i].name, "GeneralCat", "Categorias", new { name = categorias[i].name }, new { @class = "boton" })%></td>
                                    <%if(Session["UserIDG"].Equals(1) || Session["UserIDG"].Equals(2))
                                      {%>
                                    <td><%:Html.ActionLink("Eliminar","EliminarCa","Categorias",new { id = categorias[i].id_categoria }, new { @class = "boton" })%></td>
                                        <%} %>
                                </tr>
                            </table>
                           <%}
                             else if(Session["UserIDG"].Equals(4) && categorias[i].publico.Equals(1))
                             { %> 
                            <table style="margin:auto; padding-top:30px" >
                                <tr>
                                    <td><%:Html.ActionLink(categorias[i].name, "GeneralCat", "Categorias", new { name = categorias[i].name }, new { @class = "boton" })%></td>
                                </tr>
                           </table>
                            <%} %>    
                    <% }}%>

            </div>

            <div id="CD">      
                <% if(Session["UserIDG"].Equals(1))
                    { %>
                        <li><%:Html.ActionLink("Nueva Categoria","NuevaCategoria","Categorias")%></li>
                    <%} %>  

            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
