<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>

<% User user = new User();
   user = user.getUserID((int)ViewData["TopicIDU"]);
   Comments com = new Comments();
   List<Comments> Comments = new List<Comments>();
   Comments = com.getAllCommentByIDTopic((int)ViewData["TopicID"]);
   
   %>
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
                <%if(!Session["UserIDG"].Equals(4))
                  {%>
                    <li><%:Html.ActionLink("Nuevo Topic","NuevoTopic","Categorias")%></li>
                <%} %>
            </div>
            <div id="CC">    
                
                <table style="margin:auto; position:static; width:90%; " >
                    
                    <tr>
                        <td><h2> <%=ViewBag.Items[0]%> </h2> </td>
                    </tr>
                    <tr>
                        <td ><%=ViewBag.Items[1]%></td>  
                    </tr>
                    <tr>
                        <td><textarea readonly style=" margin:auto; resize:none; width:90%; height:75px; border:none; position:static" id="TextArea1 " ><%=ViewBag.Items[2]%></textarea></td>
                    </tr>
                </table>
                <table style="margin:auto">
                    <tr>
                        <td style="padding-right: 10px">Comentarios: <%=ViewBag.Comments%>   </td>

                        <td style="padding-right: 10px">Autor: <%=user.name%>   </td>
                        <!-- poner foto --> 
                        
                    </tr>
                </table>
                <%if(!Session["UserIDG"].Equals(4))
     
                        {%>
                            
                           <%:Html.ActionLink("Comment", "Comentar", "Categorias", new {topic = (int)ViewData["TopicID"]},new { @class = "boton"})%>
                            
                      <% } %>
                        <%if(!Session["UserIDG"].Equals(3) || !Session["UserIDG"].Equals(4))
                          {%>
           
                            <%:Html.ActionLink("Eliminar", "NuevoTopic", "Categorias", new { }, new { @class = "boton" })%>
                        <%} %>
                <%for(int i=0; i < Comments.Count; i++)
                  {
                      user = user.getUserID(Comments[i].id_user);%>
                     <table style="margin:auto; position:static; width:90%; " >
                        <tr>
                            <td><textarea readonly style=" margin:auto; resize:none; width:90%; height:75px; border:none; position:static" id="TextArea1" ><%=Comments[i].msg%></textarea></td>
                        </tr>
                    </table>
                    <table style="margin:auto">
                        <tr>
                            <td style="padding-right: 10px">Autor: <%:Html.ActionLink(user.name, "VerPerfil", "Home")%></td>
                            <!-- poner foto -->                   
                        </tr>
                    </table>
                <%}%><!-- fin del fro -->
               
            </div>

            <div id="CD">
                
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
