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
            user.Email = textEmail.Text;

            if (textPassword.Text == textConfirmPassord.Text)
            {
                try
                {
                    //Create user object & Database will be created
                    IdentityResult result = manager.Create(user,textPassword.Text);

                    if (result.Succeeded)
                    {

                        UserInformation info = new UserInformation
                        {
                            Address = textAddress.Text,
                            FirstName = textFirstName.Text,
                            LastName = textLastName.Text,
                            PostalCode = textPostalCode.Text,
                        GUid = user.Id,
                        Email = user.UserName
    
                    };

                    UserInfoModel model = new UserInfoModel();
                    model.InsertUserInformation(info);

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
    <style type="text/css">
        .inputs {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
        <p>
            &nbsp;</p>
        <p>
            Enter your basic information below! Make sure your details are correct and when ready, press the below &quot;Create Account&quot; button to register with us!</p>
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
            First Name</p>
        <p>
            <asp:TextBox ID="textFirstName" runat="server" CssClass="inputs" Width="170px"></asp:TextBox>
        </p>
        <p>
            Last Name</p>
        <p>
            <asp:TextBox ID="textLastName" runat="server" CssClass="inputs" Width="170px"></asp:TextBox>
        </p>
        <p>
            Address</p>
        <p>
            <asp:TextBox ID="textAddress" runat="server" CssClass="inputs" Width="330px" Height="103px" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>
            Zip Code</p>
        <p>
            <asp:TextBox ID="textPostalCode" runat="server" CssClass="inputs" Width="170px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="textPassword" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="textConfirmPassord" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" CssClass="button" OnClick="Button1_Click" Text="Create Account" BackColor="#C06C30" />
        </p>
</asp:Content>

