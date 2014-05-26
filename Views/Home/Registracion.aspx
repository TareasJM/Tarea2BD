<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script  src="jquery.js"></script>
    <script>
        var index = $('#List').get(0).selectedIndex;
        $('#List option:eq(' + index + ')').remove();
    </script>
    </head>
<body>
    
    <div>
        <div id="header">
            
            <div id="contentHeader">

                <div id="BH">
                    <ul>
                        <li><%:Html.ActionLink("Home","Index","Home")%></li>
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
                <% using(Html.BeginForm("Registracion2","Home"))
                {%>
                <h2><%=ViewBag.Message%></h2>
 
                <table style="margin:auto; position:static" >
                    
                    <tr>
                        <td><h2> User </h2> </td>
                        <td><input type="text" name="UserName" /> </td>
                        <td style="color:red"><%=ViewBag.Items[1]%></td>  
                    </tr>
                    <tr>
                        <td><h2> Tipo </h2> </td>
                        <td><select id="List" name="UserType" onChange ="hide">
                                <option value="0" disabled="disabled" selected="selected">Tipo de Usuario</option>
                                <option value="1" onclick="hide">Administrador</option>
                                <option value="2" onclick="hide">Moderador</option>
                                <option value="3" onclick="hide">Usuario Comun</option>
                            </select> </td>
                        <td style="color:red"><%=ViewBag.Items[1]%></td>  
                    </tr>
                    <tr>
                        <td><h2> Pass </h2></td>
                        <td><input type="password" name="PassUser" /> </td>
                        <td style="color:red"><%=ViewBag.Items[1]%></td>    
                    </tr>
                    <tr>
                        <td><h2> R-Pass </h2> </td>
                        <td><input type="password" name="PassUserR" /> </td>
                        <td style="color:red"><%=ViewBag.Items[0]%></td>    
                    </tr>
                    <tr>
                        <td><h2> Born </h2> </td>
                        <td><input  type="text" name="UserBorn" /> </td>
                        <td style="color:red"><%=ViewBag.Items[1]%></td>    
                    </tr>
                    <tr>
                        <td><h2> Sex </h2> </td> 
                        <td> <input  type="text" name="UserSex" /> </td>
                        <td style="color:red"><%=ViewBag.Items[1]%></td>    
                    </tr>
                    <tr>
                        <td><h2> A-Url </h2> </td>
                        <td><input type="text" name="UserAvatar-Url" /> </td>
                        <td style="color:red"><%=ViewBag.Items[1]%></td>    
                    </tr>
                 
                </table>
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
