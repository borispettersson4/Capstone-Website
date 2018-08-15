<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void buttonLogIn_Click(object sender, EventArgs e)
    {
        UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
        userStore.Context.Database.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;

        UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);

        var user = manager.Find(textUserName.Text, textPassword.Text);

        if(user != null)
        {
            //Call Owin functionality
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

            //Sign in User
            authenticationManager.SignIn(new AuthenticationProperties{IsPersistent = false}, userIdentity);

            //Redirect
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            literalStatus.Text = "Invalid username or password";
        }
    }

    protected void buttonRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/webpages/Account/Register.aspx");
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
            <asp:Literal ID="literalStatus" runat="server"></asp:Literal>
        </p>
        <p>
            Username:</p>
        <p>
            <asp:TextBox ID="textUserName" runat="server" CssClass="inputs"></asp:TextBox>
        </p>
        <p>
            Password:</p>
        <p>
            <asp:TextBox ID="textPassword" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="buttonLogIn" runat="server" CssClass="button" OnClick="buttonLogIn_Click" Text="Log In" />
        </p>
        <p>
            Don't have an account? Create a new one here!</p>
        <p>
            <asp:Button ID="buttonRegister" runat="server" CssClass="button" OnClick="buttonRegister_Click" Text="Register New Account" />
        </p>

    </form>
</asp:Content>

