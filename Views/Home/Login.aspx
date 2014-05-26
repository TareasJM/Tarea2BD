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
                 <% using(Html.BeginForm("UserIn2","Home"))
                   {%>
                   <table style="margin:auto; position:static" >
                    
                        <tr>
                            <td><h2> User </h2> </td>
                            <td><input type="text" name="UserName" /> </td>
                            <!--<td style="color:red">%=ViewBag.Items%></td>  -->
                        </tr>
                        <tr>
                            <td><h2> Pass </h2></td>
                            <td><input type="password" name="PassUser" /> </td>
                            <!--<td style="color:red">%=ViewBag.Items%></td>  -->    
                        </tr>
                   </table> 
                   <input type="submit" value="Enter"/>
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
