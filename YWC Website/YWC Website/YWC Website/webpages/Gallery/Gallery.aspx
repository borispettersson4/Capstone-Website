<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        PageContentModel model = new PageContentModel();
        PageContent content = model.GetPageContent();

        MainTitle.Text = content.Gallery_MainTitle;
        Desc1.Text = content.Gallery_Desc1;
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

<div class="contentText">

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

<br /> <br />   <!--Double Space-->

<!-- InstaWidget -->
<a href="https://instawidget.net/v/user/yeswecan_ine" id="link-9e2c44e14dc73841510b9265ac1b35c23dcee29863093058cca9a683904f6032">@yeswecan_ine</a>
<script src="https://instawidget.net/js/instawidget.js?u=9e2c44e14dc73841510b9265ac1b35c23dcee29863093058cca9a683904f6032&width=748px"></script>

</div>

</asp:Content>

