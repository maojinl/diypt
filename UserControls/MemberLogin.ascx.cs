using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

using umbraco.cms.businesslogic.member;

public partial class UserControls_MemberLogin : System.Web.UI.UserControl
{
    const string memberLandingPage = "~/my-account";
    const int timeout = 20;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, ImageClickEventArgs e)
    {
        bool bLogin = Membership.ValidateUser(username.Text, password.Text);
        if (bLogin != false)
        {
            Member uMember = Member.GetMemberFromLoginNameAndPassword(username.Text, password.Text);
            if (uMember != null)
            {
                Session["taRegistration"] = uMember.Email;
                System.Web.Security.FormsAuthentication.SetAuthCookie(uMember.LoginName, true);
                Member.AddMemberToCache(uMember);   //, true, new TimeSpan(0, timeout, 0));
                Member uMember1 = Member.GetCurrentMember();
                Response.Redirect(String.Format("{0}?loginName={1}&memberId={2}", memberLandingPage, uMember.LoginName, uMember.Id));
                return;
            }
        }

        errorLabel.Text = "Invalid UserId/password.";
    }
}