 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        PageContentModel model = new PageContentModel();
        PageContent content = model.GetPageContent();

        MainTitle.Text = content.Store_MainTitle;
        Desc1.Text = content.Store_Desc1;
        Desc2.Text = content.Store_Desc2;



        FillPage();
    }

    private void FillPage()
    {
        string userId = User.Identity.GetUserId();
        //Get list of products
        ProductModel productModel = new ProductModel();
        CartModel cartModel = new CartModel();
        List<Product> products = productModel.GetAllProducts();
        List<Cart> purchaseList = cartModel.GetOrdersInCart(userId);

        //Verify Products validity
        if(products != null)
        {
            //Create panel with buttons and labels
            foreach(Product product in products)
            {
                Panel productPanel = new Panel();
                ImageButton imageButton = new ImageButton();
                Label labelName = new Label();
                Label labelPrice = new Label();
                Label labelStock = new Label();

                //Set Values to Items
                imageButton.ImageUrl = "~/Images/Products/" + product.Image;
                imageButton.CssClass = "productImage";
                imageButton.PostBackUrl = "~/webpages/Store/Public/Product.aspx?id=" + product.Id;

                labelName.Text = product.Name;
                labelName.CssClass = "productName";

                labelPrice.Text = "$" + product.Price.ToString();
                labelPrice.CssClass = "productPrice";

                labelStock.Text = product.Stock.ToString() + " In Stock";
                labelStock.CssClass = "productPrice";

                //Add controls to parent
                productPanel.Controls.Add(imageButton);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(labelName);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(labelStock);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(labelPrice);

                //Add dynamic Panels to Parent Panel
                panelProducts.Controls.Add(productPanel);

                if(product.Stock < 1)
                {
                    labelStock.Text = "Out of Stock";
                    imageButton.Enabled = false;
                }
                else if (product.Stock >= 1)
                {
                    imageButton.Enabled = true;
                }

                foreach (Cart cart in purchaseList)
                {
                    if (product.Id == cart.ProductID)
                    {
                        labelStock.Text = "Item In Cart";
                        imageButton.Enabled = false;
                    }
                }

            }
        }
        else //No products in DB
        {
            panelProducts.Controls.Add(new Literal { Text = "No products found" });
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="MainContent1" ContentPlaceHolderID="MainContent1" Runat="Server">
    
        <p>
    </p>

<div style="text-align:center">
    <h1 style="color:chocolate">
        <asp:Literal ID="MainTitle" runat="server"></asp:Literal>
    </h1>
<div />

<div style="text-align:initial">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc1" runat="server"></asp:Literal>
 </b> 
    </p>
</div>


        <asp:Panel ID="panelProducts" runat="server">
        </asp:Panel>

    <div style="text-align:initial">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc2" runat="server"></asp:Literal>
 </b> 
    </p>
</div>
     

</asp:Content>

    

