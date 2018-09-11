<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

    <br /><!--Space line-->
    <br /><!--Space line-->
    <br /><!--Space line-->
    <hr /> <!-- Horizontal line -->

    <h1 style="text-align:center; color: chocolate">Contact Us Administrator</h1>
    <br /><!--Space line-->
    <h2 style="text-align:center; color: chocolate">Section 1</h2>

    <h3 style="text-align:center; color: chocolate"> Change title page</h3>
    <form style="text-align:center">
      New Title:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <h3 style="text-align:center; color: chocolate"> Change email</h3>
    <form style="text-align:center">
      New Email:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <h3 style="text-align:center; color: chocolate"> Update address</h3>
    <form style="text-align:center">
      New Address:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <h3 style="text-align:center; color: chocolate"> Update contact number</h3>
    <form style="text-align:center">
      New contact number:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <h3 style="text-align:center; color: chocolate"> Edit Description</h3>
    <form style="text-align:center">
          <textarea rows="9" cols="128"></textarea>
          <button type="button" onclick="">Save</button>
    </form>

    <br /> <!-- Single Line -->
    <hr /> <!-- Horizontal line -->
</asp:Content>

