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
        CreateShopTable(purchaseList, out subTotal);

        //Add totals to webpage
        double vat = subTotal * 0.11;
        double totalAmount = subTotal + vat + 15;

        //Display values on webpage

        litTotal.Text = "$ " + subTotal;
        litVat.Text = "$ " + vat;
        litTotalAmount.Text = "$ " + totalAmount;
    }

    private void CreateShopTable(List<Cart> purchaseList, out double subTotal)
    {
        subTotal = new double();
        ProductModel model = new ProductModel();

        foreach (Cart cart in purchaseList)
        {
            Product product = model.GetProduct(cart.ProductID);

            //Create the image button
            ImageButton buttonImage = new ImageButton
            {
                ImageUrl = string.Format("~/Images/Products/{0}", product.Image),
                PostBackUrl = string.Format("~/webpages/Store/Public/Product.aspx?id={0}", product.Id),
                CssClass = "productImage"
                
            };

            //Create delete link
            LinkButton linkDelete = new LinkButton
            {
                PostBackUrl = string.Format("~/webpages/ShoppingCart.aspx?productId={0}", cart.ID),
                Text = "Delete Item",
                ID = "del" + cart.ID
            };

            //Add an OnClick Event
            linkDelete.Click += Delete_Item;

            //Create the quantity dropdown
            //Generate list with numbers from 1 to 20
            int[] amount = Enumerable.Range(1, 20).ToArray();
            DropDownList dropDownAmount = new DropDownList
            {
                DataSource = amount,
                AppendDataBoundItems = true,
                AutoPostBack = true,
                ID = cart.ID.ToString()
            };

            dropDownAmount.DataBind();
            dropDownAmount.SelectedValue = cart.Amount.ToString();
            dropDownAmount.SelectedIndexChanged += dropDownAmount_SelectedIndexChanged;

            //Create HTML table with 2 rows
            Table table = new Table { CssClass = "CartTable" };
            TableRow a = new TableRow();
            TableRow b = new TableRow();

            //Create 6 cells for row A 

            TableCell a1 = new TableCell { RowSpan = 2, Width = 50 };

            TableCell a2 = new TableCell { Text = string.Format("<h4>{0}</h4><br/>{1}<br/> Stock",
                product.Name, "Item No: " + product.Id),
                HorizontalAlign = HorizontalAlign.Left, Width = 350
            };

            TableCell a3 = new TableCell { Text = "Unit Price<hr/>" };

            TableCell a4 = new TableCell { Text = "Quantity<hr/>" };

            TableCell a5 = new TableCell { Text = "IItem Total<hr/>" };

            TableCell a6 = new TableCell { };

            //Create 6 cells for row B

            TableCell b1 = new TableCell { };

            TableCell b2 = new TableCell { Text = "$ " + product.Price };
            TableCell b3 = new TableCell { };

            TableCell b4 = new TableCell { Text = "$ " + Math.Round((cart.Amount * Convert.ToDouble(product.Price)) , 2)};

            TableCell b5 = new TableCell { };

            TableCell b6 = new TableCell { };

            //Set special controls
            a1.Controls.Add(buttonImage);
            a6.Controls.Add(linkDelete);
            b3.Controls.Add(dropDownAmount);

            //Add cells to rows
            a.Cells.Add(a1);
            a.Cells.Add(a2);
            a.Cells.Add(a3);
            a.Cells.Add(a4);
            a.Cells.Add(a5);
            a.Cells.Add(a6);

            b.Cells.Add(b1);
            b.Cells.Add(b2);
            b.Cells.Add(b3);
            b.Cells.Add(b4);
            b.Cells.Add(b5);
            b.Cells.Add(b6);

            //Add rows to tables
            table.Rows.Add(a);
            table.Rows.Add(b);

            //Add table to panelShoppingCart
            pnlShoppingCart.Controls.Add(table);

            //Add total amount of items in cart subtotal
            subTotal += (cart.Amount * Convert.ToDouble(product.Price));
        }

        //Add current user's shopping cart to user specific session
        Session[User.Identity.GetUserId()] = purchaseList;
    }

    private void Delete_Item(object sender, EventArgs e)
    {
        LinkButton selectedLink = (LinkButton)sender;

        string link = selectedLink.ID.Replace("del", "");
        int cartId = Convert.ToInt32(link);

        CartModel model = new CartModel();
        model.DeleteCart(cartId);

        Response.Redirect("~/webpages/Store/Public/ShoppingCart.aspx");
    }

    private void dropDownAmount_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList selectedList = (DropDownList)sender;
        int quantity = Convert.ToInt32(selectedList.SelectedValue);
        int cartId = Convert.ToInt32(selectedList.ID);

        CartModel model = new CartModel();
        model.UpdateQuantity(cartId, quantity);

        Response.Redirect("~/webpages/Store/Public/ShoppingCart.aspx");
    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

        <asp:Panel ID="pnlShoppingCart" runat="server">
    </asp:Panel>
        <table>
            <tr>
                <td>
                    <b>Total: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotal" runat="server" Text=""></asp:Literal>
                </td>
            </tr>

            <tr>
                <td>
                    <b>Vat: </b>
                </td>
                <td>
                    <asp:Literal ID="litVat" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Shipping: </b>
                </td>
                <td>
                    $ 15
                </td>
            </tr>

            <tr>
                <td>
                    <b>Total Amount: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotalAmount" runat="server" Text="" />
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Index.aspx">Continue Shopping</asp:LinkButton> &nbsp;&nbsp; or                     
                    <asp:Button ID="btnCheckout" runat="server" Text="Check Out" CssClass="button" Width="250px" PostBackUrl="~/Pages/Success.aspx" />

                    <br />

                    <asp:LinkButton ID="litPaypal" Text="" runat="server" />
                </td>
            </tr>

        </table>


</asp:Content>

