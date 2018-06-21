<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void addButton_Click(object sender, EventArgs e)
    {
        ProductTypeModel model = new ProductTypeModel();
        ProductType pt = createProductType();

        resultLabel.Text = model.InsertProductType(pt);
    }

    private ProductType createProductType()
    {
        ProductType p = new ProductType();
        p.Name = textName.Text;

        return p;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #form1 {
            margin-left: 20px;
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <form id="form1" runat="server">
        <p>
            &nbsp;Category Name :</p>
        <p>
            <asp:TextBox ID="textName" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="addButton" runat="server" Text="Add Category" OnClick="addButton_Click" />
        </p>
        <p>
            <asp:Label ID="resultLabel" runat="server"></asp:Label>
        </p>
    </form>
</asp:Content>

