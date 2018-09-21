 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" Runat="Server">

    <script runat="server">

     protected void Page_Load(object sender, EventArgs e)
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

<br /> <br />   <!--Double Space-->

<h1 style="text-align:center; color:chocolate">
    
        <asp:Literal ID="MainTitle" runat="server"> </asp:Literal>


</h1>

<br /> 

<!--Single Space-->
<!-- Default picture
<img src="../../Images/recursos/homepic3.png" 
     style ="margin:0 auto;
     width: 100%;"/>
-->

<br /> <br />  <!--2 Space-->

<!--2 Radio Button to see picture-->    
<br>

<!--    -->

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="../../Images/recursos/homepic3.png" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="../../Images/recursos/homepic4.png" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="../../Images/recursos/homepic5.png" style="width:100%">
  <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<p style="text-align:center">To see another picture select press below</p>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
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
<br /> <br />  <!--2 Space-->

<!-- H1 Description about the website 
 <div style="text-align:center">
<h1 >¿Quienes Somos?</h1>
</div>

<div>
    <p>
        Somos una organización privada sin fines de lucro, registradas en el departamento de Estado de P.R 
        desde el ano 2014 bajo el numero de licencia - 345927. Somos un grupo de jóvenes con el interes de 
        poder resolver el problema del abandono, maltrato y sobrepoblacion de perritos en las calles de P.R
    </p>

</div>

-->

<div class="row">
  <div class="column">
    <img src="../../Images/recursos/donate2.png" alt="donacion" style="width:100%">
  </div>
  <div class="column">
    <img src="../../Images/recursos/ourproduct2.png" alt="productos" style="width:100%">
  </div>
</div>


<div class="row">
  <div class="column1">
    <a href="/webpages/Donation/Donation.aspx">Donations</a>
  </div>
  <div class="column1">
    <a href="/webpages/Store/Store.aspx">Store</a>
  </div>
</div>





<br /> <br />   <!--Double Space-->

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
<hr /> <!-- Horizontal Line -->
<br />
    <div style="text-align:right">
    <a href="https://www.facebook.com/yeswecanine/?ref=br_rs" class="fa fa-facebook"></a>
    <a href="https://www.instagram.com/yeswecan_ine/" class="fa fa-instagram"></a>
    </div>


</div>  <!--End of conentText-->


 </asp:Content>

