<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" Runat="Server">

<div class="contentText">

<h2> Welcome Message</h2>

<br /> <br />   <!--Double Space-->

<img src="../../Images/Placeholder/petstore.jpg" 
     style ="margin:0 auto;
     width: 100%;"/>

<br /> <br />   <!--Double Space-->

Here, a description of what the business does. Philosophy of the organization may also go here
    describing the perks and benefits of society that may be brought by the establishment.
    Furthermore, news or announcements may be held here in the very front page.

</div>  <!--End of conentText-->

<div id="box">              <!-- CREATE BOX -->      

    <p class="test">            <!-- CREATE NEW CLASS CALLED "test" -->
        <a  href="webpages/testpage/testpage.aspx">                         <!-- target="_blank" -->
            <img src="Images/Base.png" alt="">
        </a>                    
    </p>                        <!-- End Class "test" -->

    <p>     <!-- Add Content Space -->
        This is a test forum that will showcase an HTML template for the project. Also, look at that pretty cat!
    </p>    <!-- Close Content Space -->

</div>                      <!-- End CREATE BOX -->

</asp:Content>

