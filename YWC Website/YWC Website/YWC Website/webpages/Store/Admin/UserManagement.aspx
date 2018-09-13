<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrdersManagement.aspx.cs" Inherits="webpages_Store_Admin_OrdersManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

        <p>
            Users Lists<br />

            <asp:GridView ID="OrderView" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="UserData" Height="355px" OnSelectedIndexChanged="OrderView_SelectedIndexChanged" Width="1074px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName">
                    </asp:BoundField>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True">
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="EmailConfirmed" HeaderText="EmailConfirmed" SortExpression="EmailConfirmed" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="100" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

            <asp:SqlDataSource ID="UserData" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AspNetUsers] ([UserName], [Id], [EmailConfirmed]) VALUES (@UserName, @Id, @EmailConfirmed)" SelectCommand="SELECT [UserName], [Id], [EmailConfirmed] FROM [AspNetUsers]" UpdateCommand="UPDATE [AspNetUsers] SET [UserName] = @UserName, [EmailConfirmed] = @EmailConfirmed WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Id" Type="String" />
                    <asp:Parameter Name="EmailConfirmed" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="EmailConfirmed" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

        <asp:Panel ID="pnlOrders" runat="server">
            <br />
    </asp:Panel>

</asp:Content>

