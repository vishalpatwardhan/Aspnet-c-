<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IList<EntityFramework.Models.Student>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    GetDetails
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Student Details</h2>
    <table>
        <tr>
            <th>
                Student Name
            </th>
            <th>
                Standard
            </th>
            <th>
                Courses
            </th>
        </tr>
        <tr>
            <% foreach (var student in (List<EntityFramework.Models.Student>)Model)%>
            <%{ %>
            <td>
                <%=student.StudentName %>
            </td>
            <td>
                <%=student.Standard.StandardName %>
            </td>
            <% foreach (EntityFramework.Models.Cours course in (student.Courses))%>
            <%{ %>
            <td>
                <%=course.CourseName %>
            </td>
            </br>
            <td>
                <%=course.Location %>
            </td>
            <%} %>
            <%} %>
        </tr>
    </table>
</asp:Content>
