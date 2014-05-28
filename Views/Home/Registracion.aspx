<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace ="Tarea2BD.Models" %>
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
            var names = <%=ViewBag.Serializer.Serialize(ViewBag.Items)%>; 
            var User = document.getElementById("UserName").value;
            var PassUser = document.getElementById("PassUser").value;
            var PassUserR = document.getElementById("PassUserR").value;
            var UserType = document.getElementById("UserType");
            var strUserType = UserType.options[UserType.selectedIndex].value;
            var UserBorn = document.getElementById("UserBorn").value;
            var UserSex = document.getElementById("UserSex");
            var strUserSex = UserSex.options[UserSex.selectedIndex].value;
            var UserAvatar = document.getElementById("UserAvatar-Url").value;

            if (UserName.length < 4) {
                alert("Error: Nombre de Usuario muy corto (min 4)!");
                return false;
            };

            for (var i = names.length - 1;i >= 0; i--) {
               
                if (User.toUpperCase() == names[i]) {
                    alert("Error: Usuario Existente");
                    return false;
                };
            };

            if (strUserType == "0") {
                alert("Error: Elija un tipo de usuario");
                return false;
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

            if (strUserSex == "0") {
                alert("Error: Elija Sexo");
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

                <h2><%=ViewBag.Message%></h2>
                <form id="regForm" action="/Home/Registracion2" method="post" onsubmit="return validateForm()">

                <table style="margin:auto; position:static" >
                    
                    <tr>
                        <td><h2> User </h2> </td>
                        <td><input type="text" name="UserName" id = "UserName"/> </td>
                    </tr>
                    <tr>
                        <td><h2> Tipo </h2> </td>
                        <td><select id="UserType" name="UserType">
                                <option value="0" disabled selected style="display:none">Tipo de Usuario</option>
                                <option value="1" >Administrador</option>
                                <option value="2" >Moderador</option>
                                <option value="3" >Usuario Comun</option>
                            </select> </td>
                        
                    </tr>
                    <tr>
                        <td><h2> Pass </h2></td>
                        <td><input type="password" name="PassUser" id="PassUser"/> </td>
                    </tr>
                    <tr>
                        <td><h2> R-Pass </h2> </td>
                        <td><input type="password" name="PassUserR" id="PassUserR"/> </td>
                    </tr>
                    <tr>
                        <td><h2> Born </h2> </td>
                        <td><input  type="text" name="UserBorn" id="UserBorn"/> </td>
                    </tr>
                    <tr>
                        <td><h2>Sex</h2></td>
                        <td><select id="UserSex" name="UserSex">
                                <option value="0" disabled selected style="display:none">Sex</option>
                                <option value="Male" >Male</option>
                                <option value="Female" >Female</option>
                            </select> </td>
                    </tr>
                    <tr>
                        <td><h2> A-Url </h2> </td>
                        <td><input type="text" name="UserAvatar-Url" id="UserAvatar-Url"/> </td>
                    </tr>
                 
                </table>
                    <input type="submit" value="Send"/>
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
