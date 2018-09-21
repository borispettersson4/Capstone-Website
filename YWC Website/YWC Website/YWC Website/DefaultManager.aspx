<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        StoreEntities1 db = new StoreEntities1();
        PageContentModel model = new PageContentModel();
        PageContent content = model.GetPageContent().ElementAt(0);

        TextBox1.Text = content.Home_MainTitle;
        TextBox2.Text = content.Home_Title2;
        TextBox3.Text = content.Home_Desc2;
        TextBox4.Text = content.Home_Title3;
        TextBox5.Text = content.Home_Desc3;
        TextBox6.Text = content.Home_Title4;
        TextBox7.Text = content.Home_Desc4;
        TextBox8.Text = content.Store_MainTitle;
        TextBox9.Text = content.Store_Desc1;
        TextBox10.Text = content.Store_Desc2;
        TextBox11.Text = content.Donation_MainTitle;
        TextBox12.Text = content.Donation_Desc1;
        TextBox13.Text = content.Contact_MainTitle;
        TextBox14.Text = content.Contact_Desc1;
        TextBox15.Text = content.Contact_Email;
        TextBox16.Text = content.Contact_Desc2;
        TextBox17.Text = content.Contact_Tel;
        TextBox18.Text = content.Gallery_MainTitle;
        TextBox19.Text = content.Gallery_Desc1;




    }

</script>

<div class="contentText">



    <!--Space line-->

    <h1 style="text-align:center; color: chocolate">Customize Website Content</h1>
    <p style="text-align:left; color: black">Edit the following text fields to cuztomize the content of the website. Here you can change the titles and paragraphs for the main pages of the website including : Home, Store, Donations, ContactUs, and Gallery. </p>
    <p style="text-align:left; color: black">Note : Any and all changes made in this form must be saved using the Save button below for changes to take affect. All unsaved changes will be lost.</p>
    <p style="text-align:center; color: chocolate">&nbsp;</p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox1" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section B : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox2" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox3" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section C : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox4" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton4" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section C : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox5" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton5" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section D : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox6" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton6" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section D : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox7" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton7" runat="server">reset to default</asp:LinkButton>
    </p>

    <h3 style="text-align:left; color: chocolate"> &nbsp;</h3>
    <h3 style="text-align:left; color: chocolate"> Store&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox8" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton8" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Store&nbsp;&nbsp;&nbsp; Section A : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox9" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton9" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Store&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox10" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton10" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Donations&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox11" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton11" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Donations&nbsp;&nbsp;&nbsp; Section A : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox12" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton12" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> &nbsp;</h3>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox13" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton13" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section A : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox14" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton14" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section B : Email</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the email.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox15" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton15" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox16" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton16" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section B : Telephone Number</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the telephone number.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox17" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton17" runat="server">reset to default</asp:LinkButton>
    </p>
    <p style="text-align:left; color: chocolate"> 
        &nbsp;</p>
    <h3 style="text-align:left; color: chocolate"> Gallery&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox18" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton18" runat="server">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Gallery&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox19" runat="server" Width="705px" Height="165px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton19" runat="server">reset to default</asp:LinkButton>
    </p>

    </div>

</asp:Content>








