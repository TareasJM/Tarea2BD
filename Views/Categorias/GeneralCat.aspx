<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>
<% int n = (int)ViewData["TCount"];
   string cat = Session["CatName"].ToString();
   Categorias categorias = new Categorias();
   List<Topics> topics = new List<Topics>();
   Topics top = new Topics();
   topics = top.getAllTopicsByCatID(categorias.getIDCatName(cat));%>
<% User user = new User();
   user = user.getUserID((int)Session["UserID"]);
   User userTopic = new User(); %>
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
                        <li><%:Html.ActionLink("Home","Categorias","Home")%></li>
                        <li><%:Html.ActionLink("Login","Login","Home")%></li>
                        <li><%:Html.ActionLink("Register","Registracion","Home")%></li>
                        <% }%>
                        <%else
                          {%>
                        <li><%:Html.ActionLink("Home","Categorias","Home")%></li>
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
                        if(!Session["UserIDG"].Equals(4) || (Session["UserIDG"].Equals(4) && topics[i].publico.Equals(1)))    
                        { %>    
                        <%string name = userTopic.getNameUserByTopic(topics[i].id_user);%>
                        <%int id = topics[i].id_user;%>
                        <table style=" display:inline-block; margin:auto; padding-top:10px; width:90%">

                        <tr>
                            <td style="padding-right:10px"><%:Html.ActionLink((string)ViewBag.Items[i], "GeneralTop", "Categorias",new {name = (string)ViewBag.Items[i]},new { @class = "boton"})%></td>
                            <td style="padding-right:10px">Autor: <%:Html.ActionLink(name, "VerPerfil", "Home", new { id = id, name = name}, new { @class = "boton2" })%></td>
                            <td>N Comments: <%=topics[i].getNumbersCommentsOfTopicByID(topics[i].id_topic)%></td>
                        </tr>
                        </table>
                        <table style="margin:auto; padding-top:10px" >                         
                        <tr>
                            <td>Descripcion : <%=topics[i].descripcion%></td>
                        </tr>
                        </table>
                        
                        <%if (Session["UserIDG"].Equals(1) || Session["UserIDG"].Equals(2))
                        {%>
                        <table style="margin:auto; padding-top:10px" >                         
                            <tr>
                                <td><%:Html.ActionLink("Eliminar","EliminarTop","Categorias",new { name = (string)ViewBag.Items[i]}, new { @class = "boton" })%></td>
                            </tr>  
                          </table>                  
                        <%}}}%>


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
