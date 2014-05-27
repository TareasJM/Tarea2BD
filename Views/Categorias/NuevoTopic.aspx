<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace ="Tarea2BD.Models" %>
<% string cat = ViewData["CatName2"].ToString();%>
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

            var TopicName = document.getElementById("TopicName").value;
            var TopicDes = document.getElementById("TopicDes").value;
            var TopicMsg = document.getElementById("TopicMsg").value;

            if (TopicName.length < 4) {
                alert("Error: Nombre de Topic muy corto (min 4)!");
                return false;
            };
            
            if (TopicDes == "") {
                alert("Error: Debe tener descripción!");
                return false;
            };

            if (TopicMsg.length < 15) {
                alert("Error: Mensaje de Topic muy corto (min 15)!");
                return false;
            };

            for (var i = names.length - 1;i >= 0; i--) {
                if (TopicName == names[i]) {
                    alert("Error: Topic Existente");
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

            </div>
            <div id="CC">   
                <form action="/Categorias/MakeTopic" method="post" onsubmit="return validateForm()">
                    <table style="margin:auto; position:static" >
                        
                        <tr>
                            <td><h2> Nombre </h2> </td>
                            <td><input type="text" name="TopicName" id="TopicName"/> </td>
                        </tr>
                        <tr>
                            <td><h2> Descripcion </h2></td>
                            <td><input type="text" name="TopicDes" id="TopicDes"/> </td>
                        </tr>
                      
                    </table>
                    <h2> Mensaje </h2>
                    <textarea style=" margin:auto; resize:none; width:90%; height:75px; border:1px solid black; position:static" name="TopicMsg" id="TopicMsg" ></textarea>
                    <table style="margin:auto; position:static" >   
                        <tr>
                            <td></td>
                            <td><input type="checkbox" name="TopicPub" onclick="valuecheck(this)">Publico<td> 
                        </tr>
                    </table>
                        <input type="hidden" name="Cat_name" value="<%=cat%>" />
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
