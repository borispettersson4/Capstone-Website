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
            YWC_StorageEntities db = new YWC_StorageEntities();
            db.ProductTypes.Add(productType);
            db.SaveChanges();

            return productType.Name + " was successfully inserted";
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
            YWC_StorageEntities db = new YWC_StorageEntities();

            //Fetch an object from db
            ProductType p = db.ProductTypes.Find(id);

            //Replace the data in db
            p.Name = productType.Name;

            db.SaveChanges();

            return productType.Name + " was successfully updated";
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
            YWC_StorageEntities db = new YWC_StorageEntities();
            ProductType productType = db.ProductTypes.Find(id);

            db.ProductTypes.Attach(productType);
            db.ProductTypes.Remove(productType);
            db.SaveChanges();

            return productType.Name + " was successfully deleted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public List<ProductType> GetAllProductTypes()
    {
        try
        {
            using (YWC_StorageEntities db = new YWC_StorageEntities())
            {
                List<ProductType> products = (from x in db.ProductTypes
                                          select x).ToList();
                return products;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public string[] GetAllProductNames()
    {
        try
        {
            using (YWC_StorageEntities db = new YWC_StorageEntities())
            {
                string[] products = (from x in db.ProductTypes
                                         select x.Name).ToArray();
                return products;   
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

}