<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        PageContentModel model = new PageContentModel();
        PageContent content = model.GetPageContent();

        MainTitle.Text = content.Donation_MainTitle;
        Desc1.Text = content.Donation_Desc1;
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

        <p>
    </p>

<div style="text-align:center">
    <h1 style="color:chocolate">
        <asp:Literal ID="MainTitle" runat="server"></asp:Literal>
    </h1>
<div />

<div style="text-align:center">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc1" runat="server"></asp:Literal>
 </b> 
    </p>
</div>

            <p>
    </p>

<div style ="text-align:center;">

    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">

    <!-- Identify your business so that you can collect the payments. -->
    <input type="hidden" name="business"
        value="borispettersson4@gmail.com">

    <!-- Specify a Donate button. -->
    <input type="hidden" name="cmd" value="_donations">

    <!-- Specify details about the contribution -->
    <input type="hidden" name="item_name" value="Yes We Can-Ine">
    <input type="hidden" name="item_number" value="Kind Donation">
    <input type="hidden" name="currency_code" value="USD">

    <!-- Display the payment button. -->
    <input type="image" name="submit"
    src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif"
    alt="Donate">
    <img alt="" width="2" height="2"
    src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >

</form>

</div>

</asp:Content>

