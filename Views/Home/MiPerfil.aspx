<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<%  User user = new User();
    user = user.getUser((string)Session["User"]);%>
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
                <% using(Html.BeginForm("EditarPerfil","Home"))
                {%>
                <h2><%=ViewBag.Message%></h2>
 
                <table style="margin:auto; position:static" >
                    <%if(Session["UserIDG"].Equals(1))  
                      {%>
                    <tr>
                        <td><h2> Tipo </h2> </td>
                        <td><input type="text" name="UserType" value="<%=user.name%>"/> </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td><h2> Pass </h2> </td>
                        <td><input type="text" name="PassUser" value="<%=user.name%>"/> </td>
                    </tr>
                    <tr>
                        <td><h2> R-Pass </h2> </td>
                        <td><input  type="text" name="RPass" value="<%=user.born%>"/> </td>  
                    </tr>
                    <tr>
                        <td><h2> Born </h2> </td> 
                        <td> <input  type="text" name="UserBorn" value="<%=user.sex%>"/> </td>  
                    </tr>
                    <tr>
                        <td><h2> A-Url </h2> </td>
                        <td><input type="text" name="UserAvatar-Url" value="<%=user.a_url%>"/> </td>  
                    </tr>

                </table>
                <input type="hidden" name="UserName" value="<%=user.name%>" />
                <input  type="submit" value="Guardar"/>  
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
