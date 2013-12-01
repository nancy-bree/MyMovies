<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewGenre.aspx.cs" Inherits="MyMovies.NewGenre" Theme="Skin1" %>
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
             AutoPostBack=true RepeatDirection=Horizontal />
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="auto-style1">Add a new genre</h1>
    <asp:Label ID="lbName" runat="server" Text="Name"></asp:Label><br/>
    <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="tbName"
            Text="* Name is required."
            SetFocusOnError="true"
            Display="Dynamic"/><br/>
    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
    <asp:Label ID="LabelStatus" runat="server" Text="" style="font-size: x-large; font-weight: 700; color: #FF0000;"></asp:Label>
</asp:Content>
