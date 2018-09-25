 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            string sortId = Request.QueryString["id"];
        }

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
        StoreEntities1 db = new StoreEntities1();
        ProductModel productModel = new ProductModel();
        ProductTypeModel productTypeModel = new ProductTypeModel();
        CartModel cartModel = new CartModel();
        List<Product> products = productModel.GetAllProducts();
        List<ProductType> productTypes = productTypeModel.GetAllProductTypes();
        List<Cart> purchaseList = cartModel.GetOrdersInCart(userId);

        //Verify Products validity
        if(products != null)
        {

            if (SortDropDown.SelectedItem == null)
            {

                string[] types = productTypeModel.GetAllProductNames();

                SortDropDown.DataSource = types;
                SortDropDown.Items.Add("All Items");
                SortDropDown.AppendDataBoundItems = true;
                SortDropDown.AutoPostBack = true;
                SortDropDown.DataBind();

                if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
                    SortDropDown.SelectedValue = Request.QueryString["id"];
            }

            //Create panel with buttons and labels
            foreach(Product product in products)
            {
                if (Request.QueryString["id"] == null || Request.QueryString["id"] == db.ProductTypes.Find(product.TypeId).Name) {
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

                    if (product.Stock < 1)
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

        }
        else //No products in DB
        {
            panelProducts.Controls.Add(new Literal { Text = "No products found" });
        }

    }

    protected void SortDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (SortDropDown.SelectedValue != "All Items")
            Response.Redirect("~/webpages/Store/Public/Store.aspx?id=" + SortDropDown.SelectedValue);
        else
            Response.Redirect("~/webpages/Store/Public/Store.aspx");
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
    <div style="text-align:initial">
        <p style="font-family:'Comic Sans MS'"><b>         
            <div style="text-align:center">
            <asp:Label ID="Label1" runat="server" Text="Show Me :"></asp:Label>
            <asp:DropDownList ID="SortDropDown" runat="server" OnSelectedIndexChanged="SortDropDown_SelectedIndexChanged">
            </asp:DropDownList>

            </div>
 </b> 
    </p>
</div>
    
    <div style="float: left; width: 100%; height: 100%; text-align: center;">
        <asp:Panel ID="panelProducts" runat="server">
        </asp:Panel>
</div>
    <div style="text-align:initial">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc2" runat="server"></asp:Literal>
 </b> 
    </p>
</div>
     

 </asp:Content>

    

