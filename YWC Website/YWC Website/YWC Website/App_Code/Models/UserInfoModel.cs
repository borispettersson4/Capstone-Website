using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserInfoModel
/// </summary>
public class UserInfoModel
{
    public UserInfoModel()
    {
    }

    public UserInformation GetUserInformation(string guid)
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        UserInformation info = (from x in db.UserInformations
                                where x.GUid == guid
                                select x).FirstOrDefault();

        return info;
    }

    public void InsertUserInformation(UserInformation info) 
    {
        YWC_StorageEntities db = new YWC_StorageEntities();
        db.UserInformations.Add(info);
        db.SaveChanges();
    }
    
}