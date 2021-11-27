<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_MessageBoard.Master" AutoEventWireup="true" CodeBehind="ContentPage_Message_Index.aspx.cs" Inherits="BS4_MasterPages_MessageBoard.ContentPage_Message_Index" %>

<%@ Register Src="~/WebUserControl1.ascx" TagPrefix="uc1" TagName="WebUserControl1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Message Board</title>
    
    <link href="css/styles.css" rel="stylesheet" />
    <style type="text/css">
        .新增樣式1 {
            width: 800px;
            font-family: "Noto Sans CJK TC Bold";
        }
        .新增樣式2 {
        }
        .新增樣式3 {
            width: 800px;
            font-family: "Noto Sans CJK TC Bold";
        }
        .新增樣式4 {
            line-height: 40px;
        }
        .新增樣式5 {
            font-family: "Noto Sans CJK TC Medium";
            font-size: 17px;
            color: #000000;
            line-height: 40px;
            width: 800px;
            margin-right: 0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex mb-4"><asp:Button ID="Button1" runat="server" Text="發表文章" OnClick="Button1_Click" class="btn btn-primary text-uppercase"/></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" style="text-align: center" CssClass="新增樣式5">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="編號">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="主題" SortExpression="title">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Bind("title") %>' NavigateUrl='<%# "ContentPage_Message_Main.aspx?id="+Eval("id") %>' CssClass="text-decoration:none;" Font-Bold="False" Font-Underline="False" ForeColor="Black"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="nickname" HeaderText="發表人" SortExpression="nickname" />
            <asp:BoundField DataField="initDate" HeaderText="留言日期" SortExpression="initDate" DATAFORMATSTRING="{0:yyyy-MM-dd HH':'mm}" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="回應">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("reply") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#993333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <uc1:WebUserControl1 runat="server" id="WebUserControl1" />
    <div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase back-to-top" href="#top" >Back to top▲</a></div>
</asp:Content>
