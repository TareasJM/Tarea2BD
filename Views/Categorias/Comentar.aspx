<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>

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
                            <td><textarea readonly style=" margin:auto; resize:none; width:90%; height:75px; border:none; position:static" name="Mensaje" /></td>
                        </tr>
                    </table>
                    <table style="margin:auto">
                        <tr>
                            <input type="hidden" name="idtopic" value=<%=ViewData["IDTopic"].ToString()%>
                            <td><input type="submit" value="Send" class="boton" /></td>
                            <td><%:Html.ActionLink("Send", "Comentar2", "Categorias", new { id = (int)ViewData["IDTopic"] }, new {@class = "boton"})%></td>
                            <!-- poner foto -->                   
                        </tr>
                    </table>           
               
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
