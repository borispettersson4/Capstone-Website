<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        FillPage();
    }

    private void FillPage()
    {
        //Get list of products
        ProductModel productModel = new ProductModel();
        List<Product> products = productModel.GetAllProducts();

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

                //Set Values to Items
                imageButton.ImageUrl = "~/Images/Products/" + product.Image;
                imageButton.CssClass = "productImage";
                imageButton.PostBackUrl = "~/Pages/Product.aspx?id=" + product.Id;

                labelName.Text = product.Name;
                labelName.CssClass = "productName";

                labelPrice.Text = product.Price.ToString();
                labelPrice.CssClass = "productPrice";

                //Add controls to parent
                productPanel.Controls.Add(imageButton);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(labelName);
                productPanel.Controls.Add(new Literal { Text = "<br />" });
                productPanel.Controls.Add(labelPrice);

                //Add dynamic Panels to Parent Panel
                panelProducts.Controls.Add(productPanel);

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
    
 

    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:Panel ID="panelProducts" runat="server">
        </asp:Panel>
    </form>
    
 

</asp:Content>

    

