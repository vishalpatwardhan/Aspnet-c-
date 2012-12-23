<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AddStudent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        AddStudent</h2>
    <%using (Html.BeginForm())
      { %>
    <table>
        <tr>
            <td>
                Student Name
            </td>
            <td>
                <%=Html.TextBox("StudentName")%>
            </td>
        </tr>
        <tr>
            <td>
                Standard Name
            </td>
            <td>
                <%= Html.DropDownList("StandardId", new SelectList((IEnumerable)ViewData["standards"], "StandardId", "StandardName")) %>
            </td>
        </tr>
        <tr>
            <td>
                Course Name
            </td>
            <td>
                <% foreach (EntityFramework.Models.Cours course in (List<EntityFramework.Models.Cours>)ViewData["courses"]) %>
                <%{ %>
                    <%=course.CourseName %>
                    <%=Html.CheckBox(course.CourseName,new {@Id=course.CourseName,name=course.CourseId}) %>
                    
                <%} %>
            </td>
        </tr>
    </table>
    <input id="Submit" type="submit" runat="server" />
    <%} %>
</asp:Content>
