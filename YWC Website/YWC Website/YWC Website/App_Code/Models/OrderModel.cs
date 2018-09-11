using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderModel
/// </summary>
public class OrderModel
{
    public string InsertOrder(OrderDetail order)
    {
        try
        {
            StoreEntities1 db = new StoreEntities1();
            db.OrderDetails.Add(order);
            db.SaveChanges();

            return order.DatePurchased + " was successfully inserted";
        }
        catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
        {
            Exception raise = dbEx;
            foreach (var validationErrors in dbEx.EntityValidationErrors)
            {
                foreach (var validationError in validationErrors.ValidationErrors)
                {
                    string message = string.Format("{0}:{1}",
                        validationErrors.Entry.Entity.ToString(),
                        validationError.ErrorMessage);
                    // raise a new exception nesting
                    // the current instance as InnerException
                    raise = new InvalidOperationException(message, raise);
                }
            }
            throw raise;
        }
    }

    public string UpdateOrder(int id, OrderDetail order)
    {
        try
        {
            StoreEntities1 db = new StoreEntities1();

            //Fetch an object from db
            OrderDetail o = db.OrderDetails.Find(id);

            //Replace the data in db
            o.ClientID = order.ClientID;
            o.DatePurchased = order.DatePurchased;
            o.isSent = order.isSent;
            o.CartID = order.CartID;
            o.Total = order.Total;

            db.SaveChanges();

            return order.DatePurchased + " was successfully updated";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public string DeleteOrder(int id)
    {
        try
        {
            StoreEntities1 db = new StoreEntities1();
            OrderDetail order = db.OrderDetails.Find(id);

            db.OrderDetails.Attach(order);
            db.OrderDetails.Remove(order);
            db.SaveChanges();

            return order.DatePurchased + " was successfully deleted";
        }
        catch (Exception e)
        {
            return "Error:" + e;
        }
    }

    public List<OrderDetail> GetOrders(string userId)
    {
        StoreEntities1 db = new StoreEntities1();
        List<OrderDetail> orders = (from x in db.OrderDetails
                             where x.ClientID == userId
                             && !x.isSent
                             orderby x.DatePurchased
                             select x).ToList();

        return orders;
    }

    public List<OrderDetail> GetAllOrders()
    {
        StoreEntities1 db = new StoreEntities1();
        List<OrderDetail> orders = (from x in db.OrderDetails
                                    where !x.isSent
                                    orderby x.DatePurchased
                                    select x).ToList();

        return orders;
    }

    public List<OrderDetail> GetAllUniqueOrders()
    {
        StoreEntities1 db = new StoreEntities1();
        List<OrderDetail> orders = (from x in db.OrderDetails
                                    where !x.isSent
                                    orderby x.DatePurchased descending
                                    select x).Distinct().ToList();

        return orders;
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

    public void MarkOrderAsSent(OrderDetail order)
    {
        StoreEntities1 db = new StoreEntities1();

        if(order != null)
        {
            OrderDetail oldOrder = db.OrderDetails.Find(order.Id);
            oldOrder.isSent = true;
        }

        db.SaveChanges();
    }

    /*
    public OrderDetail GetOrder(int id)
    {
        try
        {
            using (StoreEntities1 db = new StoreEntities1())
            {
                OrderDetail order = db.OrderDetails.Find(id);
                return order;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public List<OrderDetail> GetAllOrders()
    {
        try
        {
            using (StoreEntities1 db = new StoreEntities1())
            {
                List<OrderDetail> orders = (from x in db.OrderDetails
                                          select x).ToList();
                return orders;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    public List<OrderDetail> GetAllOrdersByStatus(bool b)
    {
        try
        {
            using (StoreEntities1 db = new StoreEntities1())
            {
                List<OrderDetail> orders = (from x in db.OrderDetails
                                          where x.isSent == b
                                          select x).ToList();
                return orders;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

*/
}