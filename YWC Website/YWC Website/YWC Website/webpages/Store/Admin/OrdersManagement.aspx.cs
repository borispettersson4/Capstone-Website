using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class webpages_Store_Admin_OrdersManagement : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        OrderModel orderModel = new OrderModel();

        //Get all purchases for current user and display in table
        List<OrderDetail> orderList = orderModel.GetAllUniqueOrders();

        //   SELECT DISTINCT[ClientName], [DatePurchased], [ClientAddress], [isSent] FROM[OrderDetails] ORDER BY[DatePurchased] GROUP BY[DatePurchased]

    }

    protected void gridProducts_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Get current row
        GridViewRow row = OrderView.Rows[e.NewEditIndex];

        //Get the current product ID
        int rowId = Convert.ToInt32(row.Cells[1].Text);

        //Redirect user to the manager page
        Response.Redirect("~/webpages/Store/Admin/ManageProducts.aspx?id=" + rowId);
    }

    protected void OrderView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
