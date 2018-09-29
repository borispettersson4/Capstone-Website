using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartModel
/// </summary>
public class CartModel
{
    public string InsertCart(Cart cart)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();
            db.Carts.Add(cart);
            db.SaveChanges();

            return cart.DatePurchased + " was successfully inserted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string UpdateCart(int id, Cart cart)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();

            //Fetch an object from db
            Cart p = db.Carts.Find(id);

            //Replace the data in db
            p.DatePurchased = cart.DatePurchased;
            p.ClientID = cart.ClientID;
            p.Amount = cart.Amount;
            p.IsInCart = cart.IsInCart;
            p.ProductID = cart.ProductID;

            db.SaveChanges();

            return cart.DatePurchased + " was successfully updated";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string DeleteCart(int id)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();
            Cart cart = db.Carts.Find(id);

            db.Carts.Attach(cart);
            db.Carts.Remove(cart);
            db.SaveChanges();

            return cart.DatePurchased + " was successfully deleted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public List<Cart> GetOrdersInCart(string userId)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        List<Cart> orders = (from x in db.Carts
                             where x.ClientID == userId
                             && x.IsInCart
                             orderby x.DatePurchased
                             select x).ToList();

        return orders;
    }

    public Product FindProduct(int id)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        ProductModel model = new ProductModel();
        Product product = new Product();

        foreach(Cart cart in db.Carts)
        {
            if (cart.ProductID == id)
            {
                return cart.Product;
            }
        }

        return product;
    }

    public int GetAmountOfOrders(string userId)
    {
        try
        {
            YWC_StorageEntities db = new YWC_StorageEntities();
            int amount = (from x in db.Carts
                          where x.ClientID == userId
                          && x.IsInCart
                          select x.Amount).Sum();

            return amount;
        }
        catch
        {
            return 0;
        }
    }

    public void UpdateQuantity(int id, int quantity)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        Cart cart = db.Carts.Find(id);
        cart.Amount = quantity;

        db.SaveChanges();
    }

    public void MarkOrdersAsPaid(List<Cart> carts)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        if(carts != null)
        {
            foreach(Cart cart in carts)
            {
                Cart oldcart = db.Carts.Find(cart.ID);
                oldcart.DatePurchased = DateTime.Now;
                oldcart.IsInCart = false;
            }

            db.SaveChanges();
        }
    }
}