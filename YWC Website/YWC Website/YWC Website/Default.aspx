﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" Runat="Server">

<div class="contentText">

<br /> <br />   <!--Double Space-->

<h1> Bienvenidos</h1>

<br /> <!--Single Space-->

<img src="../../Images/recursos/homepic3.png" 
     style ="margin:0 auto;
     width: 100%;"/>

<br /> <br />  <!--2 Space-->
<p style="text-align:center">To see another picture select press below</p>
<!--2 Radio Button to see picture-->
<div class="radio">
<form action="">
  <input type="radio" name="pic" value="homepic3">
  <input type="radio" name="pic" value="homepic4">
  <input type="radio" name="pic" value="homepic5"> 
  <input type="radio" name="pic" value="homepic6"> 
</form>
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

