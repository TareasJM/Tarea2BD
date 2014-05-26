<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<% string cat = ViewData["CatName2"].ToString();%>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script>
        function valuecheck(check) {
            check.value = "1";
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
                <!-- acccion, controlador -->           
                <% using(Html.BeginForm("MakeTopic","Categorias")) 
                {%>
                <h2><%=ViewBag.Message%></h2>
 
                <table style="margin:auto; position:static" >
                    
                    <tr>
                        <td><h2> Nombre </h2> </td>
                        <td><input type="text" name="TopicName" /> </td>
                        <!--<td style="color:red">%=ViewBag.Items[1]%></td>  -->
                    </tr>
                    <tr>
                        <td><h2> Descripcion </h2></td>
                        <td><input type="text" name="TopicDes" /> </td>
                        <!--<td style="color:red">%=ViewBag.Items[1]%></td>    -->
                    </tr>
                    <tr>
                        <td><h2> Mensaje </h2></td>
                        <td><input type="text" name="TopicMsg" /> </td>
                        <!--<td style="color:red">%=ViewBag.Items[1]%></td>    -->
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="checkbox" name="TopicPub" onclick="valuecheck(this)">Publico<td>
                        <!--<td style="color:red">%=ViewBag.Items[0]%></td> -->   
                    </tr>
                </table>
                    <input type="hidden" name="Cat_name" value="<%=cat%>" />
                    <input type="submit" value="Send"/>
               <%}%>
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
