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
                       {
                            for (int i = 0; i < categorias.Count; i++ )
                            {%>
                            <li><%:Html.ActionLink(categorias[i].name, "GeneralCat", "Categorias", new { name = categorias[i].name }, new { @class = "boton" })%></li>
                  
                    <% }}%>

            </div>

            <div id="CD">      
                <% if(Session["UserIDG"].Equals(1))
                    { %>
                        <li><%:Html.ActionLink("Nueva Categoria","NuevaCategoria","Categorias")%></li>
                        <li><%:Html.ActionLink("Eliminar Categoria","NuevaCategoria","Categorias")%></li>
                <%  } %>

            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
