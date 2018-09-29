<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>
<%@ Import namespace="System.Linq" %>
<%@ Import namespace="System.Net.Mail" %>

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
            string productInfoList = "";

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

                            productInfoList += product.Name + " : " + product.Price + "$" + "<p></p>";
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

                //Email Send Details

                //Mail Message

                string subjectMessage = "";

                subjectMessage = ("<html><body><b>Your payment of the following items have been recieved successfully:</b><p></p>");

                subjectMessage += productInfoList;

                subjectMessage += ("<p></p><p>Total Amount Paid : " + order.Total + "$" + "</p> <p></p> <p>Your order is currently being processed and will be shipped soon. If you have any questions about your purchase, please reply to this email.</p> </body> </html>");


                //Send Client EMail

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new System.Net.NetworkCredential("yeswecanine.mail@gmail.com", "Yeswecanine")
                };
                using (var message = new MailMessage("yeswecanine.mail@gmail.com", order.ClientEmail)
                {
                    Subject = "Thank you for your purchase",
                    Body = string.Format(subjectMessage),
                    IsBodyHtml = true //optional
                })
                {
                    smtp.Send(message);
                }

                //Send Owner Email
                
                string subjectMessage2 = "";

                subjectMessage2 = ("<html><body><b>The following items have been purchased</b><p></p>");

                subjectMessage2 += productInfoList;

                subjectMessage2 += ("<p></p><p>Total Amount Paid : " + order.Total + "$" + "</p> <p></p> <p>This order is now pending further action. Please visit the administration controls to view more details.</p> </body> </html>");

                var smtp2 = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new System.Net.NetworkCredential("yeswecanine.mail@gmail.com", "Yeswecanine")
                };
                using (var message = new MailMessage("yeswecanine.mail@gmail.com", "yeswecan_ine@yahoo.com")
                {
                    Subject = "You have a new order!",
                    Body = string.Format(subjectMessage2),
                    IsBodyHtml = true //optional
                })
                {
                    smtp2.Send(message);
                }


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

