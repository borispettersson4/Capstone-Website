<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void gridProducts_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Get current row
        GridViewRow row = gridProducts.Rows[e.NewEditIndex];

        //Get the current product ID
        int rowId = Convert.ToInt32(row.Cells[1].Text);

        //Redirect user to the manager page
        Response.Redirect("~/webpages/Store/Admin/ManageProducts.aspx?id=" + rowId);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="15pt" Text="Orders Management"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gridProducts" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsProducts" Width="100%" OnRowEditing="gridProducts_RowEditing" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ClientID" HeaderText="ClientID" SortExpression="ClientID" />
                <asp:BoundField DataField="DatePurchased" HeaderText="DatePurchased" SortExpression="DatePurchased" />
                <asp:CheckBoxField DataField="isSent" HeaderText="isSent" SortExpression="isSent" />
                <asp:BoundField DataField="ClientName" HeaderText="ClientName" SortExpression="ClientName" />
                <asp:BoundField DataField="ClientAddress" HeaderText="ClientAddress" SortExpression="ClientAddress" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="SELECT * FROM [OrderDetails]">
        </asp:SqlDataSource>
        <br />
</asp:Content>

