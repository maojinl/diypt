using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using umbraco.cms.businesslogic.member;
using System.Web.Security;

/// <summary>
/// Summary description for Class1
/// </summary>
public class PrizeMemberAuthUtils
{

    public PrizeMemberAuthUtils()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    static public bool CurrentUserLogin()
    {
        umbraco.cms.businesslogic.member.Member uMember;
        MembershipUser aMember;
        aMember = Membership.GetUser();
        if (aMember != null)
        {
            return true;
        }
        else
        {
            uMember = umbraco.cms.businesslogic.member.Member.GetCurrentMember();
            if (uMember != null)
                return true;
        }
        return false;
    }

    static public int GetMemberID()
    {
        umbraco.cms.businesslogic.member.Member uMember;
        MembershipUser aMember;
        aMember = Membership.GetUser();
        if (aMember != null)
            return Int32.Parse(aMember.ProviderUserKey.ToString());
        else
        {
            uMember = umbraco.cms.businesslogic.member.Member.GetCurrentMember();
            if (uMember != null)
                return uMember.Id;
        }
        return -1;
    }
}