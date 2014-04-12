<%@ Page Language="C#" MasterPageFile="~/Lab/Lab.master" AutoEventWireup="true" CodeFile="deepfitness-api.aspx.cs" Inherits="lab_deepfitness_api_deepfitness_api" Title="DeepFitness API | DigitalColony.com" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <h3>Consuming the DeepFitness Web Service API</h3>
    <p>Below is a working example that utilizes three of the <a href="http://deepfitness.com">DeepFitness.com</a> web APIs.</p>
    <h4><em>GetTags</em></h4>
    <asp:Label ID="lblTag" AssociatedControlID="ddlTags" runat="server" Text="Tag:" />
    <asp:DropDownList ID="ddlTags" runat="server" AutoPostBack="true" />
      
    <h4><em>GetArticlesByTagName</em></h4>
    <p><asp:Label ID="lblSelectedTagName" runat="server" /></p>
    <div style="height:150px; overflow:scroll; width:90%; background-color:#ffffcc;">
    <asp:DataList ID="dlArticles" runat="server">
    <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
        <asp:LinkButton ID="lbtnArticleID" runat="server" 
            CommandArgument='<%# Eval("articleID") %>'
            CommandName="GetArticle"
            OnCommand="LinkButton_Command">
            <%# Eval("articleID") %>
            </asp:LinkButton>
            <%# Eval("title") %><br />
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </asp:DataList>
    </div>

    <h4><em>GetArticle</em></h4>
    <p><asp:Label ID="lblTitle" runat="server" /></p>
    <div id="dvArticle" runat="server" style="height:150px; width:90%; overflow:scroll; background-color:#ffffcc;"/>
</div>

</asp:Content>

