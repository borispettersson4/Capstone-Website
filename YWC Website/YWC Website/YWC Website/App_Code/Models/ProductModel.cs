  using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductModel
/// </summary>
public class ProductModel
{

    public string InsertProduct(Product product)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();
            db.Products.Add(product);
            db.SaveChanges();

            return product.Name + " was successfully inserted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string UpdateProduct(int id, Product product)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();

            //Fetch an object from db
            Product p = db.Products.Find(id);

            //Replace the data in db
            p.Name = product.Name;
            p.Price = product.Price;
            p.TypeId = product.TypeId;
            p.Description = product.Description;
            p.Image = product.Image;
            p.Stock = product.Stock;

            db.SaveChanges();

            return product.Name + " was successfully updated";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string DeleteProduct(int id)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();
            Product product = db.Products.Find(id);

            db.Products.Attach(product);
            db.Products.Remove(product);
            db.SaveChanges();

            return product.Name + " was successfully deleted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public Product GetProduct(int id)
    {
        try
        {
            using (YWC_StorageEntities db = new YWC_StorageEntities())
            {
                Product product = db.Products.Find(id);
                return product;
            }
        }
        catch(Exception)
        {
            return null;
        }
    }

    public List<Product> GetAllProducts()
    {
        try
        {
            using (YWC_StorageEntities db = new YWC_StorageEntities())
            {
                List<Product> products = (from x in db.Products
                                          select x).ToList();
                return products;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public List<Product> GetAllProductsByType(int typeId)
    {
        try
        {
            using (YWC_StorageEntities db = new YWC_StorageEntities())
            {
                List<Product> products = (from x in db.Products
                                          where x.TypeId == typeId
                                          select x).ToList();
                return products;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public void UpdateStock(int id, int x)
    {
        try
        {
            using (YWC_StorageEntities db = new YWC_StorageEntities())
            {
                Product product = db.Products.Find(id);
                product.Stock = x;
                db.SaveChanges();
            }
        }
        catch (Exception){}
    }

}