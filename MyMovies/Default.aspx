<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyMovies._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <asp:ObjectDataSource ID="ThemeDataSource" runat="server" 
             SelectMethod="GetThemes" TypeName="MyMovies.ThemeManager" ></asp:ObjectDataSource>
            <asp:RadioButtonList ID="strTheme" runat="server" DataTextField=name 
             DataValueField=name OnSelectedIndexChanged="strTheme_SelectedIndexChanged" 
             OnDataBound="strTheme_DataBound" DataSourceID="ThemeDataSource" 
             AutoPostBack=true RepeatDirection=Horizontal/>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("Genre") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GenreTextBox" runat="server" Text='<%# Bind("Genre") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GenreTextBox" runat="server" Text='<%# Bind("Genre") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr>
                <td style="width:70%">
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td style="width:10%">
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td style="width:20%">
                    <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("Genre") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="width: 100%;">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">Title</th>
                                <th runat="server">Year</th>
                                <th runat="server">Genre</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("Genre") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyMoviesContext %>" SelectCommand="SELECT Movies.Title, Movies.Year, Genres.Name AS Genre FROM Movies INNER JOIN Genres ON Movies.GenreId = Genres.Id ORDER BY Movies.Title"></asp:SqlDataSource>
</asp:Content>
