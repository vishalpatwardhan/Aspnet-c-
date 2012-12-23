<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IList<EntityFramework.Models.Cours>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Courses List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        List of Courses</h2>
    <table>
        <tr>
            <th>
                Course Name
            </th>
            <th>
                Teacher Name
            </th>
            <th>
                Location
            </th>
        </tr>
        <% if (Model != null)%>
        <%{ %>
        <% foreach (var item in Model)%>
        <%{ %>
        <tr>
            <td>
                <%=item.CourseName%>
            </td>
            <td>
                <%=item.Teacher.TeacherName %>
            </td>
            <td>
                <%=item.Location %>
            </td>
        </tr>
        <%} %>
        <%} %>
    </table>
    <br />
    <%=Html.ActionLink("Add Course" ,"AddCourse") %>
</asp:Content>
