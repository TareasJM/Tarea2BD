<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<%  User user = new User();
    user = user.getUser((string)Session["User"]);
    User userFrom = new User();
    Inbox inbox = new Inbox();
    inbox = inbox.getInbox(user.id);
    List<MP> mps = new List<MP>();
    MP mp = new MP();
    mps = mp.getMyMPs(inbox.id);%>

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
                
                <h2><%=ViewBag.Message%></h2>
 
                <%if(!mps.Count.Equals(0))
                       {%>                          
                        <%for (int i = 0; i < mps.Count; i++ )
                        {%>
                        <% userFrom =  userFrom.getUserID(mps[i].id_from);%>
                        <% string name = userFrom.name;%>
                           <table style=" display:inline-block; margin:auto; padding-top:10px; width:90%">
                                <tr>
                                    <%if(mps[i].check.Equals(1))
                                      {%>
                                        <td><input type="checkbox"checked disabled>Leido</td>
                                    <%} %>
                                    <%else 
                                      {%>
                                    <td><input type="checkbox" disabled>Leido</td>
                                    <%} %>
                                    <td><%:Html.ActionLink(mps[i].title, "VerMP", "Home", new { id = mps[i].id }, new { @class = "boton" })%></td>
                                    <td>De : <%:Html.ActionLink(name, "VerPerfil", "Home", new { id = userFrom.id, name = name}, new { @class = "boton2" })%>  </td>
                                    <td>Fecha : <%=mps[i].date_send%></td>
                                </tr>
                            </table>
                            <table style="margin:auto; padding-top:10px" > 
                                <tr>
                                    <td>Asunto : <%=mps[i].title%></td>
                                </tr>
                            </table>
                            <table style="margin:auto; padding-top:10px" >
                                <tr>
                                    <td><%:Html.ActionLink("Eliminar","EliminarMP","Home",new { id = mps[i].id }, new { @class = "boton" })%></td>
                                </tr>
                            </table>
                    <% }}%>
            </div>

            <div id="CD">
                <li><a href="/Home/Categorias">Back</a></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
