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
                        <li><%:Html.ActionLink("Home","Index","Home")%></li>
                        <li><a href="/Usuarios/Login.aspx">Login</a></li>
                        <li><%:Html.ActionLink("Register","Registracion","Home")%></li>
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

                    <li><%:Html.ActionLink("Tecnologia","Categorias","Home")%></li>
                    <li><%:Html.ActionLink("Viajes","Categorias","Home")%></li>
                    <li><%:Html.ActionLink("Deportes","Categorias","Home")%></li>
                    <li><%:Html.ActionLink("Nose","Categorias","Home")%></li>

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
