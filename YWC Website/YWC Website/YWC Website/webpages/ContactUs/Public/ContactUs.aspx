<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>


<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        PageContentModel model = new PageContentModel();
        PageContent content = model.GetPageContent();

        MainTitle.Text = content.Contact_MainTitle;
        Desc1.Text = content.Contact_Desc1;
        Email.Text = content.Contact_Email;
        Desc2.Text = content.Contact_Desc2;
        Tel.Text = content.Contact_Tel;

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent1" Runat="Server">

        <p>
    </p>

<div style="text-align:center">
    <h1 style="color:chocolate">
        <asp:Literal ID="MainTitle" runat="server"></asp:Literal>
    </h1>
<div />

<div style="text-align:left">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc1" runat="server"></asp:Literal>
 </b> 
    </p>
</div>

    <div style="text-align:left">
    <h3 style="color:chocolate">
        <asp:Literal ID="Email" runat="server"></asp:Literal>
    </h3>
<div />

        <div style="text-align:left">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc2" runat="server"></asp:Literal>
 </b> 
    </p>
</div>

    <div style="text-align:left">
    <h3 style="color:chocolate">
        <asp:Literal ID="Tel" runat="server"></asp:Literal>
    </h3>
<div />



</asp:Content>