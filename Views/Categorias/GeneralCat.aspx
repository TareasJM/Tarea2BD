<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>
<% int n = (int)ViewData["TCount"];
   string cat = Session["CatName"].ToString();
   Categorias categorias = new Categorias();
   List<Topics> topics = new List<Topics>();
   Topics top = new Topics();
   topics = top.getAllTopicsByCatID(categorias.getIDCatName(cat));%>
<% User user = new User();
   user = user.getUserID((int)Session["UserID"]); %>
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
                        <li><%:Html.ActionLink((string)Session["User"], "MiPerfil", "Home")%></li>
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
                <%if(!Session["UserIDG"].Equals(4) )
                  {%>
                
                <li><%:Html.ActionLink("Nuevo Topic", "NuevoTopic", "Categorias", new { cat = cat},null)%></li>
                <%} %>
            </div>
            <div id="CC">  
                   
                     <%for (int i = 0; i < n; i++ )
                       {
                        if(!Session["UserIDG"].Equals(4))    
                        { %>    
                           
                        <table  style="margin:auto; padding-top:30px" >
                        <tr>
                            <td><%:Html.ActionLink((string)ViewBag.Items[i], "GeneralTop", "Categorias",new {name = (string)ViewBag.Items[i]},new { @class = "boton"})%></td>
                        
                        <%if (Session["UserIDG"].Equals(1) || Session["UserIDG"].Equals(2))
                        {%>
                            
                                <td><%:Html.ActionLink("Eliminar","EliminarTop","Categorias",new { name = (string)ViewBag.Items[i]}, new { @class = "boton" })%></td>
                            <%}%>
                            </tr>  
                          </table>                  
                        <%}
                          else if(Session["UserIDG"].Equals(4) && topics[i].publico.Equals(1))
                          { %>  
                             
                            <table  style="margin:auto; padding-top:30px" >
                                <tr>
                                    <td><%:Html.ActionLink((string)ViewBag.Items[i], "GeneralTop", "Categorias",new {name = (string)ViewBag.Items[i]},new { @class = "boton"})%></td>  
                                </tr>
                            </table>
                            
                    <% }}%>


            </div>

            <div id="CD">
                <li><a href="/Home/Categorias">Back</a></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
