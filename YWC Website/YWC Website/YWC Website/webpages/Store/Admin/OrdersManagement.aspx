<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrdersManagement.aspx.cs" Inherits="webpages_Store_Admin_OrdersManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

        <p>
            Orders List<br />

            <asp:GridView ID="OrderView" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="OrderDataSource" Height="223px" OnSelectedIndexChanged="OrderView_SelectedIndexChanged" Width="1074px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="No." InsertVisible="False" ReadOnly="True" SortExpression="Id">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DatePurchased" HeaderText="Purchase Date" SortExpression="DatePurchased">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Total" HeaderText="Total (USD)" SortExpression="Total">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ClientName" HeaderText="Name" SortExpression="ClientName">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ClientAddress" HeaderText="Address" SortExpression="ClientAddress">
                    <ItemStyle HorizontalAlign="Justify" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="View" ShowSelectButton="True">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
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

        <asp:Panel ID="pnlOrders" runat="server">
            <asp:SqlDataSource ID="OrderDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" DeleteCommand="DELETE FROM [OrderDetails] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [OrderDetails] ([DatePurchased], [Total], [ClientName], [ClientAddress], [Status]) VALUES (@DatePurchased, @Total, @ClientName, @ClientAddress, @Status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [DatePurchased], [Total], [ClientName], [ClientAddress], [Status] FROM [OrderDetails] ORDER BY [DatePurchased] DESC" UpdateCommand="UPDATE [OrderDetails] SET [DatePurchased] = @DatePurchased, [Total] = @Total, [ClientName] = @ClientName, [ClientAddress] = @ClientAddress, [Status] = @Status WHERE [Id] = @original_Id">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DatePurchased" Type="DateTime" />
                    <asp:Parameter Name="Total" Type="Double" />
                    <asp:Parameter Name="ClientName" Type="String" />
                    <asp:Parameter Name="ClientAddress" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DatePurchased" Type="DateTime" />
                    <asp:Parameter Name="Total" Type="Double" />
                    <asp:Parameter Name="ClientName" Type="String" />
                    <asp:Parameter Name="ClientAddress" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Panel ID="pnlOrders0" runat="server">
                <asp:GridView ID="OrderView0" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" datasourceid="CartSource" ForeColor="#333333" GridLines="None" Height="190px" OnSelectedIndexChanged="OrderView_SelectedIndexChanged" style="margin-right: 0px" Width="1076px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="ClientID" HeaderText="ClientID" SortExpression="ClientID" />
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                        <asp:BoundField DataField="DatePurchased" HeaderText="DatePurchased" SortExpression="DatePurchased" />
                        <asp:CheckBoxField DataField="IsInCart" HeaderText="IsInCart" SortExpression="IsInCart" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <asp:SqlDataSource ID="CartSource" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Cart]" DeleteCommand="DELETE FROM [Cart] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [Cart] ([ClientID], [ProductID], [Amount], [DatePurchased], [IsInCart]) VALUES (@ClientID, @ProductID, @Amount, @DatePurchased, @IsInCart)" UpdateCommand="UPDATE [Cart] SET [ClientID] = @ClientID, [ProductID] = @ProductID, [Amount] = @Amount, [DatePurchased] = @DatePurchased, [IsInCart] = @IsInCart WHERE [ID] = @original_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ClientID" Type="String" />
                        <asp:Parameter Name="ProductID" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Int32" />
                        <asp:Parameter Name="DatePurchased" Type="DateTime" />
                        <asp:Parameter Name="IsInCart" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ClientID" Type="String" />
                        <asp:Parameter Name="ProductID" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Int32" />
                        <asp:Parameter Name="DatePurchased" Type="DateTime" />
                        <asp:Parameter Name="IsInCart" Type="Boolean" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:Panel>
    </asp:Panel>

</asp:Content>

