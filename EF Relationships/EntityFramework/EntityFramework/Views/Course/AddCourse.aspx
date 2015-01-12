<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<EntityFramework.Models.Cours>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        AddCourse</h2>
    <%using (Html.BeginForm())
      { %>
    <table>
        <tr>
            <td>
                Course Name
            </td>
            <td>
                <%=Html.TextBoxFor(x=>x.CourseName) %>
            </td>
        </tr>
        <tr>
            <td>
                Location
            </td>
            <td>
                <%=Html.TextBoxFor(x=>x.Location) %>
            </td>
        </tr>
        <tr>
            <td>
                Teacher
            </td>
            <td>
                <%= Html.DropDownList("TeacherId", new SelectList((IEnumerable)ViewData["Teachers"], "TeacherId", "TeacherName")) %>
            </td>
        </tr>
        <tr>
            <td>
                <input id="Submit" type="submit" runat="server" />
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
