﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

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
                <h2>ESTOY EN LOL</h2>
                    <li><%:Html.ActionLink("Hombres","Hombres","Categorias")%></li>
                    <li><%:Html.ActionLink("Juegos","Juegos","Categorias")%></li>
                    <li><%:Html.ActionLink("Mujeres","Mujeres","Categorias")%></li>
                    <li><%:Html.ActionLink("Porno","Porno","Categorias")%></li>

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