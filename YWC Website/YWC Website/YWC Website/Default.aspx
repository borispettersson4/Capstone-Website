 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" Runat="Server">

    <script runat="server">

        protected void Page_Load(object sender, EventArgs e)
        {
            if (MainTitle.Text == "")
            {
                StoreEntities1 db = new StoreEntities1();
                PageContentModel model = new PageContentModel();
                PageContent content = model.GetPageContent();

                MainTitle.Text = content.Home_MainTitle;
                WhoAreWeText.Text = content.Home_Title2;
                Desc2.Text = content.Home_Desc2;
                Title3.Text = content.Home_Title3;
                Desc3.Text = content.Home_Desc3;
                Title4.Text = content.Home_Title4;
                Desc4.Text = content.Home_Desc4;
            }
        }

</script>

<!-- Para botones de redes sociales-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
<style>
.fa {
    padding: 20px;
    font-size: 30px;
    width: 30px;
    text-align: center;
    text-decoration: none;
    margin: 5px 2px;
    border-radius: 50%;
}

.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
    background: #3B5998;
    color: white;
}

.fa-google {
    background: #dd4b39;
    color: white;
}

.fa-instagram {
    background: #125688;
    color: white;
}
</style>


<!--Javascript Programming -->
<script type="text/javascript">

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n)
{
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}

</script>

<div class="contentText">

    <p></p>
        <p> </p>
    <!--Double Space--><h1 style="text-align:center; color:chocolate">
    
        <asp:Literal ID="MainTitle" runat="server"> </asp:Literal>


</h1>
     <br />
 <!-- InstaWidget -->
<a href="https://instawidget.net/v/user/yeswecan_ine" id="link-ce80e697f0ef51a7d75b252255a1518e3edbc4fca333970ddcf9831ee1ff5675">@yeswecan_ine</a>
<script src="https://instawidget.net/js/instawidget.js?u=ce80e697f0ef51a7d75b252255a1518e3edbc4fca333970ddcf9831ee1ff5675&width=1080px"></script>   
     <br />
    <div style="text-align:center   ">
    <asp:LinkButton ID="GalleryLink" runat="server" PostBackUrl="~/webpages/Gallery/Gallery.aspx" Text="Check out our Gallery page to see more pictures."></asp:LinkButton>
    </div>
    <br />

<div style="text-align:center">
    <h1 style="color:chocolate">
        <asp:Literal ID="WhoAreWeText" runat="server"></asp:Literal>
    </h1>
<div />

<div style="text-align:initial">
    <p style="font-family:'Comic Sans MS'"><b>         
        <asp:Literal ID="Desc2" runat="server"></asp:Literal>
 </b> 
    </p>
</div>



<br /> <br />  <!--Double Space-->
<hr /> <!-- Horizontal Line -->    
    <br />
<br /> 
    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl="~/Images/Placeholder/heart.png" Width="114px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl="~/Images/Placeholder/Store.png" Width="114px" />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/webpages/Donation/Donation.aspx">Donate</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/webpages/Store/Public/Store.aspx">Visit Our Store</asp:LinkButton>
    <br />
&nbsp;<br />

    <br />

    <div style="text-align:initial">
    <p style="font-family:'Comic Sans MS'"> <b>

       <asp:Literal ID="Literal1" runat="server" Text="Support our cause by donating to us or browse through our online store. Either way would contribute in the cause of saving lives of dogs in need."></asp:Literal>
                                            </b>
    </p>
</div>


<hr />   <!--Double Space-->

<!-- H1 Description about the website's mission-->

<div style="text-align:center">
    <h1 style="color:chocolate">

       <asp:Literal ID="Title3" runat="server"></asp:Literal>

    </h1>
</div>

<div style="text-align:initial">
    <p style="font-family:'Comic Sans MS'"> <b>

       <asp:Literal ID="Desc3" runat="server"></asp:Literal>
                                            </b>
    </p>
</div>

<br /> <br />   <!--Double Space-->

<hr /> <!-- Horizontal Line -->
<!-- H1 Description about the how can Help the website's mission-->
<div style="text-align:center">
    <h1 style="color:chocolate">

       <asp:Literal ID="Title4" runat="server"></asp:Literal>

    </h1>
</div>
<br />

<div style="text-align:center">
    <p style="font-family:'Comic Sans MS'"> <b>

       <asp:Literal ID="Desc4" runat="server"></asp:Literal>

    </b></p>

</div>

<br />
<hr /> <!-- Horizontal Line -->
<br /> <br />   <!--Double Space-->

<br />
    <div style="text-align:right">
    <a href="https://www.facebook.com/yeswecanine/?ref=br_rs" class="fa fa-facebook"></a>
    <a href="https://www.instagram.com/yeswecan_ine/" class="fa fa-instagram"></a>
    </div>


</div>  <!--End of conentText-->


 </asp:Content>

