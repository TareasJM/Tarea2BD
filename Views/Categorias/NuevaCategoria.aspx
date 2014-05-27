<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace ="Tarea2BD.Models"%>
<% User user = new User();
   user = user.getUserID((int)Session["UserID"]); %>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script type="text/javascript">
        function valuecheck(check) {
            check.value = "1";
        }

         function validateForm() {
            var names = <%=ViewBag.Serializer.Serialize(ViewBag.Items)%>; 

            var CatName = document.getElementById("CatName").value;
            var CatDes = document.getElementById("CatDes").value;

            if (CatName.length < 4) {
                alert("Error: Nombre de categoria muy corto (min 4)!");
                return false;
            };
            
            if (CatDes == "") {
                alert("Error: Debe tener descripción!");
                return false;
            };

            for (var i = names.length - 1;i >= 0; i--) {
                if (CatName == names[i]) {
                    alert("Error: Categoria Existente");
                    return false;
                };
            };

            return true; // return false to cancel form action
        }
    </script>
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
                <form action="/Categorias/MakeCat" method="post" onsubmit="return validateForm()">
                    <h2><%=ViewBag.Message%></h2>
     
                    <table style="margin:auto; position:static" >
                        
                        <tr>
                            <td><h2> Nombre </h2> </td>
                            <td><input type="text" name="CatName" id="CatName" /> </td>
                        </tr>
                        <tr>
                            <td><h2> Descripcion </h2></td>
                            <td><input type="text" name="CatDes" id="CatDes" /> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="checkbox" name="CatPub" onclick="valuecheck(this)">Publico<td>
                        </tr>
                    </table>
                        <input type="submit" value="Send"/>
                </form>
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
