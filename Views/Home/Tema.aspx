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
                <% if(!Session["UserIDG"].Equals(4))
                    { %>
                        <li><%:Html.ActionLink("Nueva Tema","NuevaCategoria","Categorias")%></li>                        
                <%  } %>
            </div>
            <div id="CC">
                <h2 style="color:black"><%=ViewBag.Message%></h2>
                 <% using(Html.BeginForm("UserIn","Home"))
                   {%>                 
                        <textarea style=" margin:auto; resize:none; width:90%; height:250px; position:static" id="TextArea1"></textarea>
                        <input type="submit" value="Send"/>
                   <%}%> 


            </div>

            <div id="CD">
                 <% if(!Session["UserIDG"].Equals(4) || !Session["UserIDG"].Equals(3))
                    { %>
                        <li><%:Html.ActionLink("Eliminar Tema","NuevaCategoria","Categorias")%></li>                        
                <%  } %>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>

    </div>

</body>
</html>
