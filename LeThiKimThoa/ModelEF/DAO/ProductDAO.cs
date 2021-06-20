using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class ProductDAO
    {
        private LeThiKimThoaContext db;

        public ProductDAO()
        {
            db = new LeThiKimThoaContext();
        }
        public string formatNumber(string strNum)
        {
            string newNum = String.Format("{0:0,0}", Int32.Parse(strNum));
            return newNum;
        }

        public List<Product> ListAll()
        {
            return db.Products.ToList();
        }

        public Product ViewDetail (string id)
        {
            return db.Products.SingleOrDefault(p => p.ID.Equals(id));
        }
    }
}
