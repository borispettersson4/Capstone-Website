  using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductModel
/// </summary>
public class PageContentModel
{

    public List<PageContent> GetPageContent()
    {
        StoreEntities1 db = new StoreEntities1();
        return db.PageContents.ToList();
    }

    public void UpdateInfo(PageContent content)
    {
        StoreEntities1 db = new StoreEntities1();

        PageContent page = db.PageContents.Find(content.Id);

        page = content;
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