<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_MessageBoard.Master" AutoEventWireup="true" CodeBehind="ContentPage_Message_Main.aspx.cs" Inherits="BS4_MasterPages_MessageBoard.ContentPage_Message_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Message Main</title>
    <link href="css/styles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Post Content-->
    <article class="mb-4">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="d-flex flex-column">
                <div class="d-flex mb-4"><asp:Button ID="Button1" runat="server" Text="發表回應" OnClick="Button1_Click" class="btn btn-primary text-uppercase"/></div>
                <div class="form-floating">
                    <asp:Label ID="Label1" runat="server" Text="主題 : " class="h6"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Label" class="blockquote"></asp:Label>
                </div>
                <div class="form-floating">
                    <asp:Label ID="Label3" runat="server" Text="發表人 : " class="h6"></asp:Label>
                    <asp:Label ID="Label4" runat="server" Text="Label" class="blockquote"></asp:Label>
                </div>
                <div class="form-floating">
                    <asp:Label ID="Label5" runat="server" Text="發表時間 : " class="h6"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Text="Label" class="blockquote"></asp:Label>
                </div>
                <div class="form-floating">
                    <asp:Label ID="Label6" runat="server" Text="內容 : " class="h6"></asp:Label>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Label" class="blockquote"></asp:Label>
                </div>
                <hr />
                <div class="form-floating">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="回應者 : " class="h6"></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("nickname") %>' class="blockquote"></asp:Label>
                            <br />
                            <asp:Label ID="Label12" runat="server" Text="回應內容 : " class="h6"></asp:Label>
                            <br />
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("message") %>' class="blockquote"></asp:Label>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <hr />
                <asp:Button ID="Button2" runat="server" Text="回上一頁" OnClick="Button2_Click" UseSubmitBehavior="False" class="btn btn-secondary btn-sm text-uppercase" CausesValidation="False" />
                <asp:Button ID="Button3" runat="server" Text="回最上面" href="#top" UseSubmitBehavior="False" class="btn btn-secondary btn-sm text-uppercase" CausesValidation="False" OnClick="Button3_Click"/>
                <asp:Button ID="Button4" runat="server" Text="首頁" OnClick="Button4_Click" UseSubmitBehavior="False" class="btn btn-secondary btn-sm text-uppercase" CausesValidation="False" />
                </div>
                
            </div>
        </div>
    </article>
</asp:Content>
