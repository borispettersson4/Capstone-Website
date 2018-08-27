<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //Only load images when opened for the first time
        if (!IsPostBack)
        {
            getImages();

            if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                FillPage(id);
            }
        }
    }

    protected void buttonAdd_Click(object sender, EventArgs e)
    {
        ProductModel productModel = new ProductModel();
        Product product = createProduct();

        //Check if editing
        if (!String.IsNullOrWhiteSpace(Request.QueryString["id"]))
        {
            //ID Exists - update row
            int id = Convert.ToInt32(Request.QueryString["id"]);
            labelResult.Text = productModel.UpdateProduct(id,product);
        }
        else
        {
            //ID does not exist - create new row
            labelResult.Text = productModel.InsertProduct(product);
        }
    }

    private void FillPage(int id)
    {
        //Get all data from DB to Page
        ProductModel productmodel = new ProductModel();
        Product product = productmodel.GetProduct(id);

        //Fill Textboxes
        textDescription.Text = product.Description;
        textName.Text = product.Name;
        textPrice.Text = product.Price.ToString();

        //Fill dropdown list
        dropDownImage.SelectedValue = product.Image;
        dropDownType.SelectedValue = product.TypeId.ToString();


    }

    private void getImages()
    {
        try
        {
            //Get paths from files
            string[] images = System.IO.Directory.GetFiles(Server.MapPath("~/Images/Products/"));

            //Get filenames and add to ArrayList
            ArrayList imageList = new ArrayList();
            foreach (string image in images)
            {
                string imageName = image.Substring(image.LastIndexOf(@"\", StringComparison.Ordinal) + 1);
                imageList.Add(imageName);
            }

            //Set Arraylist as the datasource for dropdown
            dropDownImage.DataSource = imageList;
            dropDownImage.AppendDataBoundItems = true;
            dropDownImage.DataBind();
        }
        catch(Exception e)
        {
            labelResult.Text = e.ToString();
        }
    }

    private Product createProduct()
    {
        Product product = new Product();

        product.Name = textName.Text;
        product.Price = Convert.ToDouble(textPrice.Text);
        product.TypeId = Convert.ToInt32(dropDownType.SelectedValue);
        product.Description = textDescription.Text;
        product.Image = dropDownImage.SelectedValue;

        return product;
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #form1 {
            margin-left: 21px;
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <form id="form1">
        <p>
            Product Name:</p>
        <p>
            <asp:TextBox ID="textName" runat="server" Width="310px"></asp:TextBox>
        </p>
        <p>
            Description:</p>
        <p>
            <asp:TextBox ID="textDescription" runat="server" Height="164px" TextMode="MultiLine" Width="777px"></asp:TextBox>
        </p>
        <p>
            Product Type:</p>
        <p>
            <asp:DropDownList ID="dropDownType" runat="server" DataSourceID="ProductType_SqlDataSource" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ProductType_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="SELECT * FROM [ProductTypes] ORDER BY [Name]"></asp:SqlDataSource>
        </p>
        <p>
            Price:</p>
        <p>
            <asp:TextBox ID="textPrice" runat="server" Width="187px"></asp:TextBox>
        </p>
        <p>
            Image:</p>
        <p>
            <asp:DropDownList ID="dropDownImage" runat="server">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Button ID="buttonAdd" runat="server" Text="Add Product" OnClick="buttonAdd_Click" />
        </p>
        <p>
            <asp:Label ID="labelResult" runat="server"></asp:Label>
        </p>
    </form>
</asp:Content>

