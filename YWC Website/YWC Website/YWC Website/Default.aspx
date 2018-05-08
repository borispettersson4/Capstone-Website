<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent1" Runat="Server">

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

