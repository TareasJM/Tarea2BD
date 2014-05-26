<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<% User user = new User();
   user = user.getUser((string)ViewBag.Items[3]);%>
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
                        <li><%:Html.ActionLink("Home","UserIn","Home")%></li>
                        <li><%:Html.ActionLink((string)Session["User"],"MiPerfil","Home")%></li>
                        <li><%:Html.ActionLink("Logout","Logout","Home")%></li>
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
                        <td ><h3><%=(string)ViewBag.Items[1]%> </h3></td>  
                    </tr>
                </table>
                <table style="margin:auto; width:90%; " >
                    <tr>
                        <td><textarea readonly style=" margin:auto; resize:none; width:90%; height:75px; border:1px solid black; position:static" id="TextArea1 " ><%=(string)ViewBag.Items[2]%></textarea></td>
                    </tr>
                </table>
                <table style="margin:auto">
                    <tr>                      
                        <td style="padding-right: 10px">Autor: <%:Html.ActionLink(user.name, "VerPerfil", "Home", new { id = user.id, name = user.name}, new { @class = "boton2" })%></td>
                        <!-- poner foto --> 
                        <td><%:Html.ActionLink("Responder", "MP" ,"Home", new {name = (string)ViewBag.Items[3]},new { @class = "boton2"})%></td>
                        <td><%:Html.ActionLink("Eliminar", "EliminarMP", "Home", new { }, new { @class = "boton2" })%></td>

                        
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
