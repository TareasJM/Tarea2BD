<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script  src="jquery.js"></script>
    <script>
        function validateForm() {

            var names = <%=ViewBag.Serializer.Serialize(ViewBag.Items)%>; 
            var passes = <%=ViewBag.Serializer2.Serialize(ViewBag.Items2)%>; 
            var User = document.getElementById("UserName").value;
            var Pass = document.getElementById("PassUser").value;
            var i = 0;
            while(User.toUpperCase() != names[i])
            {
                
                if(i == names.length-1)
                {
                    alert("Error: No Existe Usuario");
                    return false;
                };
                i++;
            };

            if(Pass != passes[i])
            {
                alert("Error: Contraseña No Coincide");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    
    <div>

        <div id="header">
            
            <div id="contentHeader">

                <div id="BH">
                    <ul>
                        <li><%:Html.ActionLink("Home","Index","Home")%></li>
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
                <li><%:Html.ActionLink("Categorias","Categorias","Home")%></li>
                
            </div>
            <div id="CC">
                <h2 style="color:black"><%=ViewBag.Message%></h2>
                <form id="regForm" action="/Home/UserIn2" method="post" onsubmit="return validateForm()">
                   <table style="margin:auto; position:static" >
                    
                        <tr>
                            <td><h2> User </h2> </td>
                            <td><input type="text" name="UserName" id="UserName"/> </td>
                            <!--<td style="color:red">%=ViewBag.Items%></td>  -->
                        </tr>
                        <tr>
                            <td><h2> Pass </h2></td>
                            <td><input type="password" name="PassUser" id="PassUser"/> </td>
                            <!--<td style="color:red">%=ViewBag.Items%></td>  -->    
                        </tr>
                   </table> 
                   <input type="submit" value="Enter"/>
                    </form>
            </div>

            <div id="CD">
                <li><a href="/Home/Index">Back</a></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>

    </div>

</body>
</html>
