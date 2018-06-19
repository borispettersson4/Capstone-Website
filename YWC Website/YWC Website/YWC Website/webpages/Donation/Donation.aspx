<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

<div class ="contentText">

<br /> <br />   <!--Double Space-->

<h1><b> Support Yes We Can-Ine! </b></h1>

<br /> <br />   <!--Double Space-->

Your generous donation means everything to us! With each small donation means we'd be giving dogs
out there food, water, shelter, and love. We are ever so thankful for your astounding support!

<br /> <br />   <!--Double Space-->

<div style ="text-align:center">

Click here to donate any amount you wish to Yes We Can-Ine:

</div>

</div> <!--END TEXT-->

<br /> <br />   <!--Double Space-->

<div style ="text-align:center">

    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">

    <!-- Identify your business so that you can collect the payments. -->
    <input type="hidden" name="business"
        value="borispettersson4@gmail.com">

    <!-- Specify a Donate button. -->
    <input type="hidden" name="cmd" value="_donations">

    <!-- Specify details about the contribution -->
    <input type="hidden" name="item_name" value="Yes We Can-Ine">
    <input type="hidden" name="item_number" value="Kind Donation">
    <input type="hidden" name="currency_code" value="USD">

    <!-- Display the payment button. -->
    <input type="image" name="submit"
    src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif"
    alt="Donate">
    <img alt="" width="2" height="2"
    src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >

</form>

</div>

</asp:Content>

