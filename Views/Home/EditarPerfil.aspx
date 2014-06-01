<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<%  User user = new User();
    user = user.getUserID((int)ViewData["VerPerfilID"]);
    %>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width" />
    <link href="../../Resources/Index.css" type="text/css" rel="stylesheet" />
    <title></title>
     <script  src="jquery.js"></script>
    <script type="text/ecmascript">
        function validateForm() {

            var PassUser = document.getElementById("PassUser").value;
            var PassUserR = document.getElementById("PassUserR").value;           
            var UserBorn = document.getElementById("UserBorn").value;
            var UserAvatar = document.getElementById("UserAvatar-Url").value;
            if (<%=Session["UserIDG"].Equals(1)%>) 
            {   
                var UserType = document.getElementById("UserType");
                var strUserType = UserType.options[UserType.selectedIndex].value;
                if (strUserType == "0") {
                alert("Error: Elija un tipo de usuario");
                return false;
                };
            };

            if (PassUser != PassUserR) {
                alert("Error: Contraseñas no coinciden!");
                return false;
            };

            if (PassUser.length < 6) {
                alert("Error: Contraseñas muy corta (min 6)!");
                return false;
            };
                 
            re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
            if (UserBorn == '' || !UserBorn.match(re)) {
                alert("Error: Fecha no valida (DD/MM/AAAA)!");
                return false;
            };

            if (UserAvatar.match(/(jpeg|jpg|gif|png)/g) == null) {
                alert("Error: Url no valida!");
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
                        
                        <%if(!Session["UserIDG"].Equals(4))
                        {%>
                        <li><%:Html.ActionLink("Home","UserIn","Home")%></li>
                        <li><%:Html.ActionLink((string)Session["User"], "MiPerfil", "Home")%></li>
                        <li><%:Html.ActionLink("Logout","Logout","Home")%></li>
                        <%} %>
                        <%else 
                          {%>
                        <li><%:Html.ActionLink("Home","Index","Home")%></li>
                        <li><%:Html.ActionLink("Login","Login","Home")%></li>
                        <li><%:Html.ActionLink("Register","Registracion","Home")%></li>
                        <%} %>
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
                
                <h2><%=ViewBag.Message%></h2>
                <img src="<%=user.a_url%>" height="100" width="100" /> 
                <% using(Html.BeginForm("EditarPerfil2","Home"))
                {%>
                <table style="margin:auto; position:static" >
                    <%if(Session["UserIDG"].Equals(1))
                      {%>
                    <tr>
                        <td><h2> Tipo </h2> </td>
                        <td><select id="UserType" name="UserType">
                            <option value="0" disabled selected style="display:none">Tipo de Usuario</option>
                            <option value="1" >Administrador</option>
                            <option value="2" >Moderador</option>
                            <option value="3" >Usuario Comun</option>
                        </select> </td>
                    </tr> 
                    <%} %>   
                    <tr>
                        <td><h2> Pass </h2> </td>
                        <td><input type="text" name="PassUser" id="PassUser"/> </td>
                    </tr>            
                    <tr>
                        <td><h2> R-Pass </h2> </td>
                        <td><input  type="text" name="PassUserR" id="PassUserR"/> </td>
                    </tr>
                    <tr>
                        <td><h2> Born </h2> </td>
                        <td><input  type="text" name="UserBorn" id="UserBorn"/> </td>  
                    </tr>
                    <tr>
                        <td><h2> A-Url </h2> </td>
                        <td><input type="text" name="UserAvatar-Url" id="UserAvatar-Url"/> </td>  
                    </tr>
            </table>
                <input type="hidden" name="UserName" value="<%=user.name%>" />
                <input type="hidden" name="IDVeedor" value="<%=user.id%>" />
                <input  type="submit" value="Editar"/>  
                <%} %>
            </div>

            <div id="CD">
                   <%if (Session["TopicName"] != null && Session["CatName"] != null)
                     {%>
                        <li><%:Html.ActionLink("Back", "GeneralTop", "Categorias", new { name = Session["TopicName"] }, new { })%></li>                     
                    <%} 
                     else if (Session["TopicName"] == null && Session["CatName"] != null)
                     {%>
                        <li><%:Html.ActionLink("Back", "GeneralCat", "Categorias", new { name = Session["CatName"] }, new { })%></li>                     
                    <%}
                     else if(Session["TopicName"] == null && Session["CatName"] == null)
                     {%>
                        <li><%:Html.ActionLink("Back", "MiPerfil", "Home")%></li>                     
                    <%}%>

            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
