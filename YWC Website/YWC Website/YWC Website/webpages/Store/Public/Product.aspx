﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }

    private void FillPage()
    {
        //Get the selected product's data
        if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            ProductModel productModel = new ProductModel();
            Product product = productModel.GetProduct(id);

            //Fill with data
            labelPrice.Text = "Price per unit: <br/>$" + product.Price;
            labelTitle.Text = product.Name;
            labelDescription.Text = product.Description;
            labelItemNumber.Text = id.ToString();
            imageProduct.ImageUrl = "~/Images/Products/" + product.Image;

            //Fill drop down list
            int[] amount = Enumerable.Range(1, 20).ToArray();
            dropdownAmount.DataSource = amount;
            dropdownAmount.AppendDataBoundItems = true;
            dropdownAmount.DataBind();

        }
    }

    protected void buttonAdd_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            string clientID = Context.User.Identity.GetUserId();

            if (clientID != null)
            {

                int id = Convert.ToInt32(Request.QueryString["id"]);
                int amount = Convert.ToInt32(dropdownAmount.SelectedValue);

                Cart cart = new Cart
                {
                    Amount = amount,
                    ClientID = clientID,
                    DatePurchased = DateTime.Now,
                    IsInCart = true,
                    ProductID = id
                };

                CartModel model = new CartModel();
                labelResult.Text = model.InsertCart(cart);
            }
            else
            {
                labelResult.Text = "Please log in to add items to cart";
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <table>
            <!--Column 1 : Image and Title -->
        <tr>
            <td rowspan="4">
                <asp:Image ID="imageProduct" runat="server" CssClass="detailsImage"/></td>
            
            <td><h2>            
                <asp:Label ID="labelTitle" runat="server"></asp:Label><hr/>    
            </td></h2>
        </tr>
            <!--Column 2 : Description and Price -->
        <tr>
            <td>
                <asp:Label ID="labelDescription" runat="server" CssClass="detailsDescription"></asp:Label></td>
            
            <td>
                <asp:Label ID="labelPrice" runat="server" CssClass="detailsPrice"></asp:Label><br/>
                Quantity :
                <asp:DropDownList ID="dropdownAmount" runat="server"></asp:DropDownList><br/>
                <asp:Button ID="buttonAdd" runat="server" OnClick="buttonAdd_Click" Text="Add Product" />
                <br/>
                <asp:Label ID="labelResult" runat="server" Text=""></asp:Label></td>
            
        </tr>
            <!--Column 3 : Product Number -->
        <tr>
            <td>
               Product Number: <asp:Label ID="labelItemNumber" runat="server"></asp:Label></td>
        </tr>
            <!--Column 4 : Product Number -->
        <tr>
            <td>
            <asp:Label ID="labelAvailable" runat="server" Text="Available" CssClass="productPrice"></asp:Label></td>     
        </tr>

    </table>
</asp:Content>

