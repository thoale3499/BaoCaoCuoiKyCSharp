using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class UserDAO
    {
        private LeThiKimThoaContext db;

        public UserDAO()
        {
            db = new LeThiKimThoaContext();
        }

        public int login(string user, string pass)
        {
            var rs = db.UserAccounts.SingleOrDefault(x => x.UserName.Contains(user) && x.Password.Contains(pass));
            if (rs == null)
            {
                return 2;
            }
            var result = db.UserAccounts.Where(x => x.Status == "Active").SingleOrDefault(x => x.UserName.Contains(user) && x.Password.Contains(pass));
            if (result == null)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }

        public List<UserAccount> ListAll()
        {
            return db.UserAccounts.ToList();
        }

        public UserAccount Find(string userName)
        {
           return db.UserAccounts.SingleOrDefault(x => x.UserName.Contains(userName));
          
        }
        public string Insert(UserAccount entityUser)
        {
            db.UserAccounts.Add(entityUser);
            db.SaveChanges();
            return entityUser.UserName;
        }

        public IEnumerable<UserAccount> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<UserAccount> model = db.UserAccounts;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.UserName.Contains(keysearch));
            }
            return model.OrderBy(x => x.ID).ToPagedList(page, pagesize);
        }

        public bool Delete(int ID)
        {
            try
            {
                var user = db.UserAccounts.Find(ID);
                db.UserAccounts.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception )
            {
                return false;
            }
        }
    }
}
