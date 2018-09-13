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
            StoreEntities1 db = new StoreEntities1();
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
            StoreEntities1 db = new StoreEntities1();

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
            StoreEntities1 db = new StoreEntities1();
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
        StoreEntities1 db = new StoreEntities1();
        List<Cart> orders = (from x in db.Carts
                             where x.ClientID == userId
                             && x.IsInCart
                             orderby x.DatePurchased
                             select x).ToList();

        return orders;
    }

    public Product FindProduct(int id)
    {
        StoreEntities1 db = new StoreEntities1();
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
            StoreEntities1 db = new StoreEntities1();
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
        StoreEntities1 db = new StoreEntities1();
        Cart cart = db.Carts.Find(id);
        cart.Amount = quantity;

        db.SaveChanges();
    }

    public void MarkOrdersAsPaid(List<Cart> carts)
    {
        StoreEntities1 db = new StoreEntities1();
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