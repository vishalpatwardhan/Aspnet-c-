<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IList<EntityFramework.Models.Student>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        List of Students</h2>
    <table>
        <tr>
            <th>
                Student Name
            </th>
            <th>
                View Details
            </th>
            <th>
                Action
            </th>
        </tr>
        <% if (Model != null)%>
        <%{ %>
        <% foreach (var item in Model)%>
        <%{ %>
        <tr>
            <td>
                <%=item.StudentName%>
            </td>
            <td>
                <%=Html.ActionLink("View Details" ,"GetDetails",new {@StudId=item.StudentId}) %>
            </td>
            <td>
                <%=Html.ActionLink("Delete","DeleteStudent",new {StudId=item.StudentId}) %>
            </td>
        </tr>
        <%} %>
        <%} %>
    </table>
    <br />
    <%=Html.ActionLink("Add Student","AddStudent") %>
</asp:Content>
