<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

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
                <li><%:Html.ActionLink("Categorias","Categorias","Home")%></li>
                
            </div>
            <div id="CC">              
                
                <h2><%=ViewBag.Message%></h2>
                
              
            </div>

            <div id="CD">
                <li><%:Html.ActionLink("Mi Perfil","MiPerfil","Home")%></li>
                <li><%:Html.ActionLink("Bandeja de Entrada","MiPerfil","Home")%></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
