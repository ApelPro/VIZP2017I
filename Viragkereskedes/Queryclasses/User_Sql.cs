using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viragkereskedes_DAL;

namespace Viragkereskedes
{
    class User_Sql
    {
        public bool Register_User(string uname, string pw, bool admin = false)
        {
            if(UserCheck(uname))
            {
                Insert_User(uname, pw, admin);
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool UserCheck(string uname)
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                var user = context.enUsers.Where(x => x.user_name == uname).Select(x => x.user_name);
                if(user.Count() == 0)
                {
                    return true;
                }

                return false;
            }
        }
        private void Insert_User(string uname, string pw, bool admin = false)
        {
            //enUser newUser = new enUser() { user_name = uname, user_password = pw, user_admin = admin };
            using (cnViragkereskedes context = new cnViragkereskedes())
            {
                    context.enUsers.Add(new enUser() { user_name = uname, user_password = pw, user_admin = admin });
                    context.SaveChanges();
            }
        }

        public List<UserData> User_Login(string uName, string userPassword, out List<UserData> validData)
        {
            using (cnViragkereskedes context = new cnViragkereskedes())
            {
                validData = context.enUsers.Where(x => x.user_name == uName && x.user_password == userPassword).Select(x => new UserData { userName=x.user_name, userAdmin=x.user_admin }).ToList();
                return validData;
            }
        }

        public void ChangePassword(string uName, string newPassword)
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                var oldPassword = context.enUsers.SingleOrDefault(x => x.user_name==uName);
                oldPassword.user_password = newPassword;
                oldPassword.user_name = uName;
                context.Entry(oldPassword).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }
    }
}
