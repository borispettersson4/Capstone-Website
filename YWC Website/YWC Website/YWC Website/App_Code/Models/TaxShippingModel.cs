using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TaxShippingModel
/// </summary>
public class TaxShippingModel
{
    public TaxShipping GetTaxShipping()
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        return db.TaxShippings.Find(0);

    }

    public void UpdateInfo(TaxShipping ts)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();

        TaxShipping taxShip = db.TaxShippings.Find(0);

        taxShip.Tax = ts.Tax;
        taxShip.Shipping = ts.Shipping;
        db.SaveChanges();
    }

    public void addNewTaxShipping()
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        TaxShipping taxShip = new TaxShipping();

        db.TaxShippings.Add(taxShip);

        db.SaveChanges();
    }

    public void deleteTaxShipping()
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        TaxShipping taxShip = new TaxShipping();

        db.TaxShippings.Remove(taxShip);

        db.SaveChanges();
    }

}