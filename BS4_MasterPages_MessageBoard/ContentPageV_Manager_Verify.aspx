<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_ManagerVerify.Master" AutoEventWireup="true" CodeBehind="ContentPageV_Manager_Verify.aspx.cs" Inherits="BS4_MasterPages_MessageBoard.ContentPageV_Manager_Verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manager Verify</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div>
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" Text="管理員資格審核頁面 : "></asp:Label>
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="跳至留言板主頁" UseSubmitBehavior="False" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="*新增管理員" Font-Bold="True" Font-Size="Medium"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="帳號   : " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" AutoCompleteType="Disabled"  required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('請勿留白!')"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="密碼   : " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" AutoCompleteType="Disabled" TextMode="Password"  required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('請勿留白!')"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="email : " Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" AutoCompleteType="Disabled" TextMode="Email"  required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('請勿留白!')"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" Text="新增管理員帳號資料" Font-Bold="True" OnClick="Button2_Click" />
        </div>
        <hr />
        <hr />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="account" HeaderText="account" SortExpression="account" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:CheckBoxField DataField="maxPower" HeaderText="maxPower" SortExpression="maxPower" />
                    <asp:BoundField DataField="initDate" HeaderText="initDate" SortExpression="initDate" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MessageBoardConnectionString %>" DeleteCommand="DELETE FROM [managerData] WHERE [id] = @id" InsertCommand="INSERT INTO [managerData] ([account], [password], [email], [maxPower], [initDate]) VALUES (@account, @password, @email, @maxPower, @initDate)" SelectCommand="SELECT * FROM [managerData] ORDER BY [initDate] DESC" UpdateCommand="UPDATE [managerData] SET [account] = @account, [password] = @password, [email] = @email, [maxPower] = @maxPower, [initDate] = @initDate WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="account" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="maxPower" Type="Boolean" />
                    <asp:Parameter Name="initDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="account" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="maxPower" Type="Boolean" />
                    <asp:Parameter Name="initDate" Type="DateTime" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <hr />
            <hr />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="跳至全部留言內容審核頁面" UseSubmitBehavior="False" />
        </div>
</asp:Content>
