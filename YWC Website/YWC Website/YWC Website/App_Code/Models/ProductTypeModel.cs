using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductTypeModel
/// </summary>
public class ProductTypeModel
{

    public string InsertProductType(ProductType productType)
    {
        try
        {
            StoreEntities1 db = new StoreEntities1();
            db.ProductTypes.Add(productType);
            db.SaveChanges();

            return productType.Name + "was successfully inserted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string UpdateProductType(int id, ProductType productType)
    {
        try
        {
            StoreEntities1 db = new StoreEntities1();

            //Fetch an object from db
            ProductType p = db.ProductTypes.Find(id);

            //Replace the data in db
            p.Name = productType.Name;

            db.SaveChanges();

            return productType.Name + "was successfully updated";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string DeleteProductType(int id)
    {
        try
        {
            StoreEntities1 db = new StoreEntities1();
            ProductType productType = db.ProductTypes.Find(id);

            db.ProductTypes.Attach(productType);
            db.ProductTypes.Remove(productType);
            db.SaveChanges();

            return productType.Name + "was successfully deleted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

}