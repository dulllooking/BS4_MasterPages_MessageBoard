<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_MessageBoard.Master" AutoEventWireup="true" CodeBehind="ContentPage_Message_Add.aspx.cs" Inherits="BS4_MasterPages_MessageBoard.ContentPage_Message_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Message Add</title>
    <link href="css/styles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main Content-->
    <main class="mb-4">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="d-flex flex-column">
                    <div class="d-flex">
                        <asp:Label ID="Label6" runat="server" Text="發佈時間 : " Font-Names="微軟正黑體" Font-Size="Small" ForeColor="#00CC99"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="Label" Font-Names="微軟正黑體" Font-Size="Small" ForeColor="#00CC99"></asp:Label>
                    </div>
                    <div class="d-flex">
                        <asp:Label ID="Label8" runat="server" Text="IP : " Font-Names="微軟正黑體" Font-Size="Small" ForeColor="#00CC99"></asp:Label>
                        <asp:Label ID="Label9" runat="server" Text="Label" Font-Names="微軟正黑體" Font-Size="Small" ForeColor="#00CC99"></asp:Label>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="*表示必填欄位" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="Red" Width="150px"></asp:Label>
                </div>
                        
                <div class="my-1">
                    <div class="form-floating">
                        <asp:Label ID="Label3" runat="server" Text="*標題"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control pt-1 mb-2" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('需填寫標題!')" style="height: 1rem"></asp:TextBox>
                    </div>
                    <div class="form-floating">
                        <asp:Label ID="Label4" runat="server" Text="*暱稱"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" class="form-control pt-1 mb-2" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('需填寫暱稱!')" style="height: 1rem"></asp:TextBox>
                    </div>
                    <div class="form-floating">
                        <asp:Label ID="Label5" runat="server" Text="*內容"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" class="form-control pt-1" TextMode="MultiLine" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('需填寫內容')"></asp:TextBox>
                    </div>
                    <br />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Send" class="btn btn-primary text-uppercase"/>
                    <input id="Reset1" type="reset" value="Reset" class="btn btn-primary text-uppercase"/>
                    <hr />
                    <asp:Button ID="Button1" runat="server" Text="回上一頁" OnClick="Button1_Click" UseSubmitBehavior="False" class="btn btn-secondary btn-sm text-uppercase" CausesValidation="False" />
                    <asp:Button ID="Button2" runat="server" Text="回最上面" href="#top" UseSubmitBehavior="False" class="btn btn-secondary btn-sm text-uppercase" CausesValidation="False" OnClick="Button2_Click"/>
                    <asp:Button ID="Button3" runat="server" Text="首頁" OnClick="Button3_Click" UseSubmitBehavior="False" class="btn btn-secondary btn-sm text-uppercase" CausesValidation="False" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>
