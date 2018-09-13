﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        string url = HttpContext.Current.Request.Url.AbsoluteUri;
        string clientID = Context.User.Identity.GetUserId();

        Label1.Text = clientID;

        if (url.Contains("order="))
        {
            List<Cart> carts = (List<Cart>)Session[User.Identity.GetUserId()];

            OrderModel orderModel = new OrderModel();
            CartModel cartModel = new CartModel();
            UserInfoModel userModel = new UserInfoModel();
            ProductModel productModel = new ProductModel();

            try
            {
                foreach(Cart cart in carts)
                {
                    cart.DatePurchased = DateTime.Now;

                    foreach (Product product in productModel.GetAllProducts())
                    {
                        if (product.Id == cart.ProductID)
                        {
                            int newStock = product.Stock - cart.Amount;
                            productModel.UpdateStock(product.Id,newStock);
                        }
                    }
                }

                OrderDetail order = new OrderDetail
                {
                    ClientID = clientID,
                    DatePurchased = DateTime.Now,
                    Status = "PENDING",
                    ClientAddress = userModel.GetUserInformation(clientID).Address.ToString() + " ZIP:" + userModel.GetUserInformation(clientID).PostalCode.ToString(),
                    ClientName = userModel.GetUserInformation(clientID).FirstName.ToString() + " " + userModel.GetUserInformation(clientID).LastName.ToString(),
                    CartID = carts.ElementAt(0).ID,
                    Total = Convert.ToDouble(Session["total"].ToString()),
                    ClientEmail = userModel.GetUserInformation(clientID).Email


                };

                Label1.Text = orderModel.InsertOrder(order);

                cartModel.MarkOrdersAsPaid(carts);


                //   }

            }catch(Exception ex)
            {
                Label1.Text = "An Error Occured. Please Try Again Later. " + ex;
            }

            Session[User.Identity.GetUserId()] = null;
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

    <div style="text-align:center">

        <h3>&nbsp;</h3>
        <h3>&nbsp;</h3>
        <h2>Thank You</h2>
        <p>&nbsp;</p>
    <p>
        Your payment has been received. Thank you for your purchase.
    </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>

    <p>
        <small>
            We will send your items shortly
        </small>
    </p>

    </div>
</asp:Content>
