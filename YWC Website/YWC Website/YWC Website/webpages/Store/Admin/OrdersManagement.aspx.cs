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
        YWC_StorageEntities db = new YWC_StorageEntities();
        OrderModel orderModel = new OrderModel();

        //Get all purchases for current user and display in table
        List<OrderDetail> orderList = orderModel.GetAllUniqueOrders();



    }

    protected void OrderView_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Get current row
        GridViewRow row = OrderView.SelectedRow;

        //Get the current product ID
        int rowId = Convert.ToInt32(row.Cells[0].Text);

        //Redirect user to the manager page
        Response.Redirect("~/webpages/Store/Admin/Order.aspx?id=" + rowId);
    }

    protected void OrderView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = (GridViewRow)e.Row;
        TableCell cell = row.Cells[OrderView.SelectedIndex];

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Attributes.Add("style", "word-break:break-all;word-wrap:break-word;width:100px");
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //check number of row and set the pixel
            e.Row.Height = Unit.Pixel(20);
        }

        if (cell.Controls.Count > 0)
        {
            LinkButton control = cell.Controls[6] as LinkButton;
            if (control != null)
            {
                control.Text = "View";
            }
        }
    }


}
