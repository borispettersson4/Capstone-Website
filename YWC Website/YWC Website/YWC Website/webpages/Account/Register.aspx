<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>
<%@ Import namespace="Microsoft.AspNet.Identity" %>
<%@ Import namespace="Microsoft.AspNet.Identity.EntityFramework" %>
<%@ Import namespace="Microsoft.Owin.Security" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
        userStore.Context.Database.Connection.ConnectionString =
        System.Configuration.ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;

        UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);

        //Create new User and store in DB
        IdentityUser user = new IdentityUser();
        user.UserName = textEmail.Text;

        if (textPassword.Text == textConfirmPassord.Text)
        {
            try
            {
                //Create user object & Database will be created
                IdentityResult result = manager.Create(user,textPassword.Text);

                if (result.Succeeded)
                {
                    //Store user in DB
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

                    //Set to log in new user by Cookie
                    var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                    //Log in the new user and redirect to homepage
                    authenticationManager.SignIn(new AuthenticationProperties(), userIdentity);
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    literalStatus.Text = result.Errors.FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                literalStatus.Text = ex.ToString();
            }
        }
        else
            literalStatus.Text = "Passwords must match";

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <form id="form1" runat="server">
        <p>
            &nbsp;</p>
        <p>
            <asp:Literal ID="literalStatus" runat="server"></asp:Literal>
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
            <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="Create Account" />
        </p>
    </form>
</asp:Content>

