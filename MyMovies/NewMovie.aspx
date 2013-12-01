<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewMovie.aspx.cs" Inherits="MyMovies.NewMovie" Theme="Skin2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
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
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="auto-style1">Add a new movie</h1>
    <asp:Label ID="lbTitle" runat="server" Text="Title"></asp:Label><br/>
    <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="tbTitle"
            Text="* Title is required."
            SetFocusOnError="true"
            Display="Dynamic"/><br/>
    <asp:Label ID="lbGenre" runat="server" Text="Genre"></asp:Label><br/>
    <asp:DropDownList ID="ddlGenre" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyMoviesContext %>" SelectCommand="SELECT [Id], [Name] FROM [Genres]"></asp:SqlDataSource>
    <br/>
    <asp:Label ID="lbYear" runat="server" Text="Year"></asp:Label><br/>
    <asp:TextBox ID="tbYear" runat="server"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator" runat="server"
            ControlToValidate="tbYear"
            Text="* Year (from 1896 to 2013)."
            MinimumValue="1700"
            MaximumValue="2013"
            SetFocusOnError="true"
            Display="Dynamic"/><br/>
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
    <asp:Label ID="LabelStatus" runat="server" Text="" style="font-size: x-large; font-weight: 700; color: #FF0000;"></asp:Label>
</asp:Content>
