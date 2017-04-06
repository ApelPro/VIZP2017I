using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viragkereskedes_DAL;

namespace Viragkereskedes
{
    static class Category_Sql
    {
        public static List<enCategory> AllCategories()
        {
            using(cnViragkereskedes context = new cnViragkereskedes())
            {
                
                return context.enCategories.ToList();
            }
        }
    }
}
