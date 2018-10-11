using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

/// <summary>
/// Summary description for Donation
/// </summary>
public partial class webpages_Donation_Donation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        PageContentModel model = new PageContentModel();
        PageContent content = model.GetPageContent();

        MainTitle.Text = content.Donation_MainTitle;
        Desc1.Text = content.Donation_Desc1;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=yeswecan_ine@yahoo.com&lc=US&item_name=Donation + to + Yes We Can-Ine & no_note = 0 & cn = &currency_code = USD & bn = PP - DonationsBF:btn_donateCC_LG.gif:NonHosted");

    }
}