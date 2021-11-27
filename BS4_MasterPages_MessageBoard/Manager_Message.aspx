<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager_Message.aspx.cs" Inherits="BS4_MasterPages_MessageBoard.Manager_Message" MaintainScrollPositionOnPostback="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text="全部留言內容審核頁面 : "></asp:Label>
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="跳至留言板主頁" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="留言板文章總表 : " Font-Bold="True" Font-Size="Medium"></asp:Label>
            <asp:Button ID="Button5" runat="server" OnClientClick="location='#GridView2'" Text="跳至回應留言總表" />
            <asp:Button ID="Button2" runat="server" Text="送出留言板文章審核結果" OnClick="Button2_Click"/>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" OnClientClick="location='#GridView2'" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="delete" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('你確定要刪除留言及相關回應嗎?')"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" />
                    <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                    <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" />
                    <asp:TemplateField HeaderText="verify" SortExpression="verify">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("verify") %>' Enabled="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="initDate" HeaderText="initDate" SortExpression="initDate" />
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
        <hr />
        <hr />
        <div>
            <asp:Label ID="Label2" runat="server" Text="回應留言總表 : " Font-Bold="True" Font-Size="Medium"></asp:Label>
            <asp:Button ID="Button6" runat="server" Text="跳至留言板文章總表" OnClientClick="location='#Label1'" />
            <asp:Button ID="Button3" runat="server" Text="送出回應留言審核結果" OnClick="Button3_Click"/>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView2_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="delete" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button4" runat="server" Text="刪除" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('你確定要刪除回應留言嗎?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="title_id" HeaderText="title_id" SortExpression="title_id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" />
                    <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                    <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" />
                    <asp:TemplateField HeaderText="verify" SortExpression="verify">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("verify") %>' Enabled="True" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="initDate" HeaderText="initDate" SortExpression="initDate" />
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
    </form>
</body>
</html>
