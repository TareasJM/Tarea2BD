<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage"%>  
<%@ Import Namespace="Tarea2BD.Models" %>
<% User user = new User();
   user = user.getUserID((int)Session["UserID"]); %>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script  src="jquery.js"></script>
    <script type="text/ecmascript">
        function validateForm() {
 
            var Mensaje = document.getElementById("Mensaje").value;
            
            if (Mensaje.length == 0) {
                alert("Error: Escriba Algo Para Enviar Mensaje");
                return false;
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

                        <li><%:Html.ActionLink("Home","Categorias","Home")%></li>
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
                
            </div>
            <div id="CC">    
                <form id="regForm" action="/Home/EnviarMP" method="post" onsubmit="return validateForm()">

                    <table style="margin:auto">
                        <tr>
                            <td><h2>Asunto: <input type="text" name="title"  value="<%=(string)ViewBag.Asunto%>" readonly/></h2></td> 
                        </tr>
                    </table>
                    <textarea style=" border: 1px solid black; margin-top:10px; resize:none; width:90%; height:75px; position:static" name="Mensaje" id="Mensaje"></textarea>
                    <table style="margin:auto">
                        <tr>
                            <td><h2>Para: <input type="text" name="Destinatario" value="<%=(string)ViewBag.name%>" readonly/></h2></td>             
                        </tr>
                        <tr>
                            <td><input type="submit" value="Send" class="boton" /></td>                                    
                        </tr>
                    </table>           
              </form>
            </div>

            <div id="CD">
                <li><a Href="/Home/UserIn">Back</a></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
