﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Cart
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Cart()
    {
        this.OrderDetails = new HashSet<OrderDetail>();
    }

    public int ID { get; set; }
    public string ClientID { get; set; }
    public int ProductID { get; set; }
    public int Amount { get; set; }
    public Nullable<System.DateTime> DatePurchased { get; set; }
    public bool IsInCart { get; set; }

    public virtual Product Product { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<OrderDetail> OrderDetails { get; set; }
}

public partial class OrderDetail
{
    public int Id { get; set; }
    public string ClientID { get; set; }
    public Nullable<System.DateTime> DatePurchased { get; set; }
    public string Status { get; set; }
    public string ClientName { get; set; }
    public string ClientAddress { get; set; }
    public int CartID { get; set; }
    public Nullable<double> Total { get; set; }
    public string ClientEmail { get; set; }

    public virtual Cart Cart { get; set; }
}

public partial class PageContent
{
    public int Id { get; set; }
    public string Home_MainTitle { get; set; }
    public string Home_Title2 { get; set; }
    public string Home_Desc2 { get; set; }
    public string Home_Title3 { get; set; }
    public string Home_Desc3 { get; set; }
    public string Home_Title4 { get; set; }
    public string Home_Desc4 { get; set; }
    public string Store_MainTitle { get; set; }
    public string Store_Desc1 { get; set; }
    public string Store_Desc2 { get; set; }
    public string Donation_MainTitle { get; set; }
    public string Donation_Desc1 { get; set; }
    public string Contact_MainTitle { get; set; }
    public string Contact_Desc1 { get; set; }
    public string Contact_Email { get; set; }
    public string Contact_Desc2 { get; set; }
    public string Contact_Tel { get; set; }
    public string Gallery_MainTitle { get; set; }
    public string Gallery_Desc1 { get; set; }
}

public partial class Product
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Product()
    {
        this.Carts = new HashSet<Cart>();
    }

    public int Id { get; set; }
    public int TypeId { get; set; }
    public string Name { get; set; }
    public Nullable<double> Price { get; set; }
    public string Description { get; set; }
    public string Image { get; set; }
    public int Stock { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Cart> Carts { get; set; }
    public virtual ProductType ProductType { get; set; }
}

public partial class ProductType
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public ProductType()
    {
        this.Products = new HashSet<Product>();
    }

    public int Id { get; set; }
    public string Name { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Product> Products { get; set; }
}

public partial class UserInformation
{
    public int Id { get; set; }
    public string GUid { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
    public string PostalCode { get; set; }
    public string Email { get; set; }
}
