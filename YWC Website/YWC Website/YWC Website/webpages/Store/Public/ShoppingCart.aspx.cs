using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class webpages_Store_Public_ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check if user is logged in
        string userId = User.Identity.GetUserId();

        //Display all items in user's cart.
        GetPurchasesInCart(userId);
    }

    protected void Delete_Item(object sender, EventArgs e)
    {
        LinkButton selectedLink = (LinkButton)sender;
        string link = selectedLink.ID.Replace("del", "");
        int cartId = Convert.ToInt32(link);

        var cartModel = new CartModel();
        cartModel.DeleteCart(cartId);

        Response.Redirect("~/webpages/Store/Public/ShoppingCart.aspx");
    }

    private void ddlAmount_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Get ID of product that has had its quantity dropdownlist changed.
        DropDownList selectedList = (DropDownList)sender;
        int cartId = Convert.ToInt32(selectedList.ID);
        int quantity = Convert.ToInt32(selectedList.SelectedValue);

        //Update purchase with new quantity and refresh page
        CartModel cartModel = new CartModel();
        cartModel.UpdateQuantity(cartId, quantity);
        Response.Redirect("~/webpages/Store/Public/ShoppingCart.aspx");
    }

    private void GetPurchasesInCart(string userId)
    {
        CartModel cartModel = new CartModel();
        double subTotal = 0;

        //Get all purchases for current user and display in table
        List<Cart> purchaseList = cartModel.GetOrdersInCart(userId);
        CreateShopTable(purchaseList, out subTotal);

        //Add totals to webpage
        double vat = subTotal * 0.11;
        double totalAmount = subTotal + 15 + vat;

        litTotal.Text = "$ " + subTotal;
        litVat.Text = "$ " + vat;
        litTotalAmount.Text = "$ " + totalAmount;
        Session["total"] = totalAmount.ToString();

        //Add paypal button to checkout
        string paypal = GeneratePaypalButton(subTotal);
        litPaypal.Text = paypal;
    }

    private void CreateShopTable(IEnumerable<Cart> carts, out double subTotal)
    {
        subTotal = new double();
        ProductModel model = new ProductModel();

        foreach (Cart cart in carts)
        {
            //Create HTML elements and fill values with database data
            Product product = model.GetProduct(cart.ProductID);

            ImageButton btnImage = new ImageButton
            {
                ImageUrl = string.Format("~/Images/Products/{0}", product.Image),
                PostBackUrl = string.Format("~/webpages/Store/Public/Product.aspx?id={0}", product.Id)
            };

            LinkButton lnkDelete = new LinkButton
            {
                PostBackUrl = string.Format("~/webpages/Store/Public/ShoppingCart.aspx?productId={0}", cart.ID),
                Text = "Remove Item",
                ID = "del" + cart.ID,
            };

            lnkDelete.Click += Delete_Item;

            //Fill amount list with numbers 1-20
            int[] amount = Enumerable.Range(1, 20).ToArray();
            DropDownList ddlAmount = new DropDownList
            {
                DataSource = amount,
                AppendDataBoundItems = true,
                AutoPostBack = true,
                ID = cart.ID.ToString()
            };
            ddlAmount.DataBind();
            ddlAmount.SelectedValue = cart.Amount.ToString();
            ddlAmount.SelectedIndexChanged += ddlAmount_SelectedIndexChanged;

            //Create table to hold shopping cart details
            Table table = new Table { CssClass = "CartTable" };
            TableRow row1 = new TableRow();
            TableRow row2 = new TableRow();

            TableCell cell1_1 = new TableCell { RowSpan = 2, Width = 50 };
            TableCell cell1_2 = new TableCell
            {
                Text = string.Format("<h4>{0}</h4><br />{1}<br/>In Stock",
                product.Name, "Item No:" + product.Id),
                HorizontalAlign = HorizontalAlign.Left,
                Width = 350,
            };
            TableCell cell1_3 = new TableCell { Text = "Item Price<hr/>" };
            TableCell cell1_4 = new TableCell { Text = "Quantity<hr/>" };
            TableCell cell1_5 = new TableCell { Text = "Item Total<hr/>" };
            TableCell cell1_6 = new TableCell();

            TableCell cell2_1 = new TableCell();
            TableCell cell2_2 = new TableCell { Text = "$ " + product.Price };
            TableCell cell2_3 = new TableCell();
            TableCell cell2_4 = new TableCell { Text = "$ " + Math.Round((cart.Amount * Convert.ToDouble(product.Price)), 2) };
            TableCell cell2_5 = new TableCell();



            //Set custom controls
            cell1_1.Controls.Add(btnImage);
            cell1_6.Controls.Add(lnkDelete);
            cell2_3.Controls.Add(ddlAmount);

            //Add rows & cells to table
            row1.Cells.Add(cell1_1);
            row1.Cells.Add(cell1_2);
            row1.Cells.Add(cell1_3);
            row1.Cells.Add(cell1_4);
            row1.Cells.Add(cell1_5);
            row1.Cells.Add(cell1_6);

            row2.Cells.Add(cell2_1);
            row2.Cells.Add(cell2_2);
            row2.Cells.Add(cell2_3);
            row2.Cells.Add(cell2_4);
            row2.Cells.Add(cell2_5);
            table.Rows.Add(row1);
            table.Rows.Add(row2);
            pnlShoppingCart.Controls.Add(table);

            //Add total of current purchased item to subtotal
            subTotal += (cart.Amount * Convert.ToDouble(product.Price));
        }

        //Add selected objects to Session
        Session[User.Identity.GetUserId()] = carts;
    }

    private string GeneratePaypalButton(double subTotal)
    {
        //Set Paypal parameters
        string paypal = string.Format(
            @"<script async='async' src='https://www.paypalobjects.com/js/external/paypal-button.min.js?borispettersson4@gmail.com' 
                data-button='buynow' 
                data-name='Garage Purchases' 
                data-quantity=1
                data-amount='{0}' 
                data-tax='{1}'
                data-shipping='15'
                data-callback='http://localhost:50992/Pages/Success.aspx'
                data-sendback='http://localhost:50992/Pages/Success.aspx'
                data-env='sandbox'>
             </script>", subTotal, (subTotal * 0.11));

        return paypal;
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        string order_no;

        //Pass them to paypal
        Random rnd = new Random();
        order_no = Convert.ToString(rnd.Next(000000000, 999999999));
        Session["order_no"] = order_no.ToString();

        Response.Write("<form action='https://www.sandbox.paypal.com/cgi-bin/webscr' method='post' name='buyCredits' id='buyCredits'>");
        Response.Write("<input type='hidden' name='cmd' value='_xclick'>");
        Response.Write("<input type='hidden' name='business' value='yeswecanine@gmail.com'>");
        Response.Write("<input type='hidden' name='currency_code' value='USD'>");
        Response.Write("<input type='hidden' name='iem_name' value='Yes-We-Can-Ine Purchase Confirmation'>");
        Response.Write("<input type='hidden' name='amount' value='" + Session["total"].ToString() + "'>");
        Response.Write("<input type='hidden' name='return' value='http://localhost:49520/webpages/Store/Public/Success.aspx?order=" + order_no.ToString() + "'>");
        Response.Write("</form>");

        Response.Write("<script type='text/javascript'>");
        Response.Write("document.getElementById('buyCredits').submit();");
        Response.Write("</script>");
    }
}
