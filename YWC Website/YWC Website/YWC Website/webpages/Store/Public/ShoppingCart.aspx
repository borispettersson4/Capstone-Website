<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="webpages_Store_Public_ShoppingCart" %>

<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Get id
        string userId = User.Identity.GetUserId();
        GetPurchasesInCart(userId);
    }

    void GetPurchasesInCart(string userId)
    {
        CartModel model = new CartModel();
        double subTotal = 0;

        //Create HTML for each element in purchase List
        List<Cart> purchaseList = model.GetOrdersInCart(userId);
       // CreateShopTable(purchaseList, out subTotal);

        //Add totals to webpage
        double vat = subTotal * 0.11;
        double totalAmount = subTotal + vat + 15;

        //Display values on webpage

        literalTotal.Text = "$" + subTotal;
        literalVat.Text = "$" + vat;
        literalTotalAmount.Text = "$" + totalAmount;
    }

 //   private void CreateShopTable(List<Cart> purchaseList, out double subTotal)
  //  {

  //  }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    
    <asp:panel id="panelShoppingCart" runat="server">

    </asp:panel>

    <table>

        <!--Row 1-->
        <tr>
            <td>
                <b>Total:</b>
            </td>
            <td>
                <asp:Literal id="literalTotal" runat="server" Text=""/></asp:Literal>
            </td>
        </tr>

        <!--Row 2-->
        <tr>
            <td>
                <b>Vat:</b>
            </td>
            <td>
                <asp:Literal id="literalVat" runat="server" Text=""/></asp:Literal>
            </td>
        </tr>

        <!--Row 3-->
        <tr>
            <td>
                <b>Shipping:</b>
            </td>
            <td>
                <asp:Literal id="literalShipping" runat="server" Text=""/></asp:Literal>
            </td>
        </tr>

        <!--Row 4-->
        <tr>
            <td>
                <b>Total Amount:</b>
            </td>
            <td>
                <asp:Literal id="literalTotalAmount" runat="server" Text=""/></asp:Literal>
            </td>
        </tr>

        <!--Bottom Buttons-->
        <tr>
            <td>
                <asp:LinkButton id="linkContinue" runat="server" PostBackUrl="~/webpages/Store/Public/Store.aspx"></asp:LinkButton>
     
                OR

                <asp:Button id="buttonCheckOut" runat="server" PostBackUrl="~/webpages/Store/Public/Success.aspx" CssClass="button" Width="250px" Text="Continue Checkout" />
                
            </tr>

    </table>

</asp:Content>

