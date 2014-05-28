<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Tarea2BD.Models" %>
<%  User user = new User();
    user = user.getUser((string)Session["User"]);
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
                
                <h2><%=ViewBag.Message%></h2>
 
                <%if(!mps.Count.Equals(0))
                       {%>
                          
                   
                            <%for (int i = 0; i < mps.Count; i++ )
                            {%>
                            <table style="margin:auto; position:static" >
                                <tr>
                                    <td><%:Html.ActionLink(mps[i].title, "VerMP", "Home", new { id = mps[i].id }, new { @class = "boton" })%></td>
                        
                                    <td><%:Html.ActionLink("Eliminar","EliminarMP","Home",new { id = mps[i].id }, new { @class = "boton" })%></td>
                                </tr>
                            </table>
                    <% }}%>
            </div>

            <div id="CD">
                <li><a href="/Home/UserIn">Back</a></li>
            </div>

            <div id="footer">
                <span>Tarea 2 Base de Datos</span>
            </div>
        </div>
    </div>

</body>
</html>
