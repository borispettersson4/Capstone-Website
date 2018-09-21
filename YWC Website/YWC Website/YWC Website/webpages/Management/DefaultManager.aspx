<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

    <script runat="server">

    StoreEntities1 db = new StoreEntities1();
    PageContentModel model = new PageContentModel();

    protected void Page_Load(object sender, EventArgs e)
    {

        PageContent content = model.GetPageContent();

        if (TextBox1.Text == "") {

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


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        PageContent newPageContent = new PageContent
        {

            Home_MainTitle = TextBox1.Text,
            Home_Title2 = TextBox2.Text,
            Home_Desc2 = TextBox3.Text,
            Home_Title3 = TextBox4.Text,
            Home_Desc3 = TextBox5.Text,
            Home_Title4 = TextBox6.Text,
            Home_Desc4 = TextBox7.Text,
            Store_MainTitle = TextBox8.Text,
            Store_Desc1 = TextBox9.Text,
            Store_Desc2 = TextBox10.Text,
            Donation_MainTitle = TextBox11.Text,
            Donation_Desc1 = TextBox12.Text,
            Contact_MainTitle = TextBox13.Text,
            Contact_Desc1 = TextBox14.Text,
            Contact_Email = TextBox15.Text,
            Contact_Desc2 = TextBox16.Text,
            Contact_Tel = TextBox17.Text,
            Gallery_MainTitle = TextBox18.Text,
            Gallery_Desc1 = TextBox19.Text
        };

        model.UpdateInfo(newPageContent);

        //Response.Redirect("~/Default.aspx");
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();

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

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox1.Text = content.Home_MainTitle;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox2.Text = content.Home_Title2;
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox3.Text = content.Home_Desc2;
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox4.Text = content.Home_Title3;
    }

    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox5.Text = content.Home_Desc3;
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox6.Text = content.Home_Title4;
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox7.Text = content.Home_Desc4;
    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox8.Text = content.Store_MainTitle;
    }

    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox9.Text = content.Store_Desc1;
    }

    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox10.Text = content.Store_Desc2;
    }

    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox11.Text = content.Donation_MainTitle;
    }

    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox12.Text = content.Donation_Desc1;
    }

    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox13.Text = content.Contact_MainTitle;
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox14.Text = content.Contact_Desc1;
    }

    protected void LinkButton15_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox15.Text = content.Contact_Email;
    }

    protected void LinkButton16_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox16.Text = content.Contact_Desc2;
    }

    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox17.Text = content.Contact_Tel;
    }

    protected void LinkButton18_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();
        TextBox18.Text = content.Gallery_MainTitle;
    }

    protected void LinkButton19_Click(object sender, EventArgs e)
    {
        PageContent content = model.GetPageContent();

        TextBox19.Text = content.Gallery_Desc1;
    }
</script>

<div class="contentText">



    <!--Space line-->

    <h1 style="text-align:center; color: chocolate">Customize Website Content</h1>
    <p style="text-align:left; color: black">Edit the following text fields to cuztomize the content of the website. Here you can change the titles and paragraphs for the main pages of the website including : Home, Store, Donations, ContactUs, and Gallery. Any and all changes made in this form must be saved using the Save button below for changes to take affect. All unsaved changes will be lost.</p>
        
        <div style="text-align:right">
        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="button" OnClick="btnSave_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnReset" runat="server" Text="Reset All" CssClass="button" OnClick="btnReset_Click" />
    </p>
</div>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox1" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section B : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox2" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox3" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section C : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox4" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section C : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox5" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section D : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox6" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Home Page&nbsp;&nbsp;&nbsp; Section D : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox7" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton7" runat="server" OnClick="LinkButton7_Click">reset to default</asp:LinkButton>
    </p>

    <h3 style="text-align:left; color: chocolate"> &nbsp;</h3>
    <h3 style="text-align:left; color: chocolate"> Store&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox8" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton8" runat="server" OnClick="LinkButton8_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Store&nbsp;&nbsp;&nbsp; Section A : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox9" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton9" runat="server" OnClick="LinkButton9_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Store&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox10" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton10" runat="server" OnClick="LinkButton10_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Donations&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox11" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton11" runat="server" OnClick="LinkButton11_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Donations&nbsp;&nbsp;&nbsp; Section A : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox12" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton12" runat="server" OnClick="LinkButton12_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> &nbsp;</h3>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox13" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton13" runat="server" OnClick="LinkButton13_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section A : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox14" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton14" runat="server" OnClick="LinkButton14_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section B : Email</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the email.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox15" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton15" runat="server" OnClick="LinkButton15_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox16" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton16" runat="server" OnClick="LinkButton16_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Contact Us&nbsp;&nbsp;&nbsp; Section B : Telephone Number</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the telephone number.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox17" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton17" runat="server" OnClick="LinkButton17_Click">reset to default</asp:LinkButton>
    </p>
    <p style="text-align:left; color: chocolate"> 
        &nbsp;</p>
    <h3 style="text-align:left; color: chocolate"> Gallery&nbsp;&nbsp;&nbsp; Section A : Title</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the title.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox18" runat="server" Width="283px"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton18" runat="server" OnClick="LinkButton18_Click">reset to default</asp:LinkButton>
    </p>
    <h3 style="text-align:left; color: chocolate"> Gallery&nbsp;&nbsp;&nbsp; Section B : Paragraph</h3>
    <p style="text-align:left; color: black"> Edit the box below to change the paragraph for the corresponding section.</p>
    <p style="text-align:left; color: chocolate"> 
        <asp:TextBox ID="TextBox19" runat="server" Width="705px" Height="165px" TextMode="MultiLine"></asp:TextBox>
    &nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton19" runat="server" OnClick="LinkButton19_Click">reset to default</asp:LinkButton>
    </p>

    </div>

</asp:Content>








