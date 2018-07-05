<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

<div class="contentText">

    <script>
        function myFunction()
        {
            var x = document.getElementById("myFile");
            x.disabled = true;
        }
        function myFunction1()
        {
            var x = document.getElementById("myFile1");
            x.disabled = true;
        }
        function myFunction2()
        {
            var x = document.getElementById("myFile2");
            x.disabled = true;
        }
        function myFunction3()
        {
            var x = document.getElementById("myFile3");
            x.disabled = true;
        }
        function myFunction4()
        {
            var x = document.getElementById("myFile4");
            x.disabled = true;
        }
    </script>


    <br /><!--Space line-->
    <br /><!--Space line-->

    <h1 style="text-align:center; color: chocolate">Home Administrator</h1>
    <br /><!--Space line-->
    <h2 style="text-align:center; color: chocolate">Section 1</h2>
    <h3 style="text-align:center; color: chocolate"> Change title page</h3>

    <form style="text-align:center">
      New Title:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <div style="text-align:center">
        <h3 style="text-align:center; color: chocolate"> Picture 1</h3>
        <p><b>To change picture 1 click the button below</b></p>
        <input type="file" id="myFile">
        <p>Click the "again" button to disable the file upload button.</p>
        <button onclick="myFunction()">again</button>

        <h3 style="text-align:center; color: chocolate"> Picture 2</h3>
        <p><b>To change picture 1 click the button below</b></p>
        <input type="file" id="myFile1">
        <p>Click the "again" button to disable the file upload button.</p>
        <button onclick="myFunction1()">again</button>

        <h3 style="text-align:center; color: chocolate"> Picture 3</h3>
        <p><b>To change picture 1 click the button below</b></p>
        <input type="file" id="myFile2">
        <p>Click the "again" button to disable the file upload button.</p>
        <button onclick="myFunction2()">again</button>

        <h3 style="text-align:center; color: chocolate"> Change title section</h3>
        <form style="text-align:center">
          New Title:
          <input type="text" name="newTitle">
          <button type="button" onclick="">Save</button>
        </form>

        <h4 style="text-align:center; color: chocolate"> Change description of section 1 </h4>
        <form style="text-align:center">
          <textarea rows="9" cols="128"></textarea>
          <button type="button" onclick="">Save</button>
        </form>
    </div>

    <br /> <br />
    <hr /> <!--Horizontal line -->
    <br />

    <h2 style="text-align:center; color: chocolate">Section 2</h2>
    <h3 style="text-align:center; color: chocolate"> Change title section</h3>
    <form style="text-align:center">
      New Title:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <div style="text-align:center">
        <h3 style="text-align:center; color: chocolate"> Picture 1</h3>
        <p><b>To change picture 1 click the button below</b></p>
        <input type="file" id="myFile3">
        <p>Click the "again" button to disable the file upload button.</p>
        <button onclick="myFunction3()">again</button>

        <h3 style="text-align:center; color: chocolate"> Picture 2</h3>
        <p><b>To change picture 1 click the button below</b></p>
        <input type="file" id="myFile4">
        <p>Click the "again" button to disable the file upload button.</p>
        <button onclick="myFunction4()">again</button>

        <h4 style="text-align:center; color: chocolate"> Change description of section 2 </h4>
        <form style="text-align:center">
          <textarea rows="9" cols="128"></textarea>
          <button type="button" onclick="">Save</button>
        </form>
    </div>

     <br /> <br />
    <hr /> <!--Horizontal line -->
    <br />

    <h2 style="text-align:center; color: chocolate">Section 3</h2>
    <h3 style="text-align:center; color: chocolate"> Change title section</h3>
    <form style="text-align:center">
      New Title:
      <input type="text" name="newTitle">
      <button type="button" onclick="">Save</button>
    </form>

    <div style="text-align:center">
        <h4 style="text-align:center; color: chocolate"> Change description of section 2 </h4>
        <form style="text-align:center">
          <textarea rows="9" cols="128"></textarea>
          <button type="button" onclick="">Save</button>
        </form>
    </div>

</div>  <!--End of conentText-->

</asp:Content>








