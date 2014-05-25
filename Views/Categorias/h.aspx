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
                
               
                <%if(!Session["UserIDG"].Equals(4))
                  { 
                    Html.ActionLink("Commentr", "Comentar", "Categorias", new { }, new { name = "hole" });

                       } %>
                <%if(!Session["UserIDG"].Equals(3) || !Session["UserIDG"].Equals(4))
                          {
           
                            Html.ActionLink("Eliminar", "NuevoTopic", "Categorias", new { }, new { @class = "boton" });
                        } %>
                
                      
                     <table style="margin:auto; position:static; width:90%; " >
                        <tr>
                            <td><textarea readonly style=" margin:auto; resize:none; width:90%; height:75px; border:none; position:static" id="TextArea1" >no funciona</textarea></td>
                        </tr>
                    </table>
                    <table style="margin:auto">
                        <tr>
                            <td style="padding-right: 10px">Autor: <%:Html.ActionLink("YO", "VerPerfil", "Home", new { n = "" }, new { id = 6 })%></td>
                            <!-- poner foto -->                   
                        </tr>
                    </table>
                <!-- fin del fro -->
               
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
