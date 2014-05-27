<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<% User user = new User();
   user = user.getUserID((int)Session["UserID"]);%>
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
                        <li><%:Html.ActionLink((string)Session["User"], "MiPerfil", "Home")%></li>
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
                <li><%:Html.ActionLink("Categorias","Categorias","Home")%></li>
                
            </div>
            <div id="CC">              
                
                <h2><%=ViewBag.Message%></h2>
                
              
            </div>

            <div id="CD">
                <li><%:Html.ActionLink("Mi Perfil","MiPerfil","Home")%></li>
                <li><%:Html.ActionLink("Enviar MP", "MP", "Home", new { name = "Destinatario"})%></li>
                <li><%:Html.ActionLink("Bandeja de Entrada","Inbox","Home")%></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
