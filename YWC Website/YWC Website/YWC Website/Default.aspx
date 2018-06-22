<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" Runat="Server">

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

<h1> Bienvenidos</h1>

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


<br /> <br />  <!--2 Space-->
<hr /> <!-- Horizontal Line -->    
<br /> <!--1 Space-->

<!-- H1 Description about the website-->
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

<br /> <br />   <!--Double Space-->

<hr /> <!-- Horizontal Line -->
<!-- H1 Description about the website's mission-->
<div style="text-align:center">
    <h1>Nuestra misión</h1>
</div>

<div>
    <p>Nuestra misión es crear conciencia de la gran cantidad de perros desamparados que necesitan un hogar.
       Queremos y podemos ser parte de la solución del problema. Realizamos rescates según la disponibilidad 
       de "Foster homes" donde los perros son ubicados para rehabilitarlos tanto físico como emocionalmente.
       Le proveemos atención médica, vacunas y son esterilizados. Todo esto es posible gracias a las donaciones
       que nos hace el público para poder darlos en adopción sea aquí en Puerto Rico o en EEUU. Proveemos 
       charlas en escuelas, colegios, iglesias o seminarios. Donde planteamos y educamos sobre la importancia
       de esterilizar y adoptar. Dichas charlas tienen como enfoque nuestra misión para detener el abandono
       y maltrato animal.
    </p>
</div>

<br /> <br />   <!--Double Space-->

<hr /> <!-- Horizontal Line -->
<!-- H1 Description about the how can Help the website's mission-->
<div style="text-align:center">
    <h1>¿Como tu puedes ayudar?</h1>
</div>
<br />

<div style="align-content:center">
    <ul>
      <li>Adopta, no compres!</li>
      <li>Ofrece hogar temporero</li>
      <li>Rescata</li>
      <li>Educa</li>
      <li>Vacuna</li>
      <li>Esteriliza tu mascota</li>
      <li>Dona algo mensual</li>
      <li>Se portavoz, comparte nuestra pagina</li>
      <li>Amalos</li>  
    </ul>  
</div>


</div>  <!--End of conentText-->


</asp:Content>

