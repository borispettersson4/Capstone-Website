﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webpages_Store_Admin_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Get order data
        GetAllOrders();
    }

    protected void View_Item(object sender, EventArgs e)
    {
        LinkButton selectedLink = (LinkButton)sender;
        string link = selectedLink.ID.Replace("view", "");
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

    private void GetAllOrders()
    {
        StoreEntities1 db = new StoreEntities1();
        OrderModel orderModel = new OrderModel();
        CartModel cartModel = new CartModel();

        List<Cart> cartList = new List<Cart>();

        if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            OrderDetail order = orderModel.GetOrder(id);
            string cartDate = "";

            foreach (Cart cart in db.Carts)
            {
                cartDate = cart.DatePurchased.ToString();

                if (cart.ClientID == order.ClientID && order.DatePurchased.ToString() == cartDate)
                    cartList.Add(cart);
            }


            double subTotal = 0;
            CreateOrderTable(cartList, out subTotal);

            //Add totals to webpage
            double vat = subTotal * 0.11;
            double totalAmount = subTotal + 15 + vat;

            litTotal.Text = "$ " + subTotal;
            litVat.Text = "$ " + vat;
            litTotalAmount.Text = "$ " + totalAmount;

            litClientName.Text = order.ClientName.ToString();
            litClientEmail.Text = order.ClientEmail;
            litClientAddress.Text = order.ClientAddress;
            litPurchaseDate.Text = order.DatePurchased.ToString();

            if (order.Status == "PENDING")
            {
                lblOrderStatus.Text = "Confirmation Pending";
                lblOrderStatusDesc.Text = "Order not yet confirmerd. Please enter the tracking ID number provided by the post office to send delivery confirmation to client.";
                lnkDeleteOrder.Visible = false;
                lnkDeleteOrder.Enabled = false;
                textBoxTracking.Visible = true;
                buttonSend.Visible = true;
            }
            else
            {
                lblOrderStatus.Text = "Order Confirmed";
                lblOrderStatusDesc.Text = "Order is confirmed. No further action is required.";
                lnkDeleteOrder.Visible = true;
                lnkDeleteOrder.Enabled = true;
                textBoxTracking.Visible = false;
                buttonSend.Visible = false;
            }
        }
    }

    private void CreateOrderTable(IEnumerable<Cart> carts, out double subTotal)
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
            ddlAmount.Enabled = false;

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
            //cell1_6.Controls.Add(lnkDelete);
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
            pnlOrders.Controls.Add(table);

            //Add total of current purchased item to subtotal
            subTotal += (cart.Amount * Convert.ToDouble(product.Price));
        }

    }

    protected void buttonSend_Click(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        OrderModel orderModel = new OrderModel();
        CartModel cartModel = new CartModel();

        List<Cart> cartList = new List<Cart>();

        if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            OrderDetail order = orderModel.GetOrder(id);

            //Send Email to Client
            System.Net.Mail.SmtpClient smtpClient = new SmtpClient("mail.MyWebsiteDomainName.com", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("info@MyWebsiteDomainName.com", "myIDPassword");
            smtpClient.UseDefaultCredentials = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("info@MyWebsiteDomainName", "MyWeb Site");
            mail.To.Add(new MailAddress("info@MyWebsiteDomainName"));
            mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));

            //smtpClient.Send(mail);

            OrderDetail updatedOrder = order;

            updatedOrder.Status = "SENT";

            orderModel.UpdateOrder(order.Id, updatedOrder);
            
            Response.Redirect("~/webpages/Store/Admin/OrdersManagement.aspx");

        }
    }

    protected void lnkDeleteOrder_Click(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        OrderModel orderModel = new OrderModel();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        OrderDetail order = orderModel.GetOrder(id);

        if (order.Status == "SENT")
        {
            orderModel.DeleteOrder(order.Id);
            Response.Redirect("~/webpages/Store/Admin/OrdersManagement.aspx");
        }
    }
}