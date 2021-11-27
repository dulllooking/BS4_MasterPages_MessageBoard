<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_ManagerVerify.Master" AutoEventWireup="true" CodeBehind="ContentPageV_Manager_Message.aspx.cs" Inherits="BS4_MasterPages_MessageBoard.ContentPageV_Manager_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manager Message</title>
    <style type="text/css">
        .新增樣式1 {
            margin-right: auto;
            margin-left: auto;
        }
        .新增樣式2 {
            margin-right: auto;
            margin-left: auto;
            width: 800px;
        }
        .新增樣式3 {
            margin-right: auto;
            margin-bottom: auto;
            width: 800px;
        }
        .新增樣式4 {
            margin-right: auto;
            margin-left: auto;
            width: 800px;
        }
        .新增樣式5 {
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="全部留言內容審核頁面 : "></asp:Label>
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="跳至留言板主頁" />
        <span class="新增樣式4">
        <br />
        </span>
        <asp:Label ID="Label1" runat="server" Text="留言板文章總表 : " Font-Bold="True" Font-Size="Medium"></asp:Label>
        <asp:Button ID="Button5" runat="server" OnClientClick="location='#GridView2'" Text="跳至回應留言總表" />
        <asp:Button ID="Button2" runat="server" Text="送出留言板文章審核結果" OnClick="Button2_Click"/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" OnClientClick="location='#GridView2'">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="delete" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('你確定要刪除留言及相關回應嗎?')"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" >
                <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" >
                <HeaderStyle Width="100px" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" >
                <HeaderStyle Width="200px" />
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="verify" SortExpression="verify">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("verify") %>' Enabled="True" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <hr class="新增樣式4" />
        <hr class="新增樣式4" />
        <asp:Label ID="Label2" runat="server" Text="回應留言總表 : " Font-Bold="True" Font-Size="Medium"></asp:Label>
        <asp:Button ID="Button6" runat="server" Text="跳至留言板文章總表" OnClientClick="location='#Label1'" />
        <asp:Button ID="Button3" runat="server" Text="送出回應留言審核結果" OnClick="Button3_Click"/>
        <span class="新增樣式4">
        <br />
        </span>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView2_RowDeleting" Width="800px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="delete" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button4" runat="server" Text="刪除" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('你確定要刪除回應留言嗎?')" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" />
                <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                <asp:TemplateField HeaderText="verify" SortExpression="verify">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("verify") %>' Enabled="True" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
</asp:Content>
