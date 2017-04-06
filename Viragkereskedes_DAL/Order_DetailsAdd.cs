using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viragkereskedes_DAL
{
    public partial class enOrder_detail
    {
        public string pName
        {
            get
            {
                string name = "";
                foreach (var item in enProduct)
                {
                    name = item.product_name;
                }
                return name;
            }
        }
    }
}
