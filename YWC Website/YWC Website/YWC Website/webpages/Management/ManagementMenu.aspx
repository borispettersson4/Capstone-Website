<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <p>
        Welcome to the website manager admin page. Select an option to get started!

    </p>

       <h2>Home</h2>

    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/DefaultManager.aspx">Edit Home Page</asp:HyperLink>
    </p>

       <h2>Store</h2>

    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/webpages/Store/Admin/StoreManagement.aspx">Edit Store Items</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/webpages/Store/Admin/OrdersManagement.aspx">View Orders</asp:HyperLink>
    </p>

</asp:Content>

