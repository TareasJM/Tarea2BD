<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<%  User user = new User();
    user = user.getUserID((int)ViewData["VerPerfilID"]);
    List<ViewComments> views = new List<ViewComments>();
    ViewComments view = new ViewComments();
    views = view.GetMadeComments(user.id);
    List<ViewTemas> viewts = new List<ViewTemas>();
    ViewTemas viewt = new ViewTemas();
    viewts = viewt.GetMadeTopics(user.id);
    string[] split = user.born.Split('/');
    int edad = 2014 - int.Parse(split.Last());
    %>
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
                <img src="<%=user.a_url%>" height="100" width="150" /> 
                 <table style="margin:auto; position:static" >
                    <tr>
                        <td><h2> User </h2> </td>
                        <td><input  type="text" name="UserName" value="<%=user.name%>" readonly/> </td>
                    </tr>
                    <tr>
                        <td><h2> Age </h2> </td>
                        <td><input  type="text" name="UserBorn" value="<%=edad%>" readonly/> </td>  
                    </tr>
                    <tr>
                        <td><h2> Sex </h2> </td> 
                        <td> <input  type="text" name="UserSex" value="<%=user.sex%>" readonly/> </td>  
                    </tr>
                     <tr>
                        <td><h2> N_Comments </h2> </td> 
                        <td> <input  type="text" name="UserSex" value="<%=user.comments%>" readonly/> </td>  
                    </tr>
                    <tr>
                        <td><h2> A-Url </h2> </td>
                        <td><input type="text" name="UserAvatar-Url" value="<%=user.a_url%>" readonly/> </td>  
                    </tr>
                </table>
                <h2> Ultimos 5 Temas Creados </h2> 
                <table style="margin:auto; position:static" >
                    <%for(int i =0; i < viewts.Count; i++)
                      { %>
                        <tr>
                            <td></td>
                            <td><input  type="text" value="<%=viewts[i].nameTopic%>" readonly/> </td>  
                        </tr>
                     <%} %>
                </table>
                <h2> Ultimos 5 Comentarios  </h2> 
                <table style="margin:auto; position:static" >
                    <%for(int i =0; i < views.Count; i++)
                      { %>
                        <tr>
                            <td></td>
                            <td><input  type="text" value="<%=views[i].nameTopic%>" readonly/> </td>  
                        </tr>
                     <%} %>
                </table>
            </div>

            <div id="CD">
                  <%if(Session["UserIDG"].Equals(1))
                  {%>
                    <li><%:Html.ActionLink("Editar Perfil", "EditarPerfil", "Home", new { id = user.id, name = user.name}, new {})%> </li>
                <%} %>
                <%if (Session["CatName"] != null && Session["TopicName"] == null)
                  {%>
                    <li><%:Html.ActionLink("Back", "Categorias", "Home")%></li>
                   <%} %>   
                   <%if (Session["TopicName"] != null)
                     {%>
                        <li><%:Html.ActionLink("Back", "GeneralTop", "Categorias", new { name = Session["TopicName"] }, new { })%></li>
                      
                    <%} 
                     else
                     {%>
                        <li><a href="/Home/UserIn">Back</a></li>
                    <%}%>
              
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
