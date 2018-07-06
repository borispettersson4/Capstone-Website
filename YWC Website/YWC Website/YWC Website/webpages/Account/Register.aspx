<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <form id="form1" runat="server">
        <p>
            <br />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Email Address"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="textEmail" runat="server" CssClass="inputs" Width="170px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="textPassword" runat="server" CssClass="inputs"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="textConfirmPassord" runat="server" CssClass="inputs"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="Create Account" />
        </p>
    </form>
</asp:Content>

