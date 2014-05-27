<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>

<% User user = new User();
   user = user.getUserID((int)ViewData["TopicIDU"]);
   int topicIDU = (int)ViewData["TopicIDU"];
   Comments com = new Comments();
   List<Comments> Comments = new List<Comments>();
   Comments = com.getAllCommentByIDTopic((int)ViewData["TopicID"]);
   Session["TopicName"] = ViewBag.Items[0];
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

            </div>
            <div id="CC">    
                
                <table style="margin:auto; width:90%; " >
                    
                    <tr>
                        <td><h2> <%=(string)ViewBag.Items[0]%> </h2></td>
                    </tr>
                    <tr>
                        <td ><%=(string)ViewBag.Items[1]%></td>  
                    </tr>
                    <tr>
                        <td><textarea readonly style=" margin:auto; resize:none; width:90%; height:75px; border:1px solid black; position:static" id="TextArea1 " ><%=(string)ViewBag.Items[2]%></textarea></td>
                    </tr>
                </table>
                <table style="margin:auto">
                    <tr>
                        <td style="padding-right: 10px">Comentarios: <%=Comments.Count%>   </td>

                        <td style="padding-right: 10px">Autor:  <%:Html.ActionLink(user.name, "VerPerfil", "Home", new { id = user.id, name = user.name}, new { @class = "boton2" })%>  </td>
                        <!-- poner foto --> 
                         <%if(!Session["UserIDG"].Equals(4))
     
                        {%>
                            
                           <td><%:Html.ActionLink("Comment", "Comentar", "Categorias", new {topicIDU = topicIDU, topic = (int)ViewData["TopicID"]},new { @class = "boton2"})%></td>
                            
                      <% } %>
                        <%if(Session["UserIDG"].Equals(1) || Session["UserIDG"].Equals(2))
                          {%>
                            <td><%:Html.ActionLink("Eliminar", "EliminarTo", "Categorias", new { }, new { @class = "boton2" })%></td>
                        <%} %>
                        
                    </tr>
                </table>
               
                <h2>Respuestas</h2>
                <%for(int i=0; i < Comments.Count; i++)
                  {
                      user = user.getUserID(Comments[i].id_user);%>
                     <table style="margin:auto; position:static; width:90%; " >
                        <tr>
                            <td><textarea readonly style=" margin:auto; resize:none; width:90%; max-height:100px; border: 1px solid blue; position:static"><%=Comments[i].msg%></textarea></td>
                        </tr>
                    </table>
                    <table style="margin:auto; padding-bottom:20px">
                        <tr>                            
                            <td style="padding-right: 10px">Autor: <%:Html.ActionLink(user.name, "VerPerfil", "Home", new { id = user.id, name = user.name}, new { @class = "boton2" })%></td>
                            <%if (Session["UserIDG"].Equals(1) || Session["UserIDG"].Equals(2) || Comments[i].id_user.Equals(Session["UserID"]))
                          {%>
                            <td><%:Html.ActionLink("Editar", "EditarCo", "Categorias", new {id = Comments[i].id}, new { @class = "boton2" })%></td>                            
                            <td><%:Html.ActionLink("Eliminar", "EliminarCo", "Categorias", new {id = Comments[i].id}, new { @class = "boton2" })%></td>
                        <%} %>
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
