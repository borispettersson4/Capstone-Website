  using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductModel
/// </summary>
public class PageContentModel
{

    public PageContent GetPageContent()
    {
        StoreEntities1 db = new StoreEntities1();
        return db.PageContents.Find(0);
    }

    public void UpdateInfo(PageContent content)
    {
        StoreEntities1 db = new StoreEntities1();

        PageContent page = db.PageContents.Find(0);

        page.Home_MainTitle = content.Home_MainTitle;
        page.Home_Title2 = content.Home_Title2;
        page.Home_Desc2 = content.Home_Desc2;
        page.Home_Title3 = content.Home_Title3;
        page.Home_Desc3 = content.Home_Desc3;
        page.Home_Title4 = content.Home_Title4;
        page.Home_Desc4 = content.Home_Desc4;
        page.Store_MainTitle = content.Store_MainTitle;
        page.Store_Desc1 = content.Store_Desc1;
        page.Store_Desc2 = content.Store_Desc2;
        page.Donation_MainTitle = content.Donation_MainTitle;
        page.Donation_Desc1 = content.Donation_Desc1;
        page.Contact_MainTitle = content.Contact_MainTitle;
        page.Contact_Desc1 = content.Contact_Desc1;
        page.Contact_Email = content.Contact_Email;
        page.Contact_Desc2 = content.Contact_Desc2;
        page.Contact_Tel = content.Contact_Tel;
        page.Gallery_MainTitle = content.Gallery_MainTitle;
        page.Gallery_Desc1 = content.Gallery_Desc1;
        db.SaveChanges();
    }

    public void addNewPageConent()
    {
        StoreEntities1 db = new StoreEntities1();
        PageContent page = new PageContent();

        db.PageContents.Add(page);

        db.SaveChanges();
    }

}